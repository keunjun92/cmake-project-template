# CMake C++ Project Template
이 프로젝트는 CMake 를 이용해서 C++ 프로젝트를 쉽게 만들기 위한 템플릿 입니다. Ubuntu 16.04 에서 테스트를 진행하였습니다.

## Usage
### Prerequisites
아래와 같은 프로그램이 필요합니다.
- C/C++ 컴파일러 (없는 경우, ```sudo apt install build-essential``` 실행)
- CMake 3.1+ (없는 경우, ``` sudo apt install cmake ``` )
- Doxygen (없는 경우, ``` sudo apt install doxygen ```)

### Build
#### Git Clone
먼저 소스 코드를 다운받아야 합니다.
``` bash
$ cd workspace # 소스 코드를 받을 곳으로 이동합니다.
$ git clone https://github.com/keunjun92/cmake-project-template project
$ cd project
```

#### Build 하기
CMake 를 이용해서 컴파일을 위한 Makefile 을 생성합니다. Example 을 빌드하기 싫은 경우 BUILD_EXAMPLE 옵션을 OFF 로 바꾸면 됩니다. 마찬가지로 Doxygen 을 이용한 문서를 만드는 것을 원치 않는 경우 BUILD_DOC 옵션을 OFF 로 바꾸면 됩니다.
``` bash
$ mkdir build
$ cd build
$ cmake -D BUILD_EXAMPLE=ON -D BUILD_DOC=ON ..
$ make -j4 # -j 옵션은 컴파일을 할 때 사용할 CPU 의 갯수를 말합니다. 자신의 시스템에 맞게 쓰면 됩니다. (예를 들어 -j4 의 경우 4개 CPU 코어를 사용한다는 뜻입니다.)
```

#### API 문서 만들기
CMake 을 실행할때 BUILD_DOC 옵션을 ON 으로 한경우 Doxygen 을 이용해서 API 문서를 만들 수 있습니다.
``` bash
$ make doc
```
빌드를 진행한 폴더에 doc 이라는 폴더가 새롭게 생성된 것을 확인 할 수 있다. doc/index.html 을 브라우저를 통해 열어보면 생성된 API 문서를 확인 할 수 있습니다.

Doxygen 설치 및 문법을 더 자세히 알고 싶다면 아래 문서들을 참고 하면 됩니다.
- [Doxygen Official Home](http://www.doxygen.nl/)
- [Document the code with Doxygen](https://wiki.scilab.org/Doxygen%20documentation%20Examples)

#### Install 하기
다른 CMake 프로젝트에서 Budang 라이브러리를 이용하기 위해서는 설치를 해줘야 합니다.
``` bash
$ make install
```
위와 같이 install 을 해주게 되면 다른 CMake 프로젝트에서 find_package 매크로를 이용해서 Budang 라이브러리를 이용 할 수 있게 됩니다.
``` CMake
find_package(bundang REQUIRED) # or find_package(bundang)
```
