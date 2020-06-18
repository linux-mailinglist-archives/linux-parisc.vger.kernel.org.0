Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBE01FEAED
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Jun 2020 07:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgFRFaD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 18 Jun 2020 01:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbgFRFaC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 18 Jun 2020 01:30:02 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494C7C06174E
        for <linux-parisc@vger.kernel.org>; Wed, 17 Jun 2020 22:30:02 -0700 (PDT)
Received: (qmail 20755 invoked from network); 18 Jun 2020 05:29:00 -0000
Received: from p548d49d2.dip0.t-ipconnect.de ([::ffff:84.141.73.210]:36558 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Thu, 18 Jun 2020 07:29:00 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: [PATCH] parisc: Prevent optimization of loads and stores in atomic operations
Date:   Thu, 18 Jun 2020 07:29:53 +0200
Message-ID: <2287050.WoncNzrUZq@daneel.sf-tec.de>
In-Reply-To: <69241344.BnyGGfobf6@daneel.sf-tec.de>
References: <55841e49-cf36-e49a-5b33-7b60d3275e56@bell.net> <2843d7e4-9088-8f83-9401-8fa04d9f935a@bell.net> <69241344.BnyGGfobf6@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3957101.nDPfY6jpp0"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart3957101.nDPfY6jpp0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 17. Juni 2020, 21:31:40 CEST schrieb Rolf Eike Beer:
> Am Mittwoch, 17. Juni 2020, 16:41:44 CEST schrieb John David Anglin:
> > On 2020-06-16 10:57 a.m., John David Anglin wrote:I will post an updated
> > patch against trunk in a day or two.  The debian gcc-snapshot package is
> > 
> > > building on mx3210 and phantom.  This package almost always failed to
> > > build on phantom.
> > 
> > Sadly, the patch doesn't fix problem:
> Whatever is still the issue, for me it makes things much better. So you may
> add:
> 
> Tested-by: Rolf Eike Beer <eike-kernel@sf-tec.de>

And now that we talked about it the machine is dead:

[209974.638738] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[209974.638738] rcu:    3-...!: (0 ticks this GP) idle=64a/
1/0x4000000000000000 softirq=20658539/20658539 fqs=0
[209974.638738]         (detected by 0, t=5505612 jiffies, g=39395637, q=10)
[209974.638738] Task dump for CPU 3:
[209974.638738] sh              R  running task        0  9458   9177 
0x00000012
[209974.638738] Backtrace:
[209974.638738]
[209974.638738] rcu: rcu_sched kthread starved for 5505612 jiffies! g39395637 
f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=1
[209974.638738] rcu: RCU grace-period kthread stack dump:
[209974.638738] rcu_sched       R    0    10      2 0x00000000
[209974.638738] Backtrace:

I still think that patch is a step in the right direction.

Eike
--nextPart3957101.nDPfY6jpp0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXur70QAKCRBcpIk+abn8
TqGTAKCkIMJw50pzgiH+aJma7FzTpUFyDwCgiwgBmnVGNUjjO7dQh+zIcTqxWjc=
=c666
-----END PGP SIGNATURE-----

--nextPart3957101.nDPfY6jpp0--



