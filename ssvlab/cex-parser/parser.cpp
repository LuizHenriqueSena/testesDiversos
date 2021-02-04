#include <fstream>
#include <iostream>
#include <regex>
#include <string>
#include <vector>

// clang++ -o parser parser.cpp
// g++ -o parser parser.cpp

// usage: ./parser ~/path/to/file.txt

int main(int argc, const char *argv[])
{
  if (argc != 2)
  {
    std::cout << "Wrong usage! Please provide the text file to be parsed." << std::endl;
    return 1;
  }

  std::ifstream cex_file(argv[1]);
  if (cex_file.is_open())
  {
    std::string raw;
    bool ignoring = true;

    std::vector<float> pixels;

    while (getline(cex_file, raw))
    {
      if (raw.find("Counterexample") != std::string::npos)
      {
        ignoring = false;
      }
      else if (!ignoring && raw.find("  x") != std::string::npos)
      {
        std::regex rgx("\\s*x(\\d+) = (\\d+)");
        std::smatch matches;

        if (std::regex_search(raw, matches, rgx))
        {
          std::string index = matches[1].str();
          std::string value = matches[2].str();

          std::cout << "x" << index << " = " << value << std::endl;

          pixels.push_back(std::stof(value));
        }
      }
    }

    size_t size = pixels.size();
    std::cout << "float x[" << size << "] = { ";
    for (size_t i = 0; i < size; ++i)
    {
      std::cout << pixels[i];
      if (i + 1 < size)
      {
        std::cout << ", ";
      }
    }
    std::cout << " };" << std::endl;

    cex_file.close();
  }

  return 0;
}
