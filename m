Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F12D72A08A
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 23:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404237AbfEXVle (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 17:41:34 -0400
Received: from mout.gmx.net ([212.227.17.22]:56943 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404176AbfEXVle (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 17:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558734087;
        bh=xZGb58EzhPLHxzHebudUgMNYkefPWqA90AL34zeWfbk=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=MNPn2tW6amyzy9U+nDfqyPo8nMNUGV0S1z4zdu8HADHx3SxWxbr1oDuwca3BqeFPE
         //RWdyE/HFnyjHG9gYvD9D/3RyVqX1ZhvjMp/T+CbW4dhM6tiDHMDDJD1SnVNQAsF0
         G85+PDQFX3zlxs1h8bEtSpR399w8XuhY0tVn8pa4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.183.223]) by mail.gmx.com
 (mrgmx101 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MVrQS-1h60sA481w-00X2B9; Fri, 24 May 2019 23:41:27 +0200
Date:   Fri, 24 May 2019 23:41:24 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix alternative coding for PCX-U CPUs
Message-ID: <20190524214124.GA14765@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:69mxT2wjwvFWLUk8CXxU/6/l/tUSyQHwjGNa/j8oD2crCjUzw6u
 SCAaTaYj0EnmKOHhD26vOHzrs8AjT0Ncy4qh1853QVT6sY5NwALNTY5a5OdgpxNBI+XOKBu
 Ldbalxwsn0yLIDThB5nvUGbCXJEkSXIwXAXJIXm3tI5EXf5bEDm1Kojg0XknvU+20Su2KMk
 987LwJ+TWpwfeIwq/VbNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EE/ugbi2Fs0=:HTKUYAIU15MBUbmW4Lr8Bs
 24vPakXMaFEbgoJcHNiorYZIEw5txzYOHDkX3zAP/dQn5yxbxYL2HlmD2JF/mkf/EIsaOSoBw
 ZPugjyYXgNlS+hGciSuZBFc4h3AynEsHWwNwGHwXHHEJ9CJOaIiDctQ83BMVUN2yb+TPfRzNv
 9M0JCRLiOa+WVA3uHaiDV3E1dR9BPWPHqBSANirRVrqKExSmUbqTgKRE9Ovs4sWKwvb2glOoX
 9/cBlna01AyHwsd3LQJ6ATJGu4/UT8kcd+2scwfgkjvqtdSPNe2mavjNPM1AjlzA6xt5h6Cmc
 mrlV/fODWGd2m85nDRXY9T62/Csu5XpvglkImLW8lWVaZ8ICVcaP4y16Ubc2s8RlrcBjK8QAl
 Uh5TLdkKWZOqESuKmB6x2VFTkPvi5qLEDpWBcsn5ZC445eAecocSD/I5wrv7RaAUmTRVfZPGR
 g2DWikpOTh1WZmxSWMP6EqKAd1Ky+yLjtDyhHOxbjq2sEZfve/+4Tbrs8EscG+oIpmTT2nVEp
 s4X0lINyZer/MQHWButCnPGa2WcyWp8f+kPVjs2HKIN0dU+esjIfdyyqlbF+Nuz9PSoWYOHAG
 N+26AVH4J39V3fh5BLxVD2hFucmvk6FS+pA1qRlDfTWnGXx9xgaqFKlN5ikAQ9JZEh7Qrzd5W
 KVllu2FScRsyeNvIUjWBXPfV36T2VWprCn9HnVF5LaPMnciEdcGQVwf3CLtDVQHTSJ8W+/szm
 FTFZivXefIq5qOtg2nbq78yt545oly34A74GntU6CephhnB9l926EI7XtIr/xoucImgRTNjAm
 puXO6QpVNkfw8MOazk+O6hgseeVlQ9E9Ep4yQYr1nJsEk0sDNUMV5wQcxpz8qhaVYs/G4VDV5
 I5cEa2itJ7UcMLPtQFkyoQ/mPwGfg8DMqlmDvfixWWPjMmfe+0kTfMVDRO3ArpXvZEasT5XSz
 tX6P+b+TTAAUX+QmWdH8iBhywolcSWvY=
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Sven Schnelle noticed a reproduceable kernel crash (HPMC) on his C240
machine due to the alternative coding infrastructure.

According to the documentation, data cache flushes and sync instructions
are needed on the PCX-U (e.g. C200/C240) platforms, while PCX-W (e.g.
C360) platforms don't need those syncs when changing the IO PDIR data
structures.

So, let's not replace the fdc and sync assembler instructions by NOPS if
we see a CPU < PA8500 (PCX-W).

Reported-by: Sven Schnelle <svens@stackframe.org>
Tested-by: Sven Schnelle <svens@stackframe.org>
Fixes: 3847dab77421 ("parisc: Add alternative coding infrastructure")
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # 5.0+

diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index bf2274e01a96..7c574b21f834 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -56,7 +56,8 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,
 		 * time IO-PDIR is changed in Ike/Astro.
 		 */
 		if ((cond & ALT_COND_NO_IOC_FDC) &&
-			(boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC))
+			((boot_cpu_data.cpu_type < pcxw) ||
+			 (boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC)))
 			continue;

 		/* Want to replace pdtlb by a pdtlb,l instruction? */
