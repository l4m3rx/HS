################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="mmdvmcal"
PKG_VERSION="e7ee1b9f45"
PKG_SITE="https://github.com/g4klx/MMDVMCal"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/bin
  cp -PR MMDVMCal $INSTALL/bin
}
