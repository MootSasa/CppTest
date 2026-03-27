# cpptest

> Advanced testing utility for programming.
> Automates compilation, test generation, stress testing, and code formatting.

- Run all tests (from the current directory, `tests/`, and `gen_tests/`):
  `cpptest`

- Run tests **in-place** (do not copy files to a `/tmp` directory):
  `cpptest -i`

- Run **only manual tests** (from the current directory and `tests/`):
  `cpptest -a`

- Run **only generated tests** (from `gen_tests/`):
  `cpptest -g`

- Generate tests using `gen.cpp` and exit without running the solution:
  `cpptest -G`

- Run a stress test comparing `main.cpp` and `slow.cpp` using `gen.cpp`:
  `cpptest -S`

- Run interactive mode manually (type input into the console yourself):
  `cpptest -I`

- Run automated interactive testing using an `interactor.cpp` program:
  `cpptest -X`

- Automatically fix formatting and code style in `main.cpp`:
  `cpptest -F`

- Copy the standard AI prompt to your clipboard (WSL/Linux supported):
  `cpptest -p`

- Copy the interactive AI prompt to your clipboard:
  `cpptest -P`

- Update the utility to the latest version from GitHub:
  `cpptest -u`
