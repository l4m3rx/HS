################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="i2c-tools"
PKG_VERSION="4.0"
PKG_SITE="https://i2c.wiki.kernel.org/index.php/I2C_Tools"
PKG_WATCH="https://mirrors.edge.kernel.org/pub/software/utils/i2c-tools/ i2c-tools-([\d\.]*)\.tar\.xz"
PKG_URL="https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.gz"

MAKEFLAGS="-j1"

make_target() {
  make  CC="$CC" \
        AR="$AR" \
        USE_STATIC_LIB=1 \
        CFLAGS="$TARGET_CFLAGS" \
        LDFLAGS="$TARGET_LDFLAGS -static" \
        CPPFLAGS="$TARGET_CPPFLAGS -I${SYSROOT_PREFIX}/usr/include"
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib
  cp lib/libi2c.a $SYSROOT_PREFIX/usr/lib
}

