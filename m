Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798D8483837
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jan 2022 22:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiACVKj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jan 2022 16:10:39 -0500
Received: from mta-tor-003.bell.net ([209.71.212.30]:14292 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229677AbiACVKj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jan 2022 16:10:39 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61CDAA04004C3C45
X-CM-Envelope: MS4xfL2yfX9TMCei3N7nVX7ysLGt/ZI2sEcIgJn12hp+MQF9/55ASZu2XtixGhpQgEDxHup6da/Wv/V7Q1XTnr7TWxkpRBXS6zYMQi6Fz9gh/PsFgGrFXu3c
 84zNWPGil+gMVNt9IykaS5xKbRa+lmZ0DkmhpWYQm5YuhTGCvQgvPI/sK9QxVhjPMbDisk9Yg8w6FwOviC2xoDVp8NEfBumqNaAXlzUFj3dGwuuuuSDfjA+9
 /by2ourWsEUDBeaSCp4vftf83nIcgH3F3CL62moa56zXxUtcEnrcR4idx4aspepQVpCBHEDyWvFx+S6Wbf3gy8HrzLY9AvQStRPoDjpulgp4Bg1qer/Zj0ty
 puleoOvpoKxwgaAZ4OWrkJ4mMKVnZ2ALvfrYM7oRBcxvhlI5v/3CWsJUxEohIRe0FHGhhSeNxY0WXEg1yuHpeqKG9kA7JqT8RWefTh6VV2T3lJj0JyjchkNX
 OJyD9+WT01p4ByePB/agDx8n/3mwoY0qMTJhFamlMadC99YRiB64OP5t7xJ+D2+UU28gAccjm7qhJfInJQSZqUQVgj0dTlYR7KjukJWlu/EhanYjcto6JULi
 fHCZ7pL1SwenamiLEbqzGfl0aZUBPZ0aRBVkEbmyHDTipA==
X-CM-Analysis: v=2.4 cv=W7Vb6Tak c=1 sm=1 tr=0 ts=61d3663b
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=DghFqjY3_ZEA:10 a=FBHGMhGWAAAA:8 a=LVJCPOB_KSwBrqieht0A:9 a=CjuIK1q_8ugA:10
 a=pODiGUl5tNH4U3vn-ZcA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61CDAA04004C3C45; Mon, 3 Jan 2022 16:10:19 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id A2F77220117; Mon,  3 Jan 2022 21:10:18 +0000 (UTC)
Date:   Mon, 3 Jan 2022 21:10:18 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] hppa: Show registers at KERN_CRIT loglevel in
 parisc_terminate
Message-ID: <YdNmOmz2azAoLuwU@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="78b/FWR4N/Dm6r1+"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--78b/FWR4N/Dm6r1+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch displays registers at KERN_CRIT loglevel in parisc_terminate.
For example,

 Backtrace:


Bad Address (null pointer deref?): Code=3D6 (Instruction TLB miss fault) at=
 addr 00000000e09b5d5f
CPU: 1 PID: 30812 Comm: Qt bearer threa Not tainted 5.14.21+ #2
Hardware name: 9000/800/rp3440

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  000000ff0004ff0f 00000000f3c11d93 00000000e09ba3d7 0000000000fb4528
r04-07  00000000f3dafcd8 0000000000fb2730 0000000000fb4548 000000000000000a
r08-11  0000000000fb9a60 0000000000000000 00000000f3dafcd8 0000000000000000
r12-15  0000000000fb9a7c 0000000000fb9a74 0000000000fb9a70 0000000000000034
r16-19  0000000000000001 0000000000fb9a78 0000000000fb2730 00000000e09bfa3c
r20-23  0000000000000000 00000000e09ba370 00000000e09bf76a 00000000f887cdc8
r24-27  0000000000000001 0000000000000000 0000000000fb2730 0000000000b00970
r28-31  000000000000000a 0000000000fb3550 00000000e1629ac0 00000000f3b12303
sr00-03  0000000003645000 0000000000000000 0000000000000000 0000000003645000
sr04-07  0000000003645000 0000000003645000 0000000003645000 0000000003645000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00001100001111111111100000000000
FPER1: 00000000
fr00-03  0c3ff80000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  41143c0000000000 40b77080f7b1f342 408d169e3fb4abb2 0000000000000000
fr08-11  4051d93d8a819523 40538f743d58009d 40520029ad7a1ee0 407e8d24303158b6
fr12-15  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr16-19  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr20-23  0000000000000000 0000000000000000 f3ad5af4f3dafcd8 00fb1cd800000000
fr24-27  0000000000000000 0000000000000000 40590001083547bf 0000000000000000
fr28-31  0000000000000000 3fd8e4f30713752c 40836297d7543512 4073d11b7867ef74

IASQ: 0000000003645000 0000000003645000 IAOQ: 00000000e09b5d5f 00000000e09b=
5d63
 IIR: 43ffff80    ISR: 0000000003645000  IOR: 00000000f570319c
 CPU:        1   CR30: 00000000551f0000 CR31: ffffffffffffffff
 ORIG_R28: 0000000000000000
 IAOQ[0]: 00000000e09b5d5f
 IAOQ[1]: 00000000e09b5d63
 RP(r2): 00000000e09ba3d7
Kernel panic - not syncing: Bad Address (null pointer deref?)
---[ end Kernel panic - not syncing: Bad Address (null pointer deref?) ]---

In this case, the dump isn't very useful as the crash appears to have
been caused by a memory TIMEOUT. This caused a HPMC.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 892b7fc8f3c4..978bda16c71c 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -117,14 +117,12 @@ static void print_fr(const char *level, struct pt_reg=
s *regs)
 		PRINTREGS(level, regs->fr, "fr", FFMT, i);
 }
=20
-void show_regs(struct pt_regs *regs)
+static void __show_regs(struct pt_regs *regs, const char *level)
 {
 	int i, user;
-	const char *level;
 	unsigned long cr30, cr31;
=20
 	user =3D user_mode(regs);
-	level =3D user ? KERN_DEBUG : KERN_CRIT;
=20
 	show_regs_print_info(level);
=20
@@ -160,6 +158,11 @@ void show_regs(struct pt_regs *regs)
 	}
 }
=20
+void show_regs(struct pt_regs *regs)
+{
+	__show_regs(regs, user_mode(regs) ? KERN_DEBUG : KERN_CRIT);
+}
+
 static DEFINE_RATELIMIT_STATE(_hppa_rs,
 	DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
=20
@@ -452,7 +455,7 @@ void parisc_terminate(char *msg, struct pt_regs *regs, =
int code, unsigned long o
 	printk("\n");
 	pr_crit("%s: Code=3D%d (%s) at addr " RFMT "\n",
 		msg, code, trap_name(code), offset);
-	show_regs(regs);
+	__show_regs(regs, KERN_CRIT);
=20
 	spin_unlock(&terminate_lock);
=20


--78b/FWR4N/Dm6r1+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmHTZjAACgkQXb/Nrl8Z
TfGm5xAAnyEs5cxJiQ+DWaftnAbFCc+Lw8Mh2c7IzeGP5+i6jcXcUKHnOt6qwGJx
3KpneTidciBGPY9LxIVjewiDJuuCU4xud/tYFl0NwrJ63K/MIGGZG4MyiocVbbBW
XDV4tz4rvkJaMofeEy7VoUhnBw6x42yKyJ0VO3ISiz0AIV4sLGG8vGwN2ImXaf3+
sdEgTA+hUA1sUsPb7rEztEbQNGrhOamm3i2q/2FVTFAHEPSUDpzFDq8Z3kKjtqFu
i1tFM13C5P9kZLgSAkAaL8fORx3t8/O5e4kH3bQQO8JrM739gkBmqPU6ry1o2Nw/
fYfMUcb645ejHm5fFiRe8sCQ99dHQU1HwUHPdyRQuOmkNLi2ds4rd4EIJPMaU9K5
vXpWCcW1AkWdrQDK+OPIpRLCpPPCVoZXf2Dl5T5tsVmnlktOoDiHuWc6970v+6iJ
qPXpCRqgL2q5cTOcHej2yvsAlVfn4pgDGwbuHaijk1Lu6fzbLMLZxv/sj9Wd1nTz
cxSl6QqQhkJi4JAFLfpSu+YWEqi4EwaFhUeAw+bD98DMQpoMVZD7iWgeRM8vbKZA
7trD35u640M5pfuJmepkm06FOFHJvyCc6EvKmB1rB1W2/6yyeluRXtvmuveDKaKr
Twj35LWJB4abui+5wdvVXQQfcaVVKY6eE/NgCTaxRZF0rGMwgQo=
=+Cqm
-----END PGP SIGNATURE-----

--78b/FWR4N/Dm6r1+--
