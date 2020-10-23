Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB888296B93
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 10:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S460777AbgJWI6t (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 04:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S460767AbgJWI6t (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 04:58:49 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EACDC0613CE
        for <linux-parisc@vger.kernel.org>; Fri, 23 Oct 2020 01:58:49 -0700 (PDT)
Received: (qmail 20986 invoked from network); 23 Oct 2020 08:54:44 -0000
Received: from p548d4414.dip0.t-ipconnect.de ([::ffff:84.141.68.20]:49130 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <jer@xs4all.nl>; Fri, 23 Oct 2020 10:54:43 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Jeroen Roovers <jer@xs4all.nl>, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag usage
Date:   Fri, 23 Oct 2020 10:58:37 +0200
Message-ID: <2572767.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <15a0414d-9c6d-76ed-becc-f62635763da0@gmx.de>
References: <20200829122017.GA3988@ls3530.fritz.box> <05c101c9-c790-68ec-40a6-d248452fe60d@gmx.de> <15a0414d-9c6d-76ed-becc-f62635763da0@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11642728.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart11642728.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 23. Oktober 2020, 10:31:14 CEST schrieb Helge Deller:
> On 10/23/20 10:18 AM, Helge Deller wrote:
> > On 10/23/20 9:25 AM, Rolf Eike Beer wrote:
> >>> +#define O_NONBLOCK_OLD		000200004
> >>> +#define O_NONBLOCK_MASK_OUT	(O_NONBLOCK_OLD & ~O_NONBLOCK)
> >>> +static int FIX_O_NONBLOCK(int flags)
> >>> +{
> >>> +	if (flags & O_NONBLOCK_MASK_OUT) {
> >>> +		struct task_struct *tsk = current;
> >>> +		pr_warn("%s(%d) uses old O_NONBLOCK value. "
> >>> +			"Please recompile the application.\n",
> >>> +			tsk->comm, tsk->pid);
> >>> +	}
> >>> +	return flags & ~O_NONBLOCK_MASK_OUT;
> >>> +}
> >> 
> >> This will also trigger if I just pass 0x4 in flags, no? The check should
> >> be
> >> 
> >> 	if ((flags & O_NONBLOCK_OLD) == O_NONBLOCK_OLD)
> > 
> > RIGHT!
> > That's a very good point.
> > I was thinking about what would happen if over time a new (unrelated)
> > define gets created which then gets 0x4 as value. My code would then have
> > wrongly modified it.
> 
> After some more thinking....
> 
> It's not that easy.
> Let's assume there will be another new flag at some time with value 0x4.
> Now, the caller sets this flag (0x4) and new O_NONBLOCK (000200000),
> so you end up with 000200004 again, which then triggers your check:
>  	if ((flags & O_NONBLOCK_OLD) == O_NONBLOCK_OLD)
> 
> So, my check to test only the mask for 0x4 was basically better,
> because it would prevent the usage of 0x4 as any new value.
> In any way, it seems we need to avoid using 0x4 for a long time...

Then maybe just add that as an explicit comment in the header so noone picks 
it by accident, and add a comment pointing to these wrappers so they are more 
likely to be kept in sync.

And for extra fun we can just scrap all this for 64 bit userspace as we don't 
need the compat there ;)

Eike
--nextPart11642728.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCX5KbPQAKCRBcpIk+abn8
Tp1oAJ9AQtT0AxkZ632oUibyHnH7Er4htACfTkiVaKmmvekFYkaG9e7RLbwEbuE=
=dKXR
-----END PGP SIGNATURE-----

--nextPart11642728.O9o76ZdvQC--



