################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="musl"
PKG_VERSION="1.1.19"
PKG_SITE="https://www.musl-libc.org/"
PKG_WATCH="https://www.musl-libc.org/download.html .*/musl-(.*)\.tar\.gz"
PKG_URL="https://www.musl-libc.org/releases/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="linux:host gcc:bootstrap"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
