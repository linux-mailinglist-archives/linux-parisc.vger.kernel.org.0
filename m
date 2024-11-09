Return-Path: <linux-parisc+bounces-2935-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BC89C290F
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Nov 2024 02:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50AF61F229D6
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Nov 2024 01:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D65018E1A;
	Sat,  9 Nov 2024 01:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="3dbbqIZt"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo002.bell.net (mta-tor-001.bell.net [209.71.212.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C739723A9
	for <linux-parisc@vger.kernel.org>; Sat,  9 Nov 2024 01:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731114317; cv=none; b=e+fPJsn3necTPijjctNzjjjsZK85v6zBmDFvWHWz3AU6g4+6Q2PthG9j6ZKDJuuI2t051Vatq2zrJdlOOxR1sBPfT1uqxd+fggYM8TWulhCubCfhOZu8ZbaJRXMPRlS/bfFTblb6vq/1joV4pr/oLzQwPHLmUaLk4scqstRkMHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731114317; c=relaxed/simple;
	bh=Ee7d0Guep+Bjt60zEsgXJup4JkK8jMC6mJRtU/5S91Y=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=N3IRamXaA4SYorxN2Cztk4zLxwlXL5DITKyG7OTYwh+F6JqfyeV66hvLsgYoRjpEWOTLZI+Q6XhXUqRn83v/4BYewLLYLMZeGtV2x+V27UnxmZORlXIumOlDxfxvF6Oz6BS1JYfYjYiwhP0YTAKM4ScykkaJSUNUbApHgNfhK5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=3dbbqIZt; arc=none smtp.client-ip=209.71.212.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1731114314; 
        bh=1WRRRUR93HYUR3H0RbBEqbM6ZwNS/TQMiZm3eegzrCA=;
        h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
        b=3dbbqIZtDOuF2mahEXjqhBDkvIxEuHUBEqAQMDQQmr0JD3z199KBNwDYCf9xQh+oI9o1uEWBfU04rwSUVcymSJjSgBUZTOtrKJRJK7fST/4cSifIpE3vqdQlVoY27CWFSQRaIZXIjRnkGBSMW92U02aBYDB85N4t8SMPypvfLnUBeheiAZiVt3XMZG2xd+KFn531hDNeTQQzKRVaAj7LblSYmtwe/I+NiR0jXsAGJ1Qd1KeAXHh+Yqt8XnpWVWNOLZY7l2DWmGbPkOALo2UrcVFKO2P4Sf3u1oQBrS0UbXCAnj0zIFKrvArvY3myM5BfSatVHU+2IKrsI9CrnKx1yw==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 672B797400707C4A
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeefuddrtdejgddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceugffnnfdpqfgfvfenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfvhffutgfgsehtkeertddtvdejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpefguefgheejgefghfejfeefieehffejveevjefhvddtgefgveektedujeeugeejvdenucfkphepudegvddruddviedrudeliedrudelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrdduvdeirdduleeirdduleehpdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrvghvkffrpegsrhgrshdqsggrshgvqdhothifrghonhdtledtieifqdhgrhgtqddvfedqudegvddquddviedqudeliedqudelhedrughslhdrsggvlhhlrdgtrgdprghuthhhpghushgvrhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhgvghokffrpeevtedpoffvtefjohhstheptghmgidqthho
	rhhrghhotddtvd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.196.195) by cmx-torrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 672B797400707C4A; Fri, 8 Nov 2024 20:04:13 -0500
Message-ID: <09692e99-a05a-4240-96bf-040eea60d936@bell.net>
Date: Fri, 8 Nov 2024 20:04:14 -0500
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-parisc <linux-parisc@vger.kernel.org>
From: John David Anglin <dave.anglin@bell.net>
Subject: WARNING: CPU: 1 PID: 1 at drivers/pci/devres.c:602
 pcim_add_mapping_to_legacy_table+0x74/0x90
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[    1.377745] printk: legacy bootconsole [pdc0] disabled
[    1.384912] ------------[ cut here ]------------
[    1.385053] WARNING: CPU: 1 PID: 1 at drivers/pci/devres.c:602 pcim_add_mapping_to_legacy_table+0x74/0x90
[    1.387072] Modules linked in:
[    1.387171] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.7-dirty #1
[    1.391597] Hardware name: 9000/800/rp3440

[    1.391745]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[    1.391883] PSW: 00001000000001001111100100001111 Not tainted
[    1.396459] r00-03  000000ff0804f90f 000000004b9a94c0 0000000040881880 000000004b9a9390
[    1.401028] r04-07  0000000040d676a0 0000000000063000 0000000000000000 000000004baf5800
[    1.401282] r08-11  0000000000000000 0000000000000010 0000000000000000 0000000000000003
[    1.405827] r12-15  000000004117e900 000000004baf58a8 0000000040deb6a0 000000004015f080
[    1.410575] r16-19  000000004017a628 0000000040d856a0 00000000f98a5608 0000000000001a46
[    1.410828] r20-23  0000000000001a46 000000000000001a 0000000000008000 0000000000000000
[    1.418202] r24-27  0000000000000000 000000000800000f 000000004baf5a40 0000000040d676a0
[    1.422793] r28-31  0000000000061000 000000004b9a9560 000000004b9a9420 000000004ed32780
[    1.423053] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    1.427787] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

[    1.432394] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000408818b4 00000000408818b8
[    1.432672]  IIR: 03ffe01f    ISR: 0000000010240000  IOR: 0000002e62188008
[    1.437151]  CPU:        1   CR30: 000000004b988000 CR31: ffffffffffffffff
[    1.441697]  ORIG_R28: 00000000000003a3
[    1.441803]  IAOQ[0]: pcim_add_mapping_to_legacy_table+0x74/0x90
[    1.441996]  IAOQ[1]: pcim_add_mapping_to_legacy_table+0x78/0x90
[    1.446631]  RP(r2): pcim_add_mapping_to_legacy_table+0x40/0x90
[    1.446823] Backtrace:
[    1.446883]  [<0000000040882678>] pcim_iomap+0x120/0x1c8
[    1.451320]  [<00000000409102b0>] serial8250_pci_setup_port+0xd8/0x168
[    1.451540]  [<0000000040913f28>] pci_hp_diva_setup+0x98/0xe0
[    1.459116]  [<0000000040915b64>] pciserial_init_ports+0x1c4/0x3d8
[    1.459309]  [<0000000040915fb0>] pciserial_init_one+0x1a8/0x328
[    1.464435]  [<0000000040874e0c>] pci_device_probe+0x14c/0x2b8
[    1.464645]  [<000000004093759c>] really_probe+0x12c/0x590
[    1.469086]  [<0000000040937a84>] __driver_probe_device+0x84/0x1a0
[    1.469290]  [<0000000040937c90>] driver_probe_device+0xf0/0x2d8
[    1.473773]  [<0000000040938174>] __driver_attach+0x114/0x320
[    1.473963]  [<0000000040932e78>] bus_for_each_dev+0xf0/0x180
[    1.474144]  [<0000000040936980>] driver_attach+0x48/0x60
[    1.478742]  [<0000000040935884>] bus_add_driver+0x314/0x4c0
[    1.478925]  [<0000000040939de8>] driver_register+0xe0/0x290
[    1.483402]  [<00000000408740f8>] __pci_register_driver+0x88/0xa0
[    1.483617]  [<00000000401464c8>] serial_pci_driver_init+0x48/0x60
[    1.488089]  [<00000000402053e4>] do_one_initcall+0x7c/0x320
[    1.488276]  [<0000000040102a74>] kernel_init_freeable+0x5a4/0x6c0
[    1.492923]  [<0000000040caa698>] kernel_init+0x60/0x340
[    1.493099]  [<0000000040202020>] ret_from_kernel_thread+0x20/0x28

[    1.497621] ---[ end trace 0000000000000000 ]---
[    1.498533] 0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050010 (irq = 74, base_baud = 115200) is a 16550A
[    1.506174] ------------[ cut here ]------------
[    1.506312] WARNING: CPU: 1 PID: 1 at drivers/pci/devres.c:602 pcim_add_mapping_to_legacy_table+0x74/0x90
[    1.511411] Modules linked in:
[    1.511500] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.11.7-dirty #1
[    1.516088] Tainted: [W]=WARN
[    1.516165] Hardware name: 9000/800/rp3440

Dave

-- 
John David Anglin  dave.anglin@bell.net


