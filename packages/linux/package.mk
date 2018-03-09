################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="linux"
PKG_VERSION="e3e047e020"
PKG_SITE="https://github.com/raspberrypi/linux"
PKG_URL="https://github.com/raspberrypi/linux/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_NEED_REBUILD="busybox"

post_unpack() {
  cp $PROJECT_DIR/packages/linux/linux.$TARGET_ARCH.conf $PKG_BUILD/.config

  sed -e "s|^ARCH[[:space:]]*?=.*$|ARCH = $TARGET_KERNEL_ARCH|" \
      -e "s|^CROSS_COMPILE[[:space:]]*?=.*$|CROSS_COMPILE = ${TARGET_NAME}-|" \
      -i $PKG_BUILD/Makefile

  sed -e "s|^CONFIG_INITRAMFS_SOURCE=.*$|CONFIG_INITRAMFS_SOURCE=\"$BUILD/image/init.cpio\"|" \
      -e '/^CONFIG_INITRAMFS_SOURCE=*./ a CONFIG_INITRAMFS_ROOT_UID=0\nCONFIG_INITRAMFS_ROOT_GID=0' \
      -i $PKG_BUILD/.config

  touch $PKG_BUILD/.cache.mk
}

make_host() {
  :
}

makeinstall_host() {
  make INSTALL_HDR_PATH=$SYSROOT_PREFIX/usr headers_install
  rm $PKG_BUILD/.cache.mk
}

pre_configure_target() {
  make -C $PKG_BUILD oldconfig
  export KBUILD_BUILD_USER="-,-'<"
  export KBUILD_BUILD_HOST=","
}

make_target() {
  ( cd $ROOT
    rm -rf $BUILD/image/init
    scripts/install initramfs
  )
  make LDFLAGS="" $KERNEL_TARGET $KERNEL_MAKE_EXTRACMD
}

makeinstall_target() {
  :
}

post_makeinstall_target() {
  mkdir -p $PKG_BUILD/.boot
  cp arch/arm/boot/dts/bcm2708-rpi-0-w.dtb $PKG_BUILD/.boot
  cp arch/arm/boot/dts/bcm2708-rpi-b-plus.dtb $PKG_BUILD/.boot
  cp arch/arm/boot/dts/bcm2709-rpi-2-b.dtb $PKG_BUILD/.boot
  cp arch/arm/boot/dts/bcm2710-rpi-3-b-plus.dtb $PKG_BUILD/.boot
  cp arch/arm/boot/dts/bcm2710-rpi-3-b.dtb $PKG_BUILD/.boot

  mkdir -p $PKG_BUILD/.boot/overlays
  cp arch/arm/boot/dts/overlays/pi3-disable-bt.dtbo $PKG_BUILD/.boot/overlays

  rm -f $INSTALL/lib/modules/*/build
  rm -f $INSTALL/lib/modules/*/source
}
