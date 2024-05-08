Return-Path: <linux-parisc+bounces-1357-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318A8BF91A
	for <lists+linux-parisc@lfdr.de>; Wed,  8 May 2024 10:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56C6BB209BF
	for <lists+linux-parisc@lfdr.de>; Wed,  8 May 2024 08:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B97535D0;
	Wed,  8 May 2024 08:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="LbAM7TsF"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mxe.seznam.cz (mxe.seznam.cz [77.75.78.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580E13EA9C
	for <linux-parisc@vger.kernel.org>; Wed,  8 May 2024 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715158527; cv=none; b=Yha3MamL9pRtqCNp9ZgGI60RG/tLf2p4swznm9/HBEMuzEhdEijW3BaCoAzmPE2U3JA4SVh1cy0jZK/i01mg0GDGaneQVXxg4fqoL0Qmv5THESmSWVTB1ZYg8gSoK7JTngFoo1niovIv36qRt0voO06Y0bIM2ZAf5mJR7ZVCqeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715158527; c=relaxed/simple;
	bh=6sf9Ot5essvpj9DRKFmSOF4EcG7OG2Kr/nMTiTgsGrE=;
	h=From:To:Cc:Subject:Date:Message-Id:References:In-Reply-To:
	 Mime-Version:Content-Type; b=YaRWa6wiNXytK/mWbcZ0s9JA5uxPD7iMm2HfBWr7BLpnS4Syodsds/QXK3KrNhHHrxSDd2LSMrQ9Jhdq/RNRQhbfRaLejb0y+FcZAUMxTRyqIxrTyt4r7apXURYOheDDYNBEEScaDYoW5CslDkkHNRkgu2uZyHljK/3uV/MdAOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=LbAM7TsF; arc=none smtp.client-ip=77.75.78.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Received: from email.seznam.cz
	by smtpc-mxe-cdf9fb4cf-zw6dv
	(smtpc-mxe-cdf9fb4cf-zw6dv [2a02:598:64:8a00::1000:53f])
	id 6e54e136a19abe8a6e0b94ff;
	Wed, 08 May 2024 10:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
	s=szn20221014; t=1715158520;
	bh=6lPWui2FXUXdrbLVVYprZZw5xBUBrO8d4zNUs9NX1nw=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:References:
	 In-Reply-To:Mime-Version:X-Mailer:Content-Type;
	b=LbAM7TsFHCpqnCX0Oj+1ZZL1xlLZD1wSaOkveM8nU1VP7UEby4XLFzL+jnSvrYx7L
	 N+YUAc4DvLvkUH6iBqpHhgLM7+5rk3n4Ao0RXCJMCoJsiTQGDX4nrExNVZliGNTT8k
	 eoJFsCqp7aUrsU8KdFTTGHAdr1QJS838OECDK6oJuSS1ZGr1m0Qgfoi5NXgNJp9QtL
	 vQWy/O45SeKLns/FWJ5Qs7u8w4Q2/ZvdXmGJXcv5jrgVX5XefVR1F7J0clAPzzgTla
	 UTDeNzP7j11NZpSxgUj0ar8ns7B1Mh4umI24obW5LWuSiLXj67isLbxbdO/Yoz6O5N
	 857JmWfgWzbgA==
Received: from snat-29.cgn.sat-an.net (snat-29.cgn.sat-an.net [176.222.226.29])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Wed, 08 May 2024 10:54:31 +0200 (CEST)
From: <Vidra.Jonas@seznam.cz>
To: <linux-parisc@vger.kernel.org>
Cc: "John David Anglin" <dave@parisc-linux.org>,
	"Helge Deller" <deller@gmx.de>
Subject: =?utf-8?q?Re=3A_=5BPATCH=5D_parisc=3A_Try_to_fix_random_segmentat?=
	=?utf-8?q?ion_faults_in_package_builds?=
Date: Wed, 08 May 2024 10:54:31 +0200 (CEST)
Message-Id: <C4u.NueN.39ikIzqu}iW.1cEpt7@seznam.cz>
References: <Zje6ywzNAltbG3R2@mx3210.localdomain>
In-Reply-To: <Zje6ywzNAltbG3R2@mx3210.localdomain>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (szn-mime-2.1.37)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: multipart/mixed;
	boundary="=_05114d2209f196d571440241=f4f5a479-cd77-5f12-aa2d-cb7c6faa3b04_="


--=_05114d2209f196d571440241=f4f5a479-cd77-5f12-aa2d-cb7c6faa3b04_=
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

---------- Original e-mail ----------
From: John David Anglin
To: linux-parisc@vger.kernel.org
CC: Helge Deller
Date: 5. 5. 2024 19:07:17
Subject: [PATCH] parisc: Try to fix random segmentation faults in package =
builds

> The majority of random segmentation faults that I have looked at
> appear to be memory corruption in memory allocated using mmap and
> malloc. This got me thinking that there might be issues with the
> parisc implementation of flush_anon_page.
>
> [...]
>
> Lightly tested on rp3440 and c8000.

Hello,

thank you very much for working on the issue and for the patch! I tested=

it on my C8000 with the 6.8.9 kernel with Gentoo distribution patches.

My machine is affected heavily by the segfaults =E2=80=93 with some kernel=

configurations, I get several per hour when compiling Gentoo packages
on all four cores. This patch doesn't fix them, though. On the patched
kernel, it happened after ~8h of uptime during installation of the
perl-core/Test-Simple package. I got no error output from the running
program, but an HPMC was logged to the serial console:

[30007.186309] mm/pgtable-generic.c:54: bad pmd 539b0030.
<Cpu3> 78000c6203e00000  a0e008c01100b009  CC_PAT_ENCODED_FIELD_WARNING
<Cpu0> e800009800e00000  0000000041093be4  CC_ERR_CHECK_HPMC
<Cpu1> e800009801e00000  00000000404ce130  CC_ERR_CHECK_HPMC
<Cpu3> 76000c6803e00000  0000000000000520  CC_PAT_DATA_FIELD_WARNING
<Cpu0> 37000f7300e00000  84000[30007.188321] Backtrace:
[30007.188321]  [<00000000404eef9c>] pte_offset_map_nolock+0xe8/0x150
[30007.188321]  [<00000000404d6784>] __handle_mm_fault+0x138/0x17e8
[30007.188321]  [<00000000404d8004>] handle_mm_fault+0x1d0/0x3b0
[30007.188321]  [<00000000401e4c98>] do_page_fault+0x1e4/0x8a0
[30007.188321]  [<00000000401e95c0>] handle_interruption+0x330/0xe60
[30007.188321]  [<0000000040295b44>] schedule_tail+0x78/0xe8
[30007.188321]  [<00000000401e0f6c>] finish_child_return+0x0/0x58

A longer excerpt of the logs is attached. The error happened at boot
time 30007, the preceding unaligned accesses seem to be unrelated.

The patch didn't apply cleanly, but all hunks succeeded with some
offsets and fuzz. This may also be a part of it =E2=80=93 I didn't check t=
he
code for merge conflicts manually.

If you want me to provide you with more logs (such as the HPMC dumps)
or run some experiments, let me know.


Some speculation about the cause of the errors follows:

I don't think it's a hardware error, as HP-UX 11i v1 works flawlessly on=

the same machine. The errors seem to be more frequent with a heavy IO
load, so it might be system-bus or PCI-bus-related. Using X11 causes
lockups rather quickly, but that could be caused by unrelated errors in
the graphics subsystem and/or the Radeon drivers.

Limiting the machine to a single socket (2 cores) by disabling the other=

socket in firmware, or even booting on a single core using a maxcpus=3D1=

kernel cmdline option, decreases the error frequency, but doesn't
prevent them completely, at least on an (unpatched) 6.1 kernel. So it's
probably not an SMP bug. If it's related to cache coherency, it's
coherency between the CPUs and bus IO.

The errors typically manifest as a null page access to a very low
address, so probably a null pointer dereference. I think the kernel
accidentally maps a zeroed page in place of one that the program was
using previously, making it load (and subsequently dereference) a null
pointer instead of a valid one. There are two problems with this theory,=

though:
1. It would mean the program could also load zeroed /data/ instead of a
zeroed /pointer/, causing data corruption. I never conclusively observed=

this, although I am getting GCC ICEs from time to time, which could
be explained by data corruption.
2. The segfault is sometimes preceded by an unaligned access, which I
believe is also caused by a corrupted machine state rather than by a
coding error in the program =E2=80=93 sometimes a bunch of unaligned acces=
ses
show up in the logs just prior to a segfault / lockup, even from
unrelated programs such as random bash processes. Sometimes the machine
keeps working afterwards (although I typically reboot it immediately
to limit the consequences of potential kernel data structure damage),
sometimes it HPMCs or LPMCs. This is difficult to explain by just a wild=

zeroed page appearance. But this typically happens when running X11, so
again, it might be caused by another bug, such as the GPU randomly
writing to memory via misconfigured DMA.
--=_05114d2209f196d571440241=f4f5a479-cd77-5f12-aa2d-cb7c6faa3b04_=
Content-Type: application/octet-stream;
	name=parisc-hpmc-6.8.9-patched.log
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	size=5352;
	filename=parisc-hpmc-6.8.9-patched.log
Content-Id: <i05940765535047042>

WzE5MDgzLjI5OTgyOF0gdHJ5KDU5MTEpOiB1bmFsaWduZWQgYWNjZXNzIHRvIDB4Zjk1ZTM3MDkg
YXQgaXAgMHg0MTAwZDY3MyAoaWlyIDB4ZWMwMTA5ZCkKWzE5MDgzLjM5NDYyNl0gdHJ5KDU5MTEp
OiB1bmFsaWduZWQgYWNjZXNzIHRvIDB4Zjk1ZTM3MGEgYXQgaXAgMHg0MTAwZDY3MyAoaWlyIDB4
ZWMwMTA5ZCkKWzE5MDgzLjQ4NzkyNl0gdHJ5KDU5MTEpOiB1bmFsaWduZWQgYWNjZXNzIHRvIDB4
Zjk1ZTM3MGIgYXQgaXAgMHg0MTAwZDY3MyAoaWlyIDB4ZWMwMTA5ZCkKWzE5MDgzLjU4NDU4OF0g
dHJ5KDU5MTEpOiB1bmFsaWduZWQgYWNjZXNzIHRvIDB4Zjk1ZTM3MDkgYXQgaXAgMHg0MTAwZDZi
NyAoaWlyIDB4Zjk0MTI4MCkKWzE5MDgzLjY3NzkyMl0gdHJ5KDU5MTEpOiB1bmFsaWduZWQgYWNj
ZXNzIHRvIDB4Zjk1ZTM3MDkgYXQgaXAgMHg0MTAwZDZiYiAoaWlyIDB4ZjgwMTA5NSkKWzI3NTc4
LjkzNDY5M10gaGFuZGxlX3VuYWxpZ25lZDogNCBjYWxsYmFja3Mgc3VwcHJlc3NlZApbMjc1Nzgu
OTM0NzI2XSBncygxMzQwOCk6IHVuYWxpZ25lZCBhY2Nlc3MgdG8gMHg0MTdkMzliNCBhdCBpcCAw
eGY1Njk3MWEzIChpaXIgMHgyZjgwMTAwNCkKWzI3NTc5LjA5MDE5Nl0gZ3MoMTM0MDgpOiB1bmFs
aWduZWQgYWNjZXNzIHRvIDB4NDE3ZDM5YjQgYXQgaXAgMHhmNTY5NzFhMyAoaWlyIDB4MmY4MDEw
MDQpClsyNzU3OS4yNzE4NzZdIGdzKDEzNDA4KTogdW5hbGlnbmVkIGFjY2VzcyB0byAweDQxN2Qz
OWI0IGF0IGlwIDB4ZjU2OTcxYTMgKGlpciAweDJmODAxMDA0KQpbMjc1NzkuMzY2NDE4XSBncygx
MzQwOCk6IHVuYWxpZ25lZCBhY2Nlc3MgdG8gMHg0MTdkMzliNCBhdCBpcCAweGY1Njk3MWEzIChp
aXIgMHgyZjgwMTAwNCkKWzI3NTc5LjQ2NDA0Nl0gZ3MoMTM0MDgpOiB1bmFsaWduZWQgYWNjZXNz
IHRvIDB4NDE3ZDM5YjQgYXQgaXAgMHhmNTY5NzFhMyAoaWlyIDB4MmY4MDEwMDQpClsyODgxMC4x
NjAyNjVdIGhhbmRsZV91bmFsaWduZWQ6IDkgY2FsbGJhY2tzIHN1cHByZXNzZWQKWzI4ODEwLjE2
MDI5Nl0gcnVieSgxMjU4OCk6IHVuYWxpZ25lZCBhY2Nlc3MgdG8gMHhmOGE3OGI1NCBhdCBpcCAw
eGY4Nzg3NWFmIChpaXIgMHgyZjFjMDAwNSkKWzI4ODEwLjg4MDY4Ml0gcnVieSgxMjU4OSk6IHVu
YWxpZ25lZCBhY2Nlc3MgdG8gMHhmOGE3OGI1NCBhdCBpcCAweGY4Nzg3NWFmIChpaXIgMHgyZjFj
MDAwNSkKWzI4ODExLjQ3MzkxOF0gcnVieSgxMjU5MCk6IHVuYWxpZ25lZCBhY2Nlc3MgdG8gMHhm
OGE3OGI1NCBhdCBpcCAweGY4Nzg3NWFmIChpaXIgMHgyZjFjMDAwNSkKWzI4ODEyLjA2NTg0M10g
cnVieSgxMjU5MSk6IHVuYWxpZ25lZCBhY2Nlc3MgdG8gMHhmOGE3OGI1NCBhdCBpcCAweGY4Nzg3
NWFmIChpaXIgMHgyZjFjMDAwNSkKWzI4ODEyLjY1NDg5NF0gcnVieSgxMjU5Mik6IHVuYWxpZ25l
ZCBhY2Nlc3MgdG8gMHhmOGE3OGI1NCBhdCBpcCAweGY4Nzg3NWFmIChpaXIgMHgyZjFjMDAwNSkK
WzI4ODE1LjIzNTc4MV0gaGFuZGxlX3VuYWxpZ25lZDogNCBjYWxsYmFja3Mgc3VwcHJlc3NlZApb
Mjg4MTUuMjM1ODAyXSBydWJ5KDEyNjAxKTogdW5hbGlnbmVkIGFjY2VzcyB0byAweGY4YTc4YjU0
IGF0IGlwIDB4Zjg3ODc1YWYgKGlpciAweDJmMWMwMDA1KQpbMjg4MTUuODg0OTE3XSBydWJ5KDEy
NjAyKTogdW5hbGlnbmVkIGFjY2VzcyB0byAweGY4Njc4YjU0IGF0IGlwIDB4ZjgzODc1YWYgKGlp
ciAweDJmMWMwMDA1KQpbMzAwMDcuMTg2MzA5XSBtbS9wZ3RhYmxlLWdlbmVyaWMuYzo1NDogYmFk
IHBtZCA1MzliMDAzMC4KPENwdTM+IDc4MDAwYzYyMDNlMDAwMDAgIGEwZTAwOGMwMTEwMGIwMDkg
IENDX1BBVF9FTkNPREVEX0ZJRUxEX1dBUk5JTkcKPENwdTA+IGU4MDAwMDk4MDBlMDAwMDAgIDAw
MDAwMDAwNDEwOTNiZTQgIENDX0VSUl9DSEVDS19IUE1DCjxDcHUxPiBlODAwMDA5ODAxZTAwMDAw
ICAwMDAwMDAwMDQwNGNlMTMwICBDQ19FUlJfQ0hFQ0tfSFBNQwo8Q3B1Mz4gNzYwMDBjNjgwM2Uw
MDAwMCAgMDAwMDAwMDAwMDAwMDUyMCAgQ0NfUEFUX0RBVEFfRklFTERfV0FSTklORwo8Q3B1MD4g
MzcwMDBmNzMwMGUwMDAwMCAgODQwMDBbMzAwMDcuMTg4MzIxXSBCYWNrdHJhY2U6ClszMDAwNy4x
ODgzMjFdICBbPDAwMDAwMDAwNDA0ZWVmOWM+XSBwdGVfb2Zmc2V0X21hcF9ub2xvY2srMHhlOC8w
eDE1MApbMzAwMDcuMTg4MzIxXSAgWzwwMDAwMDAwMDQwNGQ2Nzg0Pl0gX19oYW5kbGVfbW1fZmF1
bHQrMHgxMzgvMHgxN2U4ClszMDAwNy4xODgzMjFdICBbPDAwMDAwMDAwNDA0ZDgwMDQ+XSBoYW5k
bGVfbW1fZmF1bHQrMHgxZDAvMHgzYjAKWzMwMDA3LjE4ODMyMV0gIFs8MDAwMDAwMDA0MDFlNGM5
OD5dIGRvX3BhZ2VfZmF1bHQrMHgxZTQvMHg4YTAKWzMwMDA3LjE4ODMyMV0gIFs8MDAwMDAwMDA0
MDFlOTVjMD5dIGhhbmRsZV9pbnRlcnJ1cHRpb24rMHgzMzAvMHhlNjAKWzMwMDA3LjE4ODMyMV0g
IFs8MDAwMDAwMDA0MDI5NWI0ND5dIHNjaGVkdWxlX3RhaWwrMHg3OC8weGU4ClszMDAwNy4xODgz
MjFdICBbPDAwMDAwMDAwNDAxZTBmNmM+XSBmaW5pc2hfY2hpbGRfcmV0dXJuKzB4MC8weDU4Clsz
MDAwNy4xODgzMjFdIApbMzAwMDcuMTg4MzIxXSAKWzMwMDA3LjE4ODMyMV0gS2VybmVsIEZhdWx0
OiBDb2RlPTI2IChEYXRhIG1lbW9yeSBhY2Nlc3MgcmlnaHRzIHRyYXApIGF0IGFkZHIgMDAwMDAw
MDA0MTAwMWYyNApbMzAwMDcuMTg4MzIxXSBDUFU6IDMgUElEOiAyODM0NCBDb21tOiBiYXNoIE5v
dCB0YWludGVkIDYuOC45LWdlbnRvby02NGJpdC1kZWJ1ZyAjMQpbMzAwMDcuMTg4MzIxXSBIYXJk
d2FyZSBuYW1lOiA5MDAwLzc4NS9DODAwMApbMzAwMDcuMTg4MzIxXSAKWzMwMDA3LjE4ODMyMV0g
ICAgICBZWnJ2V0VTVEhMTlhCQ1ZNY2JjYmNiY2JPR0ZSUVBESQpbMzAwMDcuMTg4MzIxXSBQU1c6
IDAwMDAxMDAwMDAwMDAxMTAwMDAwMDAwMDAwMDAxMTExIE5vdCB0YWludGVkClszMDAwNy4xODgz
MjFdIHIwMC0wMyAgMDAwMDAwMDAwODA2MDAwZiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwNDEw
NzRlYzggMDAwMDAwMDI3M2VhODhhMApbMzAwMDcuMTg4MzIxXSByMDQtMDcgIDAwMDAwMDAwNDEx
NjUxODAgMDAwMDAwMDA0MTAwMWYyNCAwMDAwMDAwMDU1NjU5OTkwIDAwMDAwMDAyNzNlYTgxMTAK
WzMwMDA3LjE4ODMyMV0gcjA4LTExICAwMDAwMDAwMGY5MmJjMGE4IDAwMDAwMDAwNTdkMjhjOTAg
MDAwMDAwMDAwMDAwMDAwMiAwMDAwMDAwMjczZWE4MTEwClszMDAwNy4xODgzMjFdIHIxMi0xNSAg
MDAwMDAwMDA1NTY1OTk5MCAwMDAwMDAwMDAwMDAwNDAwIDAwMDAwMDAwNDExODU5ODAgMDAwMDAw
MDAwMTAwMDAwMApbMzAwMDcuMTg4MzIxXSByMTYtMTkgIDAwMDAwMDAwNDExODU5ODAgMDAwMDAw
MDA0MTE4NTk4MCAwMDAwMDAwMDQxMTg1OTgwIDAwMDAwMDAwMDAwMDAwMDAKWzMwMDA3LjE4ODMy
MV0gcjIwLTIzICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwClszMDAwNy4xODgzMjFdIHIyNC0yNyAgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDA0MTE2NTE4MApb
MzAwMDcuMTg4MzIxXSByMjgtMzEgIDAwMDAwMDAwMDAwMDAwMmEgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMjczZWE4OTMwIDAwMDAwMDAwMDAwMDAwMDAKWzMwMDA3LjE4ODMyMV0gc3IwMC0wMyAg
MDAwMDAwMDAwMzM2YTAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMzM2YWMwMApbMzAwMDcuMTg4MzIxXSBzcjA0LTA3ICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwClszMDAwNy4xODgz
MjFdIApbMzAwMDcuMTg4MzIxXSBJQVNROiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAw
MDAgSUFPUTogMDAwMDAwMDA0MTA3NGVjOCAwMDAwMDAwMDQxMDc0ZWNjClszMDAwNy4xODgzMjFd
ICBJSVI6IDBjYTAxMjgwICAgIElTUjogMDAwMDAwMDAwMDAwMDAwMCAgSU9SOiAwMDAwMDAwMDQx
MDAxZjI0ClszMDAwNy4xODgzMjFdICBDUFU6ICAgICAgICAzICAgQ1IzMDogMDAwMDAwMDI3M2U0
OGJhMCBDUjMxOiBmZmZmZmZmZmZmZmZmZmZmClszMDAwNy4xODgzMjFdICBPUklHX1IyODogMDAw
MDAwMDAwMDAwMDAyYQpbMzAwMDcuMTg4MzIxXSAgSUFPUVswXTogcG1kX2NsZWFyX2JhZCsweDU0
LzB4YTgKWzMwMDA3LjE4ODMyMV0gIElBT1FbMV06IHBtZF9jbGVhcl9iYWQrMHg1OC8weGE4Clsz
MDAwNy4xODgzMjFdICBSUChyMik6IHBtZF9jbGVhcl9iYWQrMHg1NC8weGE4ClszMDAwNy4xODgz
MjFdIEJhY2t0cmFjZToKWzMwMDA3LjE4ODMyMV0gIFs8MDAwMDAwMDA0MDRlZWY5Yz5dIHB0ZV9v
ZmZzZXRfbWFwX25vbG9jaysweGU4LzB4MTUwClszMDAwNy4xODgzMjFdICBbPDAwMDAwMDAwNDA0
ZDY3ODQ+XSBfX2hhbmRsZV9tbV9mYXVsdCsweDEzOC8weDE3ZTgKWzMwMDA3LjE4ODMyMV0gIFs8
MDAwMDAwMDA0MDRkODAwND5dIGhhbmRsZV9tbV9mYXVsdCsweDFkMC8weDNiMApbMzAwMDcuMTg4
MzIxXSAgWzwwMDAwMDAwMDQwMWU0Yzk4Pl0gZG9fcGFnZV9mYXVsdCsweDFlNC8weDhhMApbMzAw
MDcuMTg4MzIxXSAgWzwwMDAwMDAwMDQwMWU5NWMwPl0gaGFuZGxlX2ludGVycnVwdGlvbisweDMz
MC8weGU2MApbMzAwMDcuMTg4MzIxXSAgWzwwMDAwMDAwMDQwMjk1YjQ0Pl0gc2NoZWR1bGVfdGFp
bCsweDc4LzB4ZTgKWzMwMDA3LjE4ODMyMV0gIFs8MDAwMDAwMDA0MDFlMGY2Yz5dIGZpbmlzaF9j
aGlsZF9yZXR1cm4rMHgwLzB4NTgKWzMwMDA3LjE4ODMyMV0gCjAwMDgwMDAwMCAgQ0NfRVJSX0NQ
VV9DSEVDS19TVU1NQVJZCjxDcHUxPiAzNzAwMGY3MzAxZTAwMDAwICA4NDAwMDAwMDAwODAwMDAw
ICBDQ19FUlJfQ1BVX0NIRUNLX1NVTU1BUlkKPENwdTM+IDAzMDAxMDkxMDNlMDAwMDAgIDAwMDAw
MDAwMDAwMDAwMDAgIENDX1BST0NTX0VOVFJZX09VVApbMzAwMDcuMTg4MzIxXSBLZXJuZWwgcGFu
aWMgLSBub3Qgc3luY2luZzogS2VybmVsIEZhdWx0CjxDcHUwPiBmNjAwMTA1ZTAwZTAwMDAwICBm
ZmZmZmZmMGYwYzAwMDAwICBDQ19NQ19IUE1DX01PTkFSQ0hfU0VMRUNURUQKPENwdTE+IDU2MDAx
MDliMDFlMDAwMDAgIDAwMDAwMDAwMDAxZGUwMjQgIENDX01DX0JSX1RPX09TX0hQTUMKPENwdTI+
IDAwMDAwMDAwYTJhYTAwMDAgIDAwMDAwMDAwMDAwMDAwMDAgIAo8Q3B1Mz4gZTAwMDAwNjYwM2Uw
MDAwMCAgMDkwMDAwMDAwMTc0YjZmOCAgQ0NfQk9PVF9VTkVYUEVDVEVEX0lOVEVSUlVQVAo8Q3B1
Mz4gMDMwMDEwZDUwM2UwMDAwMCAgMDAwMDAwMDAwMDAwMDAwMCAgQ0NfQ1BVX1NUT1AK
--=_05114d2209f196d571440241=f4f5a479-cd77-5f12-aa2d-cb7c6faa3b04_=--


