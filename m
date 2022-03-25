Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9854E752A
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359341AbiCYOkR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359344AbiCYOkQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:16 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB71972E6
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219115;
        bh=LI10puTNNK6tskId7IFHg8uCclJ7ZBfeS9cwtacOLc8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OIuOPBWaTqb3aSfRG6dC3vA5A/qKd3iF3X+OqPwMM2Z4LaIw4i7Z69x04RTWOkZfB
         P2YgijyNFX1UFcw2nlyZKPD5RoxFRxNZG3aWSFVH2OH93WqHrLJyeo9+FS/u31ODdM
         LnhHPg6dpyLu1OR0daFQXNiAbO0Yq4eD0kHodKhw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXtY-1ngWUd0fmS-00QPUN; Fri, 25
 Mar 2022 15:38:35 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 06/12] parisc: Move disable_sr_hashing_asm() into __cpuinit section
Date:   Fri, 25 Mar 2022 15:38:27 +0100
Message-Id: <20220325143833.402631-6-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z2jHBRXDy93YXknke44d1qGJaZNjA31kgbhzqQPrvz0wdLlw5/R
 LFwc2XfEmOnMOE5iShrC035jOUZoCU3KGtoFoBCpr/wmvIOLfRRnPk66x9OZPGZvUxC4avZ
 sclE30ssYIQS/YaisPHPMl3UWCakeyi5Zmm6HniB1shbOjkoTjUwUXWKSlapbKAq0PUdJ1B
 nho7HRZLd/AQavIB26lQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nogc3zvYWbQ=:gJTdKuHpeHaNzUJ8VaZMqR
 VjnDMnRETRZKkYMZUSHa+CGRovjb3qo4dE+GDPozrcPWpM9p3bMT1Bpst1jCEXwPQF7cQJHCq
 tGLBvRoBYFKviDRSnuuOB6PBWMUc+6Jy9yRsgzSv6E+8ClFiweYvsLGf4VxSS44ENW+hnz4Ez
 Y8WyqGShrzna/Pp4LqIv9KBMYHUQqm3UgTDa5gcHCiX2ee6pi89XZZBR1jFZZq9l7/B3iBBRJ
 RCpV0Xyu+TC5Kj1SKiTX6ZBT/LqOIRGhN4A1SqvYcScBHT4Eat7z+LZNEtyKr6QW8EJG97iJf
 +YdGja2jayUmXGFsozLFLbMxeNlu2g5+TuN/Uy+Ub2DyhupQTNlvMkMh5hsfmqGXG6/zAHx7E
 DlPQqy+Yhxc8Nru8ErvEqYGQIXZSikvEYgK8h0b9E+xOvfEgrjasnbunJtSz7Xw9Hfc5JULv9
 rVihxmMMaorrxvkyYc6+JNEX5hufMH6By8Fz8N2bQ3g5RoUjMl5xdcl+vFqMfBtAaq9b2PDKW
 RO4/veVDmTEnjnN8u1alVEypmUTM1mlW6dCutNokY0LEqv2WUToeNbH064mFfYQIJY6RytHyf
 C+w+KjvGt2Ay4uKUzYbmmMBE+Hx4HDhqT/ZKxv1TA2V3qEHhlp+H/MJUNkbHUvAWmRwqSFMNC
 jGmE5gZec3/T5aKuL9W+kMn9vC5IQj0L0Zw3QUWS73yv1nmPERUymXQD93EuWY6zEWr4MNovv
 dhNrBKv824bgoYuPKebkXmpu67J4JLPJMpWxWvrr7z0m77Dhlyizb+hJNdxrQkM94m+xXlRv5
 6UoQVULd84PPA0pcnfbqvY+UgONo+Ps+TrtNTpsXxL9gHNEEfCMuQEl/fs1+PWgmL7hqcEc2G
 Czxb7FK0Fst/KQbghZ3NEvNFby9B6mG3lLBL+FCkT8+cZXR0EGTUHFEs2bA2YJLG88jX0utz/
 zwoOnToYO7H8aSp9Yv+qYWpSlsUqaSnEQK2+Kqo5IOr5fBkREdx98MVQbYfbgd1oy1+t2gj0B
 OrqgM2n1bmp3nZnNnlAOy8HMlPZvTNZqns1RGm6advBdO2+G38AWMjpXIPNzsUlG/vQ+kgDaG
 PP9q9hF9o68id8=
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
 arch/parisc/kernel/pacache.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index b2ba6d633065..661b1834ac94 100644
=2D-- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -1264,7 +1264,11 @@ ENTRY_CFI(flush_kernel_icache_range_asm)
 	nop
 ENDPROC_CFI(flush_kernel_icache_range_asm)

+#ifdef CONFIG_HOTPLUG_CPU
+	.text
+#else
 	__INIT
+#endif

 	/* align should cover use of rfi in disable_sr_hashing_asm and
 	 * srdis_done.
=2D-
2.35.1

