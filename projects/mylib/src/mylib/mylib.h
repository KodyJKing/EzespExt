#pragma once

namespace mylib {
    extern "C" __declspec(dllexport) void sampleExportFunction();
    extern "C" __declspec(dllexport) int add(int a, int b);
}
