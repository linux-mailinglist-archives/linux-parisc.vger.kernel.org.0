Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16FFB6EBB77
	for <lists+linux-parisc@lfdr.de>; Sat, 22 Apr 2023 23:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjDVVSj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 22 Apr 2023 17:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjDVVSe (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 22 Apr 2023 17:18:34 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1A911D
        for <linux-parisc@vger.kernel.org>; Sat, 22 Apr 2023 14:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1682198310; i=deller@gmx.de;
        bh=jX+KB0BmEPZmIRuht0r/klRR6oSZ5gO58qw4LvuzXaM=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=XdXOGTzTybrqrIap4tULDVY0GVkFh7RObk3AXmiQ1glx69sn9k4tpKL9E5ONa5Zk8
         M1M52aLoBE0PPPChGCGDNsT5u+x7vplionXG5sBbwR1oigj/mANcS58oPAdDbCM9fG
         gRSIW+2/TOqAYyJcj7XMPCniVEgWdwiQtSDqYwax36JcnOmjqIVeBAUNZib6MI1ei6
         biDsTJP/1+qi+Qh3EguJ7EWemzivdkD0mOuhIoWWm3I2IgGRHD9T62t4/7DB/5wp6F
         lUvTyTtyWAPg56oIjv1Hw32fIML2MPEhNHn1xLnLBL7RHUecz7x40vtmnWa85QnkQh
         +pgNRp96ud0NQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.157.94]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoRA-1q31fM19ba-00EsSh; Sat, 22
 Apr 2023 23:18:30 +0200
Date:   Sat, 22 Apr 2023 23:18:28 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Drop HP-UX constants and structs from grfioctl.h
Message-ID: <ZERPJA7QY4/5N+hu@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:vS6LlopbM45WT0KHKgdJYXiN9RjlKBnlnOJjJXqGZd6/JthQ8S7
 NsonvvCtUs/oH/vJZctMt5pGxPVKy5gv0i/GqI88RRUBVCJHyGmuT8v5yXbQGhyFl1CHjPJ
 hppN/RQSm1/Uhb77i1dk8jy77jY8aQ+d1kL1zBFjV4VZejNK6Ipw1u/LWbCaYDYOAN1/W+4
 U0jy6BW4TVHTSoV/SNSSA==
UI-OutboundReport: notjunk:1;M01:P0:BNcX37XvU5k=;Pv2hxaUFlVXCa1jR7zPwH9N0QUm
 +IWYGwIdBZnnLW2yMLPbLr56F2o9X28W7tuWctMPC6USMTI0NhtcpDFz1a+6C6aEfydTR1yI7
 O3AS7p8gARv6l2YPQ2tWF8c7xcDUJh19bMLfx4dDnHRYqZ+Eu/TECymAe3BQeadYHrwLokdE7
 gxBXD0sHi3MFT8coMS+GB6er0hFQF7zXpXL944lHFytISDTya8iChAboatBlgp8jDo9xc5Jro
 6luce8Un5RViDTpTC2d0Bzxu/A9AG3bAqLPBJw34E5DThBjIjJNvoU1II1LG8K5uCOy/ZTzyV
 BP0LH15ZQcSTRW0ascH4FBU6PuEdiEULTaLprdzxd189SL58bGnZ2nLhq01pEZZgbCywWXckF
 kffOq3Q4VTDqeCEva7Bz5Jdl7lqrH2mxv/07CVoEwkvBmI2+0avivUgFojkQaSzlXfOHnFADg
 cBcgWPZTVFFiSyGScBLnZBAiZGBxaK5dXNZOfApVca7Q8fo5zbg27le2QwtnDhTcl8PHNFe8V
 K0DqmVxP6kxsfc615COzZDKVPS2w6hu75CkJ1K/t6R6kQd9PX61iBGjM2K/OnKLZdcai2QSDX
 22UNv/oVS3qfrFjDr2F6/RBkyXjgXfDyq8AMXjneLSfyQfjibIjhtrVksXipv8e+e59D/hnAg
 HFHHNenekZ6gLkR9iLvdXTWwIenL61CFaWFhYfs0FyAaSAnkV3+iujGLImsmODLfATXakgNqh
 keGuEz4Y6W8ln1jQVmLo/QN6YXnztp1E57A3yPI8JAbaSBRzsiISyeyJFbz4oHEMyL746g3xz
 aZC87ADiYgiIwHuiIDLziptURP4GeL7SRtn5T82fMqwc/g5eKuz9Wx6H1SDwKmZASsfuQ+8f9
 TfBJqxhw4DDRrFUIK3SqQ9w5tyrn+Eujh+H+b7KHpFt518DhCnDHM4PSMY6NAR/U023xc7FNY
 cEIMugefjvSVPQeubzaDCab6/nM=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/grfioctl.h b/arch/parisc/include/asm/=
grfioctl.h
index a740844a1581..6088687ac46e 100644
=2D-- a/arch/parisc/include/asm/grfioctl.h
+++ b/arch/parisc/include/asm/grfioctl.h
@@ -59,42 +59,5 @@
 #define CRT_ID_LEGO		0x35ACDA30	/* Lego FX5, FX10 ... */
 #define CRT_ID_PINNACLE		0x35ACDA16	/* Pinnacle FXe */

-/* structure for ioctl(GCDESCRIBE) */
-
-#define gaddr_t unsigned long	/* FIXME: PA2.0 (64bit) portable ? */
-
-struct	grf_fbinfo {
-	unsigned int	id;		/* upper 32 bits of graphics id */
-	unsigned int	mapsize;	/* mapped size of framebuffer */
-	unsigned int	dwidth, dlength;/* x and y sizes */
-	unsigned int	width, length;	/* total x and total y size */
-	unsigned int	xlen;		/* x pitch size */
-	unsigned int	bpp, bppu;	/* bits per pixel and used bpp */
-	unsigned int	npl, nplbytes;	/* # of planes and bytes per plane */
-	char		name[32];	/* name of the device (from ROM) */
-	unsigned int	attr;		/* attributes */
-	gaddr_t 	fbbase, regbase;/* framebuffer and register base addr */
-	gaddr_t		regions[6];	/* region bases */
-};
-
-#define	GCID		_IOR('G', 0, int)
-#define	GCON		_IO('G', 1)
-#define	GCOFF		_IO('G', 2)
-#define	GCAON		_IO('G', 3)
-#define	GCAOFF		_IO('G', 4)
-#define	GCMAP		_IOWR('G', 5, int)
-#define	GCUNMAP		_IOWR('G', 6, int)
-#define	GCMAP_HPUX	_IO('G', 5)
-#define	GCUNMAP_HPUX	_IO('G', 6)
-#define	GCLOCK		_IO('G', 7)
-#define	GCUNLOCK	_IO('G', 8)
-#define	GCLOCK_MINIMUM	_IO('G', 9)
-#define	GCUNLOCK_MINIMUM _IO('G', 10)
-#define	GCSTATIC_CMAP	_IO('G', 11)
-#define	GCVARIABLE_CMAP _IO('G', 12)
-#define GCTERM		_IOWR('G',20,int)	/* multi-headed Tomcat */
-#define GCDESCRIBE	_IOR('G', 21, struct grf_fbinfo)
-#define GCFASTLOCK	_IO('G', 26)
-
 #endif /* __ASM_PARISC_GRFIOCTL_H */

