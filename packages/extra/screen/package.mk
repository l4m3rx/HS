################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="screen"
PKG_VERSION="4.6.2"
PKG_SITE="http://www.gnu.org/software/screen/"
PKG_WATCH="http://ftpmirror.gnu.org/screen/ screen-([\d\.]*)\.tar\.gz"
PKG_URL="http://ftpmirror.gnu.org/screen/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_CONFIGURE_OPTS_TARGET="
  --enable-colors256
  --disable-pam
  --disable-use-locale
  --disable-telnet
  --disable-socket-dir
"

pre_configure_target() {
  CFLAGS="$CFLAGS -DTERMINFO"
  LDFLAGS="$LDFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/bin
  cp $PKG_BUILD_SUBDIR/screen $INSTALL/bin
}
