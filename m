Return-Path: <linux-parisc+bounces-1528-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC28D902982
	for <lists+linux-parisc@lfdr.de>; Mon, 10 Jun 2024 21:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36CECB2293B
	for <lists+linux-parisc@lfdr.de>; Mon, 10 Jun 2024 19:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772C4149C43;
	Mon, 10 Jun 2024 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b="PlYiQYLb"
X-Original-To: linux-parisc@vger.kernel.org
Received: from matoro.tk (matoro.tk [104.188.251.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF911BC39
	for <linux-parisc@vger.kernel.org>; Mon, 10 Jun 2024 19:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.188.251.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718049194; cv=none; b=mvHZ6SPH9RSKUCTfIUVdfgl9pPdcn8xw3Da92fqj+QCyOQN1+OU32PUNfUGqv7tvBsZn43lyz5gx35/ZS8ToCd+H1ZtQZAWbkaKV1jDKWoITtRma0pkuqCaIxrlLf7Zl9d9GgRdpTzKmSrH2Gt7ORdOUtMlITsulsWCxSFipT6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718049194; c=relaxed/simple;
	bh=iqhCKU9Sy5iBIqwmD5hrTQsoPfD72z2peVOIhxcIPwU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=CAO3Naetaxa5GdR/XyMxKWFRTZjOye9Z3HGlwGZMU6AhQH21NXVDafTgTT9YGm49VPnxh0Uy24kMPndYPewOOUVqHuf35zSlHyti7mRTAd2vSuxXoMIeXzIEe9aJuzXxWdWwPcI2aaVnLySNgWWPKITAAUUXSxFCS3XMjXAfrt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk; spf=pass smtp.mailfrom=matoro.tk; dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b=PlYiQYLb; arc=none smtp.client-ip=104.188.251.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matoro.tk
DKIM-Signature: a=rsa-sha256; bh=xyDxicyGBS8OGMWVYS4KACQhu8e2uCNMUtfADyGa1Zw=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20240416; t=1718049172; v=1; x=1718481172;
 b=PlYiQYLbhUd0WWQTrnlbXM9WJP70YK0YepT8U69y0o7iRIt/TXSaovE5VDEOWyvdvczI6WiW
 eqlJGvNGjYhd0PDK2SrNjc7y5OYfLb539nPJcTYR8PdXSMNMNRvq3e+z2F4EKUfNJdQFWAuxeQY
 9SauErXk6UJ8J7Q/BxdGbv0JDVItp7LJp/gVRgH+SySNjcRw6sKiabUmLSrG8KheO/iLEwj25Og
 R1oUe3D2/gtrRThO/1/witjiE+ibhjAq98/Kx78E7VfTLRpWRJf5LaHSbcQ7ciI32FvS0/04oSp
 LpIZ41DQpz4eTpARcvjQDkpV3EfJSOvvbTqDn19gc1A13aukC9tnJbFebwLnZy2P9rdBDoc9OT7
 v9wabrN8/cJ7SLOhhnDJBFDi/qq45aX4JOSRvxx8xv+5qWUAwfCcwD9M6qT49zeKoQbG4VmK7r5
 nz8nxJb+F1ieKzL6jYUi4rcIjfHLgVjdHAJa+owU/kyRwfTn/DHUW+7X/NfbGxPyypaY0/cXpOW
 0RrFMYGBkwxtxlaX8aTH3Ru5WrzExpSvLBXZzPOSftbx7Jt04oaFguErNymldQ+PY08/5JtdEj3
 3s2zz32JGKaUTTkrhBp3qE24Lws/ZQaShJ/2xlWmg1Ms9I8tyMVhEAttEuMMCYsZTw3ewOka2x3
 1W8ozuxfQVs=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id d2d4f4ec; Mon, 10 Jun
 2024 15:52:52 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 10 Jun 2024 15:52:52 -0400
From: matoro <matoro_mailinglist_kernel@matoro.tk>
To: John David Anglin <dave.anglin@bell.net>
Cc: Vidra.Jonas@seznam.cz, linux-parisc@vger.kernel.org, John David Anglin
 <dave@parisc-linux.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Try to fix random segmentation faults in package
 builds
In-Reply-To: <213f7afe-5bc8-40ff-835c-1fadaae0a96d@bell.net>
References: <Zje6ywzNAltbG3R2@mx3210.localdomain>
 <C4u.NueN.39ikIzqu}iW.1cEpt7@seznam.cz>
 <91563ff7-349b-4815-bcfe-99f8f34b0b16@bell.net>
 <34fdf2250fe166372a15d74d28adc8d2@matoro.tk>
 <e88cebf4-bec6-4247-93ae-39eff59cfc8e@bell.net>
 <88756923-4c3c-41bf-97a8-aab25bc93644@bell.net>
 <28cea8aa7cce7c56bbb8f88067c3f3ba@matoro.tk>
 <16d8c07c-9fbe-4e81-b1f1-3127ab05410a@bell.net>
 <7345472b8bfa050ec2b86df5f69f99a4@matoro.tk>
 <52c0dfa7e2054d883bd66da7ab2e68b8@matoro.tk>
 <213f7afe-5bc8-40ff-835c-1fadaae0a96d@bell.net>
Message-ID: <13894865a496a7f2a6ed607e2ef708c4@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-06-04 13:08, John David Anglin wrote:
> On 2024-06-04 11:07 a.m., matoro wrote:
>>> Thanks a ton Dave, I've applied this on top of 6.9.2 and also think I'm 
>>> seeing improvement!  No panics yet, I have a couple week's worth of 
>>> package testing to catch up on so I'll report if I see anything!
>> 
>> I've seen a few warnings in my dmesg while testing, although I didn't see 
>> any immediately corresponding failures.  Any danger?
> We have determined most of the warnings arise from pages that have been 
> swapped out.  Mostly, it seems these
> pages have been flushed to memory before the pte is changed to a swap pte.  
> There might be issues for pages that
> have been cleared.  It is possible the random faults aren't related to the 
> warning I added for pages with an invalid pfn
> in flush_cache_page_if_present.  The only thing I know for certain is there 
> is no way to flush these pages on parisc
> other than flushing the whole cache.
> 
> My c8000 has run almost two weeks without any random faults.  On the other 
> hand, Helge has two machines that
> frequently fault and generate these warnings.
> 
> Flushing the whole cache in flush_cache_mm and flush_cache_range might 
> eliminate the random faults but
> there will be a significant performance hit.
> 
> Dave

Unfortunately I had a few of these faults trip today after ~4 days of uptime 
with corresponding random segfaults.  One of the WARNs was emitted shortly 
before, though not for the same PID.  Reattempted the build twice and 
randomly segfaulted all 3 times.  Had to reboot as usual to get it out of the 
bad state.

[Mon Jun 10 14:26:20 2024] ------------[ cut here ]------------
[Mon Jun 10 14:26:20 2024] WARNING: CPU: 1 PID: 26453 at 
arch/parisc/kernel/cache.c:624 flush_cache_page_if_present+0x1a4/0x330
[Mon Jun 10 14:26:20 2024] Modules linked in: nfnetlink af_packet overlay 
loop nfsv4 dns_resolver nfs lockd grace sunrpc netfs autofs4 binfmt_m
isc sr_mod ohci_pci cdrom ehci_pci ohci_hcd ehci_hcd tg3 usbcore pata_cmd64x 
ipmi_si hwmon usb_common ipmi_devintf libata libphy nls_base ipmi_
msghandler
[Mon Jun 10 14:26:20 2024] CPU: 1 PID: 26453 Comm: ld.so.1 Tainted: G        
W          6.9.3-gentoo-parisc64 #1
[Mon Jun 10 14:26:20 2024] Hardware name: 9000/800/rp3440

[Mon Jun 10 14:26:20 2024]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[Mon Jun 10 14:26:20 2024] PSW: 00001000000001001111100100001111 Tainted: G   
      W
[Mon Jun 10 14:26:20 2024] r00-03  000000ff0804f90f 000000004106b280 
00000000402090bc 000000007f4c85f0
[Mon Jun 10 14:26:20 2024] r04-07  0000000040f99a80 00000000f855d000 
00000000561b6360 000000000800000f
[Mon Jun 10 14:26:20 2024] r08-11  0000000c009674de 0000000000000000 
0000004100b2e39c 000000007f4c81c0
[Mon Jun 10 14:26:20 2024] r12-15  00000000561b6360 0000004100b2e330 
0000000000000002 0000000000000000
[Mon Jun 10 14:26:20 2024] r16-19  0000000040f50360 fffffffffffffff4 
000000007f4c8108 0000000000000003
[Mon Jun 10 14:26:20 2024] r20-23  0000000000001a46 0000000011b81000 
ffffffffc0000000 00000000f859d000
[Mon Jun 10 14:26:20 2024] r24-27  0000000000000000 000000000800000f 
0000004100b2e3a0 0000000040f99a80
[Mon Jun 10 14:26:20 2024] r28-31  0000000000000000 000000007f4c8670 
000000007f4c86a0 0000000000000000
[Mon Jun 10 14:26:20 2024] sr00-03  000000000604d000 000000000604d000 
0000000000000000 000000000604d000
[Mon Jun 10 14:26:20 2024] sr04-07  0000000000000000 0000000000000000 
0000000000000000 0000000000000000

[Mon Jun 10 14:26:20 2024] IASQ: 0000000000000000 0000000000000000 IAOQ: 
0000000040209104 0000000040209108
[Mon Jun 10 14:26:20 2024]  IIR: 03ffe01f    ISR: 0000000000000000  IOR: 
0000000000000000
[Mon Jun 10 14:26:20 2024]  CPU:        1   CR30: 00000001e700e780 CR31: 
fffffff0f0e05ee0
[Mon Jun 10 14:26:20 2024]  ORIG_R28: 00000000414cab90
[Mon Jun 10 14:26:20 2024]  IAOQ[0]: flush_cache_page_if_present+0x1a4/0x330
[Mon Jun 10 14:26:20 2024]  IAOQ[1]: flush_cache_page_if_present+0x1a8/0x330
[Mon Jun 10 14:26:20 2024]  RP(r2): flush_cache_page_if_present+0x15c/0x330
[Mon Jun 10 14:26:20 2024] Backtrace:
[Mon Jun 10 14:26:20 2024]  [<000000004020b110>] 
flush_cache_range+0x138/0x158
[Mon Jun 10 14:26:20 2024]  [<00000000405fdfc8>] 
change_protection+0x134/0xb78
[Mon Jun 10 14:26:20 2024]  [<00000000405feb4c>] mprotect_fixup+0x140/0x478
[Mon Jun 10 14:26:20 2024]  [<00000000405ff15c>] 
do_mprotect_pkey.constprop.0+0x2d8/0x5f0
[Mon Jun 10 14:26:20 2024]  [<00000000405ff4a4>] sys_mprotect+0x30/0x60
[Mon Jun 10 14:26:20 2024]  [<0000000040203fbc>] syscall_exit+0x0/0x10

[Mon Jun 10 14:26:20 2024] ---[ end trace 0000000000000000 ]---

[Mon Jun 10 14:28:04 2024] do_page_fault() command='ld.so.1' type=15 
address=0x161236a0 in libc.so[f8b9c000+1b6000]
                            trap #15: Data TLB miss fault, vm_start = 
0x4208e000, vm_end = 0x420af000
[Mon Jun 10 14:28:04 2024] CPU: 0 PID: 26681 Comm: ld.so.1 Tainted: G        
W          6.9.3-gentoo-parisc64 #1
[Mon Jun 10 14:28:04 2024] Hardware name: 9000/800/rp3440

[Mon Jun 10 14:28:04 2024]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[Mon Jun 10 14:28:04 2024] PSW: 00000000000001100000000000001111 Tainted: G   
      W
[Mon Jun 10 14:28:04 2024] r00-03  000000000006000f 00000000f8d584a8 
00000000f8c46e33 0000000000000028
[Mon Jun 10 14:28:04 2024] r04-07  00000000f8d54660 00000000f8d54648 
0000000000000020 000000000001ab91
[Mon Jun 10 14:28:04 2024] r08-11  00000000f8d54654 00000000f8d5bf78 
0000000000000005 00000000f9ad87c8
[Mon Jun 10 14:28:04 2024] r12-15  0000000000000000 0000000000000000 
000000000000003f 00000000000003e9
[Mon Jun 10 14:28:04 2024] r16-19  000000000001a000 000000000001a000 
000000000001a000 00000000f8d56ca8
[Mon Jun 10 14:28:04 2024] r20-23  0000000000000000 00000000f8c46bcc 
000000000001a2d8 00000000ffffffff
[Mon Jun 10 14:28:04 2024] r24-27  0000000000000000 0000000000000020 
00000000f8d54648 000000000001a000
[Mon Jun 10 14:28:04 2024] r28-31  0000000000000001 0000000016123698 
00000000f9ad8cc0 00000000f9ad8c2c
[Mon Jun 10 14:28:04 2024] sr00-03  0000000006069400 0000000006069400 
0000000000000000 0000000006069400
[Mon Jun 10 14:28:04 2024] sr04-07  0000000006069400 0000000006069400 
0000000006069400 0000000006069400

[Mon Jun 10 14:28:04 2024]       VZOUICununcqcqcqcqcqcrmunTDVZOUI
[Mon Jun 10 14:28:04 2024] FPSR: 00000000000000000000000000000000
[Mon Jun 10 14:28:04 2024] FPER1: 00000000
[Mon Jun 10 14:28:04 2024] fr00-03  0000000000000000 0000000000000000 
0000000000000000 0000000000000000
[Mon Jun 10 14:28:04 2024] fr04-07  3fbc58dcd6e825cf 41d98fdb92c00000 
00001d29b5e9bfb4 41d999952df718f9
[Mon Jun 10 14:28:04 2024] fr08-11  ffe3d998c543273c ff60537aba025d00 
004698b61bd9b9ee 000527c1bed53af7
[Mon Jun 10 14:28:04 2024] fr12-15  0000000000000000 0000000000000000 
0000000000000000 0000000000000000
[Mon Jun 10 14:28:04 2024] fr16-19  0000000000000000 0000000000000000 
0000000000000000 0000000000000000
[Mon Jun 10 14:28:04 2024] fr20-23  0000000000000000 0000000000000000 
0000000000000020 0000000000000000
[Mon Jun 10 14:28:04 2024] fr24-27  0000000000000003 0000000000000000 
3d473181aed58d64 bff0000000000000
[Mon Jun 10 14:28:04 2024] fr28-31  3fc999b324f10111 057028cc5c564e70 
dbc91a3f6bd13476 02632fb493c76730

[Mon Jun 10 14:28:04 2024] IASQ: 0000000006069400 0000000006069400 IAOQ: 
00000000f8c44063 00000000f8c44067
[Mon Jun 10 14:28:04 2024]  IIR: 0fb0109c    ISR: 0000000006069400  IOR: 
00000000161236a0
[Mon Jun 10 14:28:04 2024]  CPU:        0   CR30: 00000001e70099e0 CR31: 
fffffff0f0e05ee0
[Mon Jun 10 14:28:04 2024]  ORIG_R28: 0000000000000000
[Mon Jun 10 14:28:04 2024]  IAOQ[0]: 00000000f8c44063
[Mon Jun 10 14:28:04 2024]  IAOQ[1]: 00000000f8c44067
[Mon Jun 10 14:28:04 2024]  RP(r2): 00000000f8c46e33

