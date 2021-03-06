# fletch External Project
#
set(KWIVER_DEPENDENCIES)
set(KWANT_DEPENDENCIES)

message(STATUS "I am pulling and building fletch!")

list(APPEND KWANT_DEPENDENCIES fletch)
list(APPEND KWIVER_DEPENDENCIES fletch)
list(APPEND DIVA_DEPENDENCIES fletch)

ExternalProject_Add(fletch
  PREFIX ${DIVA_BINARY_DIR}
  GIT_REPOSITORY "git://github.com/Kitware/fletch.git"
  GIT_TAG e758bf86b6487d43dca565d26a5cc5d321a92eea
  SOURCE_DIR fletch
  BINARY_DIR fletch-build
  STAMP_DIR ${DIVA_STAMP_DIR}
  CMAKE_CACHE_ARGS
    -DBUILD_SHARED_LIBS:BOOL=ON
    -Dfletch_BUILD_CXX11:BOOL=ON
    -Dfletch_BUILD_WITH_CUDA:BOOL=OFF
    -Dfletch_BUILD_WITH_PYTHON:BOOL=OFF
    -Dfletch_ENABLE_Boost:BOOL=ON
    -Dfletch_ENABLE_Caffe:BOOL=OFF
    -Dfletch_ENABLE_Ceres:BOOL=OFF
    -Dfletch_ENABLE_Darknet:BOOL=ON
    -Dfletch_ENABLE_Darknet_OpenCV:BOOL=ON
    -Dfletch_ENABLE_Eigen:BOOL=ON
    -Dfletch_ENABLE_FFmpeg:BOOL=ON
    -Dfletch_ENABLE_GDAL:BOOL=OFF
    -Dfletch_ENABLE_GEOS:BOOL=OFF
    -Dfletch_ENABLE_GFlags:BOOL=OFF
    -Dfletch_ENABLE_GLog:BOOL=OFF
    -Dfletch_ENABLE_GTest:BOOL=OFF
    -Dfletch_ENABLE_GeographicLib:BOOL=OFF
    -Dfletch_ENABLE_HDF5:BOOL=ON
    -Dfletch_ENABLE_ITK:BOOL=OFF
    -Dfletch_ENABLE_OpenCV:BOOL=ON
    -DOpenCV_SELECT_VERSION:STRING=3.4.0
    -Dfletch_ENABLE_OpenCV_FFmpeg:BOOL=ON
    -Dfletch_ENABLE_OpenCV_contrib:BOOL=ON
    -Dfletch_ENABLE_OpenCV_highgui:BOOL=ON
    -Dfletch_ENABLE_PNG:BOOL=ON
    -Dfletch_ENABLE_PROJ4:BOOL=ON
    -Dfletch_ENABLE_PostgresSQL:BOOL=OFF
    -Dfletch_ENABLE_pybind11:BOOL=ON
    -Dfletch_ENABLE_Qt:BOOL=OFF
    -Dfletch_ENABLE_SuiteSparse:BOOL=OFF
    -Dfletch_ENABLE_TinyXML:BOOL=ON
    -Dfletch_ENABLE_VTK:BOOL=OFF
    -Dfletch_ENABLE_VXL:BOOL=ON
    -Dfletch_ENABLE_YAMLcpp:BOOL=ON
    -Dfletch_ENABLE_ZLib:BOOL=ON
    -Dfletch_ENABLE_libgeotiff:BOOL=ON
    -Dfletch_ENABLE_libjpeg-turbo:BOOL=ON
    -Dfletch_ENABLE_libjson:BOOL=ON
    -Dfletch_ENABLE_libkml:BOOL=OFF
    -Dfletch_ENABLE_libtiff:BOOL=ON
    -Dfletch_ENABLE_log4cplus:BOOL=ON
    -Dfletch_ENABLE_shapelib:BOOL=OFF
    -Dfletch_BUILD_WITH_CUDA:BOOL=${DIVA_BUILD_WITH_CUDA}
    -DCUDA_TOOLKIT_ROOT_DIR:PATH=${CUDA_TOOLKIT_ROOT_DIR}
    -Dfletch_BUILD_WITH_CUDNN:BOOL=${DIVA_BUILD_WITH_CUDNN}
    -DCUDNN_TOOLKIT_ROOT_DIR:PATH=${CUDNN_TOOLKIT_ROOT_DIR}
    -Dfletch_PYTHON_MAJOR_VERSION:STRING=2
    -Dfletch_BUILD_INSTALL_PREFIX:STRING=${CMAKE_INSTALL_PREFIX}
    -DCMAKE_INSTALL_PREFIX:STRING=${CMAKE_INSTALL_PREFIX}
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
    -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
    -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
    -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
    -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
    ${CMAKE_CXX_COMPILER_LAUNCHER_FLAG}
    ${CMAKE_C_COMPILER_LAUNCHER_FLAG}
    -DCMAKE_EXE_LINKER_FLAGS:STRING=${CMAKE_EXE_LINKER_FLAGS}
    -DCMAKE_SHARED_LINKER_FLAGS:STRING=${CMAKE_SHARED_LINKER_FLAGS}
    -DADDITIONAL_C_FLAGS:STRING=${ADDITIONAL_C_FLAGS}
    -DADDITIONAL_CXX_FLAGS:STRING=${ADDITIONAL_CXX_FLAGS}
  #INSTALL_COMMAND cmake -E echo "Skipping install step."
  INSTALL_DIR "${CMAKE_INSTALL_PREFIX}"
)

set(fletch_DIR "${CMAKE_INSTALL_PREFIX}/lib/cmake/fletch")

