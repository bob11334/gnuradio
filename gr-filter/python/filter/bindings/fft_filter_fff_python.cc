/*
 * Copyright 2020 Free Software Foundation, Inc.
 *
 * This file is part of GNU Radio
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 *
 */

/* This file is automatically generated using bindtool */

#include <pybind11/complex.h>
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

namespace py = pybind11;

#include <gnuradio/filter/fft_filter_fff.h>
// pydoc.h is automatically generated in the build directory
#include <fft_filter_fff_pydoc.h>

void bind_fft_filter_fff(py::module& m)
{
    using fft_filter_fff = gr::filter::fft_filter_fff;


    py::class_<fft_filter_fff,
               gr::sync_decimator,
               gr::sync_block,
               gr::block,
               gr::basic_block,
               std::shared_ptr<fft_filter_fff>>(m, "fft_filter_fff", D(fft_filter_fff))

        .def(py::init(&fft_filter_fff::make),
             py::arg("decimation"),
             py::arg("taps"),
             py::arg("nthreads") = 1,
             D(fft_filter_fff, make))


        .def("set_taps",
             &fft_filter_fff::set_taps,
             py::arg("taps"),
             D(fft_filter_fff, set_taps))


        .def("taps", &fft_filter_fff::taps, D(fft_filter_fff, taps))


        .def("set_nthreads",
             &fft_filter_fff::set_nthreads,
             py::arg("n"),
             D(fft_filter_fff, set_nthreads))


        .def("nthreads", &fft_filter_fff::nthreads, D(fft_filter_fff, nthreads))

        ;
}