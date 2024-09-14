Return-Path: <linux-parisc+bounces-2363-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DFE97923A
	for <lists+linux-parisc@lfdr.de>; Sat, 14 Sep 2024 19:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C54F41C214A9
	for <lists+linux-parisc@lfdr.de>; Sat, 14 Sep 2024 17:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F206208DA;
	Sat, 14 Sep 2024 17:00:39 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from sd88.btc-net.bg (unknown [212.39.90.88])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 46C0317BCA
	for <linux-parisc@vger.kernel.org>; Sat, 14 Sep 2024 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.39.90.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726333239; cv=none; b=maPrZ3xw1e4dKZuyeSVkvzWEKbcC0S6Vx54+H4exO332D/IDPjZxoSC01LN9LJM8KC0wYeiAxBrYy7YLo1HAgNGjYh5GLiH/C0Y2i9HQ5b/1dPzFR7yPMKnsP2qJfRbJo1r4EV9xU21csC8vi6gQetmw3/gr8wcRXAP1K0jJHLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726333239; c=relaxed/simple;
	bh=hjYF/RRCM0rIec41jHTj+l9ZHRalo1yl9bGFgQ4BsTg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=BaVTGQkapoXC2PJ/Hj15Mxn3ssKwipflqC3LgPjOvLWVO+wVBozwqBlNbkX/FCOYSKdA7IBMKfYUkY81BIRz/RoTssi6fCrhGaWFUqr4poynBTooVQNv4FYDOyK6mDTPl+8rQ8LkdPiJVZpLyaajJMghU6hR9ejYy1ZujQA6fLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mbox.contact.bg; spf=pass smtp.mailfrom=mbox.contact.bg; arc=none smtp.client-ip=212.39.90.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mbox.contact.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mbox.contact.bg
Received: (qmail 14387 invoked by uid 0); 14 Sep 2024 17:00:33 -0000
Received: from unknown (HELO ?192.168.0.103?) (lucho@mbox.contact.bg@79.100.55.239)
  by 212.39.90.88 with ESMTPA; 14 Sep 2024 17:00:33 -0000
From: =?utf-8?B?0JvRitGH0LXQt9Cw0YAg0JPQtdC+0YDQs9C40LXQsg==?= <lucho@mbox.contact.bg>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_8985D264-1240-41C3-B1D1-FA5B5F3C1805"
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Added preliminary hppa64 support to dietlibc (patch attached)
Message-Id: <E6330A53-C95A-404B-A765-750CAAAB6EEB@mbox.contact.bg>
Date: Sat, 14 Sep 2024 20:00:33 +0300
To: linux-parisc@vger.kernel.org
X-Mailer: Apple Mail (2.3608.120.23.2.7)


--Apple-Mail=_8985D264-1240-41C3-B1D1-FA5B5F3C1805
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello from Bulgaria!

Please find attached my patch for adding preliminary 64-bit PA-RISC =
support to dietlibc_0.34~cvs20160606-18, along with your patch which I =
applied first. It took me almost a month to do it. While it=E2=80=99s =
still in pre-alpha stage (and there=E2=80=99s no guarantee that it =
won=E2=80=99t stay so), it allowed me to build and test the hppa64 port =
of my assembly language examples, whose I/O is written entirely in C. It =
works with kernel version up to 4.19. Unfortunately, the later kernels =
no longer support 64-bit system calls. Even 4.19.66 from the Gentoo =
installation disc doesn=E2=80=99t. And even the kernels that do support =
64-bit system calls don=E2=80=99t support them all. For example, =
malloc() doesn=E2=80=99t work probably because mmap() doesn=E2=80=99t. =
As a consequence, buffered =E2=80=98stdio' support doesn=E2=80=99t work. =
Fortunately, unbuffered does. Besides, argc and argv aren=E2=80=99t =
passed in r25 and r24 to _start() as in the 32-bit kernels. And so on, =
and so forth. Despite that, the port allows some small C programs to be =
built. The compiler generates .PROC/.PROCEND directives which cause the =
linker to build dynamic executables, although static ones are small =
enough with dietlibc. But there is a blessing in disguise: the small =
.dynamic section added by the linker can now be used as a preliminary =
stack in start.S, since beside loading the executable in memory and =
passing control to it, the kernel doesn=E2=80=99t anything else. No =
further memory is allocated for it. Even the initial stack pointer value =
is invalid. So the startup code must take care of all that its 32-bit =
counterpart doesn=E2=80=99t have to. But it=E2=80=99s not overly complex =
to compensate this =E2=80=98Spartan' kernel behaviour in start.S, which =
I=E2=80=99ve done, tested, and it works.

Here are some explanations of the patch, file by file and hunk by hunk:

1. dietfieatures.h: Conditionally commented out some features the kernel =
doesn=E2=80=99t support like TLS and everything else that is not =
mandatory to minimise startup code size.
2. dirent.h: Fixed a bug where 'make hppa DEBUG=3D1' stops with an =
error.
3. endian.h: Defined WORDSIZE for all architectures where __LP64__ is =
defined, including hppa64.
4. threads.h: Disabled the __thread keyword which the hppa64 compiler =
doesn=E2=80=99t support.
5. unistd.h: __const__ overrides __pure__ so removed the latter.
6. qsort.c: Added -O2 optimisation pragma because qsort() must be as =
fast as possible (-O3 increases code size way too much).
7. reallocarray.c: __uint128 was used which isn=E2=80=99t supported by =
old versions of libgcc before GCC 11, so replaced the whole file with =
the original OpenBSD implementation.
8. syscall.S: Added 3 more arguments in registers as per PA-RISC 2.0W =
spec; added a NOP after the CMPB instruction which turned out to be =
necessary for 64 bits.
9. Makefile: Replaced the non-working =E2=80=98u' argument of =E2=80=98ar'=
 with =E2=80=98D'; disabled the dynamic linker for the really static =
64-bit executables and set the entry point; let the preprocessor =
undefine WANT_TLS.
10. argv_env.c: Added a function that builds the argv and envp arrays =
which the 64-bit kernel doesn=E2=80=99t do, at least when executing =
64-bit executables from 32-bit ones.
11. __longjmp.S: Added a 64-bit implementation of the register saving =
code (it compiles OK but isn't tested!).
12. Makefile.add: Added the new argv_env.o file.
13. setjmp.S: Added a 64-bit implementation of the register restoring =
code (compiles OK but isn't tested!).
14. start.S: Added 64-bit support (see the comments in the code itself).
15. strcasecmp.S, strcmp.S, strlen.S, strncasecmp.S, strncmp.S, =
strncpy.S, strpbrk.S, strstr.S, __testandset.S, unified.S: Added PA-RISC =
2.0 .level directive for the 64-bit code.
19. strrchr.S and many others: All BV return instructions replaced with =
BVE for 64 bits because that=E2=80=99s what the 64-bit compiler =
generates; I don=E2=80=99t know whether this is really necessary.

I don=E2=80=99t use the diet.c utility so it may not work.
I hope the patch proves useful for others, too.

Best regards from Varna!
=D0=9B=D1=8A=D1=87=D0=B5=D0=B7=D0=B0=D1=80
--=20
https://lucho.ddns.net


--Apple-Mail=_8985D264-1240-41C3-B1D1-FA5B5F3C1805
Content-Disposition: attachment;
	filename=patches.tar.xz
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="patches.tar.xz"
Content-Transfer-Encoding: base64

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
Wg==
--Apple-Mail=_8985D264-1240-41C3-B1D1-FA5B5F3C1805--

