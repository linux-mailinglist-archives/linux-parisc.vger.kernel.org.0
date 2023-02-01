Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8E8686A82
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Feb 2023 16:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbjBAPmH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 Feb 2023 10:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjBAPmG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 Feb 2023 10:42:06 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2D36D5D8
        for <linux-parisc@vger.kernel.org>; Wed,  1 Feb 2023 07:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1675266118; bh=NQZzdGtePHK9GmuEs5EmTh0J48on80rsiYqdUxU9ieo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=i0GJhoiUF//9+A7T/JdFqkCMa4aD7/JmKWv8Jb8MBb2HAgC4VvB114QuedBO4FPPC
         z/nBHtmgIFuggJ+XOS+6NSDObYe+dFyW85K/rQQDoMgiTUP3ev3ZXt+lD7hcwGlEoc
         rAg9phCvXaaJxIehm5SXeNnqs3yFNF3JK/Ymyxqx+tymWyT+aGYMrnVjNDSAtsRvuz
         aHhVBmoC1JGzgepCv7S4T1DpLjrcAeSDZbMK3CwqaxTFQDz4EIMIuvPG3yodUmfPhb
         MqFWeouej+E4f7Bri5USP+F25ZObJyXX+W1sDNrQR0rCU183oVcOam+jcT933yK/G2
         k0mzfgFMWVwJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.144.73]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72oH-1pHUDp1nMF-008exo; Wed, 01
 Feb 2023 16:41:58 +0100
Date:   Wed, 1 Feb 2023 16:41:54 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Wire up PTRACE_GETREGS/PTRACE_SETREGS for compat case
Message-ID: <Y9qIQsdP+V9tfum0@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:7wEF8UMfKwm/nmQHIsBVHsUzHP88BooNFhqeFpnIK9YlZhsnLf3
 m3BcBaM80GW/907wchU1zjXux6pz+s9c87Q2KYTQG/a9POTtkQrMpTC80EWUrgAduBU0L5Q
 J33lRqh9mx31bqSi2/5KtQEkhVWEeXmGhkUedmGCX3fOobJvJEceT0mChSVfv1gG/whYoix
 AMR7AX8fhMJ1STV57C20Q==
UI-OutboundReport: notjunk:1;M01:P0:z5S90MYqFNw=;TJ/rJ+DvXhS88fLkY7K/vC5zzlk
 pqyXqtn/kEjtXIz6z64ffvuch6fxQulKVYQLFLfXb4xB82nWCRBOnm5XC7YoL7DuFZVb+QnWy
 8EnAztns2xmyMECjWJ1szALPYKefbKHEQUePXy4pNPkSVLcXH3AIfzTW9RcnZw/B/pIF0HMTE
 cvkJjH985ta+N48MwYr3X/KXkhdVeIFdZCEB1VWCzv4BE7/I6M5xPLdtaTw8PRsiKJzwAKSsv
 xatV41gMsxaUldm4DRMqhoQDOEFEPz8q1pInWmjlG/tLZde4RSmHuMsz8M5GvHck5GCo8G5iI
 nTNPT0U9gNjNNwwfWKGY4n8/SxiS0bVCK6fvo456kva2ws1LgJHaGBDshIgHP4Ao0rhZ1yh5W
 4DZedgueJDkrKNEZwto+6jxW/WWTdSBjq2X6FL6tyvdnq9aFo70BCMXcVbdSnKVGP1BDeJPGq
 qym+ZPpda7FnUw5JTsxHr9AltNtQoocZhqsEVQkx/mB8SZzCrgXOBH1y07Bp1byEKrzm/P+N7
 AFRbYGEtjJnm9a7+DreveaH1GhK+yNRJ0yjtPlrGdmtDvDNc0rmi5aOJoAyWNvGCMOKmxb4UC
 mCnSrkDZdptqb6NindMOvL5ipna1ZjxC9YpmlUC7Hk6d1twe0NJmcj3vpgF4WHlzpk0rhA4gl
 DWz0MQx6vdN1KlIqqnLfyD+dpKWWIalkceJSE4acmqSK9cUAETUjyhaiVdUFLsuotkm1L9q56
 pCfouFGDUrz97dZzdXtWG8qzuTelX0HL7xppCrJN7iMyQBSAkfLyvnORhKGJb8qWNL4WER7Ia
 yBnHpDFhBNrhNqAtf0hLOKtZEL0pjhxwXgMXPKOePtXPpHj1lly5kPM/OfN82BK9LgI+DaHKE
 jnS7t5VfZVkiNoiNYtb7DkCn6cscFNAEYZO2MLq8UsLeP7ZQghe9PQdF7O1+YBd4/OQfOBtEp
 s70yukC/776Z2OG1mZpsckFnE9A=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Wire up the missing ptrace requests PTRACE_GETREGS, PTRACE_SETREGS,
PTRACE_GETFPREGS and PTRACE_SETFPREGS when running 32-bit applications
on 64-bit kernels.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 79d654976ada..9af11abeee4f 100644
=2D-- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -126,6 +126,12 @@ long arch_ptrace(struct task_struct *child, long requ=
est,
 	unsigned long tmp;
 	long ret =3D -EIO;

+	unsigned long user_regs_struct_size =3D sizeof(struct user_regs_struct);
+#ifdef CONFIG_64BIT
+	if (is_compat_task())
+		user_regs_struct_size /=3D 2;
+#endif
+
 	switch (request) {

 	/* Read the word at location addr in the USER area.  For ptraced
@@ -181,14 +187,14 @@ long arch_ptrace(struct task_struct *child, long req=
uest,
 		return copy_regset_to_user(child,
 					   task_user_regset_view(current),
 					   REGSET_GENERAL,
-					   0, sizeof(struct user_regs_struct),
+					   0, user_regs_struct_size,
 					   datap);

 	case PTRACE_SETREGS:	/* Set all gp regs in the child. */
 		return copy_regset_from_user(child,
 					     task_user_regset_view(current),
 					     REGSET_GENERAL,
-					     0, sizeof(struct user_regs_struct),
+					     0, user_regs_struct_size,
 					     datap);

 	case PTRACE_GETFPREGS:	/* Get the child FPU state. */
@@ -302,6 +308,11 @@ long compat_arch_ptrace(struct task_struct *child, co=
mpat_long_t request,
 			}
 		}
 		break;
+	case PTRACE_GETREGS:
+	case PTRACE_SETREGS:
+	case PTRACE_GETFPREGS:
+	case PTRACE_SETFPREGS:
+		return arch_ptrace(child, request, addr, data);

 	default:
 		ret =3D compat_ptrace_request(child, request, addr, data);
