#include <iostream>

#include "bundang/core.hpp"

using namespace std;

kj::Bundang bd(1, 5);

int main(int argc, char **argv) {
    cout << "1 + 5 = " << bd.add() << endl;
    cout << "1 - 5 = " << bd.minus() << endl;

    return 0;
}
