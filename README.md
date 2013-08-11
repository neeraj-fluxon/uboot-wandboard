uboot-wandboard
===============

Overview
--------

 Uboot-wandboard provides a Debian package which installs the U-Boot boot
 loader for the Wandboard computer.

 The <href="http://www.wandboard.org">Wandboard</a> computer is a low power
 computer based on the Freescale i.MX6 Cortex-A9 processor.
 
 <a href="http://www.denx.de/wiki/U-Boot">U-Boot</a> is a universal boot loader
 for embeded systems.

 <a href="http://www.debian.org">Debian</a> is a Linux distribution.

 The package provided can also be used on Debian derived distributions like
 Ubuntu or Mint.


Building
--------

 You can downlaod the git respository with

 <pre>git clone https://github.com/xypron/uboot-wandboard.git</pre>

 To build the Debian package download the build repositories and
 <pre>cd uboot-wandboard
 ./build-dpkg.sh</pre>


Prerequisites
-------------

 The package assumes that you have partioned the SD card in slot 0
 (/dev/mmcblk0) such that at least 1MB is left free before the first partition.
 Otherwise the installation will irrevokably cause data loss.

 Partion /dev/mmcblk0b1 must be formatted with ext2.

 Kernel image file zImage must be in the root directory of /dev/mmcblk0b1.

 File uEnv.txt in the root directory of /dev/mmcblk0b1 can be used to change
 the command line of the Kernel. The following is a template

 <pre>
 #optargs=
 #mmcroot=/dev/sda1 ro
 #mmcrootfstype=ext4 rootwait fixrtc
 #video=
 uenvcmd=run loadzimage; run loadfdt; run mmcargs; bootz ${loadaddr} - ${fdt\_addr};
 </pre>


Installation
------------

 The package can be installed with
 
 <pre>dpkg -i uboot-wandboard-[solo|dual|quad]-[version]\_armhf.deb</pre>

 and uninstalled with

 <pre>apt-get remove  uboot-wandboard-[solo|dual|quad]</pre>

 The installation routine will overwrite any existing bootloader.
 A copy of the bootloader will be written to /boot.

 Uninstall will delete this copy but not the bootloader.


