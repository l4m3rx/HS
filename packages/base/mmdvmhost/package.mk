################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="mmdvmhost"
PKG_VERSION="86630e230e"
PKG_SITE="https://github.com/g4klx/MMDVMHost"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="arduipi_oled i2c-tools"

PKG_CMAKE_OPTS_TARGET="
  -DGIT_VERSION=$PKG_VERSION
  -DENABLE_OLED=ON
  -DCMAKE_VERBOSE_MAKEFILE=OFF
"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR MMDVMHost $INSTALL/usr/bin

  mkdir -p $INSTALL/etc/config
  cp -PR $PKG_BUILD/MMDVM.ini $INSTALL/etc/config
}
