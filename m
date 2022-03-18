Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483794DE434
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Mar 2022 23:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240531AbiCRWsA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Mar 2022 18:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234984AbiCRWr7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Mar 2022 18:47:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B0C2487AE
        for <linux-parisc@vger.kernel.org>; Fri, 18 Mar 2022 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647643593;
        bh=LTvVrGnJHzIqcPngVDeiuQm0EZAowcs0wvfFnvRFFGA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=fyMO8iiQ3EEzmQD6+Ufmmed40MNdOdaceWEXlhdNqrNk0gK6HxKtxRBKysrNvFCxE
         UPz18HkLShcWhxxEYRCywJ7gk4UIY2zLQ74i6NxEfLuDcQ7DYeYJ/pOH/1BL/osDjl
         GTrMb+WX9pPd4lNifxZGzjIXhxyKy334QO7tXtsM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.186.189]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSbxD-1ngA3U1Lbd-00Sx3z; Fri, 18
 Mar 2022 23:46:33 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Convert parisc_requires_coherency() to static branch
Date:   Fri, 18 Mar 2022 23:46:32 +0100
Message-Id: <20220318224632.132721-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZsAQiRf1/mt82fOXGpKEb+pwzj7WnaZ1UPpoBVfh1nZYgedRhnY
 a+8j0VNqtPCQDBjHcMBcc3lvAdNNdf0dUSLf8AyRlayN+nN4Bqvq8YKv6zKgqKlnE5r82ll
 5OSrlf80KcFkreL1NuxIhdbXVtUE0cVPEowJIwCOZ/Gf6/Gp+D8O7ipZ7kLt2cn7LA0rLkf
 98fKhBUPFKHZigzrkyo5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KnrmSKZhMMA=:yNoDG2l1YLyMEem5D9TSYQ
 5JCFd7HRiL8qCpAQIjGZw05UO7nFwX7ZjOW4ws+6P5cAiZeJkegLE6gjSHSJ/ui7wR9GPr+1t
 HFiSkSqKgpDaXSp0ADo6KJSTe3JiidFLbN9Ph6Vf2unMpU419xKhMdLZQAGmt5S0D9uTZSzsj
 gpC0EMybGvdCLt7+GoJUa1hccknN7rKJKRQxRNrL7uR2lwn1C45/jRyRNqQDf0DEpiwh9QqQN
 jYsPgGDFsMEQAjc6SIUugUAht16+jC3enoJy6+ZpxYVNqQw+qsi0eGoWmxRK8OVoxO/MTuEnY
 s1ajFVAvjCnsLAC5/T3zEbqPhZlMIqxyujjhJeedvOPMNzUN4scV0XVwCmnmK4U7NaKgdhdgg
 73b+R6IP5vnCpZGMrUQ+HLhDpFU+4zVsYLqWjA/OxSulGFuIRBtaXPjgtiTCrHa19G97zdlzg
 qGz3HnxlAgobvuDNT7Tq89+lm6Hry/S9iMp/LTaxNqFWlOLYojWCEaVkVq1tSxwBKfSHSATb3
 loKNJwELhmwFi+9QKXKIvkwb+k58ilRNqJf+bJYmK05k75XnSHR2X3oV7O5vr3iurMDUcd/6V
 SBPdd4TEnzwDLqU8/qVkP1jDt0Ons3UU2q3/9z/IHfbm9Py1kcg31FZ2eq6tGPEc1zlhMp3Xw
 oGGfiEgaMp86TD2hCaFn2a6GE1RLCWoQIN1PJSCsNOxM0zolCFQNz13fGDK3+yqyoWhXKuDmq
 TrO9+Ya4p1iu+CGsAcRi0FUA3jQEnXgsRoGuloLkgjgTtLF1/bR7jW3kiUT+L/gdAT+UffQkp
 v5Soc4d1acOnstMBc9LxrmqSCPOzLGOxI/tXnYAEgJIuYGBkPKfmog5irKVnl8MYG3k4dd/eY
 nKLnWWcczu0SKF4r9ZQFS0OWDGD9u40o/WH2DbT6Tvl8NEkzMzmc86mhRw3ajApnwjR1EQ6rn
 J7WP3ZBKSNbKaTQUdJjIFzSOJokYP6x+ddF4VdKl0Eln85uOuKl+t3KaLqIRy9DJQfAlEFahy
 Wwt9uJcoaX4EEsIMgrwGSKqOTE3PRJIBhdCPe/50jQTvYxzP95iY30vzcrILUj2A15xCFiKSe
 WPAjozhJagzfwE=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Optimize the parisc_requires_coherency() macro to use a static branch.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/processor.h | 5 +++--
 arch/parisc/kernel/processor.c      | 7 +++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm=
/processor.h
index 006364212795..9fc80a77b46a 100644
=2D-- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -11,6 +11,7 @@

 #ifndef __ASSEMBLY__
 #include <linux/threads.h>
+#include <linux/jump_label.h>

 #include <asm/assembly.h>
 #include <asm/prefetch.h>
@@ -281,8 +282,8 @@ extern unsigned long __get_wchan(struct task_struct *p=
);
  * with different data, whether clean or not) to operate
  */
 #ifdef CONFIG_PA8X00
-extern int _parisc_requires_coherency;
-#define parisc_requires_coherency()	_parisc_requires_coherency
+DECLARE_STATIC_KEY_TRUE(_parisc_requires_coherency);
+#define parisc_requires_coherency() static_branch_likely(&_parisc_require=
s_coherency)
 #else
 #define parisc_requires_coherency()	(0)
 #endif
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor=
.c
index 1b6129e7d776..ccaf075d0750 100644
=2D-- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -32,8 +32,7 @@
 struct system_cpuinfo_parisc boot_cpu_data __ro_after_init;
 EXPORT_SYMBOL(boot_cpu_data);
 #ifdef CONFIG_PA8X00
-int _parisc_requires_coherency __ro_after_init;
-EXPORT_SYMBOL(_parisc_requires_coherency);
+DEFINE_STATIC_KEY_TRUE(_parisc_requires_coherency);
 #endif

 DEFINE_PER_CPU(struct cpuinfo_parisc, cpu_data);
@@ -284,8 +283,8 @@ void __init collect_boot_cpu_data(void)
 	boot_cpu_data.family_name =3D cpu_name_version[boot_cpu_data.cpu_type][1=
];

 #ifdef CONFIG_PA8X00
-	_parisc_requires_coherency =3D (boot_cpu_data.cpu_type =3D=3D mako) ||
-				(boot_cpu_data.cpu_type =3D=3D mako2);
+	if ((boot_cpu_data.cpu_type !=3D mako) && (boot_cpu_data.cpu_type !=3D m=
ako2))
+		static_branch_disable(&_parisc_requires_coherency);
 #endif

 	if (pdc_model_platform_info(orig_prod_num, current_prod_num, serial_no) =
=3D=3D PDC_OK) {
=2D-
2.35.1

