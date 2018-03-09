################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="binutils"
PKG_VERSION="2.30"
PKG_SITE="http://www.gnu.org/software/binutils/binutils.html"
PKG_WATCH="http://ftpmirror.gnu.org/binutils/ binutils-([\d\.]*)\.tar\.gz"
PKG_URL="http://ftpmirror.gnu.org/binutils/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="linux:host"

PKG_CONFIGURE_OPTS_HOST="
  --target=$TARGET_NAME
  --with-sysroot=$SYSROOT_PREFIX
  --with-lib-path=$SYSROOT_PREFIX/lib:$SYSROOT_PREFIX/usr/lib
  --without-ppl
  --without-cloog
  --disable-werror
  --disable-multilib
  --disable-libquadmath
  --disable-libquadmath-support
  --disable-libada
  --disable-libssp
  --disable-gold
  --disable-lto
  --disable-nls
"
