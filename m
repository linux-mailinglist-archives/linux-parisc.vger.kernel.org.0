Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6869D52A695
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 17:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbiEQPaB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 11:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbiEQP37 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 11:29:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DE04F9D6
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652801387;
        bh=AtI6cxJvlls7QPJfLLVkiiWMpWtq0jk94S2/6mm1TS8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=k9tTqfzPyMWykSkZep5biNVyX9Hia/38UCpvFVeEOIw2wJkypEK/qFESWzXrzMRia
         bpseQgptH4ls2uaUyTkW+7zC1sZ+eWhjM3W2llF1r9YZaAgLjQ2j0dtWE05E1aCS0l
         7tByly1EdgCbYXJFbrPHw/wD29a8ON634/Kic+G0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.173.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1o5UnY3IKp-00GF6R; Tue, 17
 May 2022 17:29:47 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 1/4] parisc: Prevent ldil() to sign-extend into upper 32 bits
Date:   Tue, 17 May 2022 17:29:43 +0200
Message-Id: <20220517152946.187638-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BiAdXxMYj7wYHI+jQreb66Rgufktb9unCLIEZpU+0fOTUnLWxU/
 yPmKjAyP9OrRt5XuTRWscoOVJ8/l6aK4op3++cpe4cz03qF0bwuWd0H3/7PDzKdTTshJSeJ
 U8QWXt8eh9w4gxiWNn5W0V7QZ7itLsy+GEBeha7jaJZJHSA45Ekc1jwqUtjL0qBtqUVWcOb
 GVrZwYyIYjPMoY3o+uwyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H5fpUgZo7x0=:1E9e5mFuPLieqVTabB12Kp
 nmZxKwDs+wKtb4KTeuV0VpzmKku1o6XaCyk9GF0VnNvb7x1wSs2zWlEVPMHGj258W1IJxTesV
 rFiOnOLOFZdIXTqHnz4ldbOV3gJSfyuXvwKripG4CT0sKjvgVcYt2TfSovjt5CHyGXjys90aI
 czoQVa7DUtpQH7qzZlww/ilpxTSJ6ts9gn4wgQhwrEpIIR+r1eHmWKseticlewxGZlVuOYm7+
 7UlYXB6Ah2QS5TX2JZBzxNLnNyu9wG6Gc9diicaf7SlXXiJjLHkZ/p349BMO6rGD8jKH+r10v
 6/4+riyG+cMglFTh0FnGzlrEkQwC+0DfHwA6/6/1f52YqEQHsNFWwnGRa61RJaRm6wfMckJom
 j9ayIRLhwTxbXrUNop1dtf+y+FtFrbG72mXNq1x2n1RoeC8ds+KxD8ngGDiVlgTCiNcX29oZW
 4Dy0e5imdFxy3vOq2bagRMOuQeVo/fhTXpskTRenW9PkuoWGXMoWrQmoeXl+/TpGhsXY6z3n5
 bxxvkIOXD02uZMkXDajsruw1ptzre4CLb3r1ldYy50SMJldfrJkQX/8jfJq5mseon4yfi8RPe
 KSnCQ5zRQHTFO1+oTjyo6M5+NsWMFrD1vZbrv1ZjB9T0t0TFfY3avjwjfmNwC7vhzijF2gqVk
 r74DN8uF6FZh3MeUJNCd5lZYL9ZSHO9w/ltF5wyEyG7fPr9aDhfRaxkrHZx1ol3IW6Jn4aQLJ
 xefmiYTVR1L5/LXXKeQE1JYUMvsalDTE51zjCt4c65Nh10dTJn8PpKcYZPejHdAiCsuRUMCDX
 TeScMhH6Apj1tc5RXY2vBaEeCY/6amWbq/15E+FzRdeBFQB25DOOAi0/P5nRq7OaDcuSQaPHt
 dqKhdOyaqEfqKjUhQc+figX1mFkRSRaG8fiPCwtTUY88HKKrn+J75itmag7+Nb2jrT7gs9yNO
 MtPazAK9XjuA0WtmN592V15CgLw5rJA6y7FkdRoW3PFFQPt+bbv14L7D359iaPxypxvK94cBS
 1rS7jPYgJJDp154k9nWFIUBa81GXVtUJSUw4DodeU+3NkvJzxJYrMhH0QouykuREwKDAXwBnm
 VjovDETuJEwue6UE5bITJ0xn/QD/MqJ3ItRaSZJW2I4JrzC/Q7qqZu6Ag==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add some build time checks to prevent that the various usages of
	"ldil L%(TMPALIAS_MAP_START), %reg"
sign-extends into the upper 32 bits when building a 64-bit kernel.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/mm/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 1dc2e88e7b04..0a81499dd35e 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -555,6 +555,12 @@ void __init mem_init(void)
 	BUILD_BUG_ON(PT_INITIAL > PTRS_PER_PGD);
 #endif

+#ifdef CONFIG_64BIT
+	/* avoid ldil_%L() asm statements to sign-extend into upper 32-bits */
+	BUILD_BUG_ON(__PAGE_OFFSET >=3D 0x80000000);
+	BUILD_BUG_ON(TMPALIAS_MAP_START >=3D 0x80000000);
+#endif
+
 	high_memory =3D __va((max_pfn << PAGE_SHIFT));
 	set_max_mapnr(max_low_pfn);
 	memblock_free_all();
=2D-
2.35.3

