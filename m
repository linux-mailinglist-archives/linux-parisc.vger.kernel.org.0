Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6EEE4E7535
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359349AbiCYOkZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359353AbiCYOkS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB787972E6
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219115;
        bh=xFElwm2kmiOd3h2E96YL1yU97EVr6RYbsoZsRdaJNwc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Kulck9KECXWBptNj1HzpMyjuc4ZzKmf2mNrib/HW9nKKAEWz/px0C+JGO9D6hhgkD
         jh1IMuncNrQfQy1/DNKGztb1KuD0INeDoN4AaKcD/n9suNBndzfVQ1ye9GIL656zjc
         zHD/uLoDxrLfid2dTdGf7pFI+2HtjOfd9E+6RGBQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqb1c-1ntdV51QQ4-00mdCx; Fri, 25
 Mar 2022 15:38:35 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 07/12] parisc: Move disable_sr_hashing() into __cpuinit section
Date:   Fri, 25 Mar 2022 15:38:28 +0100
Message-Id: <20220325143833.402631-7-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q2QcQDM2S/MVL9O1Rvrz42gtITugvJh8YxKmJpDrZLi3HISAWUd
 hkfSub1KlC5T1bP/icELaxfvAicW4hJY7DolyvU1mID4omRO1mp1CmDhn61nswq4elftmf5
 IJfvnYeaW0QKytovsVdFfjikoYpmfnn88hcEXFRH4HX2FnzhvNOppKRctYODd0wAyfrR86M
 2KIjUhRiYs+nft7ApX+UQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jI1BTUql7go=:F8BqFz/4J5xAcNVYxaeI2t
 g0iSrva1Dc5IIGAjZR5tvcy1a5xVr5MsTyVt0PGmQowD0ssNjSKv/AJCREuSIzUMoH8fkn0Db
 oa8aSfaYbllSjKKP3nUzr1LMx9lRBfImgf0uqzEioFv4+/I64E13dfeao/4ZKOgevwJsSfeJg
 t+5zni0ecTFHh+HnNMaMnGTIsVPkMlxrYlTZYMc3kVeXovmtj9Sou5k9IIfwW6kq0/9yJlz3C
 Jpft2aY/nICjcN8YW+AJ4ul4/ebMZmuTX40V/jTUrB+kAXGzNWYek4AMKsa42L4sAZFE7Pp+A
 APljpOTtQvoAcZOTSNp7X8svn6XI03jtu5TvTvbQL3q0saW5vAWpTpxrnljpLMRN4lkohvCdA
 vSATkbjR+J2SnwFL5+2QsMaY3gXerv9blwBImz7ZrCE4pKdHJh4OPZWrb+NreR2eh5gF3o1Nm
 w+L8Z/M6XlPD9TwvcWnK1aHDu6PUyMkTGIYIgUEowq6JBcWCgs7DdR/cUvWPPC6SuJHQPW6yZ
 41mHEiPrXtSH0slMFTNfL90PayC1u2xH0xIto0TBiGI7ciL6Q8+F/BwabWT3lXkYEBjTyCwNX
 7Kxj20/wVQoldvq9ZGreLgfFniMTIY9pQ9zQCuJx5YjO7Stjd1n7sSEr13g1j3WKKOtEjNmUO
 jys1AM5lW3t9spRNdqSny20o5kOQwhOVurrlZyYfPUHIpjF7SqH9jPuYAOeLTZWe4ubjsIiok
 +ObCZluPslQYgY3UF2ztQdl9wAJXgbJHdUDuPCXI09t8wm/cD+pHwyMCQiEpjLVL9DcEhF3JE
 91JgjAQpaqlTVOYiKxJHvZVjG0RgFg0IiLulRNce1kojUjIdh9AgK0VjGU0W227rbt/bqV3vg
 iutuFQwsVpZG2uOHxCWmd/bfitpL+0I74t1l5xx105JG2y6fR2kHi5tdTAvh8atp/o0du8809
 fmSPhGBl8D8b8RW/NcQAdzayM3G4B0kdbXszeoGSCylh3sifnEaCjErEAkmPDSzNJAKXnk+7C
 +0BhsJwVWI7okWC2xVZoRZK/Qo33NhXGXWxBi7lR9A5WPt9EaGcwqAuQFDqeRl8EIzhTkzKc0
 dCGv8P3HcFpXnU=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 456e879d34a8..6be03d3a2382 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -273,7 +273,7 @@ parisc_cache_init(void)
 	}
 }

-void __init disable_sr_hashing(void)
+void __cpuinit disable_sr_hashing(void)
 {
 	int srhash_type, retval;
 	unsigned long space_bits;
=2D-
2.35.1

