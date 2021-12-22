Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0EB47D566
	for <lists+linux-parisc@lfdr.de>; Wed, 22 Dec 2021 17:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhLVQwl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 22 Dec 2021 11:52:41 -0500
Received: from mta-mtl-002.bell.net ([209.71.208.12]:47210 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S241876AbhLVQwl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 22 Dec 2021 11:52:41 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C30F2400095587
X-CM-Envelope: MS4xfLU45YBEtUWuTbQ32pYM/I4cK4tORnBtA7g333UXaeuIMA5EpLu33nmbfWcBQZNuuNz8zYZ8MLuGJSVG9Wc4cP4MSTchCR9w/kGLxsJ0+n4B31qr545D
 Zxeo2lAfVOn5d6REhAwRE2BfBoOSgLC6fPdRpCMsO2HATn4CCv+GDpAcxjFd5voZO2Y+yCGGUPWfIQyopJTNmjR1sfJwTCDTrlVLHbF14pR0H4v8jY5ZUaDE
 uuTF8K1sNmnRFNtMtFchSJiyArh2CSCgmGoPhrhsyH9KFysVnECQvuXm5hYLAO8K43DlRdhQBBCzZPyiXFBlvYKPt67b+Np9Y6E7wxtE8YzNui0pGcs0Eais
 VKCyucnrgXqAJoUi7fz0J8/gWsrnIeUzrPMk6cRderF4h+rf0e5HXQ3yT4b3uNMAjqg/iNIsavcdgJrc3MsJrb310JUoVd7sDkNt4Z/86lrDD0uN4kTs1vaa
 AOMZkgEiROdRe6a8ioeeYg7rw9zHujww10Q85sAiRoCc/QwYndahMt3VEeMVigpAK6pn9LPB+Sz7QLNm9tmqPFXLcm/mZlMKvni1uBbLagGdB0rJEgZax/XW
 OuR51mdhT3Ta+hvKUfP3DWEr6cGX2KCSgMwtfDxLXACcAA==
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61c357cc
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IOMw9HtfNCkA:10 a=FBHGMhGWAAAA:8 a=wnWNGUwH9116eJnOQ_8A:9 a=CjuIK1q_8ugA:10
 a=73c9hXH3EY9_ETVnencA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C30F2400095587; Wed, 22 Dec 2021 11:52:28 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 670A9220117; Wed, 22 Dec 2021 16:52:27 +0000 (UTC)
Date:   Wed, 22 Dec 2021 16:52:26 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James.Bottomley@hansenpartnership.com
Subject: [PATCH] parisc: Avoid calling faulthandler_disabled() twice
Message-ID: <YcNXyu1yyVDbyryN@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cqpUcgRQxg3eWvAN"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--cqpUcgRQxg3eWvAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In handle_interruption(), we call faulthandler_disabled() to check
whether the fault handler is not disabled. If the fault handler is
disabled, we immediately call do_page_fault(). It then calls
faulthandler_disabled(). If disabled, do_page_fault() attempts to
fixup the exception by jumping to no_context:

no_context:

        if (!user_mode(regs) && fixup_exception(regs)) {
                return;
        }

        parisc_terminate("Bad Address (null pointer deref?)", regs, code, a=
ddress);

Apart from the error messages, the two blocks of code perform the same
function.

We can avoid two calls to faulthandler_disabled() by a simple revision
to the code in handle_interruption().=20

Note: I didn't try to fix the formatting of this code block.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index b11fb26ce299..8ad184741d95 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -783,7 +783,7 @@ void notrace handle_interruption(int code, struct pt_re=
gs *regs)
 	     * unless pagefault_disable() was called before.
 	     */
=20
-	    if (fault_space =3D=3D 0 && !faulthandler_disabled())
+	    if (faulthandler_disabled() || fault_space =3D=3D 0)
 	    {
 		/* Clean up and return if in exception table. */
 		if (fixup_exception(regs))


--cqpUcgRQxg3eWvAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHDV8MACgkQXb/Nrl8Z
TfF+HA//cZ02DiqowfIISbiwaGXDm6TNAi7Hvk4gZ4VBeEyK1pbLbfRHoDW0UNs+
x4KDCMpS4wv6krq+8+E1ttu/X3hneBLcEFGv1tA5LYbmFrOa/xPSDtsjh5Dn15Ai
rhdBIr0g9LewJe1+jGBDX/5QXRFPaidGfQ6YUbAMiASh6BupsG9vGqSpVnI8Gxdy
xMPK+pfwmuCyPJa0RQvu6MwBYLPVTmoDrxcBw/iBwPDjmcnBPtHHYLITdx7pnRtT
4RUNYLXmpUVOqerr0I/tLFFV8Q5UfwCIu6RWt9zPGAYMtggmkorft7mfvzFFjWqV
19qLrzYZ2P0y/9kB13cvZ9KGWSW3d3fZzyAfOOtPkmtbDuB3ZteHDjiAtLEoSBjE
tovPtmXSQK4W6oFmKnm3kZpqjB5y5d99/pTJmfFBAv6ot3fp7EPCR/2VsmECFOi8
zbhw7/ZDuZLFCWgpypNdJFEuPzld8feFk582oJciDp8fRmu/wf/TCisjaG6iT2wf
BkRzl2xMed4mDSRQr1AKPiiyOvbzXy0apGjwJbmy+WBsAYLHBCCpP+bU1I0S5adC
t1gFqzkWI/oj+wUtmp8D15iYTOiuipotLees/AbJOs8M5NEtvRnJ6VBNZEoCr1Pe
yUYT1NbGPc0MvGmLUf63h8E4b4EygKIMr0hayeejeVnUqIeGbSs=
=aLHG
-----END PGP SIGNATURE-----

--cqpUcgRQxg3eWvAN--
