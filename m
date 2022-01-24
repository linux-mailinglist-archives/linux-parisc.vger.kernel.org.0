Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCDCE497903
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Jan 2022 07:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbiAXGlm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Jan 2022 01:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiAXGll (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Jan 2022 01:41:41 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C90C06173B
        for <linux-parisc@vger.kernel.org>; Sun, 23 Jan 2022 22:41:41 -0800 (PST)
Received: (qmail 9043 invoked from network); 24 Jan 2022 06:40:36 -0000
Received: from p200300cf0708d10076d435fffeb7be92.dip0.t-ipconnect.de ([2003:cf:708:d100:76d4:35ff:feb7:be92]:46032 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 24 Jan 2022 07:40:36 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: pagefaults and hang with 5.15.11
Date:   Mon, 24 Jan 2022 07:41:30 +0100
Message-ID: <2615489.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <4372681.LvFx2qVVIh@eto.sf-tec.de>
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de> <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net> <4372681.LvFx2qVVIh@eto.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11909241.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11909241.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 23. Januar 2022, 12:53:22 CET schrieb Rolf Eike Beer:
> Am Sonntag, 26. Dezember 2021, 18:22:12 CET schrieb John David Anglin:
> > On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
> > > [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613
> > > rcu_eqs_enter.constprop.0+0x8c/0x98
> > 
> > This is probably not reproducible. You might try this change from Sven
> > 
> > I haven't found 5.15.11 to be stable.
> 
> When I was running 5.15.0 I had uptimes of 21 and 29 days before crashes,
> and then 5 days before I rebooted into 5.15.11 to test that.
> 
> With 5.15.11 my longest uptime was 5 days.
> 
> I have switched to 5.15.4 afterwards, which is now already up for 2 weeks. I
> see regular userspace crashes with that, usually gcc or ld as the machine
> is mainly building things, which seems to happen way more often than it has
> happened with 5.15.0 for me.
> 
> So much for the moment.

That was yesterday. And now I just got this:

[1274934.746891] Bad Address (null pointer deref?): Code=15 (Data TLB miss fault) at addr 0000004140000018
[1274934.746891] CPU: 3 PID: 5549 Comm: cmake Not tainted 5.15.4-gentoo-parisc64 #4
[1274934.746891] Hardware name: 9000/785/C8000
[1274934.746891]
[1274934.746891]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[1274934.746891] PSW: 00001000000001001111111000001110 Not tainted
[1274934.746891] r00-03  000000ff0804fe0e 0000000040bc9bc0 00000000406760e4 0000004140000000
[1274934.746891] r04-07  0000000040b693c0 0000004140000000 000000004a2b08b0 0000000000000001
[1274934.746891] r08-11  0000000041f98810 0000000000000000 000000004a0a7000 0000000000000001
[1274934.746891] r12-15  0000000040bddbc0 0000000040c0cbc0 0000000040bddbc0 0000000040bddbc0
[1274934.746891] r16-19  0000000040bde3c0 0000000040bddbc0 0000000040bde3c0 0000000000000007
[1274934.746891] r20-23  0000000000000006 000000004a368950 0000000000000000 0000000000000001
[1274934.746891] r24-27  0000000000001fff 000000000800000e 000000004a1710f0 0000000040b693c0
[1274934.746891] r28-31  0000000000000001 0000000041f988b0 0000000041f98840 000000004a171118
[1274934.746891] sr00-03  00000000066e5800 0000000000000000 0000000000000000 00000000066e5800
[1274934.746891] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[1274934.746891]
[1274934.746891] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000406760e8 00000000406760ec
[1274934.746891]  IIR: 48780030    ISR: 0000000000000000  IOR: 0000004140000018
[1274934.746891]  CPU:        3   CR30: 00000040e3a9c000 CR31: ffffffffffffffff
[1274934.746891]  ORIG_R28: 0000000040acdd58
[1274934.746891]  IAOQ[0]: sba_unmap_sg+0xb0/0x118
[1274934.746891]  IAOQ[1]: sba_unmap_sg+0xb4/0x118
[1274934.746891]  RP(r2): sba_unmap_sg+0xac/0x118
[1274934.746891] Backtrace:
[1274934.746891]  [<00000000402740cc>] dma_unmap_sg_attrs+0x6c/0x70
[1274934.746891]  [<000000004074d6bc>] scsi_dma_unmap+0x54/0x60
[1274934.746891]  [<00000000407a3488>] mptscsih_io_done+0x150/0xd70
[1274934.746891]  [<0000000040798600>] mpt_interrupt+0x168/0xa68
[1274934.746891]  [<0000000040255a48>] __handle_irq_event_percpu+0xc8/0x278
[1274934.746891]  [<0000000040255c34>] handle_irq_event_percpu+0x3c/0xd8
[1274934.746891]  [<000000004025ecb4>] handle_percpu_irq+0xb4/0xf0
[1274934.746891]  [<00000000402548e0>] generic_handle_irq+0x50/0x70
[1274934.746891]  [<000000004019a254>] call_on_stack+0x18/0x24
[1274934.746891]
[1274934.746891] Kernel panic - not syncing: Bad Address (null pointer deref?)


--nextPart11909241.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYe5KGgAKCRBcpIk+abn8
TlnIAKCoV8IQ/+GUBrTvjMhxqgGCWqBadQCeOgLmwl3eENsODv0ZdJpnX2LD54Y=
=+Um0
-----END PGP SIGNATURE-----

--nextPart11909241.O9o76ZdvQC--



