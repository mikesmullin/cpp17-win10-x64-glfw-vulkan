.PHONY: clean shader cpp run

all: clean shader cpp

shader:
	cd build/ && C:\VulkanSDK\1.3.236.0\Bin\glslc.exe ../shaders/simple_shader.vert -o ../shaders/simple_shader.vert.spv
	cd build/ && C:\VulkanSDK\1.3.236.0\Bin\glslc.exe ../shaders/simple_shader.frag -o ../shaders/simple_shader.frag.spv

cpp:
	cd build/ && \
	cl.exe \
	  /nologo \
    /Zi \
    /EHsc \
    /std:c++17 \
    /I C:/VulkanSDK/1.3.236.0/Include \
    /I ../vendor/glfw-3.3.8/include \
    /I ../vendor/glm-0.9.9.8 \
    /I ../external/tinyobjloader \
    ../src/*.cpp \
    /Fegame.exe \
    /link user32.lib shell32.lib gdi32.lib \
    /NODEFAULTLIB:MSVCRT \
    /LIBPATH:../vendor/glfw-3.3.8/lib-vc2019 glfw3_mt.lib \
    /LIBPATH:C:/VulkanSDK/1.3.236.0/Lib vulkan-1.lib

run:
  cd build && game.exe

clean:
	del /f /s /q build\\*
	del /f /s /q shaders\\*.spv

