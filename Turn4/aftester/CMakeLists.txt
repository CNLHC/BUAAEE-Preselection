project(aftester)
CMAKE_MINIMUM_REQUIRED(VERSION 3.10)

include_directories(
        ./inc
        ${LIBFTDI_INCLUDE_DIRS})


add_executable(aftester
        main.cpp
        src/ftd4232driver.cpp
        src/AD9910Driver.cpp
        src/AD7606Driver.cpp
        src/FTD2xxBitMode.cpp
        src/DAC8563Driver.cpp
        )

target_link_libraries(aftester
        ftd2xx
        MPSSE
        pthread
        rt
        m)

