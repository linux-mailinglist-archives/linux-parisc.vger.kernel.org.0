Return-Path: <linux-parisc+bounces-1862-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B49401BB
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jul 2024 01:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C515F1F23147
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Jul 2024 23:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4951315CD41;
	Mon, 29 Jul 2024 23:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b="eQoJoSN2"
X-Original-To: linux-parisc@vger.kernel.org
Received: from matoro.tk (matoro.tk [104.188.251.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131D581AD2
	for <linux-parisc@vger.kernel.org>; Mon, 29 Jul 2024 23:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.188.251.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722295619; cv=none; b=SLYi1wc3sQcWgKozuT0Jv66l7YC0tX2AbrcpQPbv0yT8LWVFDiOyyO7A2FNQA5rEg/fBOktNdXrVrT2RskxPCUiPLz1RLNMW6E0hFwSYbhze9hWMEjuD8zdrfeT5CYlpxRmmFj24QFPEYibIYwLwnO7FvymtSRlv601zwc8rXOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722295619; c=relaxed/simple;
	bh=mQkC+kZHg+SONmBNU5Zxx0BPH0jRAirvG7VHGR4whAw=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=TFHFSUgK3IhdBdRfHrfNdiO1DJJFUlJkMW81FL7ETow2W/U3Atmg2inEJoG2wI2hOuXnnhilE6bauJDds9D7do01zbJKNFsjywkes5lWnIlCL84KM+R0DL2pi1gcr9ERbl9x4pOXqO+WVGQq53x0BSBpve6D0wZPlHUr7DdgWoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk; spf=pass smtp.mailfrom=matoro.tk; dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b=eQoJoSN2; arc=none smtp.client-ip=104.188.251.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matoro.tk
DKIM-Signature: a=rsa-sha256; bh=nJ4+yrlRy+jAUYawvTmkmWMpLRVtLtmevabXsLyqbxs=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20240626; t=1722294700; v=1; x=1722726700;
 b=eQoJoSN2N9RFkdxRJmSoDdeNwsQZRJaVvbMflVJil8f0mhKPU+Ro+NmKURmj1/3F9hJ4E3jH
 1kCQxLSrvnpmOhE5qUPgn/VJ9rEYEZRfgvKTDoTme0IbAdNQ9z00YiOkYKJVr8b96RZ+V3jJn+8
 8U1L/cgOXEzrmL7mrD55Nm81Ozy/g4lhafM+zX3VtTZcqVs79s3iHudQrqEI+1+zf5x0xo3vlLF
 Z47Qy1UMLIstNfPzO1xeU7VJZWFJMRGGXCHxmYSszvPXKkqECTo8535vBUQQ1q1K7UK4tAHXjpw
 d7k1z4RXr8lxWh2kW3NQ5v1Ohi6WrbWEt6muB7PQ6B58YMh94HBTt/xxVk7UwQRGJH7v6PpPH5p
 By3qQbd9AQZQRyTrOpXYLC4Sl9E+e6kedgMLtFHmCoDgBpd26UZkwqAzo0zJVh8Dlv7IXnKLSqH
 pDq4PcA9uKp8Pv0KY2TCvrsg86TXZzDonTql52bh3RstF7ZTR6FWO1nzTG7hfrfKQ3nZhy8ZfF7
 9WsNq07C60cC7+N6IRctOwnkK/I7rTzxJSwqAOMA27PllXMplnOURAT5YWeu5WKeLbJmV+ku/iX
 4L/Qns5Tb+pADYn5y6pXWM/ZMaKAexxdmHBGZvtX8PDyk/5fbABclNZxD3DaV1SQSXriS0BjQg9
 hcX2kuFAWT8=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id aac71aba; Mon, 29 Jul
 2024 19:11:40 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 29 Jul 2024 19:11:40 -0400
From: matoro <matoro_mailinglist_kernel@matoro.tk>
To: Linux Parisc <linux-parisc@vger.kernel.org>
Cc: John David Anglin <dave.anglin@bell.net>, Deller <deller@gmx.de>, John
 David Anglin <dave@parisc-linux.org>
Subject: Crash on booth with 6.10
Message-ID: <096cad5aada514255cd7b0b9dbafc768@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi all, just bumped to the newest mainline starting with 6.10.2 and 
immediately ran into a crash on boot.  Fully reproducible, reverting back to 
last known good (6.9.8) resolves the issue.  Any clue what's going on here?  
I can provide full boot logs, start bisecting, etc if needed...

[   23.444211] VFS: Mounted root (ext4 filesystem) on device 8:2.
[   24.347318] Freeing unused kernel image (initmem) memory: 1024K
[   24.546256] Backtrace:
[   24.546307]  [<0000000040ed9700>] kernel_init+0x154/0x3c8
[   24.546391]  [<0000000040202020>] ret_from_kernel_thread+0x20/0x28
[   24.546741]
[   24.546775]
[   24.546809] Kernel Fault: Code=26 (Data memory access rights trap) at addr 
0000000041252808
[   24.550224] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 
6.10.2-gentoo-parisc64 #1
[   24.550224] Hardware name: 9000/800/rp3440
[   24.550224]
[   24.550224]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   24.550224] PSW: 00001000000001000000000000001111 Not tainted
[   24.550224] r00-03  000000000804000f 0000000041081ba0 000000004055dab4 
000000004b5dc450
[   24.550224] r04-07  0000000040fadba0 0000000041415d64 000000004b850d00 
000000004108-11  0000000041647a50 0000000000000000 0000000000000001 
00000000414168b0
[   24.550224] r12-15  0000000041611818 0000000040ed16-19  0000000000000000 
0000000000800700 000000004b850000 000000004125f9b0
[   24.550224] r20-23  0000000000000002 00000000412424-27  000000004b850d00 
0000000000000000 00000000415cf158 0000000040fadba0
[   24.550224] r28-31  0000000041252800 000000004b5dr00-03  0000000000000000 
0000000000000000 0000000000000000 0000000000000000
[   24.550224] sr04-07  0000000000000000 0000000000
                                                    [   24.550224] IASQ: 
0000000000000000 0000000000000000 IAOQ: 000000004055db24 000000004055db28
[   24.550224]  IIR: 0f9412d0  [   24.550224]  CPU:        0   CR30: 
000000004b850d00 CR31: fffffff0f0e05ee0
[   24.550224]  ORIG_R28: 000000004b5dc650
[   2[   24.550224]  IAOQ[1]: jump_label_init_ro+0xec/0x190
[   24.550224]  RP(r2): jump_label_init_ro+0x78/0x190
[   24.550224] Ba+0x154/0x3c8
[   24.550224]  [<0000000040202020>] ret_from_kernel_thread+0x20/0x28
[   24.550224]
[   24.550224] Kernel pani

