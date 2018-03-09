################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="brcmfmac_sdio-firmware-rpi"
PKG_VERSION="dd61ee1578"
PKG_SITE="https://github.com/LibreELEC/brcmfmac_sdio-firmware-rpi"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

make_init() {
  :
}

makeinstall_init() {
  mkdir -p $INSTALL/lib/firmware/brcm
  cp -PR $PKG_BUILD/firmware/brcm/brcmfmac43430-sdio.* $INSTALL/lib/firmware/brcm
}
