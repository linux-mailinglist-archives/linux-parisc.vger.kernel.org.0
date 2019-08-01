Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDD0F7D2EB
	for <lists+linux-parisc@lfdr.de>; Thu,  1 Aug 2019 03:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbfHABhz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 21:37:55 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:40152 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728014AbfHABhz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 21:37:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7A0DC8EE12F;
        Wed, 31 Jul 2019 18:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564623474;
        bh=GnVcTMFH+5EKm3mNcLfbyzAdNMjkpSe35CRcarTI63A=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=VZASlkUqt01nH/n0za+vaTvbADyuK8nt5vDPtrP1ZQ35VRzESpewAjtoSaWCJiHvr
         461g74urwcr+8nPkKpFsaMo8zUvrpNxewP0oPxIszwOzuW/g9ulA8+hQxHHmRjPthe
         kSvXvlUSRgBIEdsTz39KZjpER83wY/W9nPhkZ2cU=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZvhoWH9_IR4E; Wed, 31 Jul 2019 18:37:53 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id C68778EE10C;
        Wed, 31 Jul 2019 18:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564623470;
        bh=GnVcTMFH+5EKm3mNcLfbyzAdNMjkpSe35CRcarTI63A=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=OBnuUEkf/0q3wdjnH3/16S0EHVeGBR36U4RN/Qi6lHLOEqJlD6sUFJAPoVGePDfMz
         0sBGDTmTDi+J05Vwo84GmRtWANW/n5v1qHJSFLIALURyDSH9tpw13C7SV7UuJIWo4+
         iUuoDjbl/plV6gwqZoC8kgpfwMsBbvx6bKQls40c=
Message-ID: <1564623468.3107.5.camel@HansenPartnership.com>
Subject: Re: Compressed kernels currently won't boot
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Wed, 31 Jul 2019 18:37:48 -0700
In-Reply-To: <8b4dc77f-27a0-bbce-8fdf-0c631e0bfd16@gmx.de>
References: <1564591443.3319.30.camel@HansenPartnership.com>
         <20190731173016.GA23520@t470p.stackframe.org>
         <1564595402.3319.40.camel@HansenPartnership.com>
         <1564602012.3319.45.camel@HansenPartnership.com>
         <20190731194413.GB23520@t470p.stackframe.org>
         <0084df92-ca9f-7600-187d-bc6123f30fd1@gmx.de>
         <1564602968.3319.56.camel@HansenPartnership.com>
         <2fc63e1d-dbcf-924b-e134-e5c2dcc75260@gmx.de>
         <1564606179.3319.70.camel@HansenPartnership.com>
         <8b4dc77f-27a0-bbce-8fdf-0c631e0bfd16@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 2019-07-31 at 23:44 +0200, Helge Deller wrote:
> On 31.07.19 22:49, James Bottomley wrote:
> > On Wed, 2019-07-31 at 22:19 +0200, Helge Deller wrote:
> > > On 31.07.19 21:56, James Bottomley wrote:
> > > > On Wed, 2019-07-31 at 21:46 +0200, Helge Deller wrote:
> > > > > On 31.07.19 21:44, Sven Schnelle wrote:
> > > > > > Hi James,
> > > > > > 
> > > > > > On Wed, Jul 31, 2019 at 12:40:12PM -0700, James Bottomley
> > > > > > wrote:
> > > > > > 
> > > > > > > What about causing the compressed make to build both a
> > > > > > > stripped and a non-stripped bzImage (say sbzImage and
> > > > > > > bzImage).  That way you always have the stripped one
> > > > > > > available for small size things like boot from tape or
> > > > > > > DVD?  but in the usual case we use the bzImage with full
> > > > > > > contents.
> > > > > > 
> > > > > > In that case we would also need to build two lifimages -
> > > > > > how
> > > > > > about adding a config option option? Something like "Strip
> > > > > > debug information from compressed kernel images"?
> > > > > 
> > > > > I agree, two lifimages don't make sense. Only one vmlinuz
> > > > > gets
> > > > > installed. Instead of the config option, I tink my latest
> > > > > patch
> > > > > is better.
> > > > 
> > > > It doesn't solve the problem that if a stripped compressed
> > > > image is
> > > > > 
> > > > 
> > > > 128kb then it overwrites the decompress area starting at
> > > > 0x00100000
> > > > so we can't decompress the end because we've already
> > > > overwritten it
> > > > before the decompressor gets to it.
> > > 
> > > I don't get this point.
> > >    hppa64-linux-gnu-objdump -h vmlinuz
> > > shows:
> > > Sections:
> > > Idx
> > > Name          Size      VMA               LMA               File
> > > off  Algn
> > >     0
> > > .head.text    00000084  00000000000e0000  00000000000e0000  00001
> > > 000
> > >   2**2
> > >                     CONTENTS, ALLOC, LOAD, READONLY, CODE
> > >     1
> > > .opd          00000340  00000000000e0090  00000000000e0090  00001
> > > 090
> > >   2**3
> > >                     CONTENTS, ALLOC, LOAD, DATA
> > >     2
> > > .dlt          00000160  00000000000e03d0  00000000000e03d0  00001
> > > 3d0
> > >   2**3
> > >                     CONTENTS, ALLOC, LOAD, DATA
> > >     3 .rodata.compressed
> > > 01f3c2b0  00000000000e0530  00000000000e0530  00001530  2**0
> > >                     CONTENTS, ALLOC, LOAD, DATA
> > >     4
> > > .text         00005cc0  000000000201d000  000000000201d000  01f3e
> > > 000
> > >   2**7
> > >                     CONTENTS, ALLOC, LOAD, READONLY, CODE
> > >     5
> > > .data         00000060  0000000002022cc0  0000000002022cc0  01f43
> > > cc0
> > >   2**3
> > >                     CONTENTS, ALLOC, LOAD, DATA
> > > 
> > > Only .head.text gets loaded at e0000, and it is basically just a
> > > few
> > > bytes which sets-up registers and jump to .text segment (at
> > > 0201d000
> > > in this case).
> > 
> > Actually, you're looking at the wrong thing, you want to look at
> > the
> > program header (the segments) not the section header.  It's the
> > program
> > header we load.  If I extract this from the current debian kernel
> > we
> > get
> > 
> > jejb@ion:~/git/linux-build/arch/parisc/boot/compressed> readelf -l
> > /boot/vmlinuz-4.19.0-5-parisc64-smp
> > 
> > Elf file type is EXEC (Executable file)
> > Entry point 0xe0000
> > There are 4 program headers, starting at offset 64
> > 
> > Program Headers:
> >    Type           Offset             VirtAddr           PhysAddr
> >                   FileSiz            MemSiz              Flags  Ali
> > gn
> >    PHDR           0x0000000000000040 0x0000000000001040
> > 0x0000000000000000
> >                   0x00000000000000e0 0x00000000000000e0  R E    0x8
> >    LOAD           0x0000000000001000 0x00000000000e0000
> > 0x00000000000e0000
> >                   0x00000000000004d8
> > 0x00000000000004d8  RWE    0x1000
> >    LOAD           0x0000000000002000 0x0000000001400000
> > 0x0000000001400000
> >                   0x00000000003dd46c
> > 0x00000000003e1000  RWE    0x1000
> >    GNU_STACK      0x0000000000000000 0x0000000000000000
> > 0x0000000000000000
> >                   0x0000000000000000
> > 0x0000000000000000  RWE    0x10
> > 
> >   Section to Segment mapping:
> >    Segment Sections...
> >     00
> >     01     .head.text .opd .dlt
> >     02     .text .data .rodata .eh_frame .bss
> >     03
> > 
> > The two LOAD sections corresponding to what PALO actually loads.
> > The
> > problem happens if the length of the first load section is bigger
> > than
> > 0x20000.
> 
> What exactly is the problem if the first section is bigger than
> 0x20000?
> 
> > Now if you look what happens after your change:
> > jejb@ion:~/git/linux-build/build/parisc64/arch/parisc/boot> readelf
> > -l bzImage
> 
> Ok - bzImage is the same as ./vmlinuz.
> 
> > Elf file type is EXEC (Executable file)
> > Entry point 0xe0000
> > There are 4 program headers, starting at offset 64
> > 
> > Program Headers:
> >    Type           Offset             VirtAddr           PhysAddr
> >                   FileSiz            MemSiz              Flags  Ali
> > gn
> >    PHDR           0x0000000000000040 0x0000000000001040
> > 0x0000000000000000
> >                   0x00000000000000e0 0x00000000000000e0  R E    0x8
> >    LOAD           0x0000000000001000 0x00000000000e0000
> > 0x00000000000e0000
> >                   0x00000000004ae760
> > 0x00000000004ae760  RWE    0x1000
> >    LOAD           0x00000000004b0000 0x000000000118a000
> > 0x000000000118a000
> >                   0x0000000000006044
> > 0x000000000000a000  RWE    0x1000
> >    GNU_STACK  0    0x0000000000000000 0x0000000000000000
> > 0x0000000000000000
> >                   0x0000000000000000
> > 0x0000000000000000  RWE    0x10
> > 
> >   Section to Segment mapping:
> >    Segment Sections...
> >     00
> >     01     .head.text .opd .dlt .rodata.compressed
> >     02     .text .data .rodata .eh_frame .bss
> >     03
> > 
> > So the first section tries to load between 0x000e0000-0x0058e760
> > and
> > that's overwritten at 0x00100000 when the decompression starts
> > because
> > 0x00100000 is our KERNEL_BINARY_TEXT_START.
> 
> The decompression decompresses the image from .rodata.compressed
> to an area behind .bss.
> So, "vmlinux" ends up behind .bss for further processing.
> This "vmlinux" (which can have multiple ELF sections) is then started
> at the high address.
> That address is way above the 0x00100000 or KERNEL_BINARY_TEXT_START.
> It then finally moves itself (the ELF sections) to 0x00100000.
> 
> > The result for me is that
> > I get the Decompressing linux ... message followed by a HPMC.
> 
> It actually does boot for me and Sven without a HPMC.
> The decompression is slow (~40 seconds on my c3000 for 160MB).
> I still *believe* you are facing a HPMC because of other reasons.
> On which machine do you start.
> How much memory?

This turned out to be a very eccentric bug.  Apparently we don't have
an archclean target in our arch/parisc/Makefile, so files in there
never get cleaned out by make mrproper.  This, in turn means that the
sizes.h file in arch/parisc/boot/compressed never gets removed and
worse, when you transition to an O=build/parisc[64] build model it
overrides the generated file.  The upshot being my bzImage was building
with a SZ_end that was too small.

I fixed it by making mrproper clean everyting.

James

---

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 8acb8fa1f8d6..945952166468 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -182,5 +182,8 @@ define archhelp
 	@echo  '  zinstall	- Install compressed vmlinuz kernel'
 endef
 
+archclean:
+	$(Q)$(MAKE) $(clean)=$(boot)
+
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/parisc/kernel/syscalls all
