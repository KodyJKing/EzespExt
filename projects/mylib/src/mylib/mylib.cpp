#include <stdio.h>

namespace mylib {

    extern "C" __declspec(dllexport) void sampleExportFunction() {
        printf("Hello from mylib\n");
    }

    extern "C" __declspec(dllexport) int add(int a, int b) {
        return a + b;
    };

}
