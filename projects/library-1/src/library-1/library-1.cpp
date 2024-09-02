#include <stdio.h>

extern "C" __declspec(dllexport) void sampleExportFunction() {
    printf("Hello from library-1\n");
}
