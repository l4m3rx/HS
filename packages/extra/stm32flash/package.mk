################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="stm32flash"
PKG_VERSION="0.5"
PKG_SITE="https://sourceforge.net/projects/stm32flash/"
PKG_WATCH="http://sf.net/stm32flash/stm32flash-(\d\S*)\.(?:tgz|tbz|txz|(?:tar\.(?:gz|bz2|xz)))"
PKG_URL="https://prdownloads.sourceforge.net/project/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"

pre_configure_target() {
  export LDFLAGS="$LDFLAGS -static"
}

makeinstall_target() {
  make PREFIX=/ DESTDIR=$INSTALL install
}
