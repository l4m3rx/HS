################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="libnl"
PKG_VERSION="3.4.0"
PKG_SITE="https://github.com/thom311/libnl"
PKG_WATCH="https://github.com/thom311/libnl/releases/ .*/libnl-([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/thom311/$PKG_NAME/releases/download/${PKG_NAME}${PKG_VERSION//./_}/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CONFIGURE_OPTS_TARGET="
  --enable-static --disable-shared
  --disable-cli
  --disable-debug
"

pre_configure_target() {
  export CFLAGS="$CFLAGS -D__GLIBC__=1" # wtf libc-compat.h
}

post_makeinstall_target() {
  rm -rf $INSTALL/etc
}
