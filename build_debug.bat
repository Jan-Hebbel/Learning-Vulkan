@echo off

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

SET includes=/Isrc /I%VULKAN_SDK%/Include /Ic:/src/include
SET links=/link /LIBPATH:%VULKAN_SDK%\Lib /LIBPATH:C:\src\lib\debug vulkan-1.lib glfw3.lib user32.lib gdi32.lib shell32.lib
SET defines=/D DEBUG

echo "Building Debug ..."

cl /std:c++17 /MDd /Zi /EHsc /Febin\debug\ %includes% %defines% src/main.cpp src/window.cpp src/stb_image.cpp src/tiny_obj_loader.cpp %links%