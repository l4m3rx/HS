################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="nano"
PKG_VERSION="2.9.8"
PKG_SITE="http://www.nano-editor.org/"
PKG_WATCH="https://nano-editor.org/dist/v([\d\.])+/ nano-([\d\.]+)\.tar\.xz"
PKG_URL="https://www.nano-editor.org/dist/v2.9/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_CONFIGURE_OPTS_TARGET="
  --enable-utf8
  --disable-rpath
  --disable-nls
  --disable-browser
  --disable-comment
  --disable-extra
  --disable-help
  --disable-justify
  --disable-libmagic
  --disable-speller
"

pre_configure_target() {
  export CFLAGS="$CFLAGS -static"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/share/nano
  rm -rf $INSTALL/usr/lib/charset.alias
}
