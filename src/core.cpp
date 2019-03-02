#include "bundang/core.hpp"

using namespace std;

namespace kj {
    Bundang::Bundang(int a, int b) : a(a), b(b) {}

    Bundang::Bundang(const Bundang& bundang) {
        *this = bundang;
    }

    int Bundang::add() const {
        return a + b;
    }

    int Bundang::minus() const {
        return a - b;
    }
}
