Return-Path: <linux-parisc+bounces-1437-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BF78CF479
	for <lists+linux-parisc@lfdr.de>; Sun, 26 May 2024 16:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E4C91C20834
	for <lists+linux-parisc@lfdr.de>; Sun, 26 May 2024 14:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C7915E97;
	Sun, 26 May 2024 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="vsPqOk9S"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mxc.seznam.cz (mxc.seznam.cz [77.75.79.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C6315E90
	for <linux-parisc@vger.kernel.org>; Sun, 26 May 2024 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.79.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716732487; cv=none; b=DDrHSzKbopq3Rg/k7AweqTeeoAjZFsSSx//bbh3dk/JttICzDpaHMJhIH/tRkq4aOz9D1D9oCmRzNAc2OInlUy1duyFCvl9VL/bzj6jGbKOLBCOoKqDsCrz79ggO9CasTz95rArCo09dvBFkclvAgfzLCwvdQSnMREpUWNZBnP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716732487; c=relaxed/simple;
	bh=fOoYxyGsO85F5/JtKMi+6hECxgOJg9w7Xbc2zHh5XZY=;
	h=From:To:Cc:Subject:Date:Message-Id:References:In-Reply-To:
	 Mime-Version:Content-Type; b=Xnc5bqLtQ2CMpPgJLQ0qVXMClP4dD0SzKu4qDmCP2s/Y/bB3XNrynbi5+Iza5mi+yCNTzlwdWqjchbWmJ8/91rt8EG4KQ8T/mw119L9cH0WSQYfNplq4Ivf4JGdakrnwhwMNSX0x9XBP4H09ZgGlzmA7923jJr5HC5RqQrQRtsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=vsPqOk9S; arc=none smtp.client-ip=77.75.79.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Received: from email.seznam.cz
	by smtpc-mxc-7c86ff5c95-2l2bn
	(smtpc-mxc-7c86ff5c95-2l2bn [2a02:598:128:8a00::1000:9c9])
	id 1d668fa1d2a8d01d1d39fa68;
	Sun, 26 May 2024 16:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
	s=szn20221014; t=1716732481;
	bh=taU6qxV2SfI1WMRN1xKuAHuuvpx6oDYjx9AQv1U/rfg=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:References:
	 In-Reply-To:Mime-Version:X-Mailer:Content-Type:
	 Content-Transfer-Encoding;
	b=vsPqOk9SUC0LbOAo3p4ZTo7iyoYJG6DNx4DtRKHnlSiPpni0WRsInjfK7gxK69xZU
	 LOgmZvuP/4LWSUOsdJR9iW5OWMLhFx/oSnHGtWAtz7hMk/w8FTC+OLcLMVr/8AW+KY
	 3J36kPx3SEHbFYUZd2+zkQB7/qb9BSUNgopoyh2ZVwWEUhV19xBeAm9tTmo1H/vsIO
	 Ka907pItfMeodTBlP46bYX2itTxwi/8m1Xj6pDFBkY0edITwXtX76CWM0KEgYQ747v
	 Q/A4CfdtCoyK33u+tT+4Dv3NFluC3OU+IBHRsx/6PzyshlId0mVm5t5zrULQXfOCfS
	 ZzEGBdwujeXeQ==
Received: from snat-29.cgn.sat-an.net (snat-29.cgn.sat-an.net [176.222.226.29])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Sun, 26 May 2024 16:07:31 +0200 (CEST)
From: <Vidra.Jonas@seznam.cz>
To: <linux-parisc@vger.kernel.org>
Cc: "Helge Deller" <deller@gmx.de>,
	"John David Anglin" <dave@parisc-linux.org>
Subject: =?utf-8?q?Re=3A_=5BPATCH_v2=5D_parisc=3A_Try_to_fix_random_segmen?=
	=?utf-8?q?tation_faults_in_package_builds?=
Date: Sun, 26 May 2024 16:07:30 +0200 (CEST)
Message-Id: <3tL.NdIV.4Ckcgq8bbuI.1cKq8Y@seznam.cz>
References: <Zkeo1UxDTcJtBZTl@atlas>
In-Reply-To: <Zkeo1UxDTcJtBZTl@atlas>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (szn-mime-2.1.48)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

---------- Original e-mail ----------
From: John David Anglin
To: linux-parisc@vger.kernel.org
CC: Helge Deller
Date: 17. 5. 2024 21:05:19
Subject: [PATCH v2] parisc: Try to fix random segmentation faults in packa=
ge builds

> The majority of random segmentation faults that I have looked at
> appear to be memory corruption in memory allocated using mmap and
> malloc.
>
> [...]
>
> This made it clear that we needed to implement all the required
> flush operations using tmpalias routines. This includes flushes
> for user and kernel pages.
>
> This change is the result of that conversion. As far as I can
> tell, it fixes the random segmentation faults on c8000.
>
> Base for patch is 6.8.9.

Hello,

I applied the patch to a 6.8.9 kernel with Gentoo patches on my C8000
and ran it under heavy load over the weekend. The system has been much
more stable than in the past (yay!), but I've still experienced one
userspace program crash and a kernel panic.

The crash was a memory corruption while compiling Boost (version
boost-1.84.0-r3 from Gentoo). It might be caused by a kernel memory
handling bug, but it's hard to say. Upon recompiling, the problem didn't=

manifest again. There was nothing in the syslog and the output is not
very informative:

```
gcc.compile.c++ bin.v2/libs/wave/build/gcc-13.2/gentoorelease/pch-off/thre=
ading-multi/visibility-hidden/instantiate_re2c_lexer.o

    "hppa2.0-unknown-linux-gnu-g++"   -fvisibility-inlines-hidden  -D_FILE=
_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -O2 -pipe -mar=
ch=3D2.0 -mschedule=3D8000 -ggdb -std=3Dc++17 -fPIC -pthread -finline-func=
tions -Wno-inline -Wall -fvisibility=3Dhidden  -DBOOST_ALL_DYN_LINK=3D1 -D=
BOOST_ALL_NO_LIB=3D1 -DBOOST_COBALT_USE_STD_PMR=3D1 -DNDEBUG   -I"."  -c -=
o "bin.v2/libs/wave/build/gcc-13.2/gentoorelease/pch-off/threading-multi/v=
isibility-hidden/instantiate_re2c_lexer.o" "libs/wave/src/instantiate_re2c=
_lexer.cpp"

{standard input}: Assembler messages:
{standard input}:401704: Error: unknown pseudo-op: `.ule'
{standard input}:401704: Error: junk at end of line, first unrecognized ch=
aracter valued 0x2
{standard input}:401704: Error: junk at end of line, first unrecognized ch=
aracter valued 0x1
{standard input}:401704: Error: junk at end of line, first unrecognized ch=
aracter valued 0x1
{standard input}:401704: Error: Unknown opcode: `ag=EF=BF=BD'
{standard input}:401704: Error: junk at end of line, first unrecognized ch=
aracter valued 0x3
{standard input}:401704: Error: Unknown opcode: `u=C6=80'
{standard input}:401704: Error: junk at end of line, first unrecognized ch=
aracter valued 0x1
{standard input}:401704: Error: junk at end of line, first unrecognized ch=
aracter valued 0x10
{standard input}:401704: Error: junk at end of line, first unrecognized ch=
aracter valued 0x10
{standard input}:401704: Error: Unknown opcode: `a
                                                  =EF=BF=BD=EF=BF=BD'
{standard input}:401704: Error: Unknown opcode: `x15'
{standard input}:796319: Warning: end of file in string; '"' inserted
{standard input}:797107: Warning: missing closing '"'
{standard input}:797107: Error: Unknown opcode: `
'
gcc.compile.c++ bin.v2/libs/wave/build/gcc-13.2/gentoorelease/pch-off/thre=
ading-multi/visibility-hidden/instantiate_re2c_lexer_str.o

    "hppa2.0-unknown-linux-gnu-g++"   -fvisibility-inlines-hidden  -D_FILE=
_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -O2 -pipe -mar=
ch=3D2.0 -mschedule=3D8000 -ggdb -std=3Dc++17 -fPIC -pthread -finline-func=
tions -Wno-inline -Wall -fvisibility=3Dhidden  -DBOOST_ALL_DYN_LINK=3D1 -D=
BOOST_ALL_NO_LIB=3D1 -DBOOST_COBALT_USE_STD_PMR=3D1 -DNDEBUG   -I"."  -c -=
o "bin.v2/libs/wave/build/gcc-13.2/gentoorelease/pch-off/threading-multi/v=
isibility-hidden/instantiate_re2c_lexer_str.o" "libs/wave/src/instantiate_=
re2c_lexer_str.cpp"

...skipped <pbin.v2/libs/wave/build/gcc-13.2/gentoorelease/pch-off/threadi=
ng-multi/visibility-hidden>libboost_wave.so.1.84.0 for lack of <pbin.v2/li=
bs/wave/build/gcc-13.2/gentoorelease/pch-off/threading-multi/visibility-hi=
dden>instantiate_re2c_lexer.o...
...skipped <p/var/tmp/portage/dev-libs/boost-1.84.0-r3/work/boost_1_84_0-.=
hppa/stage/lib>libboost_wave.so.1.84.0 for lack of <pbin.v2/libs/wave/buil=
d/gcc-13.2/gentoorelease/pch-off/threading-multi/visibility-hidden>libboos=
t_wave.so.1.84.0...
...failed updating 1 target...
```


The kernel panic happened after a few days of uptime. I got the
following output on the serial console, after which the machine
rebooted immediately and the usual boot output followed.

```
[163003.648077] Backtrace:
[163003.648077]  [<00000000408d7740>] btrfs_add_delayed_data_ref+0x1d4/0x5=
98
[163003.648077]  [<00000000407e61cc>] btrfs_alloc_reserved_file_extent+0x1=
58/0x210
[163003.648077]  [<0000000040819638>] insert_reserved_file_extent+0x77c/0x=
840
[163003.648077]  [<0000000040825220>] btrfs_finish_one_ordered+0xa54/0x131=
0
[163003.648077]  [<0000000040825b0c>] btrfs_finish_ordered_io+0x30/0x70
[163003.648077]  [<000000004085cadc>] finish_ordered_fn+0x38/0x78
[163003.648077]  [<0000000040891c9c>] btrfs_work_helper+0x208/0x790
[163003.648077]  [<000000004025eb74>] process_one_work+0x228/0x540
[163003.648077]  [<000000004025f1ac>] worker_thread+0x320/0x760
[163003.648077]  [<0000000040273020>] kthread+0x254/0x280
[163003.648077]  [<00000000401df020>] ret_from_kernel_thread+0x20/0x28
[163003.648077] 
[163003.648077] 
[163003.648077] Page fault: no context: Code=3D15 (Data TLB miss fault) at=
 addr 0000003b1047cdee
[163003.648077] CPU: 3 PID: 9804 Comm: kworker/u8:4 Not tainted 6.8.9-gent=
oo-64bit-debug #2
[163003.648077] Hardware name: 9000/785/C8000
[163003.648077] Workqueue: btrfs-endio-write btrfs_work_helper
[163003.648077] 
[163003.648077]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[163003.648077] PSW: 00001000000001000000000000001111 Not tainted
[163003.648077] r00-03  000000000804000f 0000000041235180 0000000040520374=
 00000003202e8d50
[163003.648077] r04-07  0000000041165180 0000000055076f20 0000000000000001=
 00000000408d7740
[163003.648077] r08-11  0000000000000c40 00000000000000b0 0000000000000000=
 00000000417b72a8
[163003.648077] r12-15  0000000000455a10 00000000556f2000 0000000000000001=
 00000002a326d620
[163003.648077] r16-19  00000003202e8b68 0000000000000000 0000000000000000=
 82140f831247cc96
[163003.648077] r20-23  00000000000d486a 0000000057ec22e0 00000000000d486b=
 000000004147c0d0
[163003.648077] r24-27  eecd47103bccf4da daf4cc3b1047cdee daf4cc3b1047cd96=
 0000000041165180
[163003.648077] r28-31  0000000000000058 00cd001000cc00da 00000003202e8e30=
 250b33c4efb8326a
[163003.648077] sr00-03  0000000007067400 0000000000000000 000000000000000=
0 0000000007067400
[163003.648077] sr04-07  0000000000000000 0000000000000000 000000000000000=
0 0000000000000000
[163003.648077] 
[163003.648077] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004052=
02d8 00000000405202dc
[163003.648077]  IIR: 0f9a00dc    ISR: 000000001af4cc00  IOR: 0000003b1047=
cdee
[163003.648077]  CPU:        3   CR30: 0000000057ec22e0 CR31: fffffffffffe=
ffff
[163003.648077]  ORIG_R28: 00000000000009de
[163003.648077]  IAOQ[0]: kmem_cache_alloc+0x10c/0x520
[163003.648077]  IAOQ[1]: kmem_cache_alloc+0x110/0x520
[163003.648077]  RP(r2): kmem_cache_alloc+0x1a8/0x520
[163003.648077] Backtrace:
[163003.648077]  [<00000000408d7740>] btrfs_add_delayed_data_ref+0x1d4/0x5=
98
[163003.648077]  [<00000000407e61cc>] btrfs_alloc_reserved_file_extent+0x1=
58/0x210
[163003.648077]  [<0000000040819638>] insert_reserved_file_extent+0x77c/0x=
840
[163003.648077]  [<0000000040825220>] btrfs_finish_one_ordered+0xa54/0x131=
0
[163003.648077]  [<0000000040825b0c>] btrfs_finish_ordered_io+0x30/0x70
[163003.648077]  [<000000004085cadc>] finish_ordered_fn+0x38/0x78
[163003.648077]  [<0000000040891c9c>] btrfs_work_helper+0x208/0x790
[163003.648077]  [<000000004025eb74>] process_one_work+0x228/0x540
[163003.648077]  [<000000004025f1ac>] worker_thread+0x320/0x760
[163003.648077]  [<0000000040273020>] kthread+0x254/0x280
[163003.648077]  [<00000000401df020>] ret_from_kernel_thread+0x20/0x28
[163003.648077] 
<Cpu3> 0300109103e00000  0000000000000000  CC_PROCS_ENTRY_OUT
[163003.648077] Kernel panic - not syncing: Page fault: no context
<Cpu3> 160012c803e00000  0300000000000000  CC_MPS_SLAVE_DISPATCHER_ENT
<Cpu3> 0300096303e00000  0000000008000008  CC_BOOT_MEM_CPU_RENDEZVOUS
<Cpu3> 160012d303e00000  0300000000000000  CC_MPS_SLAVE_SLEEPING
<Cpu3> 080012d403e00000  000000f0f0d07dc0  CC_MPS_SLAVE_SLEEP_ADDR
<Cpu2> 3400006302e00000  0000000000000000  CC_BOOT_START
```

