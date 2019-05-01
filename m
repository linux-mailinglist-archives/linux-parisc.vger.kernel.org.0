Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 222CB10816
	for <lists+linux-parisc@lfdr.de>; Wed,  1 May 2019 15:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfEANAK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 May 2019 09:00:10 -0400
Received: from mout.gmx.net ([212.227.15.15]:57331 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbfEANAK (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 May 2019 09:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1556715601;
        bh=g1sa58YQq9I8zwUCR5m5ifkEGjMn/dTtcvSoCvXZYNg=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Ezhaboxruzc7VjvEmioXt4+aYHnJrzh2Sn04szQjvzgeZHcG8KqzRNTceLbyWgUwX
         6YaV1ufCfw5/Q8KuDC6XAU2lUq5RkllL0WnecI4JK3DNer8Kq7nqFybph7k6kxF25g
         j5Ev0BnBD2zCEpk487dBawczVmygK2Ki8i5mbInw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.140.64]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7b2d-1hOp6y1itZ-0080a3; Wed, 01
 May 2019 15:00:01 +0200
Date:   Wed, 1 May 2019 14:59:58 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Allow live-patching of __meminit functions
Message-ID: <20190501125958.GA8511@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:A3s1y+Yk1g3YYx0O62RJJiIyJmXoYpCgVcyi42iguLaTCoh9e01
 Ds1Q48Mvxd1iOlOgKMRImrh21obflCbEeNpJSy08/3QTuboTlLjTcnRP7IBv2xtUas2hbwt
 E6PqfkKF1bifcaEpa031YGxCcSrFZoLpBQzqIhMRr6sII4MRp2fG4AMfUE+iH2u9t7Xpw20
 Qzn3DFHn8Z3XblkOgRi2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8zwehFuVgaU=:5+n3W1q2M3XcFrz7Y+zkpM
 xBbC2u8BFtqBJ6tywZzeK3j6ksbOxXP9qFHhuCFRIt0vAaHDAY68EY8HF0bSt2XeSpetCGE4T
 ZaEW1oPwJ2L79fRoum3quMFbSi3VtHKqMla27NzuIFEGNJ0CVLBzriCh+v31t22dfJ9VEAi7p
 TNbp9Xu3fmiIR0wKL/o60waOSKmrkhxgAEiidWP2U785zusCmBwrmYbG72tjbrCHhkRK6sDuG
 /ZtQY4M7GFFBjjL7Dw5hZdHHCeE6suz07Rywj1fxPUDy+rnrh91bMSHz9ervd1Yd3Zr7eoesC
 StvickGND/SiZnoZeLt0e8LqFd2MdqwqinBDl9bqymUwHIT4cno2dttsrNHJDU2Pqzbg/WP0h
 4S+BEMXgC8KOO+ZNk0X+jd3QiKdn3c65aCsogA+nolPLZADFe0k4fyy0YdanwyNYMq7HOYia/
 NvL7A2T+P0t4XrceEIrftlifK+Yy1CPWwWMlfcqzZjlrsE6j7cbPq79KwxWT25VqhK+GoIEYB
 W6ChK0bcF9JOyDakf1uon+y5XecJT9ez6QF4EzY+RU0hiyS69RX1Swt6gw0/1+GyPvU/bJNLn
 uyZtu8z0QZOg3EzKcz+8qQ6Nq1/AZVmFUeAwxTdJeWN+oGNRp0dWn+F333AmKdJL90wbV04Rx
 rG8pR+lbTSgvmkbqdvjVypOSJLmkBhYLd1asVMB06Pa6HcFa3NlRyELCJcp0+2SzskJKMrFjQ
 o1fResXFkwGxiZR5sWWs/5L13Dx6/UToFGqH5Z0CdvJJRxL5maH86IQEGQp0uojo8vFP/SQpO
 h1LHLVB7CAEJinKZY3sGYoms0vBf2D5/W7RGx5jBOzLCQQeEfvFNEfp48v3h37D67eLEhn/aa
 cM4i7sRjb+3A6+8FsKzlTTD4gRlQU3CdH8Y0r6NMfWxiMJYhMtSGBA/d8TAJcx
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When making the text sections writeable with set_kernel_text_rw(1),
include all text sections including those in the __init section.
Otherwise functions marked with __meminit will stay read-only.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org>	# 4.20+

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 78e451ce0f1b..79afd9600cca 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -477,7 +477,7 @@ static void __init map_pages(unsigned long start_vaddr=
,

 void __init set_kernel_text_rw(int enable_read_write)
 {
-	unsigned long start =3D (unsigned long) _text;
+	unsigned long start =3D (unsigned long) __init_begin;
 	unsigned long end   =3D (unsigned long) &data_start;

 	map_pages(start, __pa(start), end-start,
