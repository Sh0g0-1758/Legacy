cmake_minimum_required(VERSION 3.22.1)
project(test1)

add_executable(test1 main.cpp)
target_link_libraries(test1 shogomath)

# add_library(shogomath adder.cpp)
# set_target_properties(shogomath PROPERTIES PUBLIC_HEADER adder.h)
# install(TARGETS shogomath LIBRARY DESTINATION lib
        # PUBLIC_HEADER DESTINATION include   
        # )
# add_executable(test1 main.cpp)
# target_link_directories(test1 PRIVATE ${CMAKE_SOURCE_DIR}/../out/build/)
# target_link_libraries(test1 shogomath) 
