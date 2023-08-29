#include <iostream>
#include <GLFW/glfw3.h>
#include <shodowConfig.h>
#ifdef USE_ADDER
    #include<adder.h>
#endif

int main(int argc, char* argv[]) {
    std::cout << "Hey, mNA \n";

    #ifdef USE_ADDER
        std::cout << "shogoMath output : " << shogomath::add(72.1f,73.8f) << "\n";
    #else
        std::cout << 72.1f + 73.8f << "\n";
    #endif

    std::cout << argv[0] << " Version " << shodow_VERSION_MAJOR << "." << shodow_VERSION_MINOR << "\n";

    GLFWwindow *window;

    if( !glfwInit() )
    {
        fprintf( stderr, "Failed to initialize GLFW\n" );
        exit( EXIT_FAILURE );
    }

    window = glfwCreateWindow( 300, 300, "Gears", NULL, NULL );
    if (!window)
    {
        fprintf( stderr, "Failed to open GLFW window\n" );
        glfwTerminate();
        exit( EXIT_FAILURE );
    }

    // Main loop
    while( !glfwWindowShouldClose(window) )
    {
        // Swap buffers
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    // Terminate GLFW
    glfwTerminate();


    return 0;
}