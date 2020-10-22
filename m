Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058BB29591E
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Oct 2020 09:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506497AbgJVH2M (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 22 Oct 2020 03:28:12 -0400
Received: from mout.gmx.net ([212.227.17.21]:60977 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506485AbgJVH2M (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 03:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603351684;
        bh=z4kkjB1kNchGT1/JFjPsGultJzFgZ9KFtxpMYj8E/tU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=PyPqUtXA4CjiDm8qACbdALC7IP9RpamxwvaXOSQl7kCmbwXHQktvy7ImuBaEw4hOC
         wN4AQJWUj2+hg3sEydCYZOriboAvKcMmRvbm6TcIv3bWogOXKXLPxL/IN4vw6+LkqU
         HbbTjq3EqI/NejhlU4eatGbImm+kTj0UWvqf3x2E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.134.214]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5UN-1kbDn91p5z-00FFeG; Thu, 22
 Oct 2020 09:28:04 +0200
Date:   Thu, 22 Oct 2020 09:28:00 +0200
From:   Helge Deller <deller@gmx.de>
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: Kernel 5.8 and 5.9 fail to boot on C8000
Message-ID: <20201022072800.GA32562@ls3530.fritz.box>
References: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
 <37ee0636688c782a59e8b50eae5c41b96926e7ab.camel@HansenPartnership.com>
 <bbdfecf6-b13f-561f-82f6-1f5e594e02b2@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbdfecf6-b13f-561f-82f6-1f5e594e02b2@gmx.de>
X-Provags-ID: V03:K1:yYer9HDV27U2CRoOE8ehF5dNd497MkYaeyKVMYSTA3EuqJtN3o0
 E8oex0u1nAVyPEvXnWmbHtRcVn7Kysdu6LMhIJaUyO3HZAvAXnEJS3q9uvbUUE+RRNAa5Dk
 +re5Ve4UkMKG7dd0OdwqOnheoeuX2cE+sbqsYF7dO9D17G3Wz+brQhKLmXilyN8XAcf4Piw
 /vVnRIeLrZ1n+R+L2L5iQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D3avRnIo1Vk=:PiaVNNc1CLeCQ7jLGfZbvJ
 7fz5qCpfyXDuV02ZRgtYddEnsXeR9Rj4wJchzJAOYhJ/eRFCGJotiqDw07OPol4NrS7BNtLdl
 HB2/LI7SQ7ciSf/KrnQK+HFDivDmsCR0ZxitxDQjI/uCE7SxjXBCWHVROTZ9TUULi9xWdOACM
 ixx8JxLJpWk6SItdc9DREXQ/MPqLQqkpMLLmXXLDel76Zc5TVWJZ80DdcBOZmXAKyESXYu5Y8
 zMYVqTNPzWqDb5SUNGL19UBb3v+EC8ImxpvhNTf84Snz1rwdq+7ZyBfyzATXtHDBKv4JITTbq
 z32++Z+xJKPwlLastyuL0yqIqq/8cBCled+WcCKbBG1SLL5u368JeecKZ1oMUOcAEjEg8NWm4
 UtLaRh6CFHukNsMAn0+73PYRhXa00JQPMVPvFYGYqGn0RyAuHtlF5ocPT+/rX2V3RJa066GLq
 35jQSinXTPQnPx9ZF62rqCcEAo0Z9uzCZZ87L7O7n+cynABur2AIe8TjXTZnBWddp52KT3wNf
 2zZGc8fY705I9PF96ffmfS+AwudBVsVpOlIdEoobD9MGCrLCe8zgACGvhJL5Pqej9hI3vOsfl
 8YJTtjs81mZ+mXyTmYDa77b0LmVCobWlYxhy2cm9skv+CToccZtTzN49A+SKcMWA3vuI3h5E4
 u+570sS6DBDSZXWFahG1HY42Aeg8+3W0oTL4BNSV/NRYtAAjj2Q6ALlDOE/15J6CNS8GyeAIU
 m0qxrHL8CCXLJoFtBJ3S/Wsw4v9IAghJn9ueK+IQr8BgXOtv6JA3eXHvcB07Oh+mp0GMZ0IuI
 Ir5H2DukQI4lby9NQig0Wx99Bm8wohZkAMdg+PeDD4fzmuf7dZ7wFVPkvSdT5dWe/n8dGth9O
 pqEOz1k2jQFWBsvgVsxQ==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Helge Deller <deller@gmx.de>:
> On 10/21/20 5:52 PM, James Bottomley wrote:
> > On Tue, 2020-10-20 at 15:45 +0200, Helge Deller wrote:
> >> Latest Linux kernels v5.8 and v5.9 fail to boot for me on the C8000
> >> machines with this error:
> >>  mptspi: probe of 0000:40:01.0 failed with error -12
> >>  mptbase: ioc1: ERROR - Insufficient memory to add adapter!
> >>  mptspi: probe of 0000:40:01.1 failed with error -12
> >
> > I think you've already figured out that this is an allocation issue.
> > However, it does seem fishy, the code is
> >
> > 	ioc =3D kzalloc(sizeof(MPT_ADAPTER), GFP_KERNEL);
> > 	if (ioc =3D=3D NULL) {
> > 		printk(KERN_ERR MYNAM ": ERROR - Insufficient memory to
> > add adapter!\n");
> > 		return -ENOMEM;
> > 	}
> >
> > And MPT_ADAPTER should be just under a page which looks like a very od=
d
> > allocation to fail so early in boot.  The memory subsystem should have
> > also printed out a trace explaining why it failed the allocation.
>
> I think there are a few issues here.
> First, the allocation issue as seen above is from a current git head,
> where it seems memory allocation is somewhat broken. For now I would ign=
ore it
> until git head stabilizes...
>
> Then, in my machine I have two U320 drives, one "SEAGATE ST373307LW", an=
d one
> "HP 73.4GMAW3073NP". It seems both drives start to fail, because
> even in the firmware when running "search for boot devices", they someti=
me
> fail to be detected.
>
> The good thing with bad drives is, that with those it's now possible to
> debug error code paths in the drivers. In my case the last syslog
> looks like this (I'm currently testing with Linus plain v5.9 kernel now)=
.
>
> +[ 1126.041880] ioc0: LSI53C1030 B2: Capabilities=3D{Initiator,Target}
> +Begin: Waiting for root file system ...
> +[ 1127.069515] scsi host2: error handler thread failed to spawn, error =
=3D -4
> +[ 1127.069515] mptspi: ioc0: WARNING - Unable to register controller wi=
th SCSI subsystem
> +<Cpu1> 78000c6201e00000  a0e008c01100b009  CC_PAT_ENCODED_FIELD_WARNING
> +<Cpu1> 76000c6801e00000  0000000000000520  CC_PAT_DATA_FIELD_WARNING
> <XXX: here is something missing - serial port is often not fast enough..=
..>
> +[ 1127.069515] Backtrace:
> +[ 1127.069515]  [<000000001045b7cc>] mptspi_probe+0x248/0x3d0 [mptspi]
> +[ 1127.069515]  [<0000000040946470>] pci_device_probe+0x1ac/0x2d8
> +[ 1127.069515]  [<0000000040add668>] really_probe+0x1bc/0x988
> +[ 1127.069515]  [<0000000040ade704>] driver_probe_device+0x160/0x218
> +[ 1127.069515]  [<0000000040adee24>] device_driver_attach+0x160/0x188
> +[ 1127.069515]  [<0000000040adef90>] __driver_attach+0x144/0x320
> +[ 1127.069515]  [<0000000040ad7c78>] bus_for_each_dev+0xd4/0x158
> +[ 1127.069515]  [<0000000040adc138>] driver_attach+0x4c/0x80
> +[ 1127.069515]  [<0000000040adb3ec>] bus_add_driver+0x3e0/0x498
> +[ 1127.069515]  [<0000000040ae0130>] driver_register+0xf4/0x298
> +[ 1127.069515]  [<00000000409450c4>] __pci_register_driver+0x78/0xa8
> +[ 1127.069515]  [<000000000007d248>] mptspi_init+0x18c/0x1c4 [mptspi]
> +[ 1127.069515]  [<0000000040200f18>] do_one_initcall+0x74/0x314
> +[ 1127.069515]  [<00000000403528c0>] do_init_module+0xb4/0x640
> +[ 1127.069515]  [<0000000040356a24>] load_module+0x3a48/0x493c
> +[ 1127.069515]  [<0000000040357d58>] __do_sys_finit_module+0x120/0x1bc
> +[ 1127.069515]  [<0000000040357e84>] sys_finit_module+0x30/0xa0
> +[ 1127.069515]  [<0000000040210054>] syscall_exit+0x0/0x14
> +[ 1127.069515]
> +[ 1127.069515] Kernel Fault: Code=3D26 (Data memory access rights trap)=
 at addr 00000000000007d0
> +[ 1127.069515] CPU: 1 PID: 94 Comm: systemd-udevd Tainted: G           =
 E     5.9.0-1-parisc64 #1 Debian 5.9.1-1
> +[ 1127.069515] Hardware name: 9000/785/C8000
> +[ 1127.069515]
> +[ 1127.069515]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> +[ 1127.069515] PSW: 00001000000011101111111000001111 Tainted: G        =
    E
> +[ 1127.069515] r00-03  000000ff080efe0f 000000413a6a4d60 000000000c1f8b=
e8 000000413a6a4e00
> +[ 1127.069515] r04-07  000000000c1f7000 0000004087ce3000 000000007f41e0=
00 0000000000000000
> +[ 1127.069515] r08-11  0000004087ce3000 000000001045e500 000000001045e6=
f8 000000004158ea68
> +[ 1127.069515] r12-15  0000000000000002 0000000000000000 000000413a6a44=
a0 0000000040f92680
> +[ 1127.069515] r16-19  0000000000000cc0 0000000000000002 000000001045ea=
a0 0000000005c47000
> +[ 1127.069515] r20-23  000000000800000e 000000004c2ce5ae 00000000000003=
84 0000000000000000
> +[ 1127.069515] r24-27  0000000000000143 000000000800000e 00000000000000=
00 000000000c1f7000
> +[ 1127.069515] r28-31  00000000000005c8 000000413a6a4e70 000000413a6a4e=
a0 0000000041430aa0
> +[ 1127.069515] sr00-03  0000000000002800 0000000000000000 0000000000000=
000 0000000000019000
>
> The string "WARNING - Unable to register controller with SCSI subsystem"=
 is
> from drivers/message/fusion/mptspi.c: mptspi_probe():
>         sh =3D scsi_host_alloc(&mptspi_driver_template, sizeof(MPT_SCSI_=
HOST));
>         if (!sh) {
>                 printk(MYIOC_s_WARN_FMT
>                         "Unable to register controller with SCSI subsyst=
em\n",
>                         ioc->name);
>                 error =3D -1;
>                 goto out_mptspi_probe;
>         }
>
> so, the kernel jumps to:
> out_mptspi_probe:
>         mptscsih_remove(pdev);
>         return error;
>
> Somewhere inside mptscsih_remove() the kernel crashes with a "Data memor=
y access rights trap".
> At first thought I assumed ioc->sh had an invalid value, but debugging s=
howed that it's 0UL.
> Do you have an idea what's going wrong in mptscsih_remove().
> I'd expect the kernel to free all memory, ignore those drives and contin=
ue booting (and fail
> later in the boot process because the root drive isn't found then).

Everyone can trigger the fault (on any architecture) by this patch:

diff --git a/drivers/message/fusion/mptspi.c b/drivers/message/fusion/mpts=
pi.c
index eabc4de5816c..1f26ecea4c95 100644
=2D-- a/drivers/message/fusion/mptspi.c
+++ b/drivers/message/fusion/mptspi.c
@@ -1404,6 +1404,7 @@ mptspi_probe(struct pci_dev *pdev, const struct pci_=
device_id *id)
 	}

 	sh =3D scsi_host_alloc(&mptspi_driver_template, sizeof(MPT_SCSI_HOST));
+	sh =3D NULL;

 	if (!sh) {
 		printk(MYIOC_s_WARN_FMT


With the patch below the driver now cleanly exits:

[ 1119.508147] Fusion MPT base driver 3.04.20
[ 1119.508147] Copyright (c) 1999-2008 LSI Corporation
[ 1119.508147] Fusion MPT SPI Host driver 3.04.20
[ 1119.508147] mptbase: ioc0: Initiating bringup
[ 1119.508147] sr 1:0:0:0: [sr0] scsi3-mmc drive: 40x/40x cd/rw xa/form2 c=
dda tray
[ 1119.508147] cdrom: Uniform CD-ROM driver Revision: 3.20
[ 1119.508147] ioc0: LSI53C1030 B2: Capabilities=3D{Initiator,Target}
[ 1121.512619] mptspi: ioc0: WARNING - Unable to register controller with =
SCSI subsystem
[ 1121.512619] mptspi: probe of 0000:40:01.0 failed with error -1
[ 1121.512619] mptbase: ioc1: Initiating bringup
[ 1122.508645] ioc1: LSI53C1030 B2: Capabilities=3D{Initiator,Target}
[ 1122.508645] mptspi: ioc1: WARNING - Unable to register controller with =
SCSI subsystem
[ 1123.417139] mptspi: probe of 0000:40:01.1 failed with error -1
[ 1123.487494] Fusion MPT FC Host driver 3.04.20
[ 1123.487494] Fusion MPT SAS Host driver 3.04.20
[ 1123.487494] Fusion MPT misc device (ioctl) driver 3.04.20
[ 1123.487494] mptctl: Registered with Fusion MPT base driver
[ 1123.487494] mptctl: /dev/mptctl @ (major,minor=3D10,220)


I'll send this patch to the scsi mailing list shortly:


[PATCH] scsi: mptfusion: Fix error paths in mptscsih_remove()

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/message/fusion/mptscsih.c b/drivers/message/fusion/mp=
tscsih.c
index 8543f0324d5a..0d1b2b0eb843 100644
=2D-- a/drivers/message/fusion/mptscsih.c
+++ b/drivers/message/fusion/mptscsih.c
@@ -1176,8 +1176,10 @@ mptscsih_remove(struct pci_dev *pdev)
 	MPT_SCSI_HOST		*hd;
 	int sz1;

-	if((hd =3D shost_priv(host)) =3D=3D NULL)
-		return;
+	if (host =3D=3D NULL)
+		hd =3D NULL;
+	else
+		hd =3D shost_priv(host);

 	mptscsih_shutdown(pdev);

@@ -1193,14 +1195,15 @@ mptscsih_remove(struct pci_dev *pdev)
 	    "Free'd ScsiLookup (%d) memory\n",
 	    ioc->name, sz1));

-	kfree(hd->info_kbuf);
+	if (hd)
+		kfree(hd->info_kbuf);

 	/* NULL the Scsi_Host pointer
 	 */
 	ioc->sh =3D NULL;

-	scsi_host_put(host);
-
+	if (host)
+		scsi_host_put(host);
 	mpt_detach(pdev);

 }
