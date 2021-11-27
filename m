Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B45E45FE37
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 12:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234604AbhK0LIj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 06:08:39 -0500
Received: from mout.gmx.net ([212.227.17.20]:52187 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234723AbhK0LGj (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 06:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638010997;
        bh=CrvJSO8EFDtQHDgcsfGaFyUhzcHEKef2VDi6ukksPfQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=iLNkllGzNkyNhT8NP5MjcBpHsrz1gg6TUAHrA20szpn7/EqHPOEREDZujB/7Nw6Zj
         k2ESKGUWI/HEAvOWlgsyo+0ZSIJ2N6hBi7lb8m2AJR6cprr6lC/M1X9oN/s8aAy7dB
         e7hhLJYO8Yud1586inVivdy0ksBq/79pqwGt9p8o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.151.211]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGvG-1n6yYV2ajO-00Yi1s; Sat, 27
 Nov 2021 12:03:17 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Enable sata sil, audit and usb support on 64-bit defconfig
Date:   Sat, 27 Nov 2021 12:03:13 +0100
Message-Id: <20211127110313.300276-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vwqZqgN2SPaRvyCqGvkeI6maNSRMpelzRjuvYbZPjgWrXuE5Fqg
 9RPWIO/oqBTUUNuKujXy2CbWpgc2y7620UIzA8aXmVgaBkZvT8ntu435XmPX5Sj66byfyld
 6o+S4uLqXvqUGfTbOvL4j2/8K7OO25r69mnJ3TMDSqTydmBrFdkibktHilaILMfVe3EvWMm
 pLUBTg5Td9NTxTRxNWxQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t0cnQMZb6Sw=:0LJ2/FkQLO6CfbYZIBMdzl
 8ly6AhafBYG2WA95VKEj7evDvbE2DLH0ZwyQr0CeYgHAAoQ+vB8Xpt3y43ln6eDFl8bitC3kn
 Egk5x8bHxQPXjhTAEuGwQXta7xAVnUPOJYdIfK3ZOQoMrebC+Z1d+wCbaT0zU4EqKS3JaF3an
 RG2XrGaM9sM1X5weshjHdL/r4c2w1ZvEuVxa/FY1mTt+1QxIX6tnMydJDtTu5I43h5COqs3zB
 jKC6eL234fOiFi9M/iHsBsSGY68dPEk/ql+9CiIeViTi/5bQYUZtmNd5A5JAo4satX/IdZjjz
 2WSWasLPnXuIm2yqAfiaiiMDDtY27fvrBdOlBx6HQU4uCMbgfZ1Zyy2fnbFX1xQ9sHSIoO8Ha
 4WNcK74QRThI2VwzTEuddKA/XBO46w+t9v9FR/TTT9VO+Ip3tJFZ5j+RONyySf5uE7XC1Ub5s
 +VTYNaDXi257e7jnyqf48BuKuaIS3iIwCs78vPBh/5y9uqJazuMitULtqyf3PR/rGte16793a
 2cnRDHQ0ByMTkrziNUR+PtfGYE1/HGJBGwvk23re5cGzKrOI+pI7QwlC01rTnRl5L9yjgD5lB
 vtjfoZzfcfKCRnV6abu2LErG/Xod1eNdkEyrfeFVd4CkqlnCBSrGI6OJB+NMNI8om4hyn5tQL
 POJ8b4Pt8ba8Z4h4jqxuReDrxMoYObKa9Ul+rpVbmK8PE+5LISLQenvqFTdObExGjRcMH26E7
 90n9M5vTMRotE+CisxrtF+FlUzTv671ccoxDwspXoXpsNuHBN5Nuu+Q6s9HYcQTGDO5rSTkED
 2ytQdF0B72tq0NCUIH627gtD2t61XFD4RmkNkoQvx6iWv1IcYqKpZYptJP2j5hnotSMiaCBGR
 lvotP1ZscWmRKYvzcODhRM7fPYm9mruInqALpIrDkFpYXWcLn6ZEPRtUaGeXBV67HDX9oY9aj
 YDEWh4KSQc9+yFxZf+BMjrovgJRw5lNylLO9/BCFPLtRNrpTNqc90PIXoR7lGF8KHgQds6CGn
 Nc3NSugx3E4+L3R9c2yaqDWW9S/CbE0v1eAwBCy5UBQhI98VvFqWfA39q4OAbj2oV/ozbUHtr
 s/bc+IwkAnSgeU=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add some more config options which reflect what's needed to easily boot
our 64-bit debian buildds.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/configs/generic-64bit_defconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/con=
figs/generic-64bit_defconfig
index d2daeac2b217..1b8fd80cbe7f 100644
=2D-- a/arch/parisc/configs/generic-64bit_defconfig
+++ b/arch/parisc/configs/generic-64bit_defconfig
@@ -1,7 +1,9 @@
 CONFIG_LOCALVERSION=3D"-64bit"
 # CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_LZ4=3Dy
 CONFIG_SYSVIPC=3Dy
 CONFIG_POSIX_MQUEUE=3Dy
+CONFIG_AUDIT=3Dy
 CONFIG_BSD_PROCESS_ACCT=3Dy
 CONFIG_BSD_PROCESS_ACCT_V3=3Dy
 CONFIG_TASKSTATS=3Dy
@@ -35,6 +37,7 @@ CONFIG_MODVERSIONS=3Dy
 CONFIG_BLK_DEV_INTEGRITY=3Dy
 CONFIG_BINFMT_MISC=3Dm
 # CONFIG_COMPACTION is not set
+CONFIG_MEMORY_FAILURE=3Dy
 CONFIG_NET=3Dy
 CONFIG_PACKET=3Dy
 CONFIG_UNIX=3Dy
@@ -65,12 +68,15 @@ CONFIG_SCSI_ISCSI_ATTRS=3Dy
 CONFIG_SCSI_SRP_ATTRS=3Dy
 CONFIG_ISCSI_BOOT_SYSFS=3Dy
 CONFIG_SCSI_MPT2SAS=3Dy
-CONFIG_SCSI_LASI700=3Dm
+CONFIG_SCSI_LASI700=3Dy
 CONFIG_SCSI_SYM53C8XX_2=3Dy
 CONFIG_SCSI_ZALON=3Dy
 CONFIG_SCSI_QLA_ISCSI=3Dm
 CONFIG_SCSI_DH=3Dy
 CONFIG_ATA=3Dy
+CONFIG_SATA_SIL=3Dy
+CONFIG_SATA_SIS=3Dy
+CONFIG_SATA_VIA=3Dy
 CONFIG_PATA_NS87415=3Dy
 CONFIG_PATA_SIL680=3Dy
 CONFIG_ATA_GENERIC=3Dy
@@ -79,6 +85,7 @@ CONFIG_MD_LINEAR=3Dm
 CONFIG_BLK_DEV_DM=3Dm
 CONFIG_DM_RAID=3Dm
 CONFIG_DM_UEVENT=3Dy
+CONFIG_DM_AUDIT=3Dy
 CONFIG_FUSION=3Dy
 CONFIG_FUSION_SPI=3Dy
 CONFIG_FUSION_SAS=3Dy
@@ -196,10 +203,15 @@ CONFIG_FB_MATROX_G=3Dy
 CONFIG_FB_MATROX_I2C=3Dy
 CONFIG_FB_MATROX_MAVEN=3Dy
 CONFIG_FB_RADEON=3Dy
+CONFIG_LOGO=3Dy
+# CONFIG_LOGO_LINUX_CLUT224 is not set
 CONFIG_HIDRAW=3Dy
 CONFIG_HID_PID=3Dy
 CONFIG_USB_HIDDEV=3Dy
 CONFIG_USB=3Dy
+CONFIG_USB_EHCI_HCD=3Dy
+CONFIG_USB_OHCI_HCD=3Dy
+CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
 CONFIG_UIO=3Dy
 CONFIG_UIO_PDRV_GENIRQ=3Dm
 CONFIG_UIO_AEC=3Dm
=2D-
2.31.1

