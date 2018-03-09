################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="mtr"
PKG_VERSION="0.92"
PKG_SITE="https://github.com/traviscross/mtr"
PKG_WATCH="https://github.com/traviscross/mtr/releases/ .*/archive/v([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/traviscross/mtr/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--without-gtk"

pre_configure_target() {
  export LIBS="-lcurses -lterminfo"
  export CFLAGS="$CFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/bin
  cp $PKG_BUILD_SUBDIR/mtr $INSTALL/bin
  cp $PKG_BUILD_SUBDIR/mtr-packet $INSTALL/bin
}
