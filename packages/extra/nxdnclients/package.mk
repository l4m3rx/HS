################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="nxdnclients"
PKG_VERSION="28a42c921b"
PKG_SITE="https://github.com/g4klx/NXDNClients"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/bin
  cp -PR NXDNGateway $INSTALL/bin
  cp -PR NXDNParrot $INSTALL/bin

  mkdir -p $INSTALL/share/config
  cp -PR $PKG_BUILD/NXDNGateway/NXDNGateway.ini $INSTALL/share/config

  mkdir -p $INSTALL/share/NXDNGateway/Audio
  cp -PR $PKG_BUILD/NXDNGateway/Audio/en_* $INSTALL/share/NXDNGateway/Audio
}
