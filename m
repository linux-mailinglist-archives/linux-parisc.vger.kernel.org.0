Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7E1401197
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Sep 2021 22:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbhIEUvj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Sep 2021 16:51:39 -0400
Received: from mout.gmx.net ([212.227.17.22]:49139 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231895AbhIEUvj (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Sep 2021 16:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630875017;
        bh=4EEPYgv1sgfFTD33SNu3kGNOcnnidOu20uTJknT7luM=;
        h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
        b=U9YqZpvk9NK4Icb9d6TQWpLTQ5nZLPIgQ9+Nda+MUELBUxsXvw4ynHeOrBZ7Xmj7c
         kTSYFXNwD80yEIw2xA5Tan/SJM0KbGdxdN/Brb6v0P9KxVPhPBLReIOm4BrewTatus
         rxKtoa9UrkYlFD4CJY+QwLjB3asH27wsIufmM8CE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.147.61] ([80.187.121.82]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7i8Y-1n1K5D0Fyk-014lWX; Sun, 05
 Sep 2021 22:50:17 +0200
Subject: Re: [debian-hppa] qemu-system-hppa and Debian HPPA
To:     "Nelson H. F. Beebe" <beebe@math.utah.edu>
References: <CMM.0.95.0.1628948053.beebe@gamma.math.utah.edu>
Cc:     HPPA porters <debian-hppa@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
From:   Helge Deller <deller@gmx.de>
Message-ID: <54f798b6-7c79-27fc-73bf-ee211dfd53e6@gmx.de>
Date:   Sun, 5 Sep 2021 22:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CMM.0.95.0.1628948053.beebe@gamma.math.utah.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5jqo9WdccQqie83U1AG1Yi510T98YHbi3F7kSFelPkXeX0Ha0q3
 oyC0MLxvDjRi057jwy6jOxCHScSLCzNUGY6P8YKX2BjeJ8P5AFuuupz93i+geWPg1GJISBb
 snTEyOuB/nPDpdbdV8ihnrtnYwPv26WFVAdA6l7T35XQPxcKCj4vVHTJizFG8Fro8w0p4//
 Siscpnt3JYqM8Mmp9MY2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LLgNQnFPBrU=:qCg++xzCjk5mlb6OoLvSMe
 xLIwKfiTP0HtngiVhAu0FH7FT3dMqkXEgGRazi24exK9ireLCsdvNuUkAGrnVrB8dDmaTsLa4
 LiLa2TfK+PaN+TkQxgFLJcan7lRoStZteiJWw/IFkTsZiisr14/F9jdfPUM9y6j0+Uof/O2rY
 eCnaa5ZP2rLcwDTn4N+ysHVZOkDxdhu/+nza24kRkL3L8B9HBfBmPLiPcXVj9zzgIPpLt26+S
 VbIBFTWB7b4NaBzeoqTbfN5uyogS92CRkSfBRefZJ9KcU4Ln4/DR6Nna9fBD+XOc3Bekl2prk
 TKQ19OfwiWsEZwko/zf4iNBGeU6Awiidy2Rt4VzabnRW+cHXX6Dakz5cMPbbzymLEuuN/OPfm
 cX1msUiHhW1ekxiK5FfcV1LUZCASNkxcMhmSaGQG4azZIcIqED/1iiUOTU/CuEnc0mivcYkKH
 lq66xLVrwnW/DjKBpGdaV7YTIj6WOLJiqLdr82Oci4B8nOiHjDrhjYLtLI0I8hKUbHRTw69Xz
 tXBFeKih3bQulD03PyDlMUfBstXR1MPWChn/crH8bJd1Acsmmo8AeydRuN1DGXBjAv7gyV+5m
 vUAkBTpJZ2NXTo1870Ekaz/0JEFcm0I70ZwOJHXQC8+eRvUXURxvbKQQ+9KzTW7rtftBc3sA1
 1yUEIwu9g7NrLFB1LlbpURybuZbGITHIMjJxQak2DKey2ENqr5dzgbXilo8UQac7h1ojlPbpF
 2IC8jK8/Q9WlSFF+t3pRgYrkUeGF0zg2OGBfOo5wktkScojpJI6KFnQUHRI/bSY/+imoUTYAi
 ShjrzRLqVGDebN1n/pMxYFlwwPNkrz3dcbWs8VDRiWSTZdru5Wi6zokfGkINBQi1xa/zfyX8j
 OyxJccfFcVyk7krmMlEUCqaqaB4s1YlWjkvarhrwsgRwcWe4T26muw1WyX3fXo+NLA9cdRqtQ
 unr0q/V+Z781pOPe18gFEXvO7DOvNNW5JuUMctSb2yJUQXnDjLHhfLiJ7QBWkLwqQTZGTnYja
 uhrKxsiyqtiaOn/KTG+Ha/x8G+vZ7afttCpUkosdZC2jBMKushrtZcR1PXrW6vm1Snz+IXo7h
 5Ahm3W/SaZ+TnkW5oZ6ITd84KNalMZuGBiXUO/06drZMqlF2Hskel0QsA==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/14/21 3:34 PM, Nelson H. F. Beebe wrote:
> This is a report of failures, and ultimate success, in installing
> Debian HPPA with the QEMU emulation of that CPU architecture.
>
> I run a large farm of more than 500 physical and virtual machines that
> we use for software testing and development.  The VMs include numerous
> O/Ses and CPU types: AMD64 (x86_64), ARM32, ARM64, Alpha, M68K,
> MIPS32, MIPS64, PowerPC, RISC-V64, S390x, SPARC, and x86.  Most of
> those are emulated by QEMU running on CentOS 7 and Ubuntu 20.04 on
> Intel Xeon hardware.
>
> The major historical CPU family with IEEE 754 floating-point
> arithmetic missing from that list is Hewlett-Packard's Precision
> Architecture RISC, PA-RISC, also called HPPA.  In the 1990s, we had
> several physical workstations and servers of that type, but all have
> long since been retired and disposed of.
>
> Neither of our other virtualization systems, OVirt and VirtualBox,
> supports emulation of other CPU types.  With VirtManager and QEMU,
> however, there are numerous CPU types available. Regrettably, for many
> of them, it is necessary to discard the easy-to-use VirtManager GUI,
> and resort to low-level qemu-system-xxx command lines, and that is the
> case for Alpha, HPPA, M68K, and SPARC.
>
> One of the projects that I work on is ensuring that the annual TeX
> Live releases can be built on a wide range of platforms.  This year's
> report is at
>
> 	http://www.math.utah.edu/pub/texlive-utah/
>
> I had previously tried to install Debian 4, 5, 9, and 10 releases for
> HPPA, but each time, I failed: either QEMU complained of missing
> firmware, or the VM would not boot, or it would boot, but I could not
> get a working network.
>
> In June 2021, I retried with a .qcow2 disk image converted from
>
>          -rw-rw-r-- 1 511504481 May  9  2018 debian-10-hdd-img.tar.bz2

I think this is the one I prepared once:
http://backup.parisc-linux.org/qemu/debian-10-hdd-img.tar.bz2


> That disk image is far too small for my needs, but I was able to to
> extend the partition size like this:
>
> 	qemu-img convert -O qcow2 debian-10-hdd.img debian-10-hdd.qcow2
> 	qemu-img resize debian-10-hdd.qcow2 +55G
>
> That gets a bigger partition, but further work is needed after a boot
> from an ISO image:
>
>          fdisk /dev/sda
> 	[delete second partition, then recreate with maximum size]
> 	reboot
>
> Unfortunately, the disk image it has no C/C++ compilers, and other
> tools that I need, (e.g., starting with the build-essential one) but
> we found that it is sufficiently old that it is impossible to run "apt
> update" and "apt install" commands: there are far too many unresolved
> dependencies.

debian-unstable for hppa is a moving target. And we had lots of fixes
since then. So, yes maybe updating is not easy.

> It would be good to get that .img file replaced by a current one that
> could be used directly, and that had important packages needed for
> software development already installed,

Ok, I'll see if I do another one soon.

> including build-essential,
> gfortran, m4, and compilers for Go and Rust.

I don't think we have a Go-port yet, and for Rust only initial
porting was done by Adrian Glaubitz for gcc-rust:
https://www.mail-archive.com/gcc-rust@gcc.gnu.org/msg00028.html


> This month, I tried an install from the more recent ISO image
>
> 	-r--r--r-- 1 263258112 Jun  8 16:14 debian-10.0.0-hppa-NETINST-1.iso

That's a newer debian install CD I think.

> With the native version 4.2.0 qemu-system-hppa on Ubuntu 20.04 LTS,
> the installer boot died with
>
> 	[   51.098263]  [<101e7684>] do_group_exit+0x54/0xf0
> 	[   51.098263]  [<101f76a4>] get_signal+0x1b0/0xac8
> 	[   51.098263]  [<101c5b34>] do_signal+0x4c/0x56c
> 	[   51.098263]  [<101c609c>] do_notify_resume+0x48/0xfc
> 	[   51.098263]  [<101b70a8>] intr_check_sig+0x34/0x38
> 	[   51.098263]
> 	[   51.098263] ---[ end Kernel panic - not syncing: Attempted to kill i=
nit! exitcode=3D0x0000000a ]---
>
> I have built several later versions of QEMU from source, but with
> them, the installer runs for some time, then dies with a terminal
> screen that looks like this:
>
>          [ (1*installer) 2 shell 3 shell 4- log ][ Aug 07 0:00 ]
>          .... blank screen ...
>          [ 1489.609145]       _______________________________
>          [ 1489.609145]      < Your System ate a SPARC! Gah! >
>          [ 1489.609145]       -------------------------------
>          [ 1489.609145]              \   ^__^
>          [ 1489.609145]                  (__)\       )\/\
>          [ 1489.609145]                   U  ||----w |
>          [ 1489.609145]                      ||     ||
>          [ 1489.613720] ip (pid 2962): Illegal instruction (code 8)
>          [ 1489.614573] CPU: 0 PID: 2962 Comm: ip Tainted: G            =
E     5.10.0-6-parisc #1 Debian 5.
>          [ 1489.694519] ---[ end trace 49060643616260b7 ]---844cx2744   =
E     5.10.0-6-parisc #1 Debian 5.
>
> For the record, here is the emulator command:
>
>          $QEMUDIR/qemu-system-hppa						\
> 		 -m 3G								\
> 		 -drive file=3Ddebian-10e-hdd.qcow2				\
> 		 -drive file=3Ddebian-10.0.0-hppa-NETINST-1.iso,media=3Dcdrom	\
> 		 -boot order=3Dd							\
> 		 -nographic							\
> 		 -serial mon:stdio
>
> I ran an xterm log of those attempts, and found that the "Your System
> ate a SPARC! Gah!" message appears just after the output
>
>          Detecting network hardware
>
> That suggested that changing from the default TULIP network device
> might be worth trying.
>
> The devices supported by qemu-system-hppa are
>
>          e1000                               i82559c
>          e1000-82544gc                       i82559er
>          e1000-82545em                       i82562
>          i82550                              i82801
>          i82551                              ne2k_pci
>          i82557a                             pcnet
>          i82557b                             rtl8139
>          i82557c                             tulip
>          i82558a                             virtio-net-pci
>          i82558b                             virtio-net-pci-non-transiti=
onal
>          i82559a                             virtio-net-pci-transitional
>          i82559b                             vmxnet3
>
> Of those, the Intel e1000 is one that is commonly supported on most
> operating systems.
>
> I therefore changed the startup command to
>
> 	$QEMUDIR/qemu-system-hppa                                       \
> 	    -m 3G                                                       \
> 	    -drive file=3Ddebian-10e-hdd.qcow2                            \
> 	    -drive file=3Ddebian-10.0.0-hppa-NETINST-1.iso,media=3Dcdrom    \
> 	    -boot order=3Dd                                               \
> 	    -nographic                                                  \
> 	    -serial mon:stdio                                           \
> 	    -net nic,model=3De1000,netdev=3Dnet0                            \
> 	    -netdev user,\
> 	id=3Dnet0,\
> 	net=3D192.168.123.0/24,\
> 	restrict=3Doff,\
> 	ipv6=3Doff,\
> 	hostfwd=3Dtcp::12222-192.168.123.122:22
>
> and that led to a successful boot of the installer, which ran to
> completion, but took more than 10 hours to do so.

Newer versions of qemu have a tulip driver. This works best.

> In my recent experiments, I have used QEMU versions 6.0.0, 6.1.0-rc0,
> 6.1.0-rc2, and 6.1.0-rc3.
>
> Although the ISO image is labeled as Debian version 10, the actual
> version reported in /etc/debian_version is 11.0.

It's a debian-unstable install CD, so 11.

> I can now boot the .qcow2 image directly with a similar command
>
>    	$QEMUDIR/qemu-system-hppa                                       \
> 	    -m 3G                                                       \
> 	    -smp cpus=3D4                                                 \
> 	    -drive file=3Ddebian-10e-hdd.qcow2                            \
> 	    -boot order=3Dc                                               \
> 	    -nographic                                                  \
> 	    -serial mon:stdio                                           \
> 	    -net nic,model=3De1000,netdev=3Dnet0                            \
> 	    -netdev user,\
> 	id=3Dnet0,\
> 	net=3D192.168.123.0/24,\
> 	restrict=3Doff,\
> 	ipv6=3Doff,\
> 	hostfwd=3Dtcp::12222-192.168.123.122:22
>
> where the -drive line for the ISO image is removed, and the boot
> device is changed from d to c.
>
> My local practice is that VMs reside on the private network
> 192.168.123.0/24, and the last octet for a particular VM prefixes the
> standard secure shell port number, 22: thus, I have port 12222 when
> the last octet is 122.
>
> The network used by QEMU, and its DHCP range, is determined by this
> block in /etc/libvirt/qemu/networks/default.xml:
>
> 	<network>
> 	  <name>default</name>
> 	  <uuid>740f7e29-7ab4-4130-9316-d2e216fa707b</uuid>
> 	  <forward mode=3D'nat'/>
> 	  <bridge name=3D'virbr0' stp=3D'on' delay=3D'0'/>
> 	  <mac address=3D'52:54:00:7c:1e:ae'/>
> 	  <ip address=3D'192.168.123.1' netmask=3D'255.255.255.0'>
> 	    <dhcp>
> 	      <range start=3D'192.168.123.241' end=3D'192.168.123.254'/>
> 	    </dhcp>
> 	  </ip>
> 	</network>
>
> I can now connect to the VM with
>
> 	ssh -p 12222 localhost
>
> and have since been able to fully configure it with user accounts and
> installations of scores of packages.  So far, it appears to run
> stably.
>
> There is, however, a serious performance issue that I will discuss in
> a subsequent posting to this list.

The PA emulation isn't very fast, but not bad either.
On my not-so-fast x86 it's performing like a native j5600 machine.

If your emulation is slow, I'd suggest that you:

1. add "accel tcg,thread=3Dmulti" to the qemu line.
This enables that every emulated CPU runs in an own qemu thread, so
"-smp cpus=3D4" should run on 4 physical CPUs on your host.
You can check with "top" on the host if multiple CPUs are used.

2. Make sure you have debug code disabled when you compile qemu.
If enabled it generates very slow running qemu.

3. You used "nographic", so it's not relevant in your case, but if
you would enable graphics you should add "-display sdl".
It's a whole lot faster than the default setting.

Some additional info is here:
https://parisc.wiki.kernel.org/index.php/Qemu

Helge
