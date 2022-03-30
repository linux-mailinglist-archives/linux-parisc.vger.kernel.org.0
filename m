Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A604EC6C8
	for <lists+linux-parisc@lfdr.de>; Wed, 30 Mar 2022 16:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347026AbiC3OlY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 30 Mar 2022 10:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243859AbiC3OlX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:41:23 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1D85553E2A
        for <linux-parisc@vger.kernel.org>; Wed, 30 Mar 2022 07:39:25 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6243249C0021DA0A
X-CM-Envelope: MS4xfPWb97lPoliU7pAZq/A4vxpiSKAueEgKN3FY6AG3/bBrYVailBamNHHAe/fX5+WkdkA78UjcS9TjaFkIlUUxYUJUMUUafEr97VRgqbCgtyKzl3OTlDYs
 5bPMWywfm2xTY/Zb68drtMRrcLII4kZdX9y4uAXl8uHAZy+r7HHdPbl+4iEJLyPP/PZPtGBeEmQbY7SLAQhamn1jDZ4VQA1aCav7zE8W4LOwI8deAPERznRJ
 INNxvha9rqV5I7WzLfjdLx0+Zjv4SpCNDA2IezMJi4nSvxGvG5JDREk+CAJrCEb5aUT7rDoGX/Xihrz6sNIaXlPAp6xWqhvhQcth7sJVBiHxxrfiHNQF4O+a
 m/D5Bljjg5fOsb2ksIc4LazHko7codI6l2xHzt4leeU2x9kdkDlIEtbsdRWFKqnehWoCovHeEkuL6vr4vkBxit2XpjnSre9nJ5/MBgKERpvhwlOstkgEki7q
 dFpkg6tU1BEJUn5QU64wh0SifSHxO3dy0QATYaLlHvGSnCxx0utEo+KgxlohJsqaZp7zWxl9vL8pkYnvPftpe5t6AEX3h/b2aUOyDAxMub40HduYi8E0KxIL
 BDDsjWm9VYbDeqfxNEoybsA46o4pldaCdGh652TS3/FL9Q==
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=62446ad7
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=A9HHB92PKj38awnmFOAA:9 a=CjuIK1q_8ugA:10
 a=6dC2SKYju5Z_YjFVazYA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6243249C0021DA0A; Wed, 30 Mar 2022 10:36:07 -0400
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 475BB220116; Wed, 30 Mar 2022 14:36:06 +0000 (UTC)
Date:   Wed, 30 Mar 2022 14:36:05 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: In flush_cache_page, always flush tlb if pfn is valid
Message-ID: <YkRq1YhoRloLL9dz@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mrF1SdyeoC4JD9sw"
Content-Disposition: inline
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--mrF1SdyeoC4JD9sw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The purpose of this change is to inhibit move-in whenever we flush
or purge.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 23348199f3f8..91d218953b5c 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -611,8 +611,8 @@ void
 flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long pfn)
 {
 	if (pfn_valid(pfn)) {
+		flush_tlb_page(vma, vmaddr);
 		if (likely(vma->vm_mm->context.space_id)) {
-			flush_tlb_page(vma, vmaddr);
 			__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 		} else {
 			__purge_cache_page(vma, vmaddr, PFN_PHYS(pfn));


--mrF1SdyeoC4JD9sw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmJEas0ACgkQXb/Nrl8Z
TfHCVhAAoDMM5DDrhVxmOVxLRR1kvf+nLBUJ+LRYT1XzmIZ0JjwIVWIY4atuWxoq
n7mlteqzCni+P+R723Vm8+m9pUj7BVcu00JEgX+ECFllJHumAo/ZaixuPx4rQPqP
RFqiOzIPuwmkxr0Hvt9dBhWMDNaS9KX43Z1ZCf4t9Mn4fSr+59sdvqPdwbg7Yun3
u949lsJwHRJJL1nfyP9TKCMcSwh89TyW+099mYmKUHsPIdlzSB5El2A2fZ3oiaWZ
iVwkqVVNCOKqxNC0Blpi53E0QMqhM8rcc/9JuWY7NSbH4DB7cFqIN1O/qiqUBAQj
0umJ5VTL7VtbND3AIWetfU5xePoeV0hdv+2E8vpwzPmq6pIAH1UUaxN++R2IZvn2
/18G/AStasTf8zB18Mt5ufcI/Stwfnxe2NNwr3vmOrPtRxwSzIJQJbUG0ZRbgm+u
JGXvAm4g90d2i+ARNC1Fb0He2TO1f0LdYcKHlT8vs9XbF92LOICd9AqJvyMaP0Jz
pz6Li+pnBtleeuSHrkuIh2bDt7SU8qDNkZVKtlUPyphz5BCmRTn0xjBjBco0/AMY
3qDOdyQVnpQ3Ml6VvCgfFpRf7pV7PmQrtC5csFpBnnHZjSaYqvAo5pLZDA3TfX9o
XKD+WzWlfGrUyAHikAxx86yOmuZ8cQ9Jxx1OXhnPSFb50R4G36M=
=0BJi
-----END PGP SIGNATURE-----

--mrF1SdyeoC4JD9sw--
