Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4951549DA9B
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Jan 2022 07:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236510AbiA0G1m (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 27 Jan 2022 01:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbiA0G1l (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 27 Jan 2022 01:27:41 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EE5C061714
        for <linux-parisc@vger.kernel.org>; Wed, 26 Jan 2022 22:27:41 -0800 (PST)
Received: (qmail 11712 invoked from network); 27 Jan 2022 06:26:25 -0000
Received: from p200300cf0710410038a5bdfffef1938d.dip0.t-ipconnect.de ([2003:cf:710:4100:38a5:bdff:fef1:938d]:47742 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Thu, 27 Jan 2022 07:26:25 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH] parisc: Fix data TLB miss in sba_unmap_sg
Date:   Thu, 27 Jan 2022 07:27:39 +0100
Message-ID: <4373396.LvFx2qVVIh@eto.sf-tec.de>
In-Reply-To: <YfGxafKxQdw8GhMc@mx3210.localdomain>
References: <YfGxafKxQdw8GhMc@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2226644.ElGaqSPkdT"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart2226644.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 26. Januar 2022, 21:39:05 CET schrieb John David Anglin:
> Rolf Eike Beer reported the following bug:
> 
> [1274934.746891] Bad Address (null pointer deref?): Code=15 (Data TLB miss
> fault) at addr 0000004140000018 [1274934.746891] CPU: 3 PID: 5549 Comm:
> cmake Not tainted 5.15.4-gentoo-parisc64 #4 [1274934.746891] Hardware name:
> 9000/785/C8000
> [1274934.746891]
> [1274934.746891]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [1274934.746891] PSW: 00001000000001001111111000001110 Not tainted
> [1274934.746891] r00-03  000000ff0804fe0e 0000000040bc9bc0 00000000406760e4
> 0000004140000000 [1274934.746891] r04-07  0000000040b693c0 0000004140000000
> 000000004a2b08b0 0000000000000001 [1274934.746891] r08-11  0000000041f98810
> 0000000000000000 000000004a0a7000 0000000000000001 [1274934.746891] r12-15 
> 0000000040bddbc0 0000000040c0cbc0 0000000040bddbc0 0000000040bddbc0
> [1274934.746891] r16-19  0000000040bde3c0 0000000040bddbc0 0000000040bde3c0
> 0000000000000007 [1274934.746891] r20-23  0000000000000006 000000004a368950
> 0000000000000000 0000000000000001 [1274934.746891] r24-27  0000000000001fff
> 000000000800000e 000000004a1710f0 0000000040b693c0 [1274934.746891] r28-31 
> 0000000000000001 0000000041f988b0 0000000041f98840 000000004a171118
> [1274934.746891] sr00-03  00000000066e5800 0000000000000000
> 0000000000000000 00000000066e5800 [1274934.746891] sr04-07 
> 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [1274934.746891]
> [1274934.746891] IASQ: 0000000000000000 0000000000000000 IAOQ:
> 00000000406760e8 00000000406760ec [1274934.746891]  IIR: 48780030    ISR:
> 0000000000000000  IOR: 0000004140000018 [1274934.746891]  CPU:        3  
> CR30: 00000040e3a9c000 CR31: ffffffffffffffff [1274934.746891]  ORIG_R28:
> 0000000040acdd58
> [1274934.746891]  IAOQ[0]: sba_unmap_sg+0xb0/0x118
> [1274934.746891]  IAOQ[1]: sba_unmap_sg+0xb4/0x118
> [1274934.746891]  RP(r2): sba_unmap_sg+0xac/0x118
> [1274934.746891] Backtrace:
> [1274934.746891]  [<00000000402740cc>] dma_unmap_sg_attrs+0x6c/0x70
> [1274934.746891]  [<000000004074d6bc>] scsi_dma_unmap+0x54/0x60
> [1274934.746891]  [<00000000407a3488>] mptscsih_io_done+0x150/0xd70
> [1274934.746891]  [<0000000040798600>] mpt_interrupt+0x168/0xa68
> [1274934.746891]  [<0000000040255a48>] __handle_irq_event_percpu+0xc8/0x278
> [1274934.746891]  [<0000000040255c34>] handle_irq_event_percpu+0x3c/0xd8
> [1274934.746891]  [<000000004025ecb4>] handle_percpu_irq+0xb4/0xf0
> [1274934.746891]  [<00000000402548e0>] generic_handle_irq+0x50/0x70
> [1274934.746891]  [<000000004019a254>] call_on_stack+0x18/0x24
> [1274934.746891]
> [1274934.746891] Kernel panic - not syncing: Bad Address (null pointer
> deref?)
> 
> The bug is caused by overrunning the sglist and incorrectly testing
> sg_dma_len(sglist) before nents. Normally this doesn't cause a crash,
> but in this case sglist crossed a page boundary. This occurs in the
> following code:
> 
> 	while (sg_dma_len(sglist) && nents--) {
> 
> The fix is simply to test nents first and move the decrement of nents
> into the loop.
> 
> Reported-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>

This needs a "CC:stable" as well, no?
--nextPart2226644.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYfI7WwAKCRBcpIk+abn8
TthzAJ9FSH/zg5BpCiTTlcc6GhiGQQ0vKQCdHocR80sIywKbGAh461VBqI3xp20=
=H6AY
-----END PGP SIGNATURE-----

--nextPart2226644.ElGaqSPkdT--



