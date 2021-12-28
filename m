Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335F1480D8F
	for <lists+linux-parisc@lfdr.de>; Tue, 28 Dec 2021 22:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhL1Vz6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 Dec 2021 16:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbhL1Vz6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 Dec 2021 16:55:58 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BA6C061574
        for <linux-parisc@vger.kernel.org>; Tue, 28 Dec 2021 13:55:57 -0800 (PST)
Received: (qmail 17590 invoked from network); 28 Dec 2021 21:56:15 -0000
Received: from p200300cf07194a002d44b0807b269561.dip0.t-ipconnect.de ([2003:cf:719:4a00:2d44:b080:7b26:9561]:51894 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Tue, 28 Dec 2021 22:56:15 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Re: pagefaults and hang with 5.15.11
Date:   Tue, 28 Dec 2021 22:55:47 +0100
Message-ID: <3407744.iIbC2pHGDl@daneel.sf-tec.de>
In-Reply-To: <12921974.uLZWGnKmhe@daneel.sf-tec.de>
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de> <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net> <12921974.uLZWGnKmhe@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8872545.CDJkKcVGEf"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart8872545.CDJkKcVGEf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 27. Dezember 2021, 15:30:10 CET schrieb Rolf Eike Beer:
> Am Sonntag, 26. Dezember 2021, 18:22:12 CET schrieb John David Anglin:
> > On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
> > > [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613
> > > rcu_eqs_enter.constprop.0+0x8c/0x98
> > 
> > This is probably not reproducible. You might try this change from Sven
> 
> At least this time the git testsuite has finished, but with some errors as
> usual.
> 
> > diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> > index cf92ece20b75..0cd97fa004c5 100644
> > --- a/arch/parisc/kernel/smp.c
> > +++ b/arch/parisc/kernel/smp.c
> > @@ -228,11 +228,13 @@ static inline void
> > 
> >   send_IPI_allbutself(enum ipi_message_type op)
> >   {
> >   
> >          int i;
> > 
> > -
> > +
> > +       preempt_disable();
> > 
> >          for_each_online_cpu(i) {
> >          
> >                  if (i != smp_processor_id())
> >                  
> >                          send_IPI_single(i, op);
> >          
> >          }
> > 
> > +       preempt_enable();
> > 
> >   }
> >   
> >   #ifdef CONFIG_KGDB
> 
> I'll add this and see what happens.

The machine locked up again, but without many output:

[13093.642353] INEQUIVALENT ALIASES 0x96000 and 0xf5bba000 in file xargs
[13094.122900] INEQUIVALENT ALIASES 0x110000 and 0xf5a63000 in file find
[13260.968430] INEQUIVALENT ALIASES 0x96000 and 0xf5bba000 in file xargs
[16995.351108] ttyS ttyS1:[17649.655079] t[17650.739194] t[17658.174951] 
t[17659.307044] t[24039.432030] INEQUIVALENT ALIASES 0x113000 and 0xf5a66000 
in file find

And after reset it got trouble during boot:

  Configuration setting "allocation/zero_metadata" unknown.
[   76.490814] watchdog: BUG: soft lockup - CPU#3 stuck for 23s! [lvm:2612]

Luckily it worked on the next attempt.

> > and my "[PATCH v3] parisc: Rewrite light-weight syscall and futex code"
> > change. Page faults in the LWS code can mess up scheduling.
> 
> But that would be nothing new. At least the machine has been quite stable in
> the last time.
> 
> > I haven't found 5.15.11 to be stable.

Neither do I.

I assume it's some sort of backport, since 5.15.0 has been quite stable:

reboot   system boot  5.15.11-gentoo-p Sat Dec 25 00:18   still running
reboot   system boot  5.15.0-gentoo-pa Sun Dec 19 11:46 - 00:13 (5+12:27)
reboot   system boot  5.15.0-gentoo-pa Thu Nov 25 14:40 - 00:13 (29+09:33)
reboot   system boot  5.15.0-gentoo-pa Thu Nov  4 10:23 - 14:35 (21+04:11)

Eike
--nextPart8872545.CDJkKcVGEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYcuH4wAKCRBcpIk+abn8
ThZLAKCAFTyIyWQVgFurc0IzzGi7SyOR0wCfYCZ6yYHWqvQ/+fipI7Yl6Q73hfw=
=n8Ah
-----END PGP SIGNATURE-----

--nextPart8872545.CDJkKcVGEf--



