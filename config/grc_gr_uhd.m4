dnl Copyright 2010 Free Software Foundation, Inc.
dnl 
dnl This file is part of GNU Radio
dnl 
dnl GNU Radio is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation; either version 3, or (at your option)
dnl any later version.
dnl 
dnl GNU Radio is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl 
dnl You should have received a copy of the GNU General Public License
dnl along with GNU Radio; see the file COPYING.  If not, write to
dnl the Free Software Foundation, Inc., 51 Franklin Street,
dnl Boston, MA 02110-1301, USA.

AC_DEFUN([GRC_GR_UHD],[
    GRC_ENABLE(gr-uhd)

    dnl Dont do gr-uhd if gnuradio-core skipped
    GRC_CHECK_DEPENDENCY(gr-uhd, gnuradio-core)

    if test $passed = yes; then
        dnl Don't do gr-uhd if the 'uhd' package is not installed
        PKG_CHECK_MODULES(
            [UHD], [uhd >= 1.0.0 uhd < 2.0.0], [],
            [passed=no; AC_MSG_RESULT([gr-uhd requires libuhd 1.x.x])]
        )
        UHD_CPPFLAGS="${UHD_CPPFLAGS} -I\${abs_top_srcdir}/gr-uhd/lib"
        AC_SUBST(UHD_CPPFLAGS)
        AC_SUBST(UHD_LIBS)

	# Use this to tell the Makefile whether to define
	# GR_HAVE_UHD for swig.
	AM_CONDITIONAL([GR_DEFINE_HAVE_UHD],[test $passed = yes])
    fi

    AC_CONFIG_FILES([ \
        gr-uhd/Makefile \
        gr-uhd/apps/Makefile \
        gr-uhd/grc/Makefile \
        gr-uhd/lib/Makefile \
        gr-uhd/swig/Makefile \
    ])

    GRC_BUILD_CONDITIONAL(gr-uhd)
])
