cmake_minimum_required(VERSION 3.15)
project(advent-of-code-2025 LANGUAGES Swift)

# Set Swift language version (must be a major version: 4, 4.2, 5, or 6)
set(CMAKE_Swift_LANGUAGE_VERSION 6)

# Set macOS deployment target
set(CMAKE_OSX_DEPLOYMENT_TARGET "13.0")

# Find all Swift source files
file(GLOB_RECURSE SWIFT_SOURCES
    "Sources/*.swift"
)

# Create executable
add_executable(aoc ${SWIFT_SOURCES})

# Set output directory to match Swift Package Manager structure
set_target_properties(aoc PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}"
    Swift_MODULE_DIRECTORY "${CMAKE_BINARY_DIR}/CMakeFiles/aoc.dir"
)

# Copy resources directory to build directory so the executable can find input files
file(COPY "${CMAKE_SOURCE_DIR}/resources" 
     DESTINATION "${CMAKE_BINARY_DIR}"
     FILES_MATCHING PATTERN "*")

# Print build information
message(STATUS "Swift sources: ${SWIFT_SOURCES}")
message(STATUS "Build directory: ${CMAKE_BINARY_DIR}")
