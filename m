Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1243361617
	for <lists+linux-parisc@lfdr.de>; Sun,  7 Jul 2019 20:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfGGSoZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 7 Jul 2019 14:44:25 -0400
Received: from mout.gmx.net ([212.227.17.20]:56123 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbfGGSoZ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Jul 2019 14:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562525059;
        bh=DqeDGqxAkypuw1l18KiRNUyc1SJf7eeFG7fUwsZCeks=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=c8Tm+MgLV0aX9VpFNPfZ6c3CBHBcDBIagmPdEQN9VBlVgwni95+4xfNcjm3diMT4F
         /ZGsd/hkD5xssUxrDPAvR3moOF/uEcWF2QEdSnJecfAztjlwugwoc1LXysJmrW5CCU
         B0Uiu4ag0pVg0U7HDBVEp3VIqv0Wzk7iqjYjneC4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.149.140]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MOCSm-1hpfnS3fy0-005b49; Sun, 07
 Jul 2019 20:44:19 +0200
Subject: Re: [PATCH] Update palo documentation
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
References: <1562522488.3216.15.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <ff1f3d02-20bc-c1fa-5ff6-0520e9ebe8e0@gmx.de>
Date:   Sun, 7 Jul 2019 20:44:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562522488.3216.15.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tO936myRheitm0yv/sOvm1xRU/fPmDFWrU+u1aFksKiT5/C79L2
 K/TgKoZYdPOZKT9Tmy+cALzbpNQRf5EGsGn0+d27PYI26IgMudP8E16UMBEXvf+gHMqL3uW
 Lw4u71gzrXxcSAZ6YnId411HFqhtDgvCiF6D+BhPK91EamLlYQbsQVj3m4OKQX6xwxaByrC
 HeaDo//embbM8DQfdr/ZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3JhY4bqFWGI=:HsAT/2OF4SQ+Cf98Io+/04
 uCi1lrO26mso/5WrQdVNz1MfzMKGLVCgmqGyc8Zlcby/W/++k/Iz7McvBgETUC4yU/ccKdqwd
 H3/19ECm67Jb34QMd/znUb03XsrXJissmYxTMVOLiDEELhIrChMXDF7bSwu5O3z2T45bVsd8r
 TheR1GOvYCGqfYmpeyg/KpOhFzqaneVxH6D5WDCtOM50RXNP5Anuyp8j1soDue4oSpV4cJXCI
 tvBAhm5DLjqWvPTM+eolvDROPoOAUMRhR8eiIf6jdojKpuE99lQZT3ZvKvnIoqIcYLlNaPWGB
 B8ULSdWJEl6T094uDZN8r8oIGgdLdvrLD/LH5RyYQB6Nwr+Y1Dh77+6I7phTxBWubkKv0lvQr
 4PgOq9uIylnQYuHj9J/nUA68TWumSyNkRg87cUSZdz/ukZHhfLTVrcWbwR9YH3vQM1fnKuFEn
 X1r9UKhvue5UIDBFShelElZ21H33Ii2KZU94fcX/wO3V6Ub9JA/+gRYHDl6Y/NqCVjrpO/r7O
 0J+4gsht4rrEBut67kcZDCA1+pzRK3nAMGM4M4gUhPR0w05zD/ln2Z4ttWM9plvQPDg/mBU6j
 ukJ2Zv3/bMSocUQ7hRWRw62RjZHg8rh9iPe0DtCmSsudMXpDEs+ywggY0nwRLY0H5wTF0U7g8
 HonESVfVf0wwTHZmt4EJ/Sh/8dIw2M8hT2vfOyjpwZeUgbY9efXnew0uo5xiU1yPLmIl9b2mg
 hQg+Gb41xkkz7NJ+KbHkId/b+IwnBzTw9R6FDipPo1QWP7adRF23vXUECGxzNYxS4XQ5ywggz
 LlO+DzDP2Rfz90DewirKFHq0Pmyb+PezwWVRUIN1pdUKgSISsLQ6p1qEBMemXngIe/OjNCNzu
 JwvvFfjubyGocpLZpvbSPZxRs9LAfI8kpzdo+k5c0vUQG7RcpoOV9HNzyKZseP3Z0n5SDCbr0
 PLjcOOBUh4tMusQTK50SQdWLP0S57Bl7HvI/3/6VkD7hq0DkKiIyzfuzj1VQFAY31A9Qr2aV0
 rfyWL/UFcbzOluu40AnkFC/TSBXrxKC8WEwhDopuhUjYmlugvR+bMfXIs54VIPvCKVHMXivZI
 2hOhFEoJf0D062D6kGEDslJy78Qm0wrb5yDL2hg7uLQW/IYTEU0mHKVhXsgcxUA/peNO0IHv3
 bFG3LIxTmLCYfUfqiXFLnm2zXeLI9XwTFRCC5zio2IHOWlRdpmqixp4XsECYuoPz/i6RXWyKR
 zs8a3XArhvzE8qoLN
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 07.07.19 20:01, James Bottomley wrote:
> Now that we support ext4 and palo within the boot label, update the
> documentation to reflect this.  Also beef up the man page with
> examples and remove reference to palo in the gnu info system because
> it doesn't exist.
>
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> ---
>   Makefile       |  8 ++++---
>   README.html    | 44 ++++++++++++++++++++---------------
>   palo.8         | 73 ++++++++++++++++++++++++++++++++++++++++++--------=
--------
>   palo.help2man  | 47 +++++++++++++++++++++++++++++++++++++
>   palo/usage.txt |  8 +++----
>   5 files changed, 134 insertions(+), 46 deletions(-)
>   create mode 100644 palo.help2man
>
> diff --git a/Makefile b/Makefile
> index 8c76693..a372617 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -66,7 +66,7 @@ CMDLINE =3D 0/vmlinux HOME=3D/ TERM=3Dlinux $(ROOT) $(=
EISAIRQ) $(CONSOLE)
>   HELP2MAN :=3D $(shell command -v help2man 2> /dev/null)
>
>   all: makepalo README palo.conf
> -
> +
>   README:	README.html
>   	lynx -dump README.html > README
>
> @@ -106,10 +106,12 @@ distclean:
>   	cd ipl && $(MAKE) distclean
>   	cd palo && $(MAKE) distclean
>
> -palo.8.gz:	palo/palo palo/usage.txt
>   ifdef HELP2MAN
> -		help2man ./palo/palo > palo.8
> +palo.8:		palo/palo palo/usage.txt palo.help2man
> +	help2man --no-info -i palo.help2man ./palo/palo > palo.8
>   endif
> +
> +palo.8.gz:	palo.8
>   	gzip -9 < palo.8 > palo.8.gz
>
>   changelog.gz:	debian/changelog
> diff --git a/README.html b/README.html
> index 0711890..784c86e 100644
> --- a/README.html
> +++ b/README.html
> @@ -26,7 +26,7 @@ Partition number '0' is magic and refers to
>   the kernel (ramdisk) you placed on the boot medium with '-k' ('-r').
>   The path name on the '0' partition is ignored, '0/vmlinux' and '0/xyzz=
y'
>   work identically, but it's a good idea to be consistent with what
> -you'll call kernels and ramdisks on an ext2 partition.
> +you'll call kernels and ramdisks on an ext2/3/4 partition.
>
>   <h2 align=3Dcenter>Creating and Maintaining Bootable Disks </h2>
>   Partitioned media usually refers to disks, in this case disks partitio=
ned
> @@ -35,14 +35,20 @@ Normally your disk is properly initialized when you =
install
>   PA-RISC Linux, but if you need to do it by hand here are some clues:
>
>   <ul>
> -    <li>Use <i>fdisk</i> or something to (re)partition the disk.
> -    When you are finished, the disk <b>must</b> have a partition of
> -    type "F0"
> -    somewhere in the first 2Gb.  This is where the boot loader
> -    and an optional kernel and ramdisk will be stored, so make it
> -    big enough for that -- at least 4Mb (I like 8-16Mb).
> -    There must also be an ext2 partition within the first 2Gb
> -    where you'll store your Linux kernel.
> +    <li>Use <i>fdisk</i> or something to (re)partition the disk.  When
> +    you are finished, the disk may need to have a partition of type
> +    "F0" somewhere in the first 2Gb.  This is where the boot loader
> +    and an optional kernel and ramdisk will be stored, so make it big
> +    enough for that -- at least 4Mb (I like 8-16Mb).  There must also
> +    be an ext2/3/4 partition within the first 2Gb where you'll store yo=
ur
> +    Linux kernel.
> +
> +    <li>If <i>fdisk</i> created the first partition at sector 2048,
> +    which is usual for modern fdisk, you don't need a F0 partition, so
> +    set all partition types to 82 swap or 83 linux and palo will place
> +    the boot loader inside the disk label.  You still need a /boot
> +    partition <2GB from the beginning of the disk formatted as
> +    ext2/3/4 where you keep your boot kernels and initial ramdisks.
>
>       <p><li>Use <i>mke2fs</i> and <i>mkswap</i> as usual.
>
> @@ -67,16 +73,16 @@ and running <i>palo</i>.
>       <p> <b>-k&nbsp;path/to/vmlinux</b> designates a kernel to be store=
d
>       along with the boot loader in the "F0" partition.
>       You can omit this if you want, since you'll usually be booting
> -    a kernel from an ext2 partition instead.  I like to have a kernel
> -    there just in case the ext2 one is lost for some reason.  I
> +    a kernel from an ext2/3/4 partition instead.  I like to have a kern=
el
> +    there just in case the ext2/3/4 one is lost for some reason.  I
>       call it a <i><b>recovery kernel</b></i>.
>
>       <p> <b>-c&nbsp;5/vmlinux</b> must be changed for your situation.  =
The
> -    number, 5, is the partition number of your ext2 partition as
> +    number, 5, is the partition number of your ext2/3/4 partition as
>       reported by fdisk, the same number you use
>       when you mounted the partition (e.g., "mount /dev/sdb5 /mnt").
>       "/vmlinux" is the path to
> -    your kernel executable within your ext2 partition.
> +    your kernel executable within your ext2/3/4 partition.
>       The special partition number "0" is used to load the "recovery"
>       kernel which you placed into the "F0" partition with <b>-k</b>.
>
> @@ -90,7 +96,7 @@ and running <i>palo</i>.
>   <p>You now have a partitioned bootable disk, try it!
>
>   <p>There is no need to run <i>palo</i> when you change the
> -kernel in your ext2 partition because it is located dynamically
> +kernel in your ext2/3/4 partition because it is located dynamically
>   by the <i>palo</i> boot loader when you boot.  However there are proba=
bly
>   some tasks which will again require <i>palo</i>.
>
> @@ -143,7 +149,7 @@ stored contiguously on a 2k boundary.  Luckily the I=
SO file system
>   meets all these criteria except for the mod-2k length, which is achiev=
ed
>   by padding iplboot.
>   The palo bootloader (iplboot) requires requires the kernel to be store=
d
> -contiguously (except when booting from ext2), and the ISO file system
> +contiguously (except when booting from ext2/3/4), and the ISO file syst=
em
>   works well for this too.
>
>   <p>When you run <i>palo</i>, it locates the boot loader and kernel
> @@ -308,10 +314,10 @@ that somewhat larger kernels and boot loaders can =
be added later
>   without re-writing the rest of the F0 partition (this feature may
>   not yet be supported by <i>palo</i> however).
>
> -<p>On partitioned media, <i>palo</i> can load a kernel from any ext2-fo=
rmatted
> -partition which falls within the first 2G of the medium, in addition
> -to having a "sequential" kernel, perhaps best seen as a recovery kernel=
,
> -within the <b>F0</b> partition.
> +<p>On partitioned media, <i>palo</i> can load a kernel from any
> +ext2/3/4-formatted partition which falls within the first 2G of the
> +medium, in addition to having a "sequential" kernel, perhaps best seen
> +as a recovery kernel, within the <b>F0</b> partition.
>
>
>   <h2 align=3Dcenter>Really Building <i>palo</i></h2>
> diff --git a/palo.8 b/palo.8
> index 7362621..e0ccc37 100644
> --- a/palo.8
> +++ b/palo.8
> @@ -1,12 +1,12 @@
> -.\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.5.
> -.TH PALO "1" "January 2018" "palo version 2.00" "User Commands"
> +.\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.10.
> +.TH PALO "1" "July 2019" "palo version 2.01" "User Commands"
>   .SH NAME
> -palo \- manual page for palo version 2.00
> +palo \- manual page for palo version 2.01
>   .SH SYNOPSIS
>   .B palo
>   [\fI\,options\/\fR]
>   .SH DESCRIPTION
> -palo version 2.00
> +palo version 2.01
>   .TP
>   \-?, \fB\-\-help\fR
>   Print this information
> @@ -83,10 +83,10 @@ Provide more verbose information when running palo
>   \fB\-e\fR, \fB\-\-format\-as\fR=3D\fI\,type\/\fR
>   .IP
>   This is only for partitioned media. Format the palo
> -partition as an ext2 (type =3D=3D 2) or ext3 (type =3D=3D 3)
> -partition. With this option, you cannot specify any
> -parameters, kernels or ramdisks to be loaded into
> -the palo partition
> +partition as an ext2 (type =3D=3D 2), ext3 (type =3D=3D 3) or
> +ext4 (type =3D=3D 4) partition. With this option, you
> +cannot specify any parameters, kernels or ramdisks to
> +be loaded into the palo partition
>   .PP
>   \&'palo' with no arguments whatsoever is equivalent to 'palo \fB\-f\fR=
 \fI\,/etc/palo\/\fP.conf'.
>   .PP
> @@ -94,15 +94,48 @@ When more than one of \fB\-I\fR, \fB\-U\fR, \fB\-s\f=
R and \fB\-C\fR are used, on
>   last one is effective.
>   .PP
>   http://www.parisc\-linux.org \- Wed, 17 Jan 2018 15:15:40 +0100
> -.SH "SEE ALSO"
> -The full documentation for
> -.B palo
> -is maintained as a Texinfo manual.  If the
> -.B info
> -and
> -.B palo
> -programs are properly installed at your site, the command
> -.IP
> -.B info palo
> -.PP
> -should give you access to the complete manual.
> +
> +palo is the installation and management tool for the parisc
> +bootloader, called iplboot.  The size required for the iplboot binary
> +is 256kb.  Older MS-DOS label disks begin the first partition at
> +sector 63 and there is no room for iplboot within the disk label, so
> +you must create a palo partition of type F0 to hold iplboot.  If your
> +disk was formatted more recently it should have a newer MS-DOS label
> +where the first partition begins at sector 2048 meaning there is room
> +for iplboot within the disk label and a palo (F0) partition is not
> +required.
> +
> +If you have a palo partition (type F0), it must occur within the first
> +2GB of the beginning of the disk.  If you choose to have a palo
> +partition, you may store both the kernel and the initrd in this
> +partition, meaning you have to update it every time you update the
> +kernel, or you may choose to have a /boot partition, which must be
> +formatted as an ext2/3/4 filesystem, from which palo will load
> +kernels.  This /boot partition also must be within the first 2GB of
> +the beginning of the disk.  If you have no palo partition, and palo is
> +installed inside the disk label, you must have a /boot partition
> +because the disk label is still too small to contain a kernel and a
> +ramdisk.
> +
> +Palo allows you to specify a kernel command line, which is stored in
> +the firstboot partition.  The format should be kernel first followed
> +by an optional initrd=3D and then the rest of the kernel parameters.
> +For parisc system, you should specify a boot console as console=3D on
> +the command line.  The format of the kernel and initial ramdisk files
> +is <partition number>/<path to file>.  It is recommended, but not
> +required, that both the kernel and the initial ramdisk be in the root
> +directory of the filesystem.
> +.SH EXAMPLES
> +
> +Create a Bootable disk on sda for the first time by installing palo
> +
> +    $ palo -c "1/vmlinux initrd=3D1/initrd.img console=3Dtty" -I /dev/s=
da
> +
> +Update the bootloader command line without re-installing it
> +
> +    $ palo -c "1/vmlinux.new initrd=3D1/initrd.img.new console=3Dtty" -=
U /dev/sda
> +
> +Format the palo partition as ext4 and install iplboot within that
> +partition using ext4 badblocks [requires a palo (type F0) partition]:
> +
> +    $ palo  palo -c "1/vmlinux initrd=3D1/initrd.img console=3Dtty" --f=
ormat-as=3D4 -I /dev/sda
> diff --git a/palo.help2man b/palo.help2man
> new file mode 100644
> index 0000000..40c92f5
> --- /dev/null
> +++ b/palo.help2man
> @@ -0,0 +1,47 @@
> +[>description]
> +
> +palo is the installation and management tool for the parisc
> +bootloader, called iplboot.  The size required for the iplboot binary
> +is 256kb.  Older MS-DOS label disks begin the first partition at
> +sector 63 and there is no room for iplboot within the disk label, so
> +you must create a palo partition of type F0 to hold iplboot.  If your
> +disk was formatted more recently it should have a newer MS-DOS label
> +where the first partition begins at sector 2048 meaning there is room
> +for iplboot within the disk label and a palo (F0) partition is not
> +required.
> +
> +If you have a palo partition (type F0), it must occur within the first
> +2GB of the beginning of the disk.  If you choose to have a palo
> +partition, you may store both the kernel and the initrd in this
> +partition, meaning you have to update it every time you update the
> +kernel, or you may choose to have a /boot partition, which must be
> +formatted as an ext2/3/4 filesystem, from which palo will load
> +kernels.  This /boot partition also must be within the first 2GB of
> +the beginning of the disk.  If you have no palo partition, and palo is
> +installed inside the disk label, you must have a /boot partition
> +because the disk label is still too small to contain a kernel and a
> +ramdisk.
> +
> +Palo allows you to specify a kernel command line, which is stored in
> +the firstboot partition.  The format should be kernel first followed
> +by an optional initrd=3D and then the rest of the kernel parameters.
> +For parisc system, you should specify a boot console as console=3D on
> +the command line.

No, that's not recommended.
palo will detect the currently used console and add it automatically,
so one should NOT specify a console parameter.

Helge
