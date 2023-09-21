#version 330 core
in vec4 gl_FragCoord;
 
out vec4 frag_color;
 
#define MAX_ITERATIONS 600
 
uniform float center_x;
uniform float center_y;
uniform float zoom;
 
int get_iterations()
{
    float real = ((gl_FragCoord.x / 1080.0f - 0.5f) * zoom + center_x) * 4.0f;
    float imag = ((gl_FragCoord.y / 1080.0f - 0.7f) * zoom + center_y) * 4.0f;

    int iterations = 0;
    float const_real = real;
    float const_imag = imag;
 
    while (iterations < MAX_ITERATIONS)
    {
        float tmp_real = real;
        real = (real * real - imag * imag) + const_real;
        imag = (2.0f * tmp_real * imag) + const_imag;
         
        float dist = real * real + imag * imag;
 
        if (dist > 4.0f)
            break;
 
        ++iterations;
    }
    return iterations;
}

vec4 return_color()
{
    int iter = get_iterations();
    if (iter == MAX_ITERATIONS)
    {
        return vec4(0.0f, 0.0f, 0.0f, 1.0f);
    }
 
    float iterations = float(iter) / MAX_ITERATIONS;    

    if(float(iter) >= 0 && float(iter) <= 100) {
        return vec4(0.0f,iterations, 0.0f, 0.0f);
    } else if (float(iter) > 100 && float(iter) <= 200) {
        return vec4(iterations,0.0f, 0.0f, 0.0f);
    } else if (float(iter) > 200 && float(iter) <= 300) {
        return vec4(0.0f,0.0f, iterations, 0.0f);
    } else if (float(iter) > 300 && float(iter) <= 400) {
        return vec4(iterations,iterations, 0.0f, 0.0f);
    } else if (float(iter) > 400 && float(iter) <= 500) {
        return vec4(0.0f,iterations, iterations, 0.0f);
    } else if (float(iter) > 500 && float(iter) < MAX_ITERATIONS) {
        return vec4(iterations,iterations, iterations, 0.0f);
    } else {
        return vec4(0.0f,0.0f,0.0f,1.0f);
    }

}
 
void main()
{
    frag_color = return_color();
}