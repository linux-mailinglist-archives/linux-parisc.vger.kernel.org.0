Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8B0677275
	for <lists+linux-parisc@lfdr.de>; Sun, 22 Jan 2023 21:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjAVUwM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 22 Jan 2023 15:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjAVUwL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 22 Jan 2023 15:52:11 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7960A1CF4B
        for <linux-parisc@vger.kernel.org>; Sun, 22 Jan 2023 12:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1674420727; bh=hj8RffGvOrPRe/ROSad4l/JZMjzyHf3YTP6D8DwjtX4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=JKUrWypTlOrinYikoHdqp2CYuQhU8PLWyCMfNaAb3NPa6S+v44phzmYmbS7abhFQy
         J9GIFBTiiwjOhm3G/M1vvbV3bDvW1XqSOfcMl+GjTy4U21/KA2LtwKJF67mg6LPx+k
         ziknqepoW6J1jhq6LzGuzPaVjPzL2FmIX8zzx0qEQWPXow9rqoxPps+Gxu6CrSrxqh
         U0n5SF5uSZ4y1+00TEpbUrGIlY1UiFoLPIue/IIURX7qzVEDemQ7zcYq2dG9ScHG/L
         MXvKUzSfrxQC49h46KqnE7phLfRIdQ/ZyuNDoAg25locZpPD8NO0FnHXP4l1vEshj6
         ZFEnac/WZfgFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.134.151]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK0R-1oSYVC1KpV-00rFDx; Sun, 22
 Jan 2023 21:52:07 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] fs/readdir: Give kernel warning if an application uses the 32-bit getdents syscall
Date:   Sun, 22 Jan 2023 21:51:13 +0100
Message-Id: <20230122205111.202784-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BPIi5ByStlKuihXFM40DOJEiqhtsc6ORxeFWgGfH5ZnVoAPxRIY
 0cf3ktqnIX6DZYtiT7/tO4fn4kqHAhVheKJry1VZ96F4p0Z5Q/iFoszWYRP3dYRVp/XGUp6
 xQAZpBMHXssF0z01JxtprY5pd55Yyzz8LP8j7lzG5kBSKftyq1j2fGQfJRX+vyMa7oWJ8Wm
 Jy7GYYB9yTM/HlWNuwbDg==
UI-OutboundReport: notjunk:1;M01:P0:GRForim7MRo=;l3tNScyPQVWo4DCt0jRYRZRjyyZ
 6j3uedvurVAKUcyqI6ihJmx75HI8jX7SmJeUuCMuDFqCX1hz97grv7X7Ac/8wThxR1YvT2vEr
 1IWDkM1/YDBLKRKdJV8pxviOuFwyzCgV9t/76wV26cxrUDaHutGxFXVGtou8SYcIawtfzuBux
 WcTwjOqh+GQ7xmPYz1sAOJdLb+jPZTvp+b+nSUZpIBKN71CHmtBviHSNAKRwxVY7fIYC25mom
 1UYgeDY4TNmtBiqNTqjoAOLWmhd+oPFTe322zuEBij81i4O7eX4mQhehi11crJcgbrG4qvl64
 tlJ5bdD+cvAiOKnN32wK8JdKwg+yQ/PzEbrZSnKqbVz3zZN8auNkx2gLLn09BM6JrWo1lXLKE
 tuwmU0mZXfT9bpR+bROD2tZw43uuxB8+MNhFVWf4GEwvPFUBEH22aemMmjcjybH2ewANEVWK9
 FO4CardWetQVqicfygzfeCad8qZJWjNyVY2ofuAyms2DiBxNAoRhVexJzz3NQOFV4bHFlYEt7
 lzvb34sgLC9yrZBK8ACO1qHe/xYoiNMMexddS43HGL4ZxUkPljYDqJk4Y4vo5tDWj5jZxTc7J
 23rHYvfCT6nCs9rHvL2xRZfv1YFd3AnAcllhSIAAY7EwCe17xmb2hvhfAFaa2MK1mgVpxxc/b
 Y7ut+eud94rNLerjtzuVnEJa0lZuJlaAQG09x1Dwb7Bfa3lH1O4DbYe4Y5KO+QdmH8I+RNATo
 2dgXNNNXri4EouBiI7/rceYu8DT392oYrAYhBOzw6hLKUw9sM4kzUVp1nuILg0xzyXZ9oEdbN
 i1JK08Tz3SgwgvJdNj5o3p96R9NlUxQVNLPZzzrUeqIfp9qLUdu/yyF+xT8V3Cb/ynGqziSNI
 TKIy50l8OyQAe6v9GediI6DYueEG+KZMbuuAYcXUB0DAYoT+fvY9eRfJUqC4gIoAM7iN+twaa
 SgydWPPTlAGNs31L8w33Jz0033k=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch allows to detect which programs still use the 32-bit
directory system calls and which should be converted to use large
filessystem support (LFS).

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D23960
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/Kconfig | 10 ++++++++++
 fs/readdir.c | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 12e3ddabac9d..24ebaa3911eb 100644
=2D-- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1153,6 +1153,16 @@ config COMPAT_32BIT_TIME
 	  This is relevant on all 32-bit architectures, and 64-bit architectures
 	  as part of compat syscall handling.

+config COMPAT_WARN_32BIT_FILESYSTEM_ACCESS
+	bool "Warn on usage of 32-bit filesystem system calls"
+	default !64BIT || COMPAT
+	help
+	  Issue a warning in kernel syslog if a 32-bit userspace application
+	  calls the 32-bit getdents() syscall. Enabling this option helps to
+	  find programs which will silently break on larger filesystems.
+	  Disable this option only if you know your machine will never access
+	  filesystems above 4GB of size (embedded devices).
+
 config ARCH_NO_PREEMPT
 	bool

diff --git a/fs/readdir.c b/fs/readdir.c
index 9c53edb60c03..93c80726f82c 100644
=2D-- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -116,6 +116,19 @@ static int verify_dirent_name(const char *name, int l=
en)
 	return 0;
 }

+static void warn_32bit_access(void)
+{
+#ifdef CONFIG_COMPAT_WARN_32BIT_FILESYSTEM_ACCESS
+	if (sizeof(compat_ulong_t) >=3D sizeof(loff_t))
+		return;
+
+	printk_ratelimited(KERN_WARNING "%s(%d): Recompile this 32-bit "
+		"application with '-D_FILE_OFFSET_BITS=3D64 "
+		"-D_LARGEFILE_SOURCE' or '-D_GNU_SOURCE'\n",
+		current->comm, task_pid_nr(current));
+#endif
+}
+
 /*
  * Traditional linux readdir() handling..
  *
@@ -195,6 +208,7 @@ SYSCALL_DEFINE3(old_readdir, unsigned int, fd,
 		error =3D buf.result;

 	fdput_pos(f);
+	warn_32bit_access();
 	return error;
 }

@@ -294,6 +308,8 @@ SYSCALL_DEFINE3(getdents, unsigned int, fd,
 			error =3D -EFAULT;
 		else
 			error =3D count - buf.count;
+	} else {
+		warn_32bit_access();
 	}
 	fdput_pos(f);
 	return error;
@@ -545,6 +561,8 @@ COMPAT_SYSCALL_DEFINE3(getdents, unsigned int, fd,
 			error =3D -EFAULT;
 		else
 			error =3D count - buf.count;
+	} else {
+		warn_32bit_access();
 	}
 	fdput_pos(f);
 	return error;
=2D-
2.38.1

