################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="p25clients"
PKG_VERSION="118bb3dc8b"
PKG_SITE="https://github.com/g4klx/P25Clients"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/bin
  cp -PR P25Gateway $INSTALL/bin
  cp -PR P25Parrot $INSTALL/bin

  mkdir -p $INSTALL/share/config
  cp -PR $PKG_BUILD/P25Gateway/P25Gateway.ini $INSTALL/share/config
}
