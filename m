Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A574849FD
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jan 2022 22:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbiADVkU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jan 2022 16:40:20 -0500
Received: from mta-tor-004.bell.net ([209.71.212.31]:19338 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S234316AbiADVkT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jan 2022 16:40:19 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C6317800D3EA8A
X-CM-Envelope: MS4xfHYTaDA1tS8ze9CKzLOYK9uuSJVSkLIlLz/dtZa0BcrUyapbL3JMUBRdnqZzdO9nNCzXgLBNK3U8Kk0QDuQy0be4bymO2f36aAS5btyM6UwXKEZ6a07q
 m5qD9oMXvHvk75LZUSAT0YQ2lD7txYROxsxlYQ/CjXvcA9AonG3tw7IC+d6oGpqYMIUfnUfidroMiheIPKQRKqUQKXqbjvOhuWpkmsjGgo0148zFMpHZr/K+
 86+BOPvvV1rbTCw01kUd8w+nK8GVVW51zFM8NrmAwa5Af8b1P3oKZl2VVOqBXk79+LdaHzjrd7pwIhKl5B1E+kmDmwFZpKUmccZZ1zO+AjLkajyIaH9/gv4H
 yH1ppCWwM+GeFlOCc5DgyaeOoMpLTFfTFbUKpuQvloYa8YFes5Yk7mgSSH+4EAnYWJZK6QzR5UgncUbCgqVveJvoeryZPt0MZq6yGVvitt7Y3DhXCgLXZskx
 CEt6mRKbSQ0VaqTNnaedCgWnWU1vryvV9lI4NbIOtBJAMk7CC8IhlpClLWfyfsEAK2su5PpxjUfuxIGWxQWdWS00gaAtLlFPA7fJaqbzKc8pGr0drXtclkT2
 nKmfCqPSTv1r00u1BUh+zKKY1ADzvRByRLnWZvw/9T2anw==
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61d4beb4
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=DghFqjY3_ZEA:10 a=FBHGMhGWAAAA:8 a=kFL441cg9DsEPG_3uPkA:9 a=CjuIK1q_8ugA:10
 a=0Maxw7URQSbRRFcBBY0A:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C6317800D3EA8A; Tue, 4 Jan 2022 16:40:04 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 38647220117; Tue,  4 Jan 2022 21:40:02 +0000 (UTC)
Date:   Tue, 4 Jan 2022 21:40:02 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Enhance page fault termination message
Message-ID: <YdS+srr/Jxt7uO+Z@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t9aAAttEoQ5Oyf6U"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--t9aAAttEoQ5Oyf6U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In debugging kernel panics, I believe it is useful to know what type
of page fault caused the termination. "Bad Address" is too vague.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 499e2e8f7f34..147868427b7c 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -266,11 +266,14 @@ void do_page_fault(struct pt_regs *regs, unsigned lon=
g code,
 	unsigned long acc_type;
 	vm_fault_t fault =3D 0;
 	unsigned int flags;
+	char *msg;
=20
 	tsk =3D current;
 	mm =3D tsk->mm;
-	if (!mm)
+	if (!mm) {
+		msg =3D "Page fault: no context";
 		goto no_context;
+	}
=20
 	flags =3D FAULT_FLAG_DEFAULT;
 	if (user_mode(regs))
@@ -406,6 +409,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long =
code,
 		force_sig_fault(signo, si_code, (void __user *) address);
 		return;
 	}
+	msg =3D "Page fault: bad address";
=20
 no_context:
=20
@@ -413,11 +417,13 @@ void do_page_fault(struct pt_regs *regs, unsigned lon=
g code,
 		return;
 	}
=20
-	parisc_terminate("Bad Address (null pointer deref?)", regs, code, address=
);
+	parisc_terminate(msg, regs, code, address);
=20
-  out_of_memory:
+out_of_memory:
 	mmap_read_unlock(mm);
-	if (!user_mode(regs))
+	if (!user_mode(regs)) {
+		msg =3D "Page fault: out of memory";
 		goto no_context;
+	}
 	pagefault_out_of_memory();
 }


--t9aAAttEoQ5Oyf6U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHUvrEACgkQXb/Nrl8Z
TfED+w//ZWckzbVb4Ye3rUP6BDqEMs9m9qRsV9//zk+cWba5oHouT+142UsOY5Ng
F+lZTxRz3cd68qkZvurcnivt2HGTxEFNJv3OZgDYNtIuC9ukVJZEAxg2IMome3V7
KZGrgAn3B/Op6FZePL5gJeJB4HbopgyxVrNxQPbQTzJScUEEK4Ez6pqG9V8tGCjq
XkWdB44ZsT7qNr8ZRI3WtNue4PHUJXWsqr7H6drNK0xulct7QJmmsvdbFmuUbXGo
dJQAWAvDaa7iV/MVMg8Oc8pplCVvFiGyf04DVhBquiIAcdzMIJEeAhGRqYiGbZ8y
OUFEew/q5j3YYNO/BJK6/RdKelSyN/bYRlzofslDxusY1qjzNXjd/8XRcE1pRMFZ
fJo9jZjOjpJfnYdve0tGQv//iAeTLspGMqkSDvXUW8uMnPEddYMWo8n4FEgOlGmZ
amKbb6V01hnLTgLkDTXlunNe3a7L0EDhVjapACQw+R0yPPH0oV4W1g4MwOV2pCmb
dgCFCedPr6WxvYmip/Cmpd3mWh+hY1f/rMulc0nVpM9zr+r4MWyZF+BUqlO9MwRE
OQKf+/7iAU0vxqLj7O6k9WKUxpEKIBe0RHy3VIkA2L26kYv7esrM6b9Gf0yp+/Cu
dKbUX1a7yrokhYJCN2ylUNieUgQX1otq/zUyw3yBSOfqOuI2DqA=
=KtI5
-----END PGP SIGNATURE-----

--t9aAAttEoQ5Oyf6U--
