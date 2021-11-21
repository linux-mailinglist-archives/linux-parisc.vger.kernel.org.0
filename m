Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188E6458309
	for <lists+linux-parisc@lfdr.de>; Sun, 21 Nov 2021 12:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237885AbhKULHv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 21 Nov 2021 06:07:51 -0500
Received: from mout.gmx.net ([212.227.17.21]:55443 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237210AbhKULHv (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 21 Nov 2021 06:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637492678;
        bh=4TSKH+lg8DQNCBGo/nEZ80OS7/aoL+DWtSY9x50H1rY=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=OGQz6rKtRfiuKnJDjrAyJVCIgWNV6KfJAVVzGTtQZqTGyk4FEUqajf+IzLVjNjud6
         qMMa8aL+P4EMPujSc43sCGcoqvL7lxxFs3d2JMyirBMkOneNZmnxYv+EfXQcpuFQ2e
         7+oM8TSlQOhHUzFE5dDTeeBQPGQCP+RPcQgse7s4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.182.23]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHXBp-1mtPMN2Oiv-00Dbca; Sun, 21
 Nov 2021 12:04:38 +0100
Date:   Sun, 21 Nov 2021 12:04:01 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] Revert "parisc: Fix backtrace to always include init funtion
 names"
Message-ID: <YZonoYxcqIY3NLc/@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:OteDFIwBzxwv2F8eedX7GMQ8i2EU3bLwE/PP61kO5L1QcT5wZnQ
 Wun3xLcXFDNds8Vh6KvVGcu6l4vYePWVT1rVrgykc6HhGuP3iwLehcMhK4PO9NEnG/n0dcy
 +qvOT6meChhAzg148TtnBM7KoAoBx6hhttK0RXMzfA9hGdilS9duAo93HLOZ0pr5Rm/hf2O
 rTvpM+7Ye6sKrRNiyqW9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WruUy6tkgH4=:/aXVHrLnvy5fcj1CEmcO4W
 8/evciIehepPxWzCNXxnsS9lgtaJcD23H/c3DByvngpzK3J3HiFfem8iYOjUygjwz/L2OISA9
 8sYy6F8cOG6AnBp/jB8eTu/OfWNmeTFFGnTtLPJzSdMxjGs4XorJq1ENAkCwRsC2jQO4ghYBw
 Hes8W4kLNbJ28TgzVBGV1tBbY3VJfvCsQtJ/uE4Key14U3QgnRAW33rjFp7NDNcTiWr43Xmaf
 h0BK9RJFiyRsrPQpEzwXCr0d/d3SoQm51+oOOzcFqAR6silz6XakVE7O+Quf/82cfeZGseHFL
 bVQc/taFFLhJ3L4QgDyR7AoGn3FobMieKmeSx2isvlc0YdKcXaSUqj5nltDQb/EHguQ3JmhlK
 t7gNM2qo5cBtOaeuQPQZnwtcpyunscFsDaB8OkFiqazT9bJkRVboEfywuyW/cM6b5RggYKZJh
 JNDa2UQeKbKJFRLlSdY+baLZcYuFy24uIh7LGqJL8zHZuKhcnYZ9k70lqCDnpOtgIxhP48DEG
 3lMTHL/C+zICLjqKWi4XnC+WGObXMWN3SvNFnn60CuVd7yLkT+3krVWAIIXyKrZ8J+zFHkQAS
 w233Iks3BrzQdGveWblF6uhbc8QBaJTLxJk1z7gSoirAHl2rp1Q4lM2I/jlPjDJDGrR4saBMM
 vnCfyvW9jOYmIXmCbwJUgQhxMcV72/qXc/y5xgeUFngHq1qEX+LLyfjiJ9Xhge5O5l2hwsStx
 PQUdSg7k2cwbLHEagjtMzSI2mHf3lHTDbhLxWK02GtX5XnFrZvW86CFJyeOCZz6wVm95gih1C
 s0H6IblsvDUt13hUdZEuZBtJzyKewjMQhGt3AoQFI85rO+ENhkiy/1i+8cpeobDlrU9lBktH5
 hCRLpwMOOD104IZUD6sigW1otNZ1DulIHmkTHUvJrlpIaQZOL+uXNjIUvZKFERle0ei/0ihtm
 bTytEXTjVC4tunVgbnbnSEoK8xR/VmLnUKP2dkFsc7D+xvFx8E3Ji9guDcI+igVDJjYSDUjYa
 KWonTYiIPrLkUtOF1jZ1s/hE0l+cNCCkg9A2l2a3H43qQEugQycTG9ZiJi03NPfqn9V1kh1XS
 fVUiPhPsHXTyxc=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This reverts commit 279917e27edc293eb645a25428c6ab3f3bca3f86.

With the CONFIG_HARDENED_USERCOPY option enabled, this patch triggers
kernel bugs at runtime:

  usercopy: Kernel memory overwrite attempt detected to kernel text (offse=
t 2084839, size 6)!
  kernel BUG at mm/usercopy.c:99!
 Backtrace:
  IAOQ[0]: usercopy_abort+0xc4/0xe8
  [<00000000406ed1c8>] __check_object_size+0x174/0x238
  [<00000000407086d4>] copy_strings.isra.0+0x3e8/0x708
  [<0000000040709a20>] do_execveat_common.isra.0+0x1bc/0x328
  [<000000004070b760>] compat_sys_execve+0x7c/0xb8
  [<0000000040303eb8>] syscall_exit+0x0/0x14

The problem is, that we have an init section of at least 2MB size which
starts at _stext and is freed after bootup.

If then later some kernel data is (temporarily) stored in this free
memory, check_kernel_text_object() will trigger a bug since the data
appears to be inside the kernel text (>=3D_stext) area:
        if (overlaps(ptr, len, _stext, _etext))
                usercopy_abort("kernel text");

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@kernel.org # 5.4+

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux=
.lds.S
index 3d208afd15bc..2769eb991f58 100644
=2D-- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -57,8 +57,6 @@ SECTIONS
 {
 	. =3D KERNEL_BINARY_TEXT_START;

-	_stext =3D .;	/* start of kernel text, includes init code & data */
-
 	__init_begin =3D .;
 	HEAD_TEXT_SECTION
 	MLONGCALL_DISCARD(INIT_TEXT_SECTION(8))
@@ -82,6 +80,7 @@ SECTIONS
 	/* freed after init ends here */

 	_text =3D .;		/* Text and read-only data */
+	_stext =3D .;
 	MLONGCALL_KEEP(INIT_TEXT_SECTION(8))
 	.text ALIGN(PAGE_SIZE) : {
 		TEXT_TEXT
