################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="initramfs"
PKG_DEPENDS_TARGET="toolchain busybox:init brcmfmac_sdio-firmware-rpi:init"

post_install() {
  ( cd $BUILD/image/init
    cp -PR $PROJECT_DIR/fs-init/* . 2>/dev/null || :
    fakeroot -- sh -c \
      "mkdir -p dev; mknod -m 600 dev/console c 5 1; find . | cpio -H newc -ov -R 0:0 > ../init.cpio"
  )
}
