################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="gmp"
PKG_VERSION="6.1.2"
PKG_SITE="http://gmplib.org/"
PKG_WATCH="https://gmplib.org/download/gmp/ gmp-([\d\.]*)\.tar\.xz"
PKG_URL="https://gmplib.org/download/gmp/$PKG_NAME-$PKG_VERSION.tar.xz"

PKG_CONFIGURE_OPTS_HOST="
  --disable-shared --enable-static
  --enable-cxx
"
