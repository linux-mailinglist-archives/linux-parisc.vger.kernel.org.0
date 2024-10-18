Return-Path: <linux-parisc+bounces-2744-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 874879A4186
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Oct 2024 16:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0737B23B96
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Oct 2024 14:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C016B1FCF76;
	Fri, 18 Oct 2024 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="oTeUkg5m"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-003.bell.net [209.71.212.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B0D10E4
	for <linux-parisc@vger.kernel.org>; Fri, 18 Oct 2024 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729262842; cv=none; b=WpeBMPQwv8ZzbES1XfBUwQ7UrJRGe4ZD7wc7/AQK6Ha5FcDPa/ueRmZukwo5SWScbt7ZThquVJzj9G7SA2Zwm2uu5N3oBi9O5YX9sjKRdy3KMZfAxUN4XxsSLScbzJgteaJf3LE8TtAedHc7A0qtr0bvFm2i9TFK/B/QWVYtPyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729262842; c=relaxed/simple;
	bh=bg+OyI2GjR2NvhyfD8fVXCgydOONq2r9kNWbP69u29k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ZgBGdT47wwd7BxHE7gLmCEfcmjNNnCV0JFoV7D4EOBHHHHPCoD3YCbtIMYOkQucvHE8XGaakgBig+JKxt2/p81xvA++joeKiByKNV+Wfwbia+vbXEWXT7MR8IVooUvJyO2wfW29rm9Yam63/DhvV0COlRO/NQJmcjxNZYVkovxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=oTeUkg5m; arc=none smtp.client-ip=209.71.212.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1729262840; 
        bh=9UiseO9HC/YM0m76vLzXwBksEF4mzM5p9zLne1Guvek=;
        h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
        b=oTeUkg5mNwAR3QaoyjbqiE4HT/dJfSvDCRurdDpq6sxC/3gRQwSl2M66EMC7XhMmuuyIhwjY2EMqSNlg2mRtai37jnMTXFtQdCJpVWczPFXW0lTuEwU8M5ISprcTQkjeMi4qEzEGjtypZsk5ItTO3CS07g6sCLCl49y2sSLVrB/5/u3SzGg/fBEaZBhcrlo4Kg3kuKBthEGTRIMQhOsjksTP8gAWhCaOGS5jKiFd1M0WDbiXaIymY0B2HMSUQ3IRElc2lfzJpINC4kF3oDn1B2JMeZMUluRQI1bA5MeBfv3PdH4DNRLXV7U259KAGBgVHj3ns/Nwmh8AmLw9VYVfwA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 671136720023FEBF
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehfedgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfvffhufgtgfesthekredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfeugfehjeeggffhjeeffeeiheffjeevveejhfdvtdeggfevkeetudejueegjedvnecukfhppedugedvrdduvdeirddugeejrddvtdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddvrdeglegnpdhinhgvthepudegvddruddviedrudegjedrvddtfedpmhgrihhlfhhrohhmpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpnhgspghrtghpthhtohepvddprhgtphhtthhopegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgvvhfkrfepsghrrghsqdgsrghsvgdqohhtfigrohhntdeltdeifidqghhrtgdquddtqddugedvqdduvdeiqddugeejqddvtdefrdgushhlrdgsvghllhdrtggrpdgruhhthhgpuhhsvghrpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpghgvohfkrfepveetpdfovfetjfhoshhtpegtmhigqdht
	ohhrrhhgohdttddu
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.147.203) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 671136720023FEBF; Fri, 18 Oct 2024 10:45:55 -0400
Message-ID: <36c46aef-a4bb-4782-ab87-5f52a6ce54b3@bell.net>
Date: Fri, 18 Oct 2024 10:45:55 -0400
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
Subject: WARNING: CPU: 0 PID: 1 at drivers/pci/devres.c:602
 pcim_add_mapping_to_legacy_table+0x74/0x90
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Just booted 6.11.4 on rp3440 and saw the following warnings:

WARNING: CPU: 0 PID: 1 at drivers/pci/devres.c:602 pcim_add_mapping_to_legacy_table+0x74/0x90
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.4-dirty #1
Hardware name: 9000/800/rp3440
      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001101111100100001111 Not tainted
r00-03  000000ff0806f90f 000000004b9a94c0 0000000040880db0 000000004b9a9390
r04-07  0000000040d66600 0000000000063000 0000000000000000 000000004baf5800
r08-11  0000000000000000 0000000000000010 0000000000000000 0000000000000003
r12-15  000000004117e850 000000004baf58a8 0000000040dea600 000000004015f080
r16-19  000000004017a620 0000000040d84600 00000000f938e64c 0000000000001a46
r20-23  0000000000001a46 000000000000001a 0000000000008000 0000000000000000
r24-27  0000000000000000 000000000800000f 000000004baf5a40 0000000040d66600
Begin: Will now check root file system ... fsck from util-linux 2.40.2
[/sbin/fsck.ext4 (1) -- /dev/sdb5] fsck.ext4 -a -C0 /dev/sdb5
r28-31  0000000000061000 000000004b9a9560 000000004b9a9420 000000004e1d8980
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040880de4 0000000040880de8
  IIR: 03ffe01f    ISR: 0000000010240000  IOR: 0000002e62188008
  CPU:        0   CR30: 000000004b988000 CR31: ffffffffffffefff
  ORIG_R28: 00000000000003a3
  IAOQ[0]: pcim_add_mapping_to_legacy_table+0x74/0x90
  IAOQ[1]: pcim_add_mapping_to_legacy_table+0x78/0x90
  RP(r2): pcim_add_mapping_to_legacy_table+0x40/0x90
Backtrace:
  [<0000000040881ba8>] pcim_iomap+0x120/0x1c8
  [<000000004090f7e0>] serial8250_pci_setup_port+0xd8/0x168
  [<0000000040913458>] pci_hp_diva_setup+0x98/0xe0
  [<0000000040915094>] pciserial_init_ports+0x1c4/0x3d8
  [<00000000409154e0>] pciserial_init_one+0x1a8/0x328
  [<000000004087433c>] pci_device_probe+0x14c/0x2b8
  [<0000000040936964>] really_probe+0x12c/0x590
  [<0000000040936e4c>] __driver_probe_device+0x84/0x1a0
  [<0000000040937058>] driver_probe_device+0xf0/0x2d8
  [<000000004093753c>] __driver_attach+0x114/0x320
  [<0000000040932240>] bus_for_each_dev+0xf0/0x180
  [<0000000040935d48>] driver_attach+0x48/0x60
  [<0000000040934c4c>] bus_add_driver+0x314/0x4c0
  [<00000000409391b0>] driver_register+0xe0/0x290
  [<0000000040873628>] __pci_register_driver+0x88/0xa0
  [<0000000040146428>] serial_pci_driver_init+0x48/0x60
  [<00000000402053e4>] do_one_initcall+0x7c/0x320
  [<0000000040102a74>] kernel_init_freeable+0x5a4/0x6c0
  [<0000000040ca96f0>] kernel_init+0x60/0x340
  [<0000000040202020>] ret_from_kernel_thread+0x20/0x28
---[ end trace 0000000000000000 ]---
0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050010 (irq = 74, base_baud = 115200) is a 16550A
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/pci/devres.c:602 pcim_add_mapping_to_legacy_table+0x74/0x90
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W 6.11.4-dirty #1
Tainted: [W]=WARN
Hardware name: 9000/800/rp3440
      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001101111100100001111 Tainted: G        W
bd2 alternatives: applied 0 out of 21 patches
1;31mr00-03  000000ff0806f90f 000000004b9a94c0 0000000040880db0 000000004b9a9390
r04-07  0000000040d66600 0000000000065000 0000000000000000 000000004baf5800
r08-11  0000000000000000 0000000000000038 0000000000000000 0000000000000003
r12-15  000000004117e850 000000004baf58a8 0000000040dea600 000000004015f080
r16-19  000000004017a620 0000000040d84600 00000000f938e64c 0000000000001a46
r20-23  0000000000001a46 000000000000001a 0000000000008000 0000000000000000
r24-27  0000000000000000 000000000800000f 000000004baf5a40 0000000040d66600
r28-31  0000000000063000 000000004b9a9560 000000004b9a9420 000000004e1d8980
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
ROOT: clean, 263787/17629184 files, 4280669/70507776 blocks
done.
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040880de4 0000000040880de8
  IIR: 03ffe01f    ISR: 0000000010240000  IOR: 0000002e62188008
  CPU:        0   CR30: 000000004b988000 CR31: ffffffffffffefff
  ORIG_R28: 00000000000003a3
  IAOQ[0]: pcim_add_mapping_to_legacy_table+0x74/0x90
  IAOQ[1]: pcim_add_mapping_to_legacy_table+0x78/0x90
  RP(r2): pcim_add_mapping_to_legacy_table+0x40/0x90
Backtrace:
  [<0000000040881ba8>] pcim_iomap+0x120/0x1c8
  [<000000004090f7e0>] serial8250_pci_setup_port+0xd8/0x168
  [<0000000040913458>] pci_hp_diva_setup+0x98/0xe0
  [<0000000040915094>] pciserial_init_ports+0x1c4/0x3d8
  [<00000000409154e0>] pciserial_init_one+0x1a8/0x328
  [<000000004087433c>] pci_device_probe+0x14c/0x2b8
  [<0000000040936964>] really_probe+0x12c/0x590
  [<0000000040936e4c>] __driver_probe_device+0x84/0x1a0
  [<0000000040937058>] driver_probe_device+0xf0/0x2d8
  [<000000004093753c>] __driver_attach+0x114/0x320
  [<0000000040932240>] bus_for_each_dev+0xf0/0x180
  [<0000000040935d48>] driver_attach+0x48/0x60
  [<0000000040934c4c>] bus_add_driver+0x314/0x4c0
  [<00000000409391b0>] driver_register+0xe0/0x290
  [<0000000040873628>] __pci_register_driver+0x88/0xa0
  [<0000000040146428>] serial_pci_driver_init+0x48/0x60
  [<00000000402053e4>] do_one_initcall+0x7c/0x320
  [<0000000040102a74>] kernel_init_freeable+0x5a4/0x6c0
  [<0000000040ca96f0>] kernel_init+0x60/0x340
  [<0000000040202020>] ret_from_kernel_thread+0x20/0x28
---[ end trace 0000000000000000 ]---
0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050038 (irq = 74, base_baud = 115200) is a 16550A

Dave

-- 
John David Anglin  dave.anglin@bell.net


