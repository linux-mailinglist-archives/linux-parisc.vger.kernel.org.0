Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B665505A0
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jun 2022 17:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbiFRPOs (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Jun 2022 11:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234440AbiFRPOs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Jun 2022 11:14:48 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 283F212D
        for <linux-parisc@vger.kernel.org>; Sat, 18 Jun 2022 08:14:47 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [64.229.209.22]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 62A8B9F2010E0250
X-CM-Envelope: MS4xfL61viGjL26CUWXlFUvhFq8YEGLphK20CsnzV1Xobr+46QC8XNXdSR9j0qd5DvaQmoRV5RSt9df8a7FFnBeOflctXik2m9yovdDiTCgch8E+R7eMgzQi
 pQBWlnbZiPFgG1bzQQbVheR1Liv4eZgzug+OcCHRsqPgT3zINbhU6GJuVyJwzMTSZiUvhLNCCCrcYj/uhxFDJGG/I8BdqDiLsfrHhOG0ubdH8bBKM3tU2u72
 LB1sfhBL0dO53AwnIaRUh8nVsa7mFZfGiYir1mLBoc7Yd5r9M4tJ5XXC7GUWqlMbVAFY2gsme/kNTcJqyKuk1WV+IyGw6nNfti67gp/M5juzRqaKzNaoS1s9
 XjXDfoHzbRzlE9QglIekhBR38jOPyCgsimlzVdwvouzgJd3SdkVnf5KYowH933CLBm5PW9vpbKbEnO+ByXGpGKKKoKO2YcxKlvIKvlP9RpzdT0800JlaDrz+
 Lt5pdhoY7V74ahriZEHPDvgn2JaUkRc11QIfNfXsdOxr89BoRXlzzfCa95mguq0OZUv7z867/8iEH69zepZOBrDQPzYPcJoJ0EV/BJI+ezJzQRAzoeu8q1f4
 ebB1ADCzXNbinD13ZMddtF+FoFquIgstdQ8zjRh/N0D/zg==
X-CM-Analysis: v=2.4 cv=XfXqcK15 c=1 sm=1 tr=0 ts=62adebda
 a=PzUcMIm+zPr1bDMlhKZIxQ==:117 a=PzUcMIm+zPr1bDMlhKZIxQ==:17
 a=JPEYwPQDsx4A:10 a=FBHGMhGWAAAA:8 a=Y8A-Gqv_znHeydJyftMA:9 a=CjuIK1q_8ugA:10
 a=hcHyN332xRUVqRWC6PsA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (64.229.209.22) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 62A8B9F2010E0250; Sat, 18 Jun 2022 11:14:34 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 3CC9F220115; Sat, 18 Jun 2022 15:14:34 +0000 (UTC)
Date:   Sat, 18 Jun 2022 15:14:34 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Fix flush_anon_page on PA8800/PA8900
Message-ID: <Yq3r2qO//NzJGVlO@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0OnSDIQ8x5OUGXwX"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--0OnSDIQ8x5OUGXwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Anonymous pages are allocated with the shared mappings colouring,
SHM_COLOUR. Since the alias boundary on machines with PA8800 and
PA8900 processors is unknown, flush_user_cache_page() might not
flush all mappings of a shared anonymous page. Flushing the whole
data cache flushes all mappings.

This won't fix all coherency issues with shared mappings but it
seems to work well in practice.  I haven't seen any random memory
faults in almost a month on a rp3440 running as a debian buildd
machine.

There is a small preformance hit.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 0fd04073d4b6..a20c1c47b780 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -722,7 +722,10 @@ void flush_anon_page(struct vm_area_struct *vma, struc=
t page *page, unsigned lon
 		return;
=20
 	if (parisc_requires_coherency()) {
-		flush_user_cache_page(vma, vmaddr);
+		if (vma->vm_flags & VM_SHARED)
+			flush_data_cache();
+		else
+			flush_user_cache_page(vma, vmaddr);
 		return;
 	}
=20

--0OnSDIQ8x5OUGXwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmKt69IACgkQXb/Nrl8Z
TfEFig//ZyNlmiiheBlhNYiHWs4KaIlvXUNNRy6T6lGkudZM73ewP06Jna3BtJBk
CL9JIsjVzIYlUjrj0+y7uevXFP5cHwsWrX+QxDqUYl3XWG1cnDtj8IG7hQFrWZOo
KlVtphOEqgeAWg7o1JCCxiaIEpLDS3iRSYNCEqEorV1tvkv8RgjSKIwjpa276t8f
P7bfv524+UnJwOA4YVNb0iPez6FWRFfJs9XBOM7CRRVa6mc8aAHElKHvZyjUf08+
dKoGF4VA/DnDyrua9pK72Yowdkgat88ji7MOuI3DydlhrvCzVyBykQPiMyWR3eL5
vER29j1ugb+7bjy5TElUwfQ1kqGbao+mA1BQjpfrzyM4H6vrQvQ7qZPMmbmdteny
/d5GjeiYIRyFHxe8/p63yoHH5WgrhaYp3D0KTs0ZvVF8Lz2LMReDGxVkxfyF+HPq
wUwvZC4GgTcV2G15OKcp/soh6Nf4JuQOCcsc9XDA6FQiEX/jBhAT+pA7IGdiVFtY
frx/n0o1lPhrQT/JVqHSBtSfigI/YGumyZkjO97fGHQi2xzY4wPghBZPEYyFgNUs
KLiIy9CLu9pwlIkj2XnbYXGy2hU7Q/1B+lOhhOcISyZxTIhKOpt/bF9FEy1GHcue
Xz+BdAKkiLrvnR/LLsof6zBlNlWhukDpFx1AB42vtdWQDr4qMzg=
=TV1p
-----END PGP SIGNATURE-----

--0OnSDIQ8x5OUGXwX--
