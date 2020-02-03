Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDC11511C5
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Feb 2020 22:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgBCV3M (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Feb 2020 16:29:12 -0500
Received: from mout.gmx.net ([212.227.17.22]:48775 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgBCV3M (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Feb 2020 16:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580765340;
        bh=vQNaw4SLUj9/TDznKsoe8v4TBQWgeHfY8OFT1UnNo+U=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=h6YUc4lnUx0M3v8+QcODbm12MveHXNMtVIT7Me8T34LcIjUGtSVCrQV9x+XVQGgAa
         ecGWLCmGs4y3aEIO1FkWOHqXTdXr3JWzUsuuWvWTitGAPLnAjZKQPHnYOph17c6uSc
         mzpMY2mYBZ13w26wUQGMgcrFjJPWxlSF6EtnmON0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.173.154]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJqN-1jLR311RgZ-00nSjW; Mon, 03
 Feb 2020 22:29:00 +0100
Date:   Mon, 3 Feb 2020 22:28:58 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Regenerate parisc defconfigs
Message-ID: <20200203212858.GA20477@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:OSGK8WIKgi+EWpbYdIq5KtA64H9IaCLGXPUi4VezcP5ECWshnsa
 Uo5YvdjDbRyw5t0r7IZ7NfwAB9x4H5R5QUjZeZhQZ+f9CfwIlPNbgZ3eU/QTskd0Bnorklx
 xQGFC2lwuxyFgRP80LuqL5tIykjvbF3+2kUGqc3jiM7NY4lYUk37gPCZPy+g6JXLBK4tObi
 blSOog4F8G9Yo3BK/4LVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FIZrWWW6CZQ=:up9XunVnRmExDdKjMH9aWX
 h6IB2+gGl0NnVKS14XmCvctYKYWqrvZtL0zLyAc2AqkjZ3IquQ9lBQxbQ0uCK2UffugUlXoBI
 FBnxaYnzeQUKFzmzvJriFxxKjB5K15aqVcC8Uu+eomIgbc7Cthg2O9adP6exYLU7hfZ9dLqe5
 AD4goyssUnZ20na/yQ8F4eU6yysguz3m+SlpvpC7qRCCTausaYSfUqmDRMPCp73SWQHahZoj0
 XS5hdVJ/36Pzm1dRph1KP7AdRJ7KjCiyFnPvSrzlvjcfsldoJwiZ+xDLPZn7CEukgVIsyP53k
 eISJr7m8ufNcRssDUWnJH7EWtR8wkEV7NdaqRHtH4Gd4f55mWmtagyXm891kAadq64Uao0u6Y
 Z2D4sB/YIIQE92OwLChvicq/sGuNmR61k2iIHnuuXn6+Wr3xNZvVuuv/h4DItnr7P33J5P6BY
 z+HZwJXMMbLtOV5HtP/5l/NrVhXR9RzhBcIoDM3wbmm2QPMksM0SesMZWD97sGsgojROOgmyj
 GqL2Wul4ifDxRsbwOF0rMJoJhJkjm/tUYseuk/pfzMTTuSXQAPWWFZg1LMQGMhQgS0IveZbUL
 HI9PHABsXpduvZRrOmDWgrZDFl3V65g+oqmfFZ8xv2YcymDJtVrQeiTcLSu8eNTyTwGixJO5V
 jlynzQcin7QiD/ZdKRWxGwKGHgLWhaiRRCAMWSRwdPBnpHjST//GnJVqiC+eMjt1T3DVrZ9dR
 XswhIdUYTHLapm26IKkSOxytE5o9E1VKyTDYeuDc1PeqvVlVG/LNYkWMdn8hbrWeR6oEd/noQ
 x+P58We7kEyP6i7aYStF6WViMt+/ysS59EI1gq8ZquwlcUNR6nnx0toAPUV4dbXNu2FTJI0F3
 jiZk6/U4uWbPwsy5f9nMPgX54rsrfa9HXCsAQRQm1UBFmx8NM496fk9N90MEtnGAX0oN4gJOl
 8IQwYid0NMM5SSV7iMxZvaDd9OFTIARMoJ9z/t+mwU0L8+MYnfk82H+mSL4mA3RVi8J108Z3E
 NbBedpdYLOzUxtcEqi73gAFmnK4Io9cmcaB/YTK2OW3Q9gsw8GMW8hba9LN0rysd133MPq8Tz
 snamCfdFAft5qIjd/UkxkntID407aQW5q36wMWNQqvHJ1PU98m/bqJeXzhMaJc3euKhIXsGiO
 joSfTKHy6fU1lAPxTG0D/5pkZLMMpJap1E9DWF3w64nXv13VyCk0eq+4rmqZvNxsqanSEytll
 isSLmHwJw8H1FKZcs
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Regenerate the 32- and 64-bit defconfigs and drop the outdated specific
machine defconfigs for the 712, a500, b160, c3000 and c800 workstations.

Signed-off-by: Helge Deller <deller@gmx.de>

----
 arch/parisc/configs/712_defconfig             |  181 --------------------
 arch/parisc/configs/a500_defconfig            |  177 -------------------
 arch/parisc/configs/b180_defconfig            |   97 ----------
 arch/parisc/configs/c3000_defconfig           |  151 ----------------
 arch/parisc/configs/c8000_defconfig           |  234 --------------------------
 arch/parisc/configs/defconfig                 |  206 ----------------------
 b/arch/parisc/configs/generic-32bit_defconfig |   93 ++--------
 b/arch/parisc/configs/generic-64bit_defconfig |   72 ++------
 8 files changed, 43 insertions(+), 1168 deletions(-)

diff --git a/arch/parisc/configs/712_defconfig b/arch/parisc/configs/712_defconfig
deleted file mode 100644
index d3e3d94e90c3..000000000000
--- a/arch/parisc/configs/712_defconfig
+++ /dev/null
@@ -1,181 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_SLAB=y
-CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_PA7100LC=y
-CONFIG_PREEMPT_VOLUNTARY=y
-CONFIG_GSC_LASI=y
-# CONFIG_PDC_CHASSIS is not set
-CONFIG_BINFMT_MISC=m
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
-CONFIG_NET_KEY=m
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_INET_AH=m
-CONFIG_INET_ESP=m
-CONFIG_INET_DIAG=m
-# CONFIG_IPV6 is not set
-CONFIG_NETFILTER=y
-CONFIG_LLC2=m
-CONFIG_NET_PKTGEN=m
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_STANDALONE is not set
-# CONFIG_PREVENT_FIRMWARE_BUILD is not set
-CONFIG_PARPORT=y
-CONFIG_PARPORT_PC=m
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_CRYPTOLOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=6144
-CONFIG_ATA_OVER_ETH=m
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_ST=y
-CONFIG_BLK_DEV_SR=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_ISCSI_ATTRS=m
-CONFIG_SCSI_LASI700=y
-CONFIG_SCSI_DEBUG=m
-CONFIG_MD=y
-CONFIG_BLK_DEV_MD=m
-CONFIG_MD_LINEAR=m
-CONFIG_MD_RAID0=m
-CONFIG_MD_RAID1=m
-CONFIG_NETDEVICES=y
-CONFIG_BONDING=m
-CONFIG_DUMMY=m
-CONFIG_TUN=m
-CONFIG_LASI_82596=y
-CONFIG_PPP=m
-CONFIG_PPP_BSDCOMP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPP_MPPE=m
-CONFIG_PPPOE=m
-CONFIG_PPP_ASYNC=m
-CONFIG_PPP_SYNC_TTY=m
-# CONFIG_KEYBOARD_HIL_OLD is not set
-CONFIG_MOUSE_SERIAL=m
-CONFIG_LEGACY_PTY_COUNT=64
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_NR_UARTS=17
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-# CONFIG_SERIAL_MUX is not set
-CONFIG_PDC_CONSOLE=y
-CONFIG_PRINTER=m
-CONFIG_PPDEV=m
-# CONFIG_HW_RANDOM is not set
-CONFIG_RAW_DRIVER=y
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_FB_TILEBLITTING=y
-CONFIG_DUMMY_CONSOLE_COLUMNS=128
-CONFIG_DUMMY_CONSOLE_ROWS=48
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
-# CONFIG_LOGO_LINUX_CLUT224 is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_SEQUENCER=y
-CONFIG_SND_HARMONY=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_JFS_FS=m
-CONFIG_XFS_FS=m
-CONFIG_AUTOFS4_FS=y
-CONFIG_ISO9660_FS=y
-CONFIG_JOLIET=y
-CONFIG_UDF_FS=m
-CONFIG_MSDOS_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_UFS_FS=m
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=m
-CONFIG_NFSD_V4=y
-CONFIG_CIFS=m
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_CODEPAGE_737=m
-CONFIG_NLS_CODEPAGE_775=m
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_CODEPAGE_852=m
-CONFIG_NLS_CODEPAGE_855=m
-CONFIG_NLS_CODEPAGE_857=m
-CONFIG_NLS_CODEPAGE_860=m
-CONFIG_NLS_CODEPAGE_861=m
-CONFIG_NLS_CODEPAGE_862=m
-CONFIG_NLS_CODEPAGE_863=m
-CONFIG_NLS_CODEPAGE_864=m
-CONFIG_NLS_CODEPAGE_865=m
-CONFIG_NLS_CODEPAGE_866=m
-CONFIG_NLS_CODEPAGE_869=m
-CONFIG_NLS_CODEPAGE_936=m
-CONFIG_NLS_CODEPAGE_950=m
-CONFIG_NLS_CODEPAGE_932=m
-CONFIG_NLS_CODEPAGE_949=m
-CONFIG_NLS_CODEPAGE_874=m
-CONFIG_NLS_ISO8859_8=m
-CONFIG_NLS_CODEPAGE_1250=m
-CONFIG_NLS_CODEPAGE_1251=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_ISO8859_2=m
-CONFIG_NLS_ISO8859_3=m
-CONFIG_NLS_ISO8859_4=m
-CONFIG_NLS_ISO8859_5=m
-CONFIG_NLS_ISO8859_6=m
-CONFIG_NLS_ISO8859_7=m
-CONFIG_NLS_ISO8859_9=m
-CONFIG_NLS_ISO8859_13=m
-CONFIG_NLS_ISO8859_14=m
-CONFIG_NLS_ISO8859_15=m
-CONFIG_NLS_KOI8_R=m
-CONFIG_NLS_KOI8_U=m
-CONFIG_NLS_UTF8=m
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_SHA512=m
-CONFIG_CRYPTO_TGR192=m
-CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
-CONFIG_CRYPTO_TWOFISH=m
-CONFIG_CRYPTO_DEFLATE=m
-# CONFIG_CRYPTO_HW is not set
-CONFIG_FONTS=y
-CONFIG_FONT_8x8=y
-CONFIG_FONT_8x16=y
diff --git a/arch/parisc/configs/a500_defconfig b/arch/parisc/configs/a500_defconfig
deleted file mode 100644
index 3335734bfadd..000000000000
--- a/arch/parisc/configs/a500_defconfig
+++ /dev/null
@@ -1,177 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_SLAB=y
-CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_PA8X00=y
-CONFIG_64BIT=y
-CONFIG_SMP=y
-CONFIG_NR_CPUS=8
-# CONFIG_GSC is not set
-CONFIG_PCI=y
-CONFIG_PCI_LBA=y
-CONFIG_PCCARD=m
-# CONFIG_PCMCIA_LOAD_CIS is not set
-CONFIG_YENTA=m
-CONFIG_PD6729=m
-CONFIG_I82092=m
-# CONFIG_SUPERIO is not set
-# CONFIG_CHASSIS_LCD_LED is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
-CONFIG_NET_KEY=m
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_INET_AH=m
-CONFIG_INET_ESP=m
-CONFIG_INET6_AH=m
-CONFIG_INET6_ESP=m
-CONFIG_INET6_IPCOMP=m
-CONFIG_IPV6_TUNNEL=m
-CONFIG_NETFILTER=y
-# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
-CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_MATCH_ECN=m
-CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_ECN=m
-CONFIG_IP_NF_RAW=m
-CONFIG_IP_NF_ARPTABLES=m
-CONFIG_IP_NF_ARPFILTER=m
-CONFIG_IP_NF_ARP_MANGLE=m
-CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP6_NF_MATCH_FRAG=m
-CONFIG_IP6_NF_MATCH_OPTS=m
-CONFIG_IP6_NF_MATCH_HL=m
-CONFIG_IP6_NF_MATCH_IPV6HEADER=m
-CONFIG_IP6_NF_MATCH_RT=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
-CONFIG_IP6_NF_RAW=m
-CONFIG_IP_DCCP=m
-# CONFIG_IP_DCCP_CCID3 is not set
-CONFIG_LLC2=m
-CONFIG_NET_PKTGEN=m
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_STANDALONE is not set
-# CONFIG_PREVENT_FIRMWARE_BUILD is not set
-CONFIG_BLK_DEV_UMEM=m
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=6144
-CONFIG_RAID_ATTRS=m
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_ST=y
-CONFIG_BLK_DEV_SR=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_ISCSI_ATTRS=m
-CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_SCSI_QLOGIC_1280=m
-CONFIG_SCSI_DEBUG=m
-CONFIG_MD=y
-CONFIG_BLK_DEV_MD=y
-CONFIG_MD_LINEAR=y
-CONFIG_MD_RAID0=y
-CONFIG_MD_RAID1=y
-CONFIG_FUSION=y
-CONFIG_FUSION_SPI=m
-CONFIG_FUSION_CTL=m
-CONFIG_NETDEVICES=y
-CONFIG_BONDING=m
-CONFIG_DUMMY=m
-CONFIG_TUN=m
-CONFIG_PCMCIA_3C574=m
-CONFIG_PCMCIA_3C589=m
-CONFIG_VORTEX=m
-CONFIG_TYPHOON=m
-CONFIG_ACENIC=m
-CONFIG_ACENIC_OMIT_TIGON_I=y
-CONFIG_PCNET32=m
-CONFIG_TIGON3=m
-CONFIG_NET_TULIP=y
-CONFIG_DE2104X=m
-CONFIG_TULIP=y
-CONFIG_TULIP_MMIO=y
-CONFIG_PCMCIA_XIRCOM=m
-CONFIG_HP100=m
-CONFIG_E100=m
-CONFIG_E1000=m
-CONFIG_PCMCIA_SMC91C92=m
-CONFIG_PCMCIA_XIRC2PS=m
-CONFIG_PPP=m
-CONFIG_PPP_BSDCOMP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPP_ASYNC=m
-CONFIG_PPP_SYNC_TTY=m
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-# CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_CS=m
-CONFIG_SERIAL_8250_NR_UARTS=17
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_PDC_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_RAW_DRIVER=y
-# CONFIG_HWMON is not set
-CONFIG_AGP=y
-CONFIG_AGP_PARISC=y
-# CONFIG_STI_CONSOLE is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_JFS_FS=m
-CONFIG_XFS_FS=m
-CONFIG_AUTOFS4_FS=y
-CONFIG_ISO9660_FS=y
-CONFIG_JOLIET=y
-CONFIG_UDF_FS=m
-CONFIG_MSDOS_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_UFS_FS=m
-CONFIG_NFS_FS=m
-CONFIG_NFS_V4=m
-CONFIG_NFSD=m
-CONFIG_NFSD_V4=y
-CONFIG_CIFS=m
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_ISO8859_15=m
-CONFIG_NLS_UTF8=m
-CONFIG_DEBUG_FS=y
-CONFIG_HEADERS_INSTALL=y
-CONFIG_HEADERS_CHECK=y
-CONFIG_MAGIC_SYSRQ=y
-# CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_BLOWFISH=m
-# CONFIG_CRYPTO_HW is not set
diff --git a/arch/parisc/configs/b180_defconfig b/arch/parisc/configs/b180_defconfig
deleted file mode 100644
index 07fde5bd6974..000000000000
--- a/arch/parisc/configs/b180_defconfig
+++ /dev/null
@@ -1,97 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODVERSIONS=y
-CONFIG_PA7100LC=y
-CONFIG_HPPB=y
-CONFIG_IOMMU_CCIO=y
-CONFIG_GSC_LASI=y
-CONFIG_GSC_WAX=y
-CONFIG_EISA=y
-CONFIG_ISA=y
-CONFIG_PCI=y
-CONFIG_GSC_DINO=y
-# CONFIG_PDC_CHASSIS is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_PREVENT_FIRMWARE_BUILD is not set
-CONFIG_PARPORT=y
-CONFIG_PARPORT_PC=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_CRYPTOLOOP=y
-CONFIG_CDROM_PKTCDVD=m
-CONFIG_ATA_OVER_ETH=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_ST=y
-CONFIG_BLK_DEV_SR=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_LASI700=y
-CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=0
-CONFIG_SCSI_ZALON=y
-CONFIG_SCSI_NCR53C8XX_SYNC=40
-CONFIG_MD=y
-CONFIG_BLK_DEV_MD=y
-CONFIG_MD_LINEAR=y
-CONFIG_MD_RAID0=y
-CONFIG_MD_RAID1=y
-CONFIG_NETDEVICES=y
-CONFIG_NET_TULIP=y
-CONFIG_TULIP=y
-CONFIG_LASI_82596=y
-CONFIG_PPP=y
-CONFIG_INPUT_EVDEV=y
-# CONFIG_KEYBOARD_HIL_OLD is not set
-CONFIG_INPUT_MISC=y
-# CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_NR_UARTS=13
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_PRINTER=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_SEQUENCER=y
-CONFIG_SND_HARMONY=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_ISO9660_FS=y
-CONFIG_JOLIET=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=y
-CONFIG_NFSD_V3=y
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_ISO8859_15=m
-CONFIG_NLS_UTF8=m
-CONFIG_HEADERS_INSTALL=y
-CONFIG_HEADERS_CHECK=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_SECURITY=y
diff --git a/arch/parisc/configs/c3000_defconfig b/arch/parisc/configs/c3000_defconfig
deleted file mode 100644
index 64d45a8b6ca0..000000000000
--- a/arch/parisc/configs/c3000_defconfig
+++ /dev/null
@@ -1,151 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_SLAB=y
-CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_PA8X00=y
-CONFIG_PREEMPT_VOLUNTARY=y
-# CONFIG_GSC is not set
-CONFIG_PCI=y
-CONFIG_PCI_LBA=y
-# CONFIG_PDC_CHASSIS is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
-CONFIG_NET_KEY=m
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_INET_DIAG is not set
-CONFIG_INET6_IPCOMP=m
-CONFIG_IPV6_TUNNEL=m
-CONFIG_NETFILTER=y
-CONFIG_NET_PKTGEN=m
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_STANDALONE is not set
-# CONFIG_PREVENT_FIRMWARE_BUILD is not set
-CONFIG_BLK_DEV_UMEM=m
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_CRYPTOLOOP=m
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_NS87415=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_ST=y
-CONFIG_BLK_DEV_SR=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_ISCSI_ATTRS=m
-CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=0
-CONFIG_SCSI_DEBUG=m
-CONFIG_MD=y
-CONFIG_BLK_DEV_MD=y
-CONFIG_MD_LINEAR=y
-CONFIG_MD_RAID0=y
-CONFIG_MD_RAID1=y
-CONFIG_BLK_DEV_DM=m
-CONFIG_DM_CRYPT=m
-CONFIG_DM_SNAPSHOT=m
-CONFIG_DM_MIRROR=m
-CONFIG_DM_ZERO=m
-CONFIG_DM_MULTIPATH=m
-CONFIG_FUSION=y
-CONFIG_FUSION_SPI=m
-CONFIG_FUSION_CTL=m
-CONFIG_NETDEVICES=y
-CONFIG_BONDING=m
-CONFIG_DUMMY=m
-CONFIG_TUN=m
-CONFIG_ACENIC=m
-CONFIG_TIGON3=m
-CONFIG_NET_TULIP=y
-CONFIG_DE2104X=m
-CONFIG_TULIP=y
-CONFIG_TULIP_MMIO=y
-CONFIG_E100=m
-CONFIG_E1000=m
-CONFIG_PPP=m
-CONFIG_PPP_BSDCOMP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPPOE=m
-CONFIG_PPP_ASYNC=m
-CONFIG_PPP_SYNC_TTY=m
-# CONFIG_KEYBOARD_ATKBD is not set
-# CONFIG_MOUSE_PS2 is not set
-CONFIG_SERIO=m
-CONFIG_SERIO_LIBPS2=m
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_NR_UARTS=13
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_RAW_DRIVER=y
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
-# CONFIG_LOGO_LINUX_CLUT224 is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_SEQUENCER=y
-CONFIG_SND_AD1889=y
-CONFIG_USB_HIDDEV=y
-CONFIG_USB=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_PRINTER=m
-CONFIG_USB_STORAGE=m
-CONFIG_USB_STORAGE_USBAT=m
-CONFIG_USB_STORAGE_SDDR09=m
-CONFIG_USB_STORAGE_SDDR55=m
-CONFIG_USB_STORAGE_JUMPSHOT=m
-CONFIG_USB_MDC800=m
-CONFIG_USB_MICROTEK=m
-CONFIG_USB_LEGOTOWER=m
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_XFS_FS=m
-CONFIG_AUTOFS4_FS=y
-CONFIG_ISO9660_FS=y
-CONFIG_JOLIET=y
-CONFIG_MSDOS_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=y
-CONFIG_NFSD_V3=y
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_ISO8859_15=m
-CONFIG_NLS_UTF8=m
-CONFIG_DEBUG_FS=y
-CONFIG_HEADERS_INSTALL=y
-CONFIG_HEADERS_CHECK=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_MUTEXES=y
-# CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_MD5=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_DES=m
-# CONFIG_CRYPTO_HW is not set
diff --git a/arch/parisc/configs/c8000_defconfig b/arch/parisc/configs/c8000_defconfig
deleted file mode 100644
index db864b18962a..000000000000
--- a/arch/parisc/configs/c8000_defconfig
+++ /dev/null
@@ -1,234 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-# CONFIG_CROSS_MEMORY_ATTACH is not set
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_BSD_PROCESS_ACCT_V3=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_RELAY=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_BLK_DEV_INTEGRITY=y
-CONFIG_PA8X00=y
-CONFIG_64BIT=y
-CONFIG_SMP=y
-CONFIG_PREEMPT=y
-CONFIG_IOMMU_CCIO=y
-CONFIG_PCI=y
-CONFIG_PCI_LBA=y
-# CONFIG_SUPERIO is not set
-# CONFIG_CHASSIS_LCD_LED is not set
-# CONFIG_PDC_CHASSIS is not set
-# CONFIG_PDC_CHASSIS_WARN is not set
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_BINFMT_MISC=m
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
-CONFIG_XFRM_SUB_POLICY=y
-CONFIG_NET_KEY=m
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_IP_PNP_RARP=y
-CONFIG_NET_IPIP=m
-CONFIG_IP_MROUTE=y
-CONFIG_IP_PIMSM_V1=y
-CONFIG_IP_PIMSM_V2=y
-CONFIG_SYN_COOKIES=y
-CONFIG_INET_AH=m
-CONFIG_INET_ESP=m
-CONFIG_INET_IPCOMP=m
-CONFIG_INET_XFRM_MODE_BEET=m
-CONFIG_INET_DIAG=m
-# CONFIG_IPV6 is not set
-CONFIG_IP_DCCP=m
-# CONFIG_IP_DCCP_CCID3 is not set
-CONFIG_TIPC=m
-CONFIG_LLC2=m
-CONFIG_DNS_RESOLVER=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_STANDALONE is not set
-CONFIG_PARPORT=y
-CONFIG_PARPORT_PC=y
-CONFIG_PARPORT_PC_FIFO=y
-CONFIG_BLK_DEV_UMEM=m
-CONFIG_BLK_DEV_LOOP=m
-CONFIG_BLK_DEV_CRYPTOLOOP=m
-CONFIG_BLK_DEV_SX8=m
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=6144
-CONFIG_CDROM_PKTCDVD=m
-CONFIG_CDROM_PKTCDVD_WCACHE=y
-CONFIG_ATA_OVER_ETH=m
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_PLATFORM=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_ST=m
-CONFIG_BLK_DEV_SR=m
-CONFIG_CHR_DEV_SG=y
-CONFIG_CHR_DEV_SCH=m
-CONFIG_SCSI_CONSTANTS=y
-CONFIG_SCSI_LOGGING=y
-CONFIG_SCSI_FC_ATTRS=y
-CONFIG_SCSI_SAS_LIBSAS=m
-CONFIG_ISCSI_TCP=m
-CONFIG_ISCSI_BOOT_SYSFS=m
-CONFIG_ATA=y
-CONFIG_PATA_SIL680=y
-CONFIG_FUSION=y
-CONFIG_FUSION_SPI=y
-CONFIG_FUSION_SAS=y
-CONFIG_NETDEVICES=y
-CONFIG_DUMMY=m
-CONFIG_NETCONSOLE=m
-CONFIG_TUN=y
-CONFIG_E1000=y
-CONFIG_PPP=m
-CONFIG_PPP_BSDCOMP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPP_MPPE=m
-CONFIG_PPPOE=m
-CONFIG_PPP_ASYNC=m
-CONFIG_PPP_SYNC_TTY=m
-# CONFIG_WLAN is not set
-CONFIG_INPUT_FF_MEMLESS=m
-# CONFIG_KEYBOARD_ATKBD is not set
-# CONFIG_KEYBOARD_HIL_OLD is not set
-# CONFIG_KEYBOARD_HIL is not set
-# CONFIG_MOUSE_PS2 is not set
-CONFIG_INPUT_MISC=y
-CONFIG_SERIO_SERPORT=m
-CONFIG_SERIO_PARKBD=m
-CONFIG_SERIO_GSCPS2=m
-# CONFIG_HP_SDC is not set
-CONFIG_SERIO_PCIPS2=m
-CONFIG_SERIO_LIBPS2=y
-CONFIG_SERIO_RAW=m
-CONFIG_SERIAL_8250=y
-# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_NR_UARTS=8
-CONFIG_SERIAL_8250_RUNTIME_UARTS=8
-CONFIG_SERIAL_8250_EXTENDED=y
-# CONFIG_SERIAL_MUX is not set
-CONFIG_SERIAL_JSM=m
-CONFIG_PRINTER=y
-CONFIG_HW_RANDOM=y
-CONFIG_RAW_DRIVER=m
-CONFIG_PTP_1588_CLOCK=y
-CONFIG_SSB=m
-CONFIG_SSB_DRIVER_PCICORE=y
-CONFIG_AGP=y
-CONFIG_AGP_PARISC=y
-CONFIG_DRM=y
-CONFIG_DRM_RADEON=y
-CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_FOREIGN_ENDIAN=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_FB_TILEBLITTING=y
-# CONFIG_FB_STI is not set
-# CONFIG_LCD_CLASS_DEVICE is not set
-# CONFIG_BACKLIGHT_GENERIC is not set
-CONFIG_FRAMEBUFFER_CONSOLE=y
-# CONFIG_STI_CONSOLE is not set
-CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
-# CONFIG_LOGO_LINUX_CLUT224 is not set
-CONFIG_SOUND=m
-CONFIG_SND=m
-CONFIG_SND_VERBOSE_PRINTK=y
-CONFIG_SND_SEQUENCER=m
-CONFIG_SND_SEQ_DUMMY=m
-CONFIG_SND_AD1889=m
-# CONFIG_SND_USB is not set
-# CONFIG_SND_GSC is not set
-CONFIG_USB=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
-CONFIG_EXT2_FS_SECURITY=y
-CONFIG_EXT3_FS=y
-CONFIG_REISERFS_FS=m
-CONFIG_REISERFS_PROC_INFO=y
-CONFIG_XFS_FS=m
-CONFIG_XFS_POSIX_ACL=y
-CONFIG_QUOTA=y
-CONFIG_QFMT_V1=m
-CONFIG_QFMT_V2=m
-CONFIG_AUTOFS4_FS=m
-CONFIG_FUSE_FS=m
-CONFIG_ISO9660_FS=y
-CONFIG_JOLIET=y
-CONFIG_MSDOS_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_XATTR=y
-CONFIG_NFS_FS=m
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_CODEPAGE_737=m
-CONFIG_NLS_CODEPAGE_775=m
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_CODEPAGE_852=m
-CONFIG_NLS_CODEPAGE_855=m
-CONFIG_NLS_CODEPAGE_857=m
-CONFIG_NLS_CODEPAGE_860=m
-CONFIG_NLS_CODEPAGE_861=m
-CONFIG_NLS_CODEPAGE_862=m
-CONFIG_NLS_CODEPAGE_863=m
-CONFIG_NLS_CODEPAGE_864=m
-CONFIG_NLS_CODEPAGE_865=m
-CONFIG_NLS_CODEPAGE_866=m
-CONFIG_NLS_CODEPAGE_869=m
-CONFIG_NLS_CODEPAGE_936=m
-CONFIG_NLS_CODEPAGE_950=m
-CONFIG_NLS_CODEPAGE_932=m
-CONFIG_NLS_CODEPAGE_949=m
-CONFIG_NLS_CODEPAGE_874=m
-CONFIG_NLS_ISO8859_8=m
-CONFIG_NLS_CODEPAGE_1250=m
-CONFIG_NLS_CODEPAGE_1251=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_ISO8859_2=m
-CONFIG_NLS_ISO8859_3=m
-CONFIG_NLS_ISO8859_4=m
-CONFIG_NLS_ISO8859_5=m
-CONFIG_NLS_ISO8859_6=m
-CONFIG_NLS_ISO8859_7=m
-CONFIG_NLS_ISO8859_9=m
-CONFIG_NLS_ISO8859_13=m
-CONFIG_NLS_ISO8859_14=m
-CONFIG_NLS_ISO8859_15=m
-CONFIG_NLS_KOI8_R=m
-CONFIG_NLS_KOI8_U=m
-CONFIG_NLS_UTF8=m
-CONFIG_UNUSED_SYMBOLS=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_SLAB=y
-CONFIG_DEBUG_MEMORY_INIT=y
-CONFIG_DEBUG_STACKOVERFLOW=y
-CONFIG_PANIC_ON_OOPS=y
-CONFIG_DEBUG_RT_MUTEXES=y
-CONFIG_DEBUG_BLOCK_EXT_DEVT=y
-CONFIG_LATENCYTOP=y
-CONFIG_KEYS=y
-# CONFIG_CRYPTO_HW is not set
-CONFIG_FONTS=y
diff --git a/arch/parisc/configs/defconfig b/arch/parisc/configs/defconfig
deleted file mode 100644
index 5b877ca34ebf..000000000000
--- a/arch/parisc/configs/defconfig
+++ /dev/null
@@ -1,206 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_SLAB=y
-CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PA7100LC=y
-CONFIG_PREEMPT_VOLUNTARY=y
-CONFIG_IOMMU_CCIO=y
-CONFIG_GSC_LASI=y
-CONFIG_GSC_WAX=y
-CONFIG_EISA=y
-CONFIG_PCI=y
-CONFIG_GSC_DINO=y
-CONFIG_PCI_LBA=y
-CONFIG_PCCARD=y
-CONFIG_YENTA=y
-CONFIG_PD6729=y
-CONFIG_I82092=y
-CONFIG_BINFMT_MISC=m
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
-CONFIG_NET_KEY=m
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_INET_AH=m
-CONFIG_INET_ESP=m
-CONFIG_INET_DIAG=m
-CONFIG_INET6_AH=y
-CONFIG_INET6_ESP=y
-CONFIG_INET6_IPCOMP=y
-CONFIG_LLC2=m
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_STANDALONE is not set
-# CONFIG_PREVENT_FIRMWARE_BUILD is not set
-CONFIG_PARPORT=y
-CONFIG_PARPORT_PC=m
-CONFIG_PARPORT_PC_PCMCIA=m
-CONFIG_PARPORT_1284=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_CRYPTOLOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=6144
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECS=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_NS87415=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_ST=y
-CONFIG_BLK_DEV_SR=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_LASI700=y
-CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_SCSI_ZALON=y
-CONFIG_MD=y
-CONFIG_BLK_DEV_MD=y
-CONFIG_MD_LINEAR=y
-CONFIG_MD_RAID0=y
-CONFIG_MD_RAID1=y
-CONFIG_MD_RAID10=y
-CONFIG_BLK_DEV_DM=y
-CONFIG_NETDEVICES=y
-CONFIG_BONDING=m
-CONFIG_DUMMY=m
-CONFIG_TUN=m
-CONFIG_ACENIC=y
-CONFIG_TIGON3=y
-CONFIG_NET_TULIP=y
-CONFIG_TULIP=y
-CONFIG_LASI_82596=y
-CONFIG_PPP=m
-CONFIG_PPP_BSDCOMP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPPOE=m
-CONFIG_PPP_ASYNC=m
-CONFIG_PPP_SYNC_TTY=m
-# CONFIG_KEYBOARD_HIL_OLD is not set
-CONFIG_MOUSE_SERIAL=y
-CONFIG_LEGACY_PTY_COUNT=64
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_CS=y
-CONFIG_SERIAL_8250_NR_UARTS=17
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_PRINTER=m
-CONFIG_PPDEV=m
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_FB_TILEBLITTING=y
-CONFIG_DUMMY_CONSOLE_COLUMNS=128
-CONFIG_DUMMY_CONSOLE_ROWS=48
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
-# CONFIG_LOGO_LINUX_CLUT224 is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_DYNAMIC_MINORS=y
-CONFIG_SND_SEQUENCER=y
-CONFIG_SND_AD1889=y
-CONFIG_SND_HARMONY=y
-CONFIG_HID_GYRATION=y
-CONFIG_HID_NTRIG=y
-CONFIG_HID_PANTHERLORD=y
-CONFIG_HID_PETALYNX=y
-CONFIG_HID_SAMSUNG=y
-CONFIG_HID_SUNPLUS=y
-CONFIG_HID_TOPSEED=y
-CONFIG_USB=y
-CONFIG_USB_MON=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_ISO9660_FS=y
-CONFIG_JOLIET=y
-CONFIG_VFAT_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=y
-CONFIG_NFSD_V4=y
-CONFIG_CIFS=m
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_CODEPAGE_737=m
-CONFIG_NLS_CODEPAGE_775=m
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_CODEPAGE_852=m
-CONFIG_NLS_CODEPAGE_855=m
-CONFIG_NLS_CODEPAGE_857=m
-CONFIG_NLS_CODEPAGE_860=m
-CONFIG_NLS_CODEPAGE_861=m
-CONFIG_NLS_CODEPAGE_862=m
-CONFIG_NLS_CODEPAGE_863=m
-CONFIG_NLS_CODEPAGE_864=m
-CONFIG_NLS_CODEPAGE_865=m
-CONFIG_NLS_CODEPAGE_866=m
-CONFIG_NLS_CODEPAGE_869=m
-CONFIG_NLS_CODEPAGE_936=m
-CONFIG_NLS_CODEPAGE_950=m
-CONFIG_NLS_CODEPAGE_932=m
-CONFIG_NLS_CODEPAGE_949=m
-CONFIG_NLS_CODEPAGE_874=m
-CONFIG_NLS_ISO8859_8=m
-CONFIG_NLS_CODEPAGE_1250=y
-CONFIG_NLS_CODEPAGE_1251=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_ISO8859_2=m
-CONFIG_NLS_ISO8859_3=m
-CONFIG_NLS_ISO8859_4=m
-CONFIG_NLS_ISO8859_5=m
-CONFIG_NLS_ISO8859_6=m
-CONFIG_NLS_ISO8859_7=m
-CONFIG_NLS_ISO8859_9=m
-CONFIG_NLS_ISO8859_13=m
-CONFIG_NLS_ISO8859_14=m
-CONFIG_NLS_ISO8859_15=m
-CONFIG_NLS_KOI8_R=m
-CONFIG_NLS_KOI8_U=m
-CONFIG_NLS_UTF8=y
-CONFIG_DEBUG_FS=y
-CONFIG_HEADERS_INSTALL=y
-CONFIG_HEADERS_CHECK=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_KEYS=y
-CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_SHA512=m
-CONFIG_CRYPTO_TGR192=m
-CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
-CONFIG_CRYPTO_TWOFISH=m
-# CONFIG_CRYPTO_HW is not set
-CONFIG_LIBCRC32C=m
-CONFIG_FONTS=y
diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index c7a5726728a4..61bac8ff8f22 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -10,23 +10,20 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
 CONFIG_PA7100LC=y
 CONFIG_SMP=y
 CONFIG_HZ_100=y
 CONFIG_IOMMU_CCIO=y
 CONFIG_GSC_LASI=y
 CONFIG_GSC_WAX=y
-CONFIG_EISA=y
-CONFIG_PCI=y
 CONFIG_GSC_DINO=y
 CONFIG_PCI_LBA=y
-CONFIG_PCCARD=m
-CONFIG_YENTA=m
 # CONFIG_PDC_CHASSIS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_UNUSED_SYMBOLS=y
+# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
 CONFIG_NET=y
@@ -35,17 +32,15 @@ CONFIG_UNIX=y
 CONFIG_XFRM_USER=m
 CONFIG_NET_KEY=m
 CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_BOOTP=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 CONFIG_INET_DIAG=m
 CONFIG_LLC2=m
 # CONFIG_WIRELESS is not set
+CONFIG_EISA=y
+CONFIG_PCI=y
+CONFIG_PCCARD=m
+CONFIG_YENTA=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
@@ -88,7 +83,6 @@ CONFIG_TUN=m
 # CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
-# CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_BROCADE is not set
 # CONFIG_NET_VENDOR_CHELSIO is not set
@@ -97,8 +91,6 @@ CONFIG_NET_TULIP=y
 CONFIG_TULIP=y
 # CONFIG_NET_VENDOR_DLINK is not set
 # CONFIG_NET_VENDOR_EMULEX is not set
-# CONFIG_NET_VENDOR_EXAR is not set
-# CONFIG_NET_VENDOR_HP is not set
 CONFIG_LASI_82596=y
 # CONFIG_NET_VENDOR_MELLANOX is not set
 # CONFIG_NET_VENDOR_MICREL is not set
@@ -106,10 +98,9 @@ CONFIG_LASI_82596=y
 # CONFIG_NET_VENDOR_NATSEMI is not set
 # CONFIG_NET_VENDOR_NVIDIA is not set
 # CONFIG_NET_VENDOR_OKI is not set
-# CONFIG_NET_PACKET_ENGINE is not set
 # CONFIG_NET_VENDOR_QLOGIC is not set
-# CONFIG_NET_VENDOR_REALTEK is not set
 # CONFIG_NET_VENDOR_RDC is not set
+# CONFIG_NET_VENDOR_REALTEK is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
 # CONFIG_NET_VENDOR_SILAN is not set
 # CONFIG_NET_VENDOR_SIS is not set
@@ -142,7 +133,6 @@ CONFIG_PPDEV=m
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 # CONFIG_HWMON is not set
-CONFIG_AGP=y
 CONFIG_FB=y
 CONFIG_FB_FOREIGN_ENDIAN=y
 CONFIG_FB_MODE_HELPERS=y
@@ -230,63 +220,11 @@ CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 # CONFIG_CIFS_DEBUG is not set
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_CODEPAGE_737=m
-CONFIG_NLS_CODEPAGE_775=m
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_CODEPAGE_852=m
-CONFIG_NLS_CODEPAGE_855=m
-CONFIG_NLS_CODEPAGE_857=m
-CONFIG_NLS_CODEPAGE_860=m
-CONFIG_NLS_CODEPAGE_861=m
-CONFIG_NLS_CODEPAGE_862=m
-CONFIG_NLS_CODEPAGE_863=m
-CONFIG_NLS_CODEPAGE_864=m
-CONFIG_NLS_CODEPAGE_865=m
-CONFIG_NLS_CODEPAGE_866=m
-CONFIG_NLS_CODEPAGE_869=m
-CONFIG_NLS_CODEPAGE_936=m
-CONFIG_NLS_CODEPAGE_950=m
-CONFIG_NLS_CODEPAGE_932=m
-CONFIG_NLS_CODEPAGE_949=m
-CONFIG_NLS_CODEPAGE_874=m
-CONFIG_NLS_ISO8859_8=m
-CONFIG_NLS_CODEPAGE_1250=y
-CONFIG_NLS_CODEPAGE_1251=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_ISO8859_2=m
-CONFIG_NLS_ISO8859_3=m
-CONFIG_NLS_ISO8859_4=m
-CONFIG_NLS_ISO8859_5=m
-CONFIG_NLS_ISO8859_6=m
-CONFIG_NLS_ISO8859_7=m
-CONFIG_NLS_ISO8859_9=m
-CONFIG_NLS_ISO8859_13=m
-CONFIG_NLS_ISO8859_14=m
-CONFIG_NLS_ISO8859_15=m
-CONFIG_NLS_KOI8_R=m
-CONFIG_NLS_KOI8_U=m
-CONFIG_NLS_UTF8=y
-CONFIG_UNUSED_SYMBOLS=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_MEMORY_INIT=y
-CONFIG_DEBUG_STACKOVERFLOW=y
-CONFIG_DEBUG_SHIRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEBUG_RT_MUTEXES=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_LATENCYTOP=y
-CONFIG_LKDTM=m
-CONFIG_KEYS=y
 CONFIG_CRYPTO_TEST=m
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD5=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA1=y
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
@@ -302,3 +240,14 @@ CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRC_CCITT=m
 CONFIG_CRC_T10DIF=y
 CONFIG_FONTS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_DEBUG_STACKOVERFLOW=y
+CONFIG_DEBUG_SHIRQ=y
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_LATENCYTOP=y
+CONFIG_LKDTM=m
diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/configs/generic-64bit_defconfig
index d39e7f821aba..59561e04e659 100644
--- a/arch/parisc/configs/generic-64bit_defconfig
+++ b/arch/parisc/configs/generic-64bit_defconfig
@@ -17,27 +17,24 @@ CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_MODULES=y
-CONFIG_MODULE_FORCE_LOAD=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_BLK_DEV_INTEGRITY=y
-# CONFIG_IOSCHED_DEADLINE is not set
 CONFIG_PA8X00=y
 CONFIG_64BIT=y
 CONFIG_SMP=y
-# CONFIG_COMPACTION is not set
 CONFIG_HPPB=y
 CONFIG_IOMMU_CCIO=y
 CONFIG_GSC_LASI=y
 CONFIG_GSC_WAX=y
-CONFIG_PCI=y
-CONFIG_PCI_STUB=m
-CONFIG_PCI_IOV=y
 CONFIG_GSC_DINO=y
 CONFIG_PCI_LBA=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_UNUSED_SYMBOLS=y
+CONFIG_BLK_DEV_INTEGRITY=y
 CONFIG_BINFMT_MISC=m
+# CONFIG_COMPACTION is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -47,18 +44,17 @@ CONFIG_XFRM_MIGRATE=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
-CONFIG_IP_PNP_BOOTP=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
-CONFIG_INET_XFRM_MODE_TRANSPORT=m
-CONFIG_INET_XFRM_MODE_TUNNEL=m
-CONFIG_INET_XFRM_MODE_BEET=m
 CONFIG_INET_DIAG=m
 CONFIG_NETFILTER=y
 # CONFIG_NETFILTER_ADVANCED is not set
 CONFIG_NETFILTER_NETLINK_LOG=y
 CONFIG_DCB=y
 # CONFIG_WIRELESS is not set
+CONFIG_PCI=y
+CONFIG_PCI_STUB=m
+CONFIG_PCI_IOV=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
@@ -102,7 +98,6 @@ CONFIG_TUN=y
 # CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
-# CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_BROCADE is not set
 # CONFIG_NET_VENDOR_CHELSIO is not set
@@ -111,10 +106,8 @@ CONFIG_NET_TULIP=y
 CONFIG_TULIP=y
 # CONFIG_NET_VENDOR_DLINK is not set
 # CONFIG_NET_VENDOR_EMULEX is not set
-# CONFIG_NET_VENDOR_EXAR is not set
-CONFIG_HP100=m
-CONFIG_E1000=y
 CONFIG_LASI_82596=y
+CONFIG_E1000=y
 # CONFIG_NET_VENDOR_MARVELL is not set
 # CONFIG_NET_VENDOR_MELLANOX is not set
 # CONFIG_NET_VENDOR_MICREL is not set
@@ -124,9 +117,8 @@ CONFIG_LASI_82596=y
 # CONFIG_NET_VENDOR_OKI is not set
 CONFIG_QLA3XXX=m
 CONFIG_QLCNIC=m
-CONFIG_QLGE=m
-# CONFIG_NET_VENDOR_REALTEK is not set
 # CONFIG_NET_VENDOR_RDC is not set
+# CONFIG_NET_VENDOR_REALTEK is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
 # CONFIG_NET_VENDOR_SILAN is not set
 # CONFIG_NET_VENDOR_SIS is not set
@@ -153,9 +145,6 @@ CONFIG_SMSC_PHY=m
 CONFIG_STE10XP=m
 CONFIG_VITESSE_PHY=m
 CONFIG_SLIP=m
-CONFIG_SLIP_COMPRESSED=y
-CONFIG_SLIP_SMART=y
-CONFIG_SLIP_MODE_SLIP6=y
 # CONFIG_WLAN is not set
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_HIL_OLD is not set
@@ -208,34 +197,18 @@ CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
-CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
 CONFIG_HIDRAW=y
 CONFIG_HID_PID=y
 CONFIG_USB_HIDDEV=y
 CONFIG_USB=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-CONFIG_USB_DYNAMIC_MINORS=y
-CONFIG_USB_MON=m
-CONFIG_USB_WUSB_CBAF=m
-CONFIG_USB_XHCI_HCD=m
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_ONESHOT=y
-CONFIG_LEDS_TRIGGER_DISK=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=m
-CONFIG_LEDS_TRIGGER_BACKLIGHT=m
-CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
 CONFIG_UIO=y
 CONFIG_UIO_PDRV_GENIRQ=m
 CONFIG_UIO_AEC=m
 CONFIG_UIO_SERCOS3=m
 CONFIG_UIO_PCI_GENERIC=m
 CONFIG_STAGING=y
+CONFIG_QLGE=m
+CONFIG_HP100=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_SECURITY=y
@@ -272,14 +245,6 @@ CONFIG_NLS_ASCII=m
 CONFIG_NLS_ISO8859_1=m
 CONFIG_NLS_ISO8859_2=m
 CONFIG_NLS_UTF8=m
-CONFIG_PRINTK_TIME=y
-CONFIG_STRIP_ASM_SYMS=y
-CONFIG_UNUSED_SYMBOLS=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_STACKOVERFLOW=y
-# CONFIG_SCHED_DEBUG is not set
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_ECB=m
 CONFIG_CRYPTO_PCBC=m
@@ -292,3 +257,10 @@ CONFIG_CRYPTO_DEFLATE=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_CRC_CCITT=m
 CONFIG_LIBCRC32C=y
+CONFIG_PRINTK_TIME=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_STACKOVERFLOW=y
+# CONFIG_SCHED_DEBUG is not set
