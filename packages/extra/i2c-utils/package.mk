################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="i2c-utils"
PKG_VERSION="4.0"
PKG_SITE="https://i2c.wiki.kernel.org/index.php/I2C_Tools"
PKG_URL=""
PKG_DEPENDS_TARGET="i2c-tools"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2cdetect $INSTALL/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2cdump $INSTALL/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2cget $INSTALL/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2cset $INSTALL/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2ctransfer $INSTALL/bin
}

