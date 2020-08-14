#include <algorithm>
#include <array>
#include <atomic>
#include <chrono>
#include <fstream>
#include <iostream>
#include <memory>
#include <mutex>
#include <queue>
#include <sstream>
#include <string>
#include <thread>
#include <vector>

#include <cstdio>
#include <dirent.h>
#include <unistd.h>

#define BASE_ESBMC_COMMAND_FIXED_POINT                                         \
  "/home/erickson.alves/esbmc/v6.4.0/bin/esbmc "                                \
  "--force-malloc-success "                                                    \
  "--no-bounds-check "                                                         \
  "--no-div-by-zero-check "                                                    \
  "--no-pointer-check "                                                        \
  "--fixedbv "                                                                 \
  "-I . "
#define BASE_ESBMC_COMMAND_FLOATING_POINT                                      \
  "/home/erickson.alves/esbmc/v6.4.0/bin/esbmc "                                \
  "--force-malloc-success "                                                    \
  "--no-bounds-check "                                                         \
  "--no-div-by-zero-check "                                                    \
  "--no-pointer-check "                                                        \
  "--incremental-bmc "                                                         \
  "--fixedbv "                                                                 \
  "-I . "
#define BENCHMARK_FILENAME "neural.c"
#define BUFFER_SIZE 128
#define CURRENT_FOLDER_SYMLINK "."
#define FIXED_POINT_DEFINE "-DFIXED_POINT"
#define FXP_V2_DEFINE "-DFXP_V2"
#define FIXED_POINT_SUFFIX "_fixedbv"
#define FLOATING_POINT_SUFFIX "_floatingbv"
#define FRAC_BITS_DEFINE "-DFRAC_BITS="
#define INT_BITS_DEFINE "-DINT_BITS="
#define PARENT_FOLDER_SYMLINK ".."
#define PATH_SEPARATOR "/"
#define PIPE_READ_MODE "r"
#define TXT_EXTENSION ".txt"

class benchmark {
public:
  benchmark(const benchmark &other)
      : benchmark(other.command(), other.name(), other.output_filename()) {}

  benchmark(const std::string &command, const std::string &name,
            const std::string &output_filename)
      : m_command(command), m_name(name), m_output_filename(output_filename),
        m_elapsed_time(0) {}

  ~benchmark() {}

  void perform_test() {
    std::chrono::steady_clock::time_point begin =
        std::chrono::steady_clock::now();

    m_output_file.open(m_output_filename.c_str());

    execute_command();

    m_output_file.close();

    std::chrono::steady_clock::time_point end =
        std::chrono::steady_clock::now();

    m_elapsed_time =
        std::chrono::duration_cast<std::chrono::milliseconds>(end - begin)
            .count();
  }

  std::string command() const { return m_command; }

  unsigned long elapsed_time() const { return m_elapsed_time; }

  std::string name() const { return m_name; }

  std::string output_filename() const { return m_output_filename; }

private:
  std::ofstream m_output_file;

  std::string m_command;
  std::string m_name;
  std::string m_output_filename;

  unsigned long m_elapsed_time;

  void execute_command() {
    std::array<char, BUFFER_SIZE> buffer;
    std::shared_ptr<FILE> pipe(popen(m_command.c_str(), PIPE_READ_MODE),
                               pclose);
    if (pipe) {
      while (!feof(pipe.get())) {
        if (fgets(buffer.data(), BUFFER_SIZE, pipe.get()) != nullptr) {
          std::string data = std::string(buffer.data());
          std::string output = data.substr(0, data.length() - 1);

          m_output_file << output << std::endl;
        }
      }
    }
  }
};

class benchmark_executor {
public:
  benchmark_executor(const size_t &parallel_executions)
      : m_parallel_executions(parallel_executions), m_finished(false) {}

  ~benchmark_executor() {}

  void add_benchmark(benchmark benchmark) { m_benchmarks.push(benchmark); }

  void start() {
    m_stdout_thread = std::thread(&benchmark_executor::m_stdout_worker, this);

    while (!m_benchmarks.empty()) {
      size_t size = m_benchmarks.size();

      size_t max = size <= m_parallel_executions ? size : m_parallel_executions;

      for (size_t i = 0; i < max; ++i) {
        benchmark benchmark = m_benchmarks.front();
        m_benchmarks.pop();

        m_benchmark_threads.push_back(std::thread(
            &benchmark_executor::m_benchmark_worker, this, benchmark));
      }

      for (std::thread &benchmark_thread : m_benchmark_threads) {
        benchmark_thread.join();
      }

      m_benchmark_threads.clear();
    }

    m_finished = true;

    m_stdout_thread.join();
  }

private:
  size_t m_parallel_executions;

  std::atomic<bool> m_finished;

  std::mutex m_stdout_mutex;

  std::queue<benchmark> m_benchmarks;

  std::queue<std::string> m_stdout_queue;

  std::thread m_stdout_thread;

  std::vector<std::thread> m_benchmark_threads;

  void m_add_stdout_message(const std::string &message) {
    m_stdout_mutex.lock();
    m_stdout_queue.push(message);
    m_stdout_mutex.unlock();
  }

  void m_benchmark_worker(benchmark benchmark) {
    std::stringstream str_stream;

    str_stream << "[START] Benchmark <" << benchmark.name() << ">";
    m_add_stdout_message(str_stream.str());

    benchmark.perform_test();

    str_stream.str(std::string());

    str_stream << "[FINISH] Benchmark <" << benchmark.name() << "> took "
               << benchmark.elapsed_time() << " [ms]";
    m_add_stdout_message(str_stream.str());
  }

  void m_stdout_worker() {
    while (!m_finished.load()) {
      std::string message;

      m_stdout_mutex.lock();
      if (!m_stdout_queue.empty()) {
        message = m_stdout_queue.front();
        m_stdout_queue.pop();
      }
      m_stdout_mutex.unlock();

      if (!message.empty()) {
        std::cout << message << std::endl;
      }
    }
  }
};

std::vector<std::string> list_directories() {
  DIR *dir;
  struct dirent *ent;
  std::vector<std::string> dirs;
  if ((dir = opendir(CURRENT_FOLDER_SYMLINK)) != nullptr) {
    while ((ent = readdir(dir)) != nullptr) {
      if (ent->d_type == DT_DIR) {
        auto current_dir = std::string(ent->d_name);
        if (current_dir.compare(CURRENT_FOLDER_SYMLINK) != 0 &&
            current_dir.compare(PARENT_FOLDER_SYMLINK) != 0)
          dirs.push_back(current_dir);
      }
    }
    closedir(dir);
    std::sort(dirs.begin(), dirs.end());
  }
  return dirs;
}

typedef struct fxp_settings {
  unsigned int int_bits;
  unsigned int frac_bits;
  bool use_full_fxp_library;
} fxp_settings_t;

unsigned int parse_uint(const std::string &str) {
  bool is_number = std::all_of(str.begin(), str.end(), ::isdigit);

  if (!is_number) {
    return 0;
  }

  return static_cast<unsigned int>(std::stoi(str));
}

fxp_settings_t *parse_options(const std::vector<std::string> &args) {
  fxp_settings_t *fxp_settings = nullptr;
  bool succeeded = true;
  size_t i = 0;

  while (i < args.size()) {
    std::string arg = args[i];

    if (arg.compare("--fxp") == 0) {
      fxp_settings = new fxp_settings_t;
    } else if (arg.compare("--int-bits") == 0) {
      if (fxp_settings == nullptr) {
        fxp_settings = new fxp_settings_t;
      }
      arg = args[++i];
      fxp_settings->int_bits = parse_uint(arg);
    } else if (arg.compare("--frac-bits") == 0) {
      if (fxp_settings == nullptr) {
        fxp_settings = new fxp_settings_t;
      }
      arg = args[++i];
      fxp_settings->frac_bits = parse_uint(arg);
    } else if (arg.compare("--use-full-library") == 0) {
      if (fxp_settings == nullptr) {
        fxp_settings = new fxp_settings_t;
      }
      fxp_settings->use_full_fxp_library = true;
    } else {
      succeeded = false;
      break;
    }

    ++i;
  }

  if (!succeeded && fxp_settings != nullptr) {
    delete fxp_settings;
    fxp_settings = nullptr;
  }

  return fxp_settings;
}

int main(int argc, char *argv[]) {
  fxp_settings_t *fxp_settings = nullptr;

  if (argc > 1) {
    std::vector<std::string> args;

    for (int i = 1; i < argc; ++i) {
      args.push_back(std::string(argv[i]));
    }

    fxp_settings = parse_options(args);

    if (fxp_settings == nullptr) {
      std::cout << "Could not parse arguments" << std::endl;

      return -1;
    }
  }

  std::cout << "Benchmark runner v0.1" << std::endl;

  std::vector<std::string> dirs = list_directories();

  size_t size = dirs.size();

  std::cout << "Found " << size << " benchmark(s)" << std::endl;

  benchmark_executor executor(8);

  for (size_t i = 0; i < size; ++i) {
    std::string dir = dirs[i];

    std::cout << "Preparing benchmark " << (i + 1) << " out of " << size
              << std::endl;

    std::stringstream str_stream;

    str_stream << dir << PATH_SEPARATOR << BENCHMARK_FILENAME;
    std::string benchmark_filepath = str_stream.str();

    str_stream.str(std::string());

    str_stream << BASE_ESBMC_COMMAND_FIXED_POINT << benchmark_filepath;

    if (fxp_settings != nullptr) {
      if (!fxp_settings->use_full_fxp_library) {
        str_stream << " " << FXP_V2_DEFINE;
      }

      str_stream << " " << INT_BITS_DEFINE << fxp_settings->int_bits;
      str_stream << " " << FRAC_BITS_DEFINE << fxp_settings->frac_bits;

      delete fxp_settings;
      fxp_settings = nullptr;
    }

    std::string fixed_point_command = str_stream.str();

    str_stream.str(std::string());

    str_stream << BASE_ESBMC_COMMAND_FLOATING_POINT << benchmark_filepath;

    std::string floating_point_command = str_stream.str();

    str_stream.str(std::string());

    str_stream << dir << FIXED_POINT_SUFFIX << TXT_EXTENSION;
    std::string fixed_point_filename = str_stream.str();

    str_stream.str(std::string());

    str_stream << dir << FLOATING_POINT_SUFFIX << TXT_EXTENSION;
    std::string floating_point_filename = str_stream.str();

    executor.add_benchmark(benchmark(
        fixed_point_command, dir + FIXED_POINT_SUFFIX, fixed_point_filename));

    executor.add_benchmark(benchmark(floating_point_command,
                                     dir + FLOATING_POINT_SUFFIX,
                                     floating_point_filename));
  }

  std::cout << "Ready to execute benchmarks" << std::endl;

  executor.start();

  return 0;
}
