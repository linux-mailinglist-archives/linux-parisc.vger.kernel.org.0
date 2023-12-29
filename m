Return-Path: <linux-parisc+bounces-316-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9548200A0
	for <lists+linux-parisc@lfdr.de>; Fri, 29 Dec 2023 17:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EC6D2847D3
	for <lists+linux-parisc@lfdr.de>; Fri, 29 Dec 2023 16:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5046112B6B;
	Fri, 29 Dec 2023 16:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="k0MwVTMO"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A906112B69
	for <linux-parisc@vger.kernel.org>; Fri, 29 Dec 2023 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1703868783; x=1704473583; i=deller@gmx.de;
	bh=DWKpd8W87x7zsQYOpKfE7JeZ2FEvYeyHYa4piyVLExY=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=k0MwVTMOZC951u6sme7m8k7kfFkQ4g/y+6418ANFzaEuMVJ4bmrHVdE8rQto/NRD
	 KSHS9CPf3x7HklNVUesZdl8BRBZLaWKviuvo/1uMRUVbqRBdikSCsIbJghfcxrFB5
	 TDQJ1xPq6GRjt73CPl79XD9l+n0PVpfv2k2Zn37TfjTAcNVhzsDqS0EBTx+7N14Y+
	 DPjOb9Hiu+moa7a0OYPzD0Ulx2gYUAdjtWMF5MLw9GrlPRa5y7FdTP/9nhwm5Mden
	 Pq6DVN2BedUf0Z9LCRi3LcNV8G12Ql+i05l3ILkqmWrB+mMHeSX85tXIpqSrzpAiE
	 /raq9gq5lU1HheUfdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.155.76]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1qkSFl2yuk-00hc2v; Fri, 29
 Dec 2023 17:53:03 +0100
Message-ID: <27c830f0-36b9-4e7d-8540-dbf2fe415b5c@gmx.de>
Date: Fri, 29 Dec 2023 17:53:02 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hppa64 Linux in QEMU
Content-Language: en-US
To: Bruno Haible <bruno@clisp.org>, "Nelson H. F. Beebe" <beebe@math.utah.edu>
Cc: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@t2-project.org>,
 linux-parisc <linux-parisc@vger.kernel.org>
References: <CMM.0.95.0.1703805969.beebe@gamma.math.utah.edu>
 <3574571.ElGaqSPkdT@nimes>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <3574571.ElGaqSPkdT@nimes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w9VFvajh1kDVdcPxSduyB+FYvWuYWJTremSVQIo2UOxwTGzrJSM
 C78TriB+CJ2bjjpmZfUJfQZztG/w4dSfNwUIEsnnE4L0nySzT4k+6P/Cj3+gzzEGXsljuqL
 aN3RuXTRNS2uopRL/dl/aaKOLwGAYZ6C6fmpdVyB9WEu8KnlbNNv8gOfm4qyElnphr8oU2r
 qVfGGoGNDfkYPKnGWvRYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jmZ0BcAqREs=;rwDl53MSYsrgV/2DbyEsc+GvDiP
 a03aTIsRd1BNRjc0JXm+pwd0j5bTGXzRP0PsQuKNdgojb59E62hGp6LyTiLdiZWc+IkpNFiA4
 y79R8cjzIr5QzYx8QxFJYz6FDB8wub36D3h7q1owGgvsjf/gwpqTd1pmK+N5EVeaenExLHP5r
 VixxogW80jkDfdWd047h8W4WAsM4c05dxHPGy1U4elrQGiU3dmolsfDYHSHJJsFfkHtmmFT48
 cp64Ze7DDG7gCNnj6XETFW3G6kIzOibLdK+Blb5OD7bpZxkj7fqP0eSA8XQFjYre+J7THcoGQ
 grPIWIPzeanFbcAD/DpEW0ryL99fAdM5K4vR4NLKBmPMJbRkSpa4RUzZ2azH3RvT8UgIqYmdu
 DBhbAspOZOdjaL4/oBIXww5DK88ltVRABMZ1JaIPVf4417LSqiwmnGt1Y4APcc++9lXZGzCl0
 jxopI/Rw/PoW7QsP0COyuk+jTl2ZJaQKntPHsDIH/DX5kbyDQBVLN0gpB5xmh1wpd4wZ2AGDK
 OD9hxSxP+xUg0SdK5W65mQvQVzFKWjOqtcXJjuEvNDZJqD1UpGzWjcIdWfLdiRiArYP9kU2vG
 fKTzwC2BMhubwroVvoUilNoP1OqwK/HDaAjM6ElFgyo0/ay0Bnmr+qV8c9fwduZiPtkH8yItP
 g00xekFU93wPCu8KuXcPRa8xWHDW6GM0p/OTKeGLNVvleZKNBfKJ9uoBv4dGL/yaJ8wvMZjcC
 3hwZSbHD7nuMXjCSdkT547q5irbPzol9DUfMuu0e1bYBjpImSbezIXTkjzNgW1XRFgAfbJzS2
 fjUjf30AM32tYdbqGuy4T0pU2yqhoHs/K/34e/hzG6rUczFfpB7LNMAJqrJxBnc4Uw9RAQHFb
 cWhB6dtB5brfDtrtwTx4uES3XuRqZo20PjQ8Af7IbSzz8OEEEPHC4WBu//uy39IUbVpLQ4Hu2
 Wy0SnA==

On 12/29/23 17:15, Bruno Haible wrote:
> Nelson H. F. Beebe wrote:
>> I'm going to look at building a VM for the 64-bit variant.
>
> I tried it, but couldn't complete the installation.
>
> The only Linux distro with HPPA64 binaries that I know of

Debian and Gentoo can install a 64-bit kernel as well.
The userspace binaries are 32-bit on ALL distributions, since
we don't have a 64-bit glibc yet.

> I don't want to build everything myself =E2=80=94 is T2-SDE. Here's what=
 I tried:
>
> Download: http://dl.t2sde.org/binary/2023/t2-23.12-hppa64-minimal-firefo=
x-gcc-glibc.iso
>
> Use qemu-8.2.0 (because it support 64-bit CPUs)
> % PATH=3D$HOME/inst-qemu/8.2.0/bin:$PATH
>
>
> Create empty disk:
> % qemu-img create -f qcow2 t2sde.qcow2 10G
>
> Pull kernel and initrd out of the installation CD:
> % sudo mount -r -t iso9660 -o loop t2-23.12-hppa64-minimal-firefox-gcc-g=
libc.iso /mnt
> % mkdir boot
> % cp -a /mnt/boot/* boot/
> % sudo umount /mnt
>
>
> Run installer:
> Doc says: Start 64-bit machine with "-machine C3700" and 32-bit CPU with=
 "-machine B160L"
> % machine_args=3D"-M C3700 -m 256"
> % disk_args=3D"-drive file=3Dt2sde.qcow2,format=3Dqcow2,id=3Dhd0"
> % net_args=3D""
> % display_args=3D"-nographic"
> % common_args=3D"$machine_args $disk_args $net_args $display_args"
> % qemu-system-hppa $common_args \
>      -kernel boot/vmlinux-6.6.7-t2 -initrd boot/initrd-6.6.7-t2 \
>      -drive file=3Dt2-23.12-hppa64-minimal-firefox-gcc-glibc.iso,if=3Dsc=
si,bus=3D0,unit=3D2,media=3Dcdrom
>
> Serial terminal: <Enter> or console
> # install
> Partition:
>    fdisk
>    n p 1 <Enter> <Enter>
>    w
> On /dev/sda1: Create filesystem of type ext3 [why not ext4?] with mount =
point /
> --------------------------------------------------- HERE it hangs
> handle_break: 2921306 callbacks suppressed
> handle_break: 2923362 callbacks suppressed
> handle_break: 2919859 callbacks suppressed
> handle_break: 2944852 callbacks suppressed
> handle_break: 2933621 callbacks suppressed
> handle_break: 2948476 callbacks suppressed
> handle_break: 2952380 callbacks suppressed
> handle_break: 2869013 callbacks suppressed
> handle_break: 2800234 callbacks suppressed
> handle_break: 2908121 callbacks suppressed
> handle_break: 2825626 callbacks suppressed
> handle_break: 2899328 callbacks suppressed
> handle_break: 2916401 callbacks suppressed
> handle_break: 2886012 callbacks suppressed
> handle_break: 2942498 callbacks suppressed
> handle_break: 2925950 callbacks suppressed
> handle_break: 2923203 callbacks suppressed
> ...
> ---------------------------------------------------
>
> Any ideas, what one could try, to get further?

There still seems a problem in qemu when running a 64-bit kernel.
This shows up when kernel modules are used, esp. e.g. with ext4.

As a work-around for now I suggest to use the 32-bit kernel and do the
installation. Then, after installation, install a 64-bit kernel
(a manually built one which does not use kernel modules) and boot
that one.

Beside that, at least Debian will install a 32-bit kernel by default
since the SeaBIOS-hppa firmware is still 32-bit only and will report
back to the installers to "install a 32-bit kernel".
This will change as soon as I can come up with a 64-bit SeaBIOS-hppa,
but currently I'll try to focus on fixing the 64-bit kernel (modules)
issue and fixing booting 32-bit HP-UX.

Helge

