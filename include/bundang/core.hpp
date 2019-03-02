/**
* CMake Project Template
* @author Keunjun
* @date 2019-03-02
*/

#ifndef BUNDANG_CORE_H
#define BUNDANG_CORE_H

#include <string>

namespace kj {
    /**
    * Bundang Class
    * @brief Addition and Substraction
    * @details This is a class which can calculate addition and subtraction
    * of two arguments
    */
    class Bundang {
    public:
        /**
        * Constructor for class Bundang
        *
        * @param[in] a The first operand
        * @param[in] b The second operand
        */
        Bundang(int a, int b);

        /**
        * Copy Constructor for class Bundang
        *
        * @param[in] bundang Existing object
        */
        Bundang(const Bundang& bundang);

        /**
        * Addition function
        *
        * @return a + b
        */
        int add() const;

        /**
        * Subtraction function
        *
        * @return a - b
        */
        int minus() const;

    private:
        int a; /**< The first operand */

        int b; /**< The second operand */
    };
}

#endif
