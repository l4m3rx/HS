################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="ysfclients"
PKG_VERSION="3385796d22"
PKG_SITE="https://github.com/g4klx/YSFClients"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/bin
  cp -PR YSFGateway $INSTALL/bin
  cp -PR YSFParrot $INSTALL/bin

  mkdir -p $INSTALL/share/config
  cp -PR $PKG_BUILD/YSFGateway/YSFGateway.ini $INSTALL/share/config
}
