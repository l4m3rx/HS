################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="netbsd-curses"
PKG_VERSION="0.2.1"
PKG_SITE="https://github.com/sabotage-linux/netbsd-curses"
PKG_WATCH="https://github.com/sabotage-linux/netbsd-curses/releases/ .*/archive/v([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/sabotage-linux/netbsd-curses/archive/v$PKG_VERSION.tar.gz"

make_target() {
  make HOSTCC="$HOST_CC" PREFIX=/usr all-static
}

makeinstall_target() {
  make HOSTCC="$HOST_CC" PREFIX=$SYSROOT_PREFIX/usr install-static
}
