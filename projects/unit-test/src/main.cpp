#include <iostream>
#include <catch2/catch_amalgamated.hpp>

#include <mylib/mylib.h>

// Test add function
TEST_CASE("add function", "[add]") {
    REQUIRE(mylib::add(1, 2) == 3);
    REQUIRE(mylib::add(2, 3) == 5);
    REQUIRE(mylib::add(3, 4) == 7);
}

int main(int argc, char* argv[]) {

    // Print arguments
    std::cout << "\nArguments: ";
    for (int i = 0; i < argc; i++) {
        std::cout << "\n" << argv[i];
    }
    std::cout << "\n\n";

    Catch::Session().run( argc, argv );
}
