################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="hostapd"
PKG_VERSION="2.6"
PKG_SITE="https://w1.fi/hostapd/"
PKG_WATCH="https://w1.fi/releases/ hostapd-([\d\.]*)\.tar\.gz"
PKG_URL="https://w1.fi/releases/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="libnl"

PKG_MAKE_OPTS_TARGET="-C hostapd V=1 LIBDIR=/usr/lib BINDIR=/usr/bin"

pre_configure_target() {
  export LDFLAGS="$LDFLAGS -static"
}

configure_target() {
  cp $PKG_DIR/config/makefile.config hostapd/.config
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR hostapd/hostapd $INSTALL/usr/bin
}
