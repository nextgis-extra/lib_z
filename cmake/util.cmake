################################################################################
# Project:  Lib z
# Purpose:  CMake build scripts
# Author:   Dmitry Baryshnikov, dmitry.baryshnikov@nexgis.com
################################################################################
# Copyright (C) 2015-2018, NextGIS <info@nextgis.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
################################################################################

function(check_version major minor rev)

    set(VERSION_FILE ${CMAKE_CURRENT_SOURCE_DIR}/zlib.h)

    file(READ ${VERSION_FILE} VERSION_H_CONTENTS)

    string(REGEX MATCH "ZLIB_VER_MAJOR[ \t]+([0-9]+)"
      ZLIB_VER_MAJOR ${VERSION_H_CONTENTS})
    string (REGEX MATCH "([0-9]+)"
      ZLIB_VER_MAJOR ${ZLIB_VER_MAJOR})
    string(REGEX MATCH "ZLIB_VER_MINOR[ \t]+([0-9]+)"
      ZLIB_VER_MINOR ${VERSION_H_CONTENTS})
    string (REGEX MATCH "([0-9]+)"
      ZLIB_VER_MINOR ${ZLIB_VER_MINOR})
    string(REGEX MATCH "ZLIB_VER_REVISION[ \t]+([0-9]+)"
      ZLIB_VER_REVISION ${VERSION_H_CONTENTS})
    string (REGEX MATCH "([0-9]+)"
      ZLIB_VER_REVISION ${ZLIB_VER_REVISION})

    set(${major} ${ZLIB_VER_MAJOR} PARENT_SCOPE)
    set(${minor} ${ZLIB_VER_MINOR} PARENT_SCOPE)
    set(${rev} ${ZLIB_VER_REVISION} PARENT_SCOPE)

    # Store version string in file for installer needs
    file(TIMESTAMP ${VERSION_FILE} VERSION_DATETIME "%Y-%m-%d %H:%M:%S" UTC)
    file(WRITE ${CMAKE_BINARY_DIR}/version.str "${ZLIB_VER_MAJOR}.${ZLIB_VER_MINOR}.${ZLIB_VER_REVISION}\n${VERSION_DATETIME}")

endfunction(check_version)


function(report_version name ver)

    string(ASCII 27 Esc)
    set(BoldYellow  "${Esc}[1;33m")
    set(ColourReset "${Esc}[m")

    message("${BoldYellow}${name} version ${ver}${ColourReset}")

endfunction()
