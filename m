Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0714410E0
	for <lists+linux-parisc@lfdr.de>; Sun, 31 Oct 2021 21:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhJaVBS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 31 Oct 2021 17:01:18 -0400
Received: from mout.gmx.net ([212.227.17.21]:56017 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229974AbhJaVBR (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 31 Oct 2021 17:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635713918;
        bh=2ZaMzFCyoJiqJVCWfovUlcxxsEFg4UCitJyHxWEpuCo=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=aQwpczHRa9exa3LYtuBnQ8Ztg5qpUSBuNybM/Zl9149uSP9hxawuMIzzZ54wP/ujS
         CU/r4QJFfc+0ZkRCEJh1AwFL2iQ3/CJVUXdgVpnpj+knwzcOvzvCWWV4GZDdpxsBup
         5AMxqrFCM05i8TEeIbT0/4FMFFwN1x4Ja44JNX8A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.174.201]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1Obb-1mnJCA3LqN-012n0X; Sun, 31
 Oct 2021 21:58:37 +0100
Date:   Sun, 31 Oct 2021 21:58:12 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Fix set_fixmap() on PA1.x CPUs
Message-ID: <YX8DZChVfaD8QjRp@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:xhgJ0JmkgRhQzBs3ZZIDFWBYBgHINJlIh3WTccYCKbkP0M/PE+c
 LgubAq9ODlywOpqA7C1GIcTxew2mVsE7vt116Cc1xTUrSZ1bzw9yAbPwIeWRwetJ5ybkhd+
 Wrzj5B7sJISUv3sxGqqLEWCnEG8fG/tgVDTJovMYJrBz5coFaUp2y54taIhhLCmeivU9QJZ
 wvh90UPCTjZTP+ywasN+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tO1V1/IIh54=:3sLWF+qa4ytNx8Iv2qOBLh
 8qoK9zIuw0BwV2dmoMHGwjXa++krsXJkfdVMooYQ8zh2R+ZFuh+Q50TG4UkCcxhY9WLjjUoNw
 GMYt817iU0vKR4ilQe7pTM+jRHWIV2NSNfxStzeF2zD9aT9OvNrvUewxfyxrVIx/PZ5//jiwT
 lTtIHCQKThxgNOMud73m7WpQJwsOdXAAV+MwWbavc8fhuUISd7A3HeFku4lKyJVjKGt3TJ4g2
 rR4sHKaMWDzGXAXaPUQ62CqnTKjjjl6GkQ6lQDDMgUrhMkg5lFAKMxDQq19XwHCStauCqvg3T
 kxn/NOtk7T+fjQHt8Tvivldl3fQqJuIxLeYzs2uLiJj2sZMuMNC+gbHIP79AV1YV1TP8ZzAb1
 mnXvewQzNXqI69PUBVkQQtlnlz11aRBk7f6IANWhy8fKC9JJ7/V7/mP+L7AwYItH552HatEaO
 zgWRhxQUNKhTMErXvjXXS5Tr6s2bdKdMxVQpaZT6pirC1ym6rG66D9sXG0n17MLNDYfN1SMr6
 g0JgF1pkNbEAjuFEfNbzufkaH8GWcab1GvEcDe1KnA/0pA/b+Ru+h2UcCnA0Svz4KLb55D6/N
 bb8kM4YZDbOoBLK6fC9R6TuT0jkSOdScBgB+q9LUgkpKueg4wYlyucF/u0dlB9K1TFsYw3jrV
 GDp/i7cv3sfeQdUMCsBvozgZVEF4M+AM30vpPe+e+ZVBB15bWf8zPasB9DNUhmsHt1C6gtuXQ
 Q0yRFaFu4F3t+/o1GU3TJwP/oNk/wUayqaabGRfTtibCSAIxfhQn+uzf88LxHVo7eSJqLMksU
 XjOXj/m26TgwPtlkGdYwtFNugRRAJPKETBXQ/UVu7kaGUAeKi6uVpFOuWKlBF9xbUenMZ5dbD
 xzuCspgI9+CJz/7l3lxVC8UiRZqChkpBlgA+kgEuxKx7XW6+qtCS3sFEVyf998pMOU4RjPRiO
 q7rT3zMLPa+0+Xugjq3A/cExuee4c17myF8dVbRzX58HThS6CxEKLG33bWjlimoWW5MFBK7Pp
 Ib8LScC3eB0KjLmDgEjNF3+IEf45gx8iHfJAwSjiw/2JWKK0azpmHjAQxnfl9DEAR4opAq2vn
 4QqbrbLG9aYtjI=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix a kernel crash which happens on PA1.x CPUs while initializing the
FTRACE/KPROBE breakpoints.  The PTE table entries for the fixmap area
were not created correctly.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: ccfbc68d41c2 ("parisc: add set_fixmap()/clear_fixmap()")
Cc: stable@vger.kernel.org # v5.2+

diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
index 24426a7e1a5e..cc15d737fda6 100644
=2D-- a/arch/parisc/mm/fixmap.c
+++ b/arch/parisc/mm/fixmap.c
@@ -20,12 +20,9 @@ void notrace set_fixmap(enum fixed_addresses idx, phys_=
addr_t phys)
 	pte_t *pte;

 	if (pmd_none(*pmd))
-		pmd =3D pmd_alloc(NULL, pud, vaddr);
-
-	pte =3D pte_offset_kernel(pmd, vaddr);
-	if (pte_none(*pte))
 		pte =3D pte_alloc_kernel(pmd, vaddr);

+	pte =3D pte_offset_kernel(pmd, vaddr);
 	set_pte_at(&init_mm, vaddr, pte, __mk_pte(phys, PAGE_KERNEL_RWX));
 	flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE);
 }
