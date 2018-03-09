################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="mpfr"
PKG_VERSION="4.0.1"
PKG_SITE="http://www.mpfr.org/"
PKG_WATCH="http://ftp.gnu.org/gnu/mpfr/ mpfr-([\d\.]*)\.tar\.xz"
PKG_URL="http://ftp.gnu.org/gnu/mpfr/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="gmp:host"

PKG_CONFIGURE_OPTS_HOST="
  --disable-shared --enable-static
  --target=$TARGET_NAME
"
