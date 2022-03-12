Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470A04D707D
	for <lists+linux-parisc@lfdr.de>; Sat, 12 Mar 2022 20:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbiCLTD1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 12 Mar 2022 14:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiCLTD0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 12 Mar 2022 14:03:26 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A6920BCDE
        for <linux-parisc@vger.kernel.org>; Sat, 12 Mar 2022 11:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647111733;
        bh=U0d+BKQ43K2uYSepAoNj7OCKi/wzCDCXPPc8swIM8qc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=GEQaCMYein66Nsug9XQ/LjJx7TkSqjcaQRlZnP3KUtDE7SMz5GV4ISfDuRycj1Z1V
         tt2fxNtfcuFIhNVZX3tdUrwWGJB5RNmsMSp84nE7PY4sN3z4rvBHZ6fs6bkQSO9dkc
         AHqGgZlQliKMSy3dcBYkk/sc+uHgE6vELGUPFd7Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.170.130]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNpH-1nqInY0DhF-00llE4; Sat, 12
 Mar 2022 20:02:13 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add sysctl entry for parisc_cache_flush_threshold
Date:   Sat, 12 Mar 2022 20:02:12 +0100
Message-Id: <20220312190212.48901-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YqRzSL41mfHDPF0EGi0NMTZyZP1jV1a/gm3+3J3tVf3PLMdjDPE
 eHuebhKBREKcXH1qoJJKDAXP2e18y5fDzt5Z/a3HuJxWSOP4lLhd2zi2m7cmD0p+ow24bW9
 dZgr3kQxyqT7H9k0A3oEBT2QDFivM9+Xq6z/PJcZZkIdZOUYrMbPY6S/AkKDMM5XQVIJ+o1
 omdmdr2sf+v11yzgnFlRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vrb9/ymDCY8=:bxnq99avxh/OmRusW7IDPj
 xufqmXd2rfjImD8Dgiccs910bHKbIEuXVTIO/FAaZalEWtRPqga61DaRtuGXdm2aHQ+Qzw4q6
 gcItlbXOfnPJQUPYbyqHaXgQJ8hUoXuqTsHJNyRR0yivlFJ6KwhUdMkTNV8NN140LXem2gJme
 TnTfqyz5jvHpxL7uaQf5n6KHHtMaqjuJGtBVAD3Q7mmQqQds85+/2n/u1PqvKjHSo2jvdjpzq
 08ThLuXbI09kEO07P0+MkKwrIHlR6mGlDbCzFLRumuHjg71bssr6vB5eJGpKte7Oa/OQ3NDHu
 UZhUjy6NCKLK+sRhv8w/ucC7nOKB7koWNS+mfka2qKiQsjou4P+AzU+vudpVK36254ODmz3CO
 cjMmoBHbHZr6p3dcFGwxdrDDdk/Y1eXrvNIe0CwYgGGEItDEmYkYjAnbKnq1dtlw5Fn/2lBho
 6ik1Tf1EP+zr3euclSUr+lNXiCcZREtAkuBQoYXHrXHbQEbzssFlDVdZpIHEHY+4lO76vZkK+
 UMz7ogWWpg/ckKko095teXgYDEY2mZXL4nF78DtlWvAeQiRET+R16+k05Q+oNxBA1XGMgtkZ/
 zD0DyD1DTnD6vJXe3p4cHDLJYFrw5tuhDMz899p/EoE3TxPZsi+E6TaSbFtYohIzCmSf/yb4C
 xsbNaNRhD0WluUjoKcNy+LZcRY+tPdDE3tJjUs4HM2yvyj85vo6EuxzFAi/6OOSUKnPHV04uP
 nx1Q5vkwDOgc5wDNOhQ05RgzjoZbmewpyKWFZWe6qXGd1qpDHHjtiEqsUorUfc2y/YRRwXAh/
 cFA9YzUSedsr6yoGaHsD8cgj+GfhJP+6kA5N5fRMMvZj4glsK7jx02y036XoLQizaLLjBZctc
 MBInR4vZGaH5EmKtqyGm/nSRHvpQmEZVbSKDqji1NXkwx63vWT62lrk4tu52RRT1Eyjtm30ac
 J3ZbHHUKswXPmHEbnUOSkqz6/vgbZTtUQqMsMJ1owaqodn5CWOIQmqVCJTBQhirAP1dC6ApRA
 bvJlXyb9txeniEdCaQ2s9yXGRIVGHPBR8ove8gQ1JgaBGc4P+pIixnTc9Ths/Viw+1XY6CVzC
 F+XxRHTytYtI6c=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add the sysctl entry /proc/sys/kernel/cache_flush_threshold which allows
the user to modify the threshold above which the kernel will flush all
CPU caches, instead of manually flushing only specific memory areas.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/cache.c | 2 +-
 include/linux/sysctl.h     | 1 +
 kernel/sysctl.c            | 7 +++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 81f36d6407f0..3f0f554d3edd 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -379,7 +379,7 @@ EXPORT_SYMBOL(flush_data_cache_local);
 EXPORT_SYMBOL(flush_kernel_icache_range_asm);

 #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
-static unsigned long parisc_cache_flush_threshold __ro_after_init =3D FLU=
SH_THRESHOLD;
+unsigned long parisc_cache_flush_threshold =3D FLUSH_THRESHOLD;

 #define FLUSH_TLB_THRESHOLD (16*1024) /* 16 KiB minimum TLB threshold */
 static unsigned long parisc_tlb_flush_threshold __ro_after_init =3D ~0UL;
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 6353d6db69b2..771e56d47bab 100644
=2D-- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -243,6 +243,7 @@ int do_proc_douintvec(struct ctl_table *table, int wri=
te,
 		      void *data);

 extern int pwrsw_enabled;
+extern unsigned long parisc_cache_flush_threshold;
 extern int unaligned_enabled;
 extern int unaligned_dump_stack;
 extern int no_unaligned_warning;
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 5ae443b2882e..b2acfc6640d0 100644
=2D-- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1889,6 +1889,13 @@ static struct ctl_table kern_table[] =3D {
 		.mode		=3D 0644,
 		.proc_handler	=3D proc_dointvec,
 	},
+	{
+		.procname	=3D "cache_flush_threshold",
+		.data		=3D &parisc_cache_flush_threshold,
+		.maxlen		=3D sizeof (unsigned long),
+		.mode		=3D 0644,
+		.proc_handler	=3D proc_doulongvec_minmax,
+	},
 #endif
 #ifdef CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW
 	{
=2D-
2.34.1

