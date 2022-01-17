Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633164904A2
	for <lists+linux-parisc@lfdr.de>; Mon, 17 Jan 2022 10:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiAQJNQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 17 Jan 2022 04:13:16 -0500
Received: from mout.gmx.net ([212.227.15.19]:54649 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233409AbiAQJNQ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 17 Jan 2022 04:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642410782;
        bh=+7RMDRRpcrTgcH8milkA2TWCerBcSFg3j42FCrSXP9k=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=j6G/hfVMK55/lRrI4w+m52wOOuAd9k0eT4ABYEIVTr7U6LoKWvP6An+O9G0rgcnqq
         ywsyoy1ZuwpKD8hQ7cLWCdHr0ZtzdIvIs1+D5c/JeFGuNsdmok9ijkq1LgSVSqBhVx
         Hz93liPbeSK2ILVVIeuvj2BhjAm+CvdmbLxg5o38=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.167.237]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1mPO9V41Oa-00xf9z; Mon, 17
 Jan 2022 10:13:02 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] parisc: Fix no previous prototype for 'toc_intr' warning in toc.c
Date:   Mon, 17 Jan 2022 10:11:56 +0100
Message-Id: <20220117091156.183427-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BOhUW8sisTCoC2E6LbfgbHIprkE6Dv1wMkxkIzHrDYCea8Bd5PJ
 nn1ObVAYtIh+jIa3NCukBI0qxZ+dkTrq+pfTv8mcgvCeMF5MRDc0wIY4uamX6i7kR+WYnLs
 rDSnHdBOlV0flWDJQQbjEAK8UmPY51U3OZhkqjO7RpFCvQpxiYbw0vxAKTc1r+KFFIrldJx
 5k99Rq0r+OG3qvr1/WpgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rLZ8WCO9Gds=:CxGByW5mMV2RH6D6uSNcf7
 8fddvF7EUifx4DPq5+DHZD4m9nrw2eF32977g6k9/rvT7jgFJwuJha8vv8s6pSREC4NiAqBa0
 MHe5DMKEAUTJpJymOLrFyL3i51ETzrorzxy43WmIZzj3R/tolLftHtIRVhBchIEf42F3adQwn
 cby7akUJv+5bJjTpYYariRR4uL1rI2UdkbOQHH75E66mCoNg2M7ojG5FArY/FnhDE/AwUL2FJ
 HPQbRPU11wyOKcj5JakDb7ks/v2o/tEqYLiz7KedyDnf71qXkAoJBLR+Y80VAVjxrQUPcTupE
 p0zNJBpy5smCfgY23Hpi/CQXnYfLtX9/17iBSGfJ6lMkqV6aTfyfQAQm9JbnwPt+ELz8QnZXd
 Vp9Pw2UsL8oSjupyddpR1hXON1U4yvjevdHs/cNckDztgyPt+QaNih+BkolsLtwNyE72ggrAD
 XCzWvbVpSMKwRiIU/nFjdo9u0GiLNqQGLQMWpG1J1oxeMMWEW+O4eRh3lriHL4NPKWXlEIDv7
 KpF8L5zDhoY1R23zInbQZMuw5v13PBYNJ/GALz/oq4LnSKN2W41lDB0uJYXWaMrQolqxC5ihN
 M5ZGFGZuFlkUwti/1TXxHKzeofJhdSpItCOQLDo2mm84ER71onDM9K7akY1wPwBYZoyrXKJzW
 sZPC4nWrtkPl0O9JiVxoAIgQtORQdeKGGXpyTXiBR/Dn4NQdAJUDWEltmYfXZGUSOc1ghWRd/
 l+qhg9Yxfa0HXs1lRObPRl0yJytMtYT7nOnv4O0Lq8gwfL28Y1a+vxm/3Dx4nfJDMMcKt83E7
 H1ytxefz7LQgyRaq3BxDlpoGzH6IPb/gN8ZO0PBDytWFSOYkXuqGH62CGmsimouZMkztvoixP
 l1qL+ZU9I7Va2KKSpWQMBmPrqUZcQna2xW8tCiaVutHtX716Iel4g8ODuyHlSm1/ynQbbbZz5
 8xI4BtLxKFrpXktpehoNUxA4lwFzOKhsggmeZG0fEeezAKXYEj352Qfxx/wBmHJgkR5o1bQg6
 Yb/nMeugzGaeKj8NkhcQD9wYsMi+spSu7FDoguBjrjV7BqlOYDqgngGZl7XtzOhIG2PAfH0xW
 7WgHeTJyFMbf1I=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix a missing prototype warning noticed by the kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/processor.h | 1 +
 arch/parisc/kernel/toc.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm=
/processor.h
index b669f4b9040b..8793137deac5 100644
=2D-- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -289,6 +289,7 @@ extern int _parisc_requires_coherency;

 extern int running_on_qemu;

+extern void toc_intr(struct pt_regs *regs);
 extern void toc_handler(void);
 extern unsigned int toc_handler_size;
 extern unsigned int toc_handler_csum;
diff --git a/arch/parisc/kernel/toc.c b/arch/parisc/kernel/toc.c
index fa5a10eaf0aa..e4b48d07afbd 100644
=2D-- a/arch/parisc/kernel/toc.c
+++ b/arch/parisc/kernel/toc.c
@@ -10,6 +10,7 @@
 #include <asm/pdc.h>
 #include <asm/pdc_chassis.h>
 #include <asm/ldcw.h>
+#include <asm/processor.h>

 static unsigned int __aligned(16) toc_lock =3D 1;
 DEFINE_PER_CPU_PAGE_ALIGNED(char [16384], toc_stack) __visible;
=2D-
2.31.1

