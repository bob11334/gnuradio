# Copyright 2012-2013 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

########################################################################
include(GrPython)

GR_PYTHON_INSTALL(
    FILES
    __init__.py
    amp_bal.py
    conj_fs_iqcorr.py
    distortion_2_gen.py
    distortion_3_gen.py
    impairments.py
    iqbal_gen.py
    phase_bal.py
    phase_noise_gen.py
    quantizer.py
    DESTINATION ${GR_PYTHON_DIR}/gnuradio/channels
)

########################################################################
# Handle the unit tests
########################################################################
if(ENABLE_TESTING)

  set(GR_TEST_TARGET_DEPS "")
  set(GR_TEST_LIBRARY_DIRS "")
  set(GR_TEST_PYTHON_DIRS
    ${CMAKE_BINARY_DIR}/gnuradio-runtime/python
    ${CMAKE_BINARY_DIR}/gnuradio-runtime/swig	
    ${CMAKE_BINARY_DIR}/gr-blocks/swig
    ${CMAKE_BINARY_DIR}/gr-fft/swig	
    ${CMAKE_BINARY_DIR}/gr-filter/swig	
    ${CMAKE_BINARY_DIR}/gr-analog/swig	
    ${CMAKE_BINARY_DIR}/gr-channels/swig
    )

  include(GrTest)
  file (GLOB py_qa_test_files "qa_*.py")
  foreach(py_qa_test_file ${py_qa_test_files})
    get_filename_component(py_qa_test_name ${py_qa_test_file} NAME_WE)
    GR_ADD_TEST(${py_qa_test_name} ${QA_PYTHON_EXECUTABLE} -B ${py_qa_test_file})
  endforeach(py_qa_test_file)
endif(ENABLE_TESTING)
