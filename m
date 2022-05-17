Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC0352A693
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 17:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiEQPaA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 11:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243726AbiEQP37 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 11:29:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEFB4F9D9
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652801388;
        bh=Fc5qIZe4rJNu60cudMzST+OOzayPFdm81IC5dlxgg+Q=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ijx4jIG+Aj5fIBOzEGcfu/PB7cYcDnBwB5aQEnNMPtloPoLJdtImbDrcL1gKXPeqa
         71036BcRGfvyz0jlgGPHklD6Q/Iy1mefQcKzuG/fjUHwVwD34/25WjAvJUK07oiIz0
         dSMi7AnlMiWRRMxeb4AQPAF+6BAFWWZqzrtf6O1c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.173.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mdvqg-1nIC5a0Cko-00b2Gs; Tue, 17
 May 2022 17:29:48 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 3/4] parisc: Add a dep_safe() macro to deposit a value in 32- and 64-kernels
Date:   Tue, 17 May 2022 17:29:45 +0200
Message-Id: <20220517152946.187638-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517152946.187638-1-deller@gmx.de>
References: <20220517152946.187638-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ICe8WgMcN26e0X8+pa7e28VYDlhrjKMRjsd3uQQkCDQ5fZtW7wr
 ZevNBA7/F7gaPl4k/ChZrMG7mxChomwlX88KOZwhpeqCsVV5VSHJQiH/te0juReuOPtvHA6
 HoLvF0DtJFkl1sXT/QfL4xk/SFQ39mDuXMSkD1mJg/pfapMwwcNYJ6cLHHAzg2TT1vOCZZ+
 zw3qvcMgZIo4XGk11IzWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Nr0InANdU5s=:ajk7w0T1Ub93dzH06qtEFU
 XkIu2ImHFzGjG3riXZ1TRicx5O0j9M48JC/n6xhNicGBufXf6809hwn/7Di4PFxPSR0WgYafy
 /QX4dedfcBVvATDz5cxMITkM8bjRo3gzuY8wXm9eWdNdsOZY6nc9g8/5Y4mzy3xWWpEUUWuR6
 mawicLXpBDVxaOvZRTNjySCTj/gL7t1KO0iXNPwNrq2NCjvSSEonHRKp78HevvBDAN86shXiq
 U/sYJs2H/E2Z5Alqx+logBbZRItHsK5wRYspybDXzmRur8ZIFHwUrNJv3Q6F8SjI/c7x4Ic/I
 A+l01EwgavJXugiDLZ6gaJ1WOz59rx+gTkuHqy4HLC7iP4d5suGmjUG3nsEgonDktxwqML/NO
 pypzoDPIMnohjUWEl/g04dIY9cqf97gihYduXcVsPG6Y8A/+anSaPW6LNfxZz4cxibEs4sa0H
 H8OqHOYqF/g9i5zkUlH+L7yT9hlSSvIkzQmD+7OF2cV1FZLZmArnDWXAFjfEOAbxL9/OWKlrd
 9dI/JQmIPKHhR5iGOKCW8/4OFhnmqutpuy6Sk5n93MXeci9sZl+yEhx1T0UxIRofaE/qh6MMx
 eZXXX2ROq4K65j0vp0DDfuupqQD3m8mZOTWpxgKUQxx7v4NWkP1Fh+wxM5MrkYmyu5leX1Ko9
 dfbhWgMpzGPgc+fUb4pIT+EKC3EAE7i6S8YdPvAuuDlDy9sq0e93WYpCtvhCAoQ/Bs1/Hk24p
 oSszfSKYsSOYjnjwiz2nR59Q8NaZNU4CfEijw38uzmKkf1xRzhVqjtWI8EyugVmUCRaBDD/Br
 zV0Tx/cnRLVBpQFXbYH4Pv1bKtdMzw2nUzjj7qnrhCjtbkK0JFM5NLNSpaduOEve17UmgkaA1
 8OLhg46a2/7NWkDECmGYy0Xz76UPccX4mghGzpkSelgZXH6KToeFY0r44fO/5yQxmqZteHgxm
 18swdXV0GVlXTsl2s7qtGYdyIwmnAN9W5uo52OrNY6bvaKwoA+6nwJkpZaWbKi/sxmeF7mz+e
 nkGzSYhN3r13BYIt82douUGCS8E6fDrwe9mr3j7OACbUwgj4R6kxgmJZgPpdL1MtFwgkd50kw
 ouaiaL0sWZ8Q+cxLEVOcR3AKsDoUTZcNqqncjXMVxfpci90vSEABFKHbA==
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
 arch/parisc/include/asm/assembly.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index be784b41048c..0f0d4a496fef 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -174,6 +174,16 @@
 #endif
 	.endm

+	/* The depw instruction leaves the most significant 32 bits of the
+	 * target register in an undefined state on PA 2.0 systems. */
+	.macro dep_safe i, p, len, t
+#ifdef CONFIG_64BIT
+	depd	\i, 32+(\p), \len, \t
+#else
+	depw	\i, \p, \len, \t
+#endif
+	.endm
+
 	/* load 32-bit 'value' into 'reg' compensating for the ldil
 	 * sign-extension when running in wide mode.
 	 * WARNING!! neither 'value' nor 'reg' can be expressions
=2D-
2.35.3

