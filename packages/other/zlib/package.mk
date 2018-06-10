################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="zlib"
PKG_VERSION="1.2.11"
PKG_SITE="http://www.zlib.net"
PKG_WATCH="http://www.zlib.net/ zlib-([\d\.]*)\.tar\.gz"
PKG_URL="http://zlib.net/$PKG_NAME-$PKG_VERSION.tar.xz"

post_makeinstall_target() {
  rm -rf $SYSROOT_PREFIX/usr/lib/libz.so*
  rm -rf $INSTALL/usr/lib/libz.so*
}
