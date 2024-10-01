Return-Path: <linux-parisc+bounces-2422-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACAA98C0F3
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2024 17:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E36C9284EAC
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Oct 2024 15:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA2C84047;
	Tue,  1 Oct 2024 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyvmtWN2"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C7727448;
	Tue,  1 Oct 2024 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794813; cv=none; b=h5VxyiD1f4gwrZOTUqunI/3JOhk6HpWjWrRHbkYDNNhFbv65w6A9Vo/OuIE+TNS3cAYxdhju7MEoWGu7HW0mxW5Ww6j8m5IdGY8kbmk6LWhGp3dp+JGhuqCC/rTrAVUzaptTzGOtfzdUY8hRYSLdTqiY4/t1DDTlapOLCQHeKtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794813; c=relaxed/simple;
	bh=ucTxQkm6GTSeAwhdciRrwf80M8IIH/CgVEPI7Sp36Ck=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=soZ0t9X/ojRtYXQWaNMiaUYlk63fKhncLJXByRlvTbjSJHNLG41GzXZu3rVIOygJ2Is/QDqSO1fXid02EVjKa2WTF1VZm5kC7RqEUvMUqiO4lYgKnD/gP5DBfJ9wkXVy+MgyHyd+lr6run3P4+8mARHgP0pc4bBKoSRJFpyV6qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyvmtWN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862AFC4CECD;
	Tue,  1 Oct 2024 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727794813;
	bh=ucTxQkm6GTSeAwhdciRrwf80M8IIH/CgVEPI7Sp36Ck=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=dyvmtWN2cU4doivM1bfNqGnN6Dhs9n1zNY9awUlAPS3DIW4gb1KoyuWHpmBq7LFLv
	 NeC1WV57ItIsYYbr5eYryOcfeL198dXSoquVF1Qpbmc/jmO0FWprOcxnFiwQA5Cxng
	 huRmX0IymYY7x+NnerFK3Omcq1yXKShnq4E2HvxBQLsEEEj2R4uDuZft0D/Wj03/NI
	 uJrmWPTQ2q1TzI+YpnCRHty1kPOLTw2jeRGrekhdBO2nct8Mnf34dJ9RhvyaOuD+aT
	 ojyE6+Au4H+y1///zd8RsSeoDHeKDvmROb04QNV1yAoCab6dOdmHUSnR/XSKYYFtk5
	 QDxt6qIwN8Ggg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E27FD380DBF7;
	Tue,  1 Oct 2024 15:00:17 +0000 (UTC)
From: Colin Ian King via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 01 Oct 2024 15:00:13 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: deller@gmx.de, bugs@lists.linux.dev, linux-parisc@vger.kernel.org, 
 James.Bottomley@HansenPartnership.com
Message-ID: <20241001-b219339c1-77ccff4939f9@bugzilla.kernel.org>
In-Reply-To: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
References: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
Subject: Re: calling getcpu with misaligned address causes kernel panic
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Colin Ian King writes via Kernel.org Bugzilla:

uname -a
./Linux hppa 6.10.6-parisc #1 SMP Debian 6.10.6-1 (2024-08-19) parisc GNU/Linux
cking@hppa:~$ ./crash 
[  991.661268] handle_unaligned: 190 callbacks suppressed
[  991.661901] Kernel: unaligned access to 0xf8c00001 in sys_getcpu+0x30/0x6c (iir 0xf3cd280)
[  991.677270] Backtrace:
[  991.679232]  [<10413c60>] handle_unaligned+0x598/0x758
[  991.679232]  [<10409854>] handle_interruption+0x1dc/0x7b8
[  991.679232]  [<10454dec>] sys_getcpu+0x30/0x6c
[  991.679232] 
[  991.679232] 
[  991.679232] Page fault: bad address: Code=26 (Data memory access rights trap) at addr f8c00000
[  991.679232] CPU: 2 PID: 725 Comm: crash Not tainted 6.10.6-parisc #1  Debian 6.10.6-1
[  991.679232] Hardware name: 9000/778/B160L
[  991.679232] 
[  991.679232]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  991.679232] PSW: 00000000000001101111111100001111 Not tainted
[  991.679232] r00-03  0006ff0f 00000000 10413c60 12de83c0
[  991.679232] r04-07  12de8080 17220940 fc000000 f8c00001
[  991.679232] r08-11  00000000 0f3cd280 f8fd5c20 f8fd2e58
[  991.679232] r12-15  00011008 00bdd7d8 00000000 00000001
[  991.679232] r16-19  12de8080 00138428 00bd5730 ff000000
[  991.679232] r20-23  00000000 00000000 00000000 12de86d8
[  991.679232] r24-27  00000000 00000000 12de8080 11148ae8
[  991.679232] r28-31  00000000 000003c0 12de8400 f8c00000
[  991.679232] sr00-03  00000000 000003c0 00000000 000003c0
[  991.679232] sr04-07  00000000 00000000 00000000 00000000
[  991.679232] 
[  991.679232] IASQ: 00000000 00000000 IAOQ: 10413598 1041359c
[  991.679232]  IIR: 0ff45280    ISR: 000003c0  IOR: f8c00000
[  991.679232]  CPU:        2   CR30: 17220940 CR31: 00000000
[  991.679232]  ORIG_R28: 00000000
[  991.679232]  IAOQ[0]: emulate_stw+0x5c/0x90
[  991.679232]  IAOQ[1]: emulate_stw+0x60/0x90
[  991.679232]  RP(r2): handle_unaligned+0x598/0x758
[  991.679232] Backtrace:
[  991.679232]  [<10413c60>] handle_unaligned+0x598/0x758
[  991.679232]  [<10409854>] handle_interruption+0x1dc/0x7b8
[  991.679232]  [<10454dec>] sys_getcpu+0x30/0x6c
[  991.679232] 
[  991.679232] Kernel panic - not syncing: Page fault: bad address

View: https://bugzilla.kernel.org/show_bug.cgi?id=219339#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


