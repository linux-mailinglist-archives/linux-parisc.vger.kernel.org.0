Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37AE01429A
	for <lists+linux-parisc@lfdr.de>; Sun,  5 May 2019 23:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbfEEVzM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 May 2019 17:55:12 -0400
Received: from mout.gmx.net ([212.227.15.18]:55209 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbfEEVzM (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 May 2019 17:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557093305;
        bh=dSrDTxHnJ8+yIJuT0qEpQFhQaWm/lTIE3xC6Yj5ZZa8=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=l4K2mQyX9jMXAZphiWIBTzSBr7oqyR/E+F96pE3DKR4KFaCgGflowQ+upMAD4msHQ
         WHxXDrLVGGRqllGZ4pW5zwDZ8j8C+WuZtauC0d5Sd+MAabXZxE3g4sITDxVf14jmcM
         dh2zTTcD2tlzNDV8iMQkm3c16R6cGy9MolFmHnLs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.187.88]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lt1eU-1gckU71IRW-012WRV; Sun, 05
 May 2019 23:55:05 +0200
Date:   Sun, 5 May 2019 23:55:02 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] Use PA_ASM_LEVEL in boot code
Message-ID: <20190505215502.GA25125@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:FDHlLgl5ZCFSQGroAEM89lRd/JkF6nbIzUPwrlMyfQQrINw3rqy
 hDFW3RVHD39UkJ7Z2eeiLOOIMVNiFWq/zvavuoLXAaHPG992JZDOBACwHgbeQuV6ECpiQ2Z
 CVxg1Bq8SpK7CE+xjev3BMZ6302Nu9icZoft3Pxu5vpC771Ufl7n7og0eTz9e5iUsgPcqi9
 S90ZGzvKH1cD7L07hJ4hA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qVPCNWSjZdg=:Lmfm5yE9H8fK63etpayi2q
 BGZ5sjE4FvH2m153ff77nRKb5vtwEq4TtrF86iFabEOW+DjK+WY4s7KvyA+3O8LMhJ6UKULK4
 1jZ0u1RJFO3cJWjpxDSGrpkjhTcoumKArQHNLEpf0rDIKZ7O/2conlgRpbCagbXQ6vIuuLZm5
 JmbnleuNxidsmxN/ItcqjsZ3CQaF2LbKiHTrXzvbKJsuSyFMpzWmBsWDQsMIa61HV+KCWrTMR
 OC6Zwd6Dux7GtubU0fuxEWRNEWYkTPVEAny2Mqy7K8JBOpwj8svsAKMsip907h+bYgDRznmiG
 tZdl/QsI5QspoqvfNPBMgEluc1KJl5cwg0tD71pK/1zJsTAZJIW9delAhPmr2ZdprREEMSVNL
 zhujyfOAecjlgPcScIp2cPq99NIyd4TBX+2c+Eslt6zp/GYxoJhNKoGrAiakns9GgFwmXL3TK
 IYHohOHWfTXAhHHdZyFiryjWdXegle7XA0l6vT9GBjiNpk65nb/RScHGZa8PffQClk80R5H+r
 hcUUejLn1AB4YMXGpl9xyrHqM9UYxhRT9GTkURuMi6pdabn1YXM3pth2VdoXpz46H4YXjClur
 K4AyPsn+KEiHCQDvWMkqtu+o7i49X0qJL02eQWaXw4VeCXwYMmU10/zZvUXMgjrT8UoTR4ysR
 dkCpx1uIVW5C4yi7kKLZx8DaLs17K3gUfZN1qV9s39Q9YcfDOoZhYzmnr1y0NUpmYqaAKKMoN
 sOA6pnU8Sz+WkBRqGoPdzMLJye/h9jHcynmI1hDiocLbsxyGsSeQwl0tLGr3hA1qeDJIARFfE
 PuhqD0HSCJPc87dNpr7riWNtMJsxBhCXh5VwsvnKe13XIDGYnc4KFlcIE2Edw67BYdNwPpRvM
 /XLtEG7yVqlOCDCJvhz/OEZrXwfq7vIZGE0JNqYrdNDTPn8hxCDTS75thgap3R
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The LEVEL define clashed with the DRBD code.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # v4.14+

diff --git a/arch/parisc/boot/compressed/head.S b/arch/parisc/boot/compres=
sed/head.S
index 5aba20fa48aa..e8b798fd0cf0 100644
=2D-- a/arch/parisc/boot/compressed/head.S
+++ b/arch/parisc/boot/compressed/head.S
@@ -22,7 +22,7 @@
 	__HEAD

 ENTRY(startup)
-	 .level LEVEL
+	 .level PA_ASM_LEVEL

 #define PSW_W_SM	0x200
 #define PSW_W_BIT       36
@@ -63,7 +63,7 @@ $bss_loop:
 	load32	BOOTADDR(decompress_kernel),%r3

 #ifdef CONFIG_64BIT
-	.level LEVEL
+	.level PA_ASM_LEVEL
 	ssm	PSW_W_SM, %r0		/* set W-bit */
 	depdi	0, 31, 32, %r3
 #endif
@@ -72,7 +72,7 @@ $bss_loop:

 startup_continue:
 #ifdef CONFIG_64BIT
-	.level LEVEL
+	.level PA_ASM_LEVEL
 	rsm	PSW_W_SM, %r0		/* clear W-bit */
 #endif

