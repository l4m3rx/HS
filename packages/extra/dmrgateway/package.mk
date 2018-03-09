################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="dmrgateway"
PKG_VERSION="004c162fca"
PKG_SITE="https://github.com/g4klx/DMRGateway"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="
  -DGIT_VERSION=$PKG_VERSION
  -DCMAKE_VERBOSE_MAKEFILE=OFF
"

makeinstall_target() {
  mkdir -p $INSTALL/bin
  cp -PR DMRGateway $INSTALL/bin

  mkdir -p $INSTALL/share/config
  cp -PR $PKG_BUILD/DMRGateway.ini $INSTALL/share/config

  mkdir -p $INSTALL/share/DMRGateway/Audio
  cp -PR $PKG_BUILD/Audio/en_* $INSTALL/share/DMRGateway/Audio
}
