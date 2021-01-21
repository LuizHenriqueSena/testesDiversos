#include <algorithm>
#include <atomic>
#include <array>
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

#define BASE_ESBMC_COMMAND_INTERVAL "esbmc "\
                                    "--force-malloc-success "\
                                    "--no-bounds-check "\
                                    "--no-div-by-zero-check "\
                                    "--no-pointer-check "\
                                    "--incremental-bmc "\
                                    "--interval-analysis "\
                                    "-I ~/library/ "
#define BASE_ESBMC_COMMAND_NO_INTERVAL "esbmc "\
                                       "--force-malloc-success "\
                                       "--no-bounds-check "\
                                       "--no-div-by-zero-check "\
                                       "--no-pointer-check "\
                                       "--incremental-bmc "\
                                       "-I ~/library/ "
#define BENCHMARK_FILENAME "verifynn.c"
#define BUFFER_SIZE 128
#define CURRENT_FOLDER_SYMLINK "."
#define INTERVAL_SUFFIX "_interval"
#define NO_INTERVAL_SUFFIX "_no_interval"
#define PARENT_FOLDER_SYMLINK ".."
#define PATH_SEPARATOR "/"
#define PIPE_READ_MODE "r"
#define TXT_EXTENSION ".txt"

class benchmark
{
public:
    benchmark(const benchmark& other)
        :
            benchmark(other.command()
                      ,
                      other.name()
                      ,
                      other.output_filename())
    {
    }

    benchmark(const std::string& command
              ,
              const std::string& name
              ,
              const std::string& output_filename)
        :
            m_command(command)
            ,
            m_name(name)
            ,
            m_output_filename(output_filename)
            ,
            m_elapsed_time(0)
    {
    }

    ~benchmark()
    {
    }

    void perform_test()
    {
        std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();

        m_output_file.open(m_output_filename.c_str());

        execute_command();

        m_output_file.close();

        std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();

        m_elapsed_time = std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count();
    }

    std::string command() const
    {
        return m_command;
    }

    unsigned long elapsed_time() const
    {
        return m_elapsed_time;
    }

    std::string name() const
    {
        return m_name;
    }

    std::string output_filename() const
    {
        return m_output_filename;
    }

private:
    std::ofstream m_output_file;

    std::string m_command;
    std::string m_name;
    std::string m_output_filename;

    unsigned long m_elapsed_time;

    void execute_command()
    {
        std::array<char, BUFFER_SIZE> buffer;
        std::shared_ptr<FILE> pipe(popen(m_command.c_str(), PIPE_READ_MODE), pclose);
        if (pipe)
        {
            while (!feof(pipe.get()))
            {
                if (fgets(buffer.data(), BUFFER_SIZE, pipe.get()) != nullptr)
                {
                    std::string data = std::string(buffer.data());
                    std::string output = data.substr(0, data.length() - 1);

                    m_output_file << output << std::endl;
                }
            }
        }
    }
};

class benchmark_executor
{
public:
    benchmark_executor(const size_t& parallel_executions)
        : m_parallel_executions(parallel_executions)
          ,
          m_finished(false)
    {
    }

    ~benchmark_executor()
    {
    }

    void add_benchmark(benchmark benchmark)
    {
        m_benchmarks.push(benchmark);
    }

    void start()
    {
        m_stdout_thread = std::thread(
            &benchmark_executor::m_stdout_worker, this);

        while (!m_benchmarks.empty())
        {
            size_t size = m_benchmarks.size();

            size_t max = size <= m_parallel_executions ?
                         size :
                         m_parallel_executions;

            for (size_t i = 0; i < max; i++)
            {
                benchmark benchmark = m_benchmarks.front();
                m_benchmarks.pop();

                m_benchmark_threads.push_back(std::thread(
                    &benchmark_executor::m_benchmark_worker, this, benchmark
                ));
            }

            for (std::thread& benchmark_thread : m_benchmark_threads)
            {
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

    void m_add_stdout_message(const std::string& message)
    {
        m_stdout_mutex.lock();
        m_stdout_queue.push(message);
        m_stdout_mutex.unlock();
    }

    void m_benchmark_worker(benchmark benchmark)
    {
        std::stringstream str_stream;

        str_stream << "[START] Benchmark <" <<
                    benchmark.name() <<
                    ">";
        m_add_stdout_message(str_stream.str());

        benchmark.perform_test();

        str_stream.str(std::string());

        str_stream << "[FINISH] Benchmark <" <<
                      benchmark.name() <<
                      "> took " <<
                      benchmark.elapsed_time() <<
                      " [ms]";
        m_add_stdout_message(str_stream.str());
    }

    void m_stdout_worker()
    {
        while (!m_finished.load())
        {
            std::string message;

            m_stdout_mutex.lock();
            if (!m_stdout_queue.empty())
            {
                message = m_stdout_queue.front();
                m_stdout_queue.pop();
            }
            m_stdout_mutex.unlock();

            if (!message.empty())
            {
                std::cout << message << std::endl;
            }
        }
    }
};

std::vector<std::string> list_directories()
{
    DIR *dir;
    struct dirent *ent;
    std::vector<std::string> dirs;
    if ((dir = opendir(CURRENT_FOLDER_SYMLINK)) != nullptr)
    {
        while ((ent = readdir(dir)) != nullptr)
        {
            if (ent->d_type == DT_DIR)
            {
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

int main(int argc, char* argv[])
{
    std::cout << "Benchmark runner v0.1" << std::endl;

    std::vector<std::string> dirs = list_directories();

    size_t size = dirs.size();

    std::cout << "Found " << size << " benchmark(s)" <<
                 std::endl;
    
    benchmark_executor executor(5);

    for (size_t i = 0; i < size; i++)
    {
        std::string dir = dirs[i];

        std::cout << "Preparing benchmark "
                  << (i + 1)
                  << " out of "
                  << size
                  << std::endl;
        
        std::stringstream str_stream;

        str_stream << dir << PATH_SEPARATOR <<
                      BENCHMARK_FILENAME;
        std::string benchmark_filepath = str_stream.str();

        str_stream.str(std::string());

        str_stream << BASE_ESBMC_COMMAND_INTERVAL <<
                      benchmark_filepath;
        std::string interval_command = str_stream.str();

        str_stream.str(std::string());

        str_stream << BASE_ESBMC_COMMAND_NO_INTERVAL <<
                      benchmark_filepath;
        std::string no_interval_command = str_stream.str();

        str_stream.str(std::string());

        str_stream << dir <<
                      INTERVAL_SUFFIX <<
                      TXT_EXTENSION;
        std::string interval_filename = str_stream.str();

        str_stream.str(std::string());

        str_stream << dir <<
                      NO_INTERVAL_SUFFIX <<
                      TXT_EXTENSION;
        std::string no_interval_filename = str_stream.str();

        executor.add_benchmark(
            benchmark(interval_command
                      ,
                      dir + INTERVAL_SUFFIX
                      ,
                      interval_filename)
        );

        executor.add_benchmark(
            benchmark(no_interval_command
                      ,
                      dir + NO_INTERVAL_SUFFIX
                      ,
                      no_interval_filename)
        );
    }

    std::cout << "Ready to execute benchmarks" << std::endl;

    executor.start();

    return 0;
}