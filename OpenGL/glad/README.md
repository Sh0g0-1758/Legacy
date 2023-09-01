# How to set up glad. 

1) first change #include<glad/glad.h> to #include "glad.h"
2) have a copy of glad.h with you. 
3) Also in your main cpp file, don't forget to put "glad.h" above your GLFW/glfw.h header file. 

Now, Run these commands : 

```bash
g++ -c glad.c # this will create a glad.o file which you can later use for linking. 
g++ {file}.cpp -o {executable_file} glad.o -lglfw -ldl
```

And the cpp file should compile properly :)