Return-Path: <linux-parisc+bounces-2171-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E134966CED
	for <lists+linux-parisc@lfdr.de>; Sat, 31 Aug 2024 01:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B67741C215E7
	for <lists+linux-parisc@lfdr.de>; Fri, 30 Aug 2024 23:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BF817D344;
	Fri, 30 Aug 2024 23:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="MJ/qok/A"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B0175D5E
	for <linux-parisc@vger.kernel.org>; Fri, 30 Aug 2024 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725060844; cv=none; b=s5fzMdxDVB+xZb2f/r1hi99KJZtptPwIfJYTpb/ispGJc2ZWZUh5M9ytCQ9NXfp+i2OH2SWR4/WoUgIOWYtnlvNftX5cnljatHxxRvMjG6QdmQnpdIWwe9gIa1r27ujWdez87x7Jt7hXhbpYSVB4Rm0oLshI7iu2TInhZ9lupKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725060844; c=relaxed/simple;
	bh=6OnEGN1BHGd6/Bq+GxdqvNj0ObSkIZUl2wzSaLQM5zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b85JS4900BDTAFWjbmrLcWKZ3K75gz5ucebj49FI+2PZrY3TKCYqR8jqj908ZVEyEMjSOd+iWEWawtKQrxdiduuGJfJjjhQQn8rn2znxF9nXF9hKsD3lokhFWG9931x74RomSrLdwLyixM7hbcakwRlT3dZ2RhUrY/VVBIR4Izw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=MJ/qok/A; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1725060796; x=1725665596; i=deller@gmx.de;
	bh=/GqFIkkvgmtYNb5XWuZYufni8ULvNczzU4Y7IxcgECM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MJ/qok/Ar+T96rDx6AGimbvAcZpiQPJTaEvYjuKw6lq0Td3hRhRWk+7UPKpkEred
	 B0JITFVfhOSQGiPvKPH13ctAFdmEPAau8UDBQ7MpsWJYLhPgY0/Ck9yvJ9wyyRdRT
	 nbGe4q4arPoABxBI/e0RBLnWuT+OMT/nlRxtCNGM9H/UXjRtQeKWe4z1GM7hKv0Qv
	 h4NO8U5M365kecZUATWb9u1QeI5zGLjJhJXXbK2tXco+3+o3bMDrwRNme+JN5YqGV
	 Txl1Vqnq/ThLU6BEUbkb8V7AZJtcU1rGOfv5rNONsv/VTvgSuIRNRgWS+TROZybDt
	 WyUgd36C64Dq5u3iTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.126]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wys-1sgrBw2AfE-003X7B; Sat, 31
 Aug 2024 01:33:16 +0200
Message-ID: <eeb2389b-7ff9-4ee5-b6c9-73cc716c5a81@gmx.de>
Date: Sat, 31 Aug 2024 01:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Crash on booth with 6.10
To: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
 Linux Parisc <linux-parisc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 matoro <matoro_mailinglist_kernel@matoro.tk>, Sam James <sam@gentoo.org>
References: <096cad5aada514255cd7b0b9dbafc768@matoro.tk>
 <1725041917@msgid.manchmal.in-ulm.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <1725041917@msgid.manchmal.in-ulm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0SzTdKerfQrks9gKehWgrj9IHOVzhQIu3n6q4u87QmvSE7hH0HP
 xDCFLSRnkwm0XVTTInH2Y8PeO0VvK7T++UVV2lnS7qADKvl5QRj0u4PFVaDipgS9s+D55Ks
 je0SVnZi5ZFnoU397XRs5nBYWDvJa0SQL8h7QVPgth0hzBUpxjuHHiNR+MFdXLH6Vl6dGNq
 pZgYa6oL05L7Ct+snyDGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jQsI3BNhqeA=;Bli0Aj6HACEujpV4wdmRIlF0lKA
 ckqfFh4pzMsYcwA97ZOAai+Uv40bJbu+fmrczcGQ4CdmAvoUh7welVHvp6pufywWV5Yick/Qy
 kRX1AosVdABj30p/g0H+7iNdta0UrInhYM38v2yLQg4EASFXNx0zEWyBLMAOZPpSkoMgIZmlr
 FVz1O6TweRRTf/6UrlyfrM+Bc2Ue4gUFkakIgyGtfJKumF4ayKpzSPaj5qPmr/qGPbWnaP7GF
 iKba1kAi9Plht8G8R3AlRix0vH6GRRP1WFLFwYP8YOkWiIPhRciFfRK1YiEopsQMeioP8Nky+
 gUsPXvtw8EJFKNehQdpKPU/0apPDNie2FxMm46c7UAc4UoyVN5fDlwSkU82BnIL0U/MPekS27
 AQm+mh99Hfg2LioAvB1+UmyhtQI4CeyCA9uNzb7KqjfiZQ1O2HOQPEP6BLY/ASH9Pddd741P1
 AvvjaHjd6NoBsw8NXJCB5bAiOGp/q8YISwh0B3ROL1I5Q4vFZo5N2uNYG/UW4DVy2oTAwrOSQ
 j5Os/c/xDHW9e/bRvtHE8sL5vUhDBu01pqehS/rnVL/+HaMNAUupcG8Q1T2rXgNHLtSdcvua3
 Sqh3b/9kItPmTEsr+O2Pov3lDgBWqO1oxQR6mGg6z/L6+JMKpQ+7gHqsTGgVMA96Fsf+OgYvJ
 NmLkkKot/QNJXp6v4laEygi7NeK1gP2lFOostoe3ewAnFROuO4CJRvRJPtpJn+2JqVQ2nPVSh
 0UWUAE3qgJ4VIZKp4C2WDN9RKTei/6lTPrNOr+BAy/YQ17A17rMMjirAiikAnyj3a9wxUfjcm
 ga4VupGRUXhXNWj/uEWlzy1Q==

On 8/30/24 20:18, Christoph Biedl wrote:
> matoro wrote...
>
>> Hi all, just bumped to the newest mainline starting with 6.10.2 and
>> immediately ran into a crash on boot.  Fully reproducible, reverting ba=
ck to
>> last known good (6.9.8) resolves the issue.  Any clue what's going on h=
ere?
>> I can provide full boot logs, start bisecting, etc if needed...
>
> Is this supposed to have been fixed in the meantime? Using 6.10.7 from y=
esterday,
> I getting a similar crash:
>
> (...)
> [    9.653898] scsi 1:0:5:0: Power-on or device reset occurred
> [   12.337213] sd 1:0:5:0: Attached scsi generic sg0 type 0
> [   12.343544] sd 1:0:5:0: [sda] 17773524 512-byte logical blocks: (9.10=
 GB/8.47 GiB)
> [   12.352957] sd 1:0:5:0: [sda] Write Protect is off
> [   12.359151] sd 1:0:5:0: [sda] Write cache: enabled, read cache: enabl=
ed, supports DPO and FUA
> [   12.379035]  sda: sda1 sda2 sda3
> [   12.383562] sd 1:0:5:0: [sda] Attached SCSI disk
> [   12.397737] Freeing unused kernel image (initmem) memory: 3072K
> [   12.406839] Backtrace:
> [   12.409235]  [<1116535c>] kernel_init+0x80/0x1d4
> [   12.413911]  [<1040201c>] ret_from_kernel_thread+0x1c/0x24
> [   12.419448]
> [   12.420970]
> [   12.422487] Kernel Fault: Code=3D26 (Data memory access rights trap) =
at addr 113c5f90
> [   12.430172] CPU: 0 PID: 1 Comm: swapper Not tainted 6.10.7 #1
> [   12.435958] Hardware name: 9000/785/C3600
> [   12.439997]
> [   12.441518]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [   12.446256] PSW: 00000000000001000000000000001111 Not tainted
> [   12.452033] r00-03  0004000f 113c9744 105994ac 128942c0
> [   12.457295] r04-07  119bda70 1180d4e0 1180d4e0 11822a90
> [   12.462555] r08-11  11822a70 112d1000 1180d7ec 00000017
> [   12.467817] r12-15  00000000 11a1aa70 113b196c 112d1000
> [   12.473077] r16-19  112d1000 ffffffff f0000174 113c723c
> [   12.478338] r20-23  00000002 113c9744 113c5a70 000000d0
> [   12.483597] r24-27  12892d00 00000000 119bde74 113c5a70
> [   12.488859] r28-31  113c5f8c 01a19700 12894300 00000004
> [   12.494158] sr00-03  00000000 00000000 00000000 00000000
> [   12.499502] sr04-07  00000000 00000000 00000000 00000000
> [   12.504850]
> [   12.506373] IASQ: 00000000 00000000 IAOQ: 10599508 1059950c
> [   12.511980]  IIR: 0f941288    ISR: 00000000  IOR: 113c5f90
> [   12.517495]  CPU:        0   CR30: 12892d00 CR31: 11111111
> [   12.523016]  ORIG_R28: 55555555
> [   12.526185]  IAOQ[0]: jump_label_init_ro+0x98/0xe4
> [   12.531014]  IAOQ[1]: jump_label_init_ro+0x9c/0xe4
> [   12.535872]  RP(r2): jump_label_init_ro+0x3c/0xe4
> [   12.540610] Backtrace:
> [   12.543000]  [<1116535c>] kernel_init+0x80/0x1d4
> [   12.547654]  [<1040201c>] ret_from_kernel_thread+0x1c/0x24
> [   12.553319]
> [   12.557345] Kernel panic - not syncing: Kernel Fault
>
> .config is attached, I can dig more in the next days.

I can reproduce.

The crash happens, because in kernel/jump_label.c: jump_label_init_ro(),
this static key is accessed but gives a segfault, because this area is alr=
eady read-only:
mm/usercopy.c:static DEFINE_STATIC_KEY_FALSE_RO(bypass_usercopy_checks);

This is the only static key in this parisc kernel which is marked with __r=
o_after_init.
The area is marked read-only in free_initmem() [in arch/parisc/mm/init.c],
which happens before mark_readonly().

So, the issue is basically triggered by this commit:

commit 91a1d97ef482c1e4c9d4c1c656a53b0f6b16d0ed
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Wed Mar 13 19:01:03 2024 +0100
     jump_label,module: Don't alloc static_key_mod for __ro_after_init key=
s

due to this hunk:

diff --git a/init/main.c b/init/main.c
index 2ca52474d0c3..6c3f251d6ef8 100644
=2D-- a/init/main.c
+++ b/init/main.c
@@ -1408,6 +1408,7 @@ static void mark_readonly(void)
                  * insecure pages which are W+X.
                  */
                 flush_module_init_free_work();
+               jump_label_init_ro();
                 mark_rodata_ro();
                 debug_checkwx();
                 rodata_test();

I'm still unsure about the best way to fix it.
Swapping calls to free_initmem() and mark_readonly() fixes it for me:

diff --git a/init/main.c b/init/main.c
index 206acdde51f5..1f82583fd21d 100644
=2D-- a/init/main.c
+++ b/init/main.c
@@ -1473,8 +1473,8 @@ static int __ref kernel_init(void *unused)
         ftrace_free_init_mem();
         kgdb_free_init_mem();
         exit_boot_config();
-       free_initmem();
         mark_readonly();
+       free_initmem();

         /*
          * Kernel mappings are now finalized - update the userspace page-=
table


Opinions?

Helge

