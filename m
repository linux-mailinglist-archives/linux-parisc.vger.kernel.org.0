Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A97A4D3C06
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Mar 2022 22:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbiCIVYw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Mar 2022 16:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbiCIVYw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Mar 2022 16:24:52 -0500
Received: from cmx-torrgo002.bell.net (mta-tor-003.bell.net [209.71.212.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A78938F
        for <linux-parisc@vger.kernel.org>; Wed,  9 Mar 2022 13:23:52 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 621B3022016BA449
X-CM-Envelope: MS4xfPumMMLC8CqmikR+b32EBLh+O4IMhrjMWz+XcsSXu/fYHTDOU1vcFfZJG8E/xoLrScOc101BKxzxr3F9tJIIOoefszs63puNJYeR6NTpgRqpC2rcU0Mm
 2B9yQWPu/TOCL4Iszj6wXuNRE+q6vtGsiMkaUqbe+bglHs9AQsQlPff1OZBakXbHZbtChPrFuXgyuF427PDrcwToo6wRQby9JkIa8MNaB41xtVCYuaw/qHMi
 +k5mmZAB2c3niAZvjIjIg7J5hJbKjeK9JP6GbY2/mei1U2yLM//zsLyLYjCBTi1szJnSX/n6D33HoSuIn2vpupJoaIPFQcg1ajxoGFvl/5dhmlD3/C5cfZBQ
 WDDBrFITTC5Sx7pGyWo+ma1CQgm6pjK7WgYR+eBFde0qpUbmD61XTCzS3bH1+Yx4cw5fxz1Jj5VElRrJ+2yz3IJBExFfaHlw8ksXkwFLvr7FvXhrYQIKiKoa
 J7LUJT/UjNAxo1NETHjqy1iInpj3rgVNOM42VSevQNjtJeJ3e73ecQbrbuNzIfqgCmdBUN4i5vT4fvqYSqvKAD/bw1h3rF6dRwebig58BnDblu7Qcrv6USTG
 svfI8DhNJFFNmfGjIyKBPz2Bt2W4eyQNpjj9lMQsB4ip1Q==
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=62291adb
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=Zau3mHOBwhKTnCBnnckA:9 a=CjuIK1q_8ugA:10
 a=EPIGKhmQmzm14eOhI_UA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 621B3022016BA449; Wed, 9 Mar 2022 16:23:39 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 87B6A220115; Wed,  9 Mar 2022 21:23:39 +0000 (UTC)
Date:   Wed, 9 Mar 2022 21:23:39 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Simplify fast path for non-access data TLB faults
Message-ID: <Yika24Ovf3mNn2qr@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2OzYWSJPpW5fuht1"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--2OzYWSJPpW5fuht1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

With the latest cache fix for non-access faults and the support for
non-access faults (code 17) in handle_interruption, we can remove
the fast path emulation for fdc, fic, pdc, lpa, probe and probei
instructions.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 6e9cdb269862..ecf50159359e 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1288,74 +1288,12 @@ nadtlb_check_alias_20:
 nadtlb_emulate:
=20
 	/*
-	 * Non access misses can be caused by fdc,fic,pdc,lpa,probe and
-	 * probei instructions. We don't want to fault for these
-	 * instructions (not only does it not make sense, it can cause
-	 * deadlocks, since some flushes are done with the mmap
-	 * semaphore held). If the translation doesn't exist, we can't
-	 * insert a translation, so have to emulate the side effects
-	 * of the instruction. Since we don't insert a translation
-	 * we can get a lot of faults during a flush loop, so it makes
-	 * sense to try to do it here with minimum overhead. We only
-	 * emulate fdc,fic,pdc,probew,prober instructions whose base=20
-	 * and index registers are not shadowed. We defer everything=20
-	 * else to the "slow" path.
+	 * Non-access misses can be caused by fdc,fic,pdc,lpa,probe and
+	 * probei instructions. The kernel no longer faults doing flushes.
+	 * Use of lpa and probe instructions is rare. Given the issue
+	 * with shadow registers, we defer everything to the "slow" path.
 	 */
-
-	mfctl           %cr19,%r9 /* Get iir */
-
-	/* PA 2.0 Arch Ref. Book pg 382 has a good description of the insn bits.
-	   Checks for fdc,fdce,pdc,"fic,4f",prober,probeir,probew, probeiw */
-
-	/* Checks for fdc,fdce,pdc,"fic,4f" only */
-	ldi             0x280,%r16
-	and             %r9,%r16,%r17
-	cmpb,<>,n       %r16,%r17,nadtlb_probe_check
-	bb,>=3D,n         %r9,26,nadtlb_nullify  /* m bit not set, just nullify */
-	BL		get_register,%r25
-	extrw,u         %r9,15,5,%r8           /* Get index register # */
-	cmpib,COND(=3D),n        -1,%r1,nadtlb_fault    /* have to use slow path =
*/
-	copy            %r1,%r24
-	BL		get_register,%r25
-	extrw,u         %r9,10,5,%r8           /* Get base register # */
-	cmpib,COND(=3D),n        -1,%r1,nadtlb_fault    /* have to use slow path =
*/
-	BL		set_register,%r25
-	add,l           %r1,%r24,%r1           /* doesn't affect c/b bits */
-
-nadtlb_nullify:
-	mfctl           %ipsw,%r8
-	ldil            L%PSW_N,%r9
-	or              %r8,%r9,%r8            /* Set PSW_N */
-	mtctl           %r8,%ipsw
-
-	rfir
-	nop
-
-	/*=20
-		When there is no translation for the probe address then we
-		must nullify the insn and return zero in the target register.
-		This will indicate to the calling code that it does not have=20
-		write/read privileges to this address.
-
-		This should technically work for prober and probew in PA 1.1,
-		and also probe,r and probe,w in PA 2.0
-
-		WARNING: USE ONLY NON-SHADOW REGISTERS WITH PROBE INSN!
-		THE SLOW-PATH EMULATION HAS NOT BEEN WRITTEN YET.
-
-	*/
-nadtlb_probe_check:
-	ldi             0x80,%r16
-	and             %r9,%r16,%r17
-	cmpb,<>,n       %r16,%r17,nadtlb_fault /* Must be probe,[rw]*/
-	BL              get_register,%r25      /* Find the target register */
-	extrw,u         %r9,31,5,%r8           /* Get target register */
-	cmpib,COND(=3D),n        -1,%r1,nadtlb_fault    /* have to use slow path =
*/
-	BL		set_register,%r25
-	copy            %r0,%r1                /* Write zero to target register */
-	b nadtlb_nullify                       /* Nullify return insn */
-	nop
-
+	b,n		nadtlb_fault
=20
 #ifdef CONFIG_64BIT
 itlb_miss_20w:

--2OzYWSJPpW5fuht1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmIpGtoACgkQXb/Nrl8Z
TfGMMA//VbVPaU4fEC1zRbJS3nnz17APZ38UDZIMZS0pFPuLqsKBZqRhNIh4i3QL
Krkm6yzUvAA0EePLZCO96fk7TPdQtQJ4WiofdB4TnN4cpRCZhebgi3Q/VI0jVxhd
6aUtP0iN1RWoGfHGOQTHvfOY6BRPc5Ebh1HQ/zjcvpmRHAgW2cVi13t83UHjADTU
0fbyD647Iz/eoYfxtm1b9t6Rxnvx8uUyFYE8xHvmsMvzAKm0Bl3aQcug1uNllzOv
vgVaNnAT/AJg0bYobsoDPu/dOZK90xBAP6WcJSqXOKdOAH5AtQCCxSRadcnt2ag2
Fd7InRNgzVUmjcaTtq68A04w4UT5szJTPziuMEVSYz+HJrU8PKqV6shenLy576wd
I33VPhp5gArhGtM7sJh/rRajZfcmvmM5gDSOTonsLaPYSTfpNHTW9h8dumZjRmtI
wm2nVjTGN9OlKXwczlEjaJLzh/6UkU2LAyT0SImREo/ubFRt3AG9M2+3qfzF4LV1
ZAltkAk1bkRCXcqT7YwzGG3VHRIcbULVOyKh8Mc5Q1QL8iR7v9Vftf4NTuiYCBoB
TEJqD48nxyRzROrBS0cFjcNjJiyrRnoUBA31Oh8Xt7bEVus7OYF6A/uXHoMnLmw4
9Qcbx2zwNjLVud05mVdYE6bHTXsuoAKCny/9gobae3RPO9UVsJA=
=68+l
-----END PGP SIGNATURE-----

--2OzYWSJPpW5fuht1--
