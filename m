Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75A352A1F5
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 14:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243529AbiEQMte (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 08:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbiEQMta (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 08:49:30 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0EE3F333
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 05:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652791757;
        bh=FL21i3yS3wtZYk4znGGg9fdebD1Mf/Blbyn9lNsto0Y=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=U9JIS8UZsGElOxQiqI1Cx+GZK2sSL/BTSA9YEPjXwbH3hjqUdeaNvImK+vyLCtZFg
         s1tUCco1UV51axCM+HSZ/CPDN6pw3ZWsqvrRjbv0z4lY+qepiWC7zNRKeIAUn8jhyu
         2b0zje+JMh30gOVBV8Z4nvJBx29nt4uabfjv4hKw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.173.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wPb-1nwh8Q33PP-007Y3Z; Tue, 17
 May 2022 14:49:17 +0200
Date:   Tue, 17 May 2022 14:49:15 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Prevent using same register as soure and target in
 extru/shr
Message-ID: <YoOZy3A3R0i0DUWB@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:neyPs2YhlPSoUN7hHe61uVQ9qpUvJ+8Czl11WNWBFDulFKXxGGy
 brTyQPB2uzsc+fe6wPDMl2x7eyNoz8wdFSjF+oG1CEsDhJa8Nqdze6+2vTvLTimBOW1G3R3
 AJmyBC62WiL3SGmK7lJz6X+xLLVBJq+64qqeuyFYZF7byD+WSKlvvxkOrb1VmXGV55hQQe0
 AanaURFlioW514/zrosnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/Tc+Ro6JjE0=:klyP6nny+JTw5twdej/KdG
 /ZWnjIbNDRHpr8Y56A05Dli8hHu8QTnSn35C2FXrofCWslHbM1DqwL1qz0SjMp5+xE4I4fSys
 87l7G819TU1SBvO1/nEU7CkkbTJBRgRlNIvkqeZOWmXqMrJoAX002IvRpvtKCF6G6Uyxus1eA
 Z3ORapz2T3UaqMCxrxWa9Pcp6s94kCkeyUaCWbOhfKJJSEiO6xnstj0DDsp9CFe+Sb37GPooc
 9F/TdsonGhktHeSLJKJy6gV1worgTq4rsM0AAZhlxfl04bUDKw2gS79ACZbpdWhlRzfXd9cNS
 jJczOsWQiNU4shvTSgGqVh16BJkuDjx45aOXVExe0OEsCI6puLhvM89kCC9TG4V8G/43y7sfY
 53Dd4E4EfCHepNcSMBTr729mZ76PVUMXvWgJlC0cslSBvwOYbuRzL2B4u50YyDkfwh4MRusMd
 OFdNTkoX2l2wMDW7gazzHvU7YR097q55Wah5pb5qbWZJS+VJIVs3SiscOwwuj9xBm4QyttBvn
 tHJ4n16qrwFXAt9fNr2LsGoViqmot48wKnF2EfS96HIMd6QVe0U2XpUPiAtRiDcOLdGPRi/+S
 1JfDdkWZFGU2XWc901eo+z817Ia/uTB7KkpdwCzlo0oHauts85T/2ooovfmWAcDLFONiUVaFe
 AJJMUX/d7GVbdTnuZjOCo9mo/OLew9pT3lpX4s5bGz6oB6lxjFvXMw8HqBpSO/lD8DeWfl7FC
 tucNSQsS8am5qjBmfiamQiyAAvjxcWRsuJcx3qtjziVY5LyHoHK4qU9JpquNRfJ3gP2ndg7XV
 tITA9tTyE5yKlqstyFziX5AJ0fIjhGpXE6m0kF9+SdexUx/+aL0WafIWxWb48AVoVyenuelVj
 LNIXsPRmzH7YxO9lHjYoVyddeZe36dFdj9EO6kbs36UzlPOZu1DC2VFAYvCob//iLzwSl6s8B
 QH+Tv8pwiAdEI8Hx0Ep403OuT1sTpUpeHNyLfqrf0rfbRsp3fcMt8FjhSSWoMCAniYzh/ycuk
 ubGfWEsx3x74gwtJInizS1qSWVPHhWreAcL/bG72koN3jULMFGUtty7SXyHc1cS+uDlBvVv8i
 t67w83ZG2OEWvkrhZUtorAC5bmTBuQjeSeApD8bKNdaURhpGaiFthpsAw==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In 2004 Randolph added the shr() assembly macro and noted that the
source and target register could not be the same.

I did not find any confindence in the docs for this restriction. Maybe
it's related that on PA2.0 the upper bits may be clobbered?

Anyway, add a compile-time check for it now.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index ea0cb318b13d..ca1a12ae5ee7 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -146,6 +146,9 @@
 	/* Shift Right - note the r and t can NOT be the same! */
 	.macro shr r, sa, t
 	extru \r, 31-(\sa), 32-(\sa), \t
+.ifc \r,\t
+        .error "Can not used the same register (\r) in shr/extru as sourc=
e and target register."
+.endif
 	.endm

 	/* pa20w version of shift right */
