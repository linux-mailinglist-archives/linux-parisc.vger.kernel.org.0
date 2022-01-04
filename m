Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F544849F2
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jan 2022 22:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233487AbiADVet (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jan 2022 16:34:49 -0500
Received: from mta-mtl-002.bell.net ([209.71.208.12]:36700 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S234136AbiADVes (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jan 2022 16:34:48 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61CE3D3B005F41AC
X-CM-Envelope: MS4xfFnHH+Eb1Fe5jI+p3RjaPZUE0K1gh44cA1YpLl2cJQh6O+mggOcW4wMeFotcR7wM0md8nyIcda2q9zL4XRRqOa6Wm/EUVXlRDVIlAcDZOsCKBJ1SnLgO
 WXUPb+Qzp9CBUSnjxeYqYXQYZ/HMLNU8QQjIkmpgzj9hfuEXJfRS9qi8CUVLQQdzESDJyFQpK6aSN1oopLKr8bK9TTP6KtL/BqC8KPszb8jq9cd45skS/ARn
 8A9F7v/o73NFFP/Bz2w33JO4nnJw6GvfiDMeZ4VpMCZLyhP/915CaNTqUshu2KbxebTLqOcmo3r4qvQoEnJGh3Vm8xEwtV2kNTzNepzCyR6N+hGYUORmzUKZ
 vVhRQjxPL8byJn8LL0sdnkXuNuq25whwk9TG0GYQBTP7AFbJ9isS6TOm0uWcJfl28MSnU2HAAfUu3G34mtbE482QfGFR69O+e2/APPTjo5eg7fO8B47wi5Xg
 duTvqbAmBQn7/RGsVO+hxpy1zPsZPkaSYGjCZ7RhkEyEPyQQQSaGfb+p/SU9bWJOUzU9d5l1NUlnvxnoLAEvNOpB1YJwtVqX/bqqZD3FNFGtxafneIcbmgRB
 mWEX6Y+myPCh3DmuBplLVoRdssleCq7GcC6ydDiWFGX7EQ==
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61d4bd64
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=DghFqjY3_ZEA:10 a=FBHGMhGWAAAA:8 a=TLObkWdysBXqFXURvToA:9 a=CjuIK1q_8ugA:10
 a=PySCXoWds3VBT8ULBo4A:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61CE3D3B005F41AC; Tue, 4 Jan 2022 16:34:28 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id E2636220117; Tue,  4 Jan 2022 21:34:26 +0000 (UTC)
Date:   Tue, 4 Jan 2022 21:34:26 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Don't call faulthandler_disabled() in do_page_fault()
Message-ID: <YdS9YjUBSd6JPyu4@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rZjnt8cdw+hfFF1A"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--rZjnt8cdw+hfFF1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It is dangerous to call faulthandler_disabled() when user_mode(regs)
is true.  The task pagefault_disabled counter is racy and it is not
updated atomically on parisc. As a result, calling faulthandler_disabled()
may cause erroneous termination.

We now handle execption fixups and termination when user_mode(regs) is
false in handle_interruption(). Thus, we can just remove the
faulthandler_disabled() check from do_page_fault().

faulthandler_disabled()

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 01fd2a32acc6..499e2e8f7f34 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -267,9 +267,6 @@ void do_page_fault(struct pt_regs *regs, unsigned long =
code,
 	vm_fault_t fault =3D 0;
 	unsigned int flags;
=20
-	if (faulthandler_disabled())
-		goto no_context;
-
 	tsk =3D current;
 	mm =3D tsk->mm;
 	if (!mm)

--rZjnt8cdw+hfFF1A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHUvVoACgkQXb/Nrl8Z
TfH94A//fZnS/YrtrKiAfooNWTQhDWLvauHoEi99ipoYCisMM4GFSVmpeCwPTeC6
Nhm23EGVuq5RDGUA28MXaivzX/YPpCeNXiIF3xTBg5Mo9niWZ0h5ndqEr3q2raSO
lcYz79BwEEL/xGzDMG+c+sgN6WxzpoYea6q40XRa9YUtqhnljnDr8v8jfQRTMKAk
ErhsQPcTGzeKPejYNcGHgYBPagB2Kzf45+sM5Shs0FWJl0fvUW9K03j4dslW+Zh0
W5fQyGD8P/CoS4Xwex0qaP0cNiUKLQKdjjjkjOAO0kwty6xQfnrjtqE3rSFtTuCJ
DhhwAYzWeaDhhICz1mIxsEEuNWMdiWL4BF+RTSPqwL6i+QSYLIVFMRdOD56WJXTE
oCjQSG5wvbAXPoneqZ0quiI/gLfZo/O36C8awLfd8TiUJO/2arw2zKvwUMmR/Rel
wOcDHTfn7aFAH066y97MNwtLxPmF8hw5JhMvXZx68oq8+lZQva+VrC7H56Evr6UI
riA+i1jHW2QaFyxngZy6b97jCeilYhODS9mBjlFmuET13mSjHWSPyT8HFRtGSRlb
vwgQgxFFxQE1egLVpygxnWZ9CB+6FHfdALBJ3h2W6grqjZ/MVr5Uo1KBCc/T0Uri
nwCZOVBwREbROjnNDnG91iWO5TwLZb0/pSJlhvIlEu/KcM9+E7w=
=bAqu
-----END PGP SIGNATURE-----

--rZjnt8cdw+hfFF1A--
