#include <iostream>
#include <catch2/catch_amalgamated.hpp>

int main(int argc, char* argv[]) {

    // Print arguments
    std::cout << "\nArguments: ";
    for (int i = 0; i < argc; i++) {
        std::cout << "\n" << argv[i];
    }
    std::cout << "\n\n";

    Catch::Session().run( argc, argv );
}
