Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63184A3023
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Jan 2022 15:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345931AbiA2Oze (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Jan 2022 09:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241965AbiA2Oze (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Jan 2022 09:55:34 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D0DC061714
        for <linux-parisc@vger.kernel.org>; Sat, 29 Jan 2022 06:55:33 -0800 (PST)
Received: (qmail 2342 invoked from network); 29 Jan 2022 14:54:06 -0000
Received: from p200300cf0746ee0076d435fffeb7be92.dip0.t-ipconnect.de ([2003:cf:746:ee00:76d4:35ff:feb7:be92]:50366 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sat, 29 Jan 2022 15:54:06 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Randolph Chung <randolph@tausq.org>
Subject: Re: [PATCH] parisc: Add initial vDSO support
Date:   Sat, 29 Jan 2022 15:55:23 +0100
Message-ID: <11912593.O9o76ZdvQC@eto.sf-tec.de>
In-Reply-To: <20220129110342.50853-1-deller@gmx.de>
References: <20220129110342.50853-1-deller@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5536966.DvuYhMxLoT"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart5536966.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 29. Januar 2022, 12:03:42 CET schrieb Helge Deller:
> Add minimal vDSO support, which provides the signal trampoline helpers, but
> none of the userspace syscall helpers like time functions.
> 
> The big benefit of this vDSO implementation is, that we now don't need an
> executeable stack any longer. PA-RISC is one of the last architectures where
> an executeable stack was needed in oder to implement the signal trampolines
> by putting assembly instructions on the stack which then gets executed.
> With this implementation the kernel will utilize the assembler statements
> in the vDSO page which is mapped into each userspace application instead
> and just put the pointers to the signal information on the stack.
> By dropping the need for executable stacks we now avoid running into issues
> with various applications in Debian which nowadays want non-executable
> stacks for security reasons. Additionally, alternative stacks are supported
> better as well.
> 
> This code is based on an initial implementation by Randolph Chung from 2006:
> https://lore.kernel.org/linux-parisc/4544A34A.6080700@tausq.org/
> 
> I did the porting and lifted the code to current code base. Dave fixed the
> unwind code so that gdb and glibc are able to backtrace through the code. An
> additional patch to gdb will be pushed upstream by Dave.

There are a few extra newlines in the first few files which you may or may not 
want to remove.

OTOH I would split out the change to mm_context_t into it's own patch, without 
adding the vdso_base there. This would reduce the overall size of the actual 
vdso patch and eases review.

Eike
--nextPart5536966.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYfVVWwAKCRBcpIk+abn8
Tgt5AJ9qEkRfmbd0FzX1L4pNR3PE8CjqowCfZ26QrpoHKACXNeWykwImMeFBBE0=
=oHhe
-----END PGP SIGNATURE-----

--nextPart5536966.DvuYhMxLoT--



