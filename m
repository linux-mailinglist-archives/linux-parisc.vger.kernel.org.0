Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECBF48E4AE
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Jan 2022 08:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235841AbiANHIc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 14 Jan 2022 02:08:32 -0500
Received: from mout.gmx.net ([212.227.15.15]:44561 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229474AbiANHIc (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 14 Jan 2022 02:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642144104;
        bh=vwpivY4/f4ozJflRHmvOGAYJRU+qOl38ffk5zc0Sx+s=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QdO2tPz/Ll0Ia2UiaIs42Ye6Xh4XFA1Y7lbBEpJT8H7k2T0yWc3NQSHM74go2fy84
         mctx5RToseSZOfLueHx7XQ3TZZZ6HxbNwabMdEm1m+wC4He/FBAQO1Pe0uV7iiBzP7
         1ILpkKraRYtr/3MitKYEriD6TyT94mDeLsHDwu20=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.186.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1mzQzY1dIm-008ohE; Fri, 14
 Jan 2022 08:08:24 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/2] parisc: Autodetect default output device and set console= kernel parameter
Date:   Fri, 14 Jan 2022 08:07:20 +0100
Message-Id: <20220114070720.73353-2-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220114070720.73353-1-deller@gmx.de>
References: <20220114070720.73353-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b7oVt5C7chTXpAKawmj2A5hrw/tvOy5ZT4CO+QYaceLe8splewU
 q3UBVlUI6S5BeaJ1P8fKictLTqwri0JXt3crsM8S/kVsF4fGSIpLiAUGRhGV/LVrYCf46ro
 VXHg+NtCc381mgbfzJip9EjbmqF3lnKy3hy364P1PwH8NP6VmyzqDSWhju4KxUeyz+4MF7P
 F62WMwIwMHczwqs2GKAIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9kAolr/DwcA=:6a0kSw7v9a243865n7vmCG
 SJbautBlI+FeFl+pat952u5X2Nun4k69n7s6APwSX+YibGoa0Pzt1mXTAj72BArCW9vk6YdZ9
 5UiDSSDXFmZ6pWk9kYqETwf4N91cu2KJojlu+qW2mFO1Mw9pE31WgqeFcM08TtRp9Kyh5cuD5
 Lbc23ZeCaTTEr85pg1SaP0e3ARAVmduqqnnlxVjZmNQlZi7z6AXJjkcBVOmw8gOqA++PMrsBd
 EBIj9sTEqGvGoEQPzTLZgQecTAiX4E/NdBq9u5jdIMDFfNB7G1+q18RuDu61oOJPia4EeV4Bg
 lieWsUbDxcdVorcvDucxNFK54I5hmNIvyyryHeVleFgaQ8qf9ZYzNDHq+viZ3RBtNtGPbAH9P
 qMOLTiJAPJXdEyFnlCIkUZGYQ8QGbRSama6hQgLrEGcdwtNCBua0msn4Icg+AJTQpurWZakj6
 +53fZMxsk+HiyRbuRg9AZNUOlgaDrgXBewVrig/M3r2zBsZMDkG/n6WK4z51BdPYUUjEtwgPt
 89IY/sVSqsNE7tJO3xQ+DezI+2LL17Sae8sB+gnHaJVZcSWA9kXSSV6xsuJknOcTOzTi5c4Oo
 x6S8fZBWMrTNPI/nZuCSQ3Xo9hVOxRGZZrSQkHP/0IQMk/4NVgDdvDdzMEodbQf3FNqaSQJ/O
 ubhlcO/tcLPPKxuHA0qJ3QW3zYhkTAsmnJ6VD82Nmio7tyvhzgycaJMg51SZ66U3M+9N7WlhP
 nB1JC7uSK4IhMWibXIwomNlT2wTH1TBoMl/S3yLtYn3KeLHbUaEH55BiXJ61V9I2Yr5WMWm1U
 Ic75PyW4rW0ofU+qs16VWjVRLlIvycSupF6PAlwwcW/B5BCFderCXrMJsq6rzEhpLslEitft0
 UCa5S+umXAoJtgr5cWMgYQ0/HaTu4c6ehscuR0Z1/igWqJ2sMQEYlpjdH23VKx85putHHjzOo
 Gl8BfZ10aGPKSrbBCXoID0LLXhPqzuzrJ0z6GAhyW5nrf+p9uAl4jqIxQj8IEAhogZaCZr5Vn
 6PNR4mM8TlNLyjnCjlSh2avX4nl324ZFdABPBVfCjAeRDI4uoVoBCxaqVupF7q5x6A==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Usually palo (the PA-RISC boot loader) will check at boot time if the
machine/firmware was configured to use the serial line (ttyS0, SERIAL_x)
or the graphical display (tty0, graph) as default output device and add
the correct "console=3DttyS0" or "console=3Dtty0" Linux kernel parameter t=
o
the kernel command line when starting the Linux kernel.

But the kernel could also have been started via the HP-UX boot loader
or directly in qemu, in which cases the console parameter is missing.

This patch fixes this problem by adding the correct console=3D parameter
if it's missing in the current kernel command line.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/setup.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 456087a2350c..b91cb45ffd4e 100644
=2D-- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -48,6 +48,7 @@ struct proc_dir_entry * proc_mckinley_root __read_mostly=
 =3D NULL;
 void __init setup_cmdline(char **cmdline_p)
 {
 	extern unsigned int boot_args[];
+	char *p;

 	/* Collect stuff passed in from the boot loader */

@@ -59,6 +60,16 @@ void __init setup_cmdline(char **cmdline_p)
 		strscpy(boot_command_line, (char *)__va(boot_args[1]),
 			COMMAND_LINE_SIZE);

+	/* autodetect console type (if not done by palo yet) */
+	p =3D boot_command_line;
+	if (!str_has_prefix(p, "console=3D") && !strstr(p, " console=3D")) {
+		strlcat(p, " console=3D", COMMAND_LINE_SIZE);
+		if (PAGE0->mem_cons.cl_class =3D=3D CL_DUPLEX)
+			strlcat(p, "ttyS0", COMMAND_LINE_SIZE);
+		else
+			strlcat(p, "tty0", COMMAND_LINE_SIZE);
+	}
+
 #ifdef CONFIG_BLK_DEV_INITRD
 		if (boot_args[2] !=3D 0) /* did palo pass us a ramdisk? */
 		{
=2D-
2.31.1

