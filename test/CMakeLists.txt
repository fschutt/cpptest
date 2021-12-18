# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(cpptestTests LANGUAGES CXX)

add_executable(cpptest_test source/cpptest_test.cpp)
target_link_libraries(cpptest_test PRIVATE cpptest_lib)
target_compile_features(cpptest_test PRIVATE cxx_std_17)

add_test(NAME cpptest_test COMMAND cpptest_test)

add_folders(Test)
