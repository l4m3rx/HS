################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="strace"
PKG_VERSION="4.22"
PKG_SITE="https://github.com/strace/strace"
PKG_WATCH="https://github.com/strace/strace/releases/ .*/archive/v([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/strace/strace/archive/v$PKG_VERSION.tar.gz"

PKG_CONFIGURE_OPTS_TARGET="--enable-mpers=check"

pre_configure_target() {
  ./bootstrap
}

makeinstall_target() {
  mkdir -p $INSTALL/bin
  cp $PKG_BUILD/strace $INSTALL/bin
}
