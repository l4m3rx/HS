################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="oledctl"
PKG_VERSION="0.1"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="arduipi_oled"

pre_configure_target() {
  cp -PR $PKG_DIR/source/* $PKG_BUILD/
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp oledctl $INSTALL/usr/bin
}
