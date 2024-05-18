-- CMaker

-- Define your project details
local cmake_version = "3.20"
local project_name = ""
local cxx_standard = "17"

-- Dependencies
local dep_version = ""
local include_directories = ""
local lib_directories = ""


-- CMake Content
local cmake_content = [[
cmake_minimum_required(VERSION ]] .. cmake_version .. [[)
project(]] .. project_name .. [[)

set(CMAKE_CXX_STANDARD ]] .. cxx_standard .. [[)

# Find Package
find_package(SFML ]] .. dep_version .. [[ COMPONENTS system window graphics REQUIRED)

add_executable(]] .. project_name .. [[
        main.cpp
        sound.cpp)

target_include_directories(]] .. project_name .. [[ PRIVATE ]] .. include_directories .. [[)

# Link SFML libraries to your executable
target_link_libraries(]] .. project_name .. [[ PRIVATE sfml-system sfml-window sfml-graphics sfml-audio)
]]

-- Write file
local file = io.open("CMakeLists.txt", "w")

if file then
  file:write(cmake_content)
  file:close()
  print("CMakeLists.txt created successfully!")
else
  print("Failed to create CMakeLists.txt")
end
