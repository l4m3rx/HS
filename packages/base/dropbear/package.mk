################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="dropbear"
PKG_VERSION="2018.76"
PKG_SITE="https://matt.ucc.asn.au/dropbear/dropbear.html"
PKG_WATCH="https://matt.ucc.asn.au/dropbear/releases/ dropbear-([\d\.]*)\.tar\.bz2"
PKG_URL="https://matt.ucc.asn.au/dropbear/releases/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-harden
  --disable-zlib
  --disable-pam
  --disable-syslog
  --enable-bundled-libtom
  --disable-lastlog
  --disable-utmp
  --disable-utmpx
  --disable-wtmp
  --disable-wtmpx
  --disable-loginfunc
  --disable-pututline
  --disable-pututxline
"

pre_configure_target() {
  rm -rf $PKG_BUILD_SUBDIR
  cp $PKG_DIR/config/localoptions.h $PKG_BUILD/

  export LDFLAGS="$LDFLAGS -static"
  export PROGRAMS="scp ssh dropbear dbclient dropbearkey" SCPPROGRESS=1 MULTI=1
}

post_makeinstall_target() {
  mkdir -p $INSTALL/etc
  ln -sf /storage/.config/dropbear/ $INSTALL/etc/dropbear
}
