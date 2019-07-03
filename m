Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3274E5DE1B
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Jul 2019 08:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfGCGgI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Jul 2019 02:36:08 -0400
Received: from mout.gmx.net ([212.227.15.15]:38203 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbfGCGgI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Jul 2019 02:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562135729;
        bh=F+zl8mFANOFQgediALk++P2BpDP9KtUyGC0xt5nHQlI=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=YU4lswpHXBb8Ph/4Nni+oQL7ROcqWNo4W0tGjm9Zo65S/uvqtUcAfCWuL/QvycLAj
         znJdR80yAsaMsu1Tr7GvDk9HXomyq3oqFQ5Ba/U9EEQOB5mrGkdUE6X3jgcp9Ccg8N
         phgm+bkM2C5T7ZQiFhmSVcrm1oPHeJT4u8rb40iY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.183.112]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDhlV-1hr7R81DfD-00An6n; Wed, 03 Jul 2019 08:35:29 +0200
Date:   Wed, 3 Jul 2019 08:35:24 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Jeroen Roovers <jer@gentoo.org>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH] parisc: Fix kernel panic due invalid values of IAOQ0 or IAOQ1
Message-ID: <20190703063524.GA27797@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:mIouJft4ozNw4UDziPLz5FdNPeH27DhYTJnejXSM8Op8n0X0MuO
 Y94c2lc28UXJEVjYZx+Ro6L5EFpYQU61SRjDM5UOJ9LKAhDkbpVdw+pgdx9L/QAfW69kS78
 AAtV6To+C2m+DCfyCQLWXDk451ZVwQiLQ95BPQPOX0BM3GC+KyW4W9qr3W3e1eVQhH8p5rh
 NOgjRGKthVjTWLWaLWQSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RfRvv6+ditQ=:PIHs+KIAA8GjjYfEZIe8MP
 pXhAEDw7ykjqLvGidt2w1ln/XUEhIK8hp+ej7lrfuQTOCmuNCcUa2nRPnVF5u+PPnfYzTF4qW
 4OM1gg0cHPQsEs24dt8McKaih3aNwFrnJSGFzNsMwo3N9eNtURmfHszavOmAx8kPH3iZYgB9u
 JFhl15a4yBKKPq3mn0lsP8QXzSLxwBByWdyuKjLP/airGqTTLVREhekUprkmA/MVKZkpSuncL
 MqRkPigSyiR8Y+j4xSNxbRNt1UXWGXqS3S4rAH5QPBuPjv4IIaj+BY/Z0Sdm/LChgsONi680W
 cuvmm6AiDkYxzNfwHrup4Fnn//MNWcoK7URr4D/z/W3u3CzDqwU0pnzXTZY9xp8ljA5N0w5BK
 S6u8LpS9JAVJy3MScwjAY17ixxQb73C+4sdc4EcoK7JPpVmCECH8gI/sdMXNZBHFq9keiI8DK
 jbirfl63PDHn74GCGkvgGmUnxSUOS2YSLNsaRlFaBp7rfztHzSFdnJhRLCmckGhQ5zT7oFC8n
 x/seV41zAaUWvvcaK7SjZqakZm1DPzTZgkR67K+XK5lhoTRy/+IwlJH5TvXbJx9xHlpyfGel6
 xpy08abmXMPGpUEqblWwj227bu+DztpK2OaYfNTRpDTohJ6ktFF8Y+0R8jcnzLW4QPGm1I+Zb
 yECPmSB9bRUXwyMReb8bHytLjilSkqyv/T1piBBDaUA0Qh4DqvRkJTCNCDS1Jm6JEM9Tvlr6T
 wxM8I25gv4nnLJfCDDblVJo10DFfYEYPCN3jyDY12pLHwNAU3gFD/1KHS0rA0O6Z2kT8U+hHA
 ivk+eA1x9a/pJv3ROJx+wDlyajRbdvOQRiYPFsBthAhGVuY2fj7iux30FxyKVYLmbRCFiVT7H
 qgbY73WJRHQQXMcn1tPpdNeow8Q0bHQA5ntvzlzl8raXBhzLtTleYbzkhdhhRAvK5jzGbJav7
 LvpZqAY+ePL40S4xZnm396Ud3Bcdo6Fd1+EmfZ3m9avKOakBvlvKa4D3IbBUdU28UQ7CbZvr4
 k7DsKPhloZ6DOKDRSB8VWy7d62JfbmgzX1aiuXk7UoePKhMhAnb+dWJJ+EvU/m1ZVw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On parisc the privilege level of a process is stored in the lowest two bits of
the instruction pointers (IAOQ0 and IAOQ1). On Linux we use privilege level 0
for the kernel and privilege level 3 for user-space. So userspace should not be
allowed to modify IAOQ0 or IAOQ1 of a ptraced process to change it's privilege
level to e.g. 0 to try to gain kernel privileges.

This patch prevents such modifications by always setting the two lowest bits to
one (which relates to privilege level 3 for user-space) if IAOQ0 or IAOQ1 are
modified via ptrace calls.

Fixes: https://bugs.gentoo.org/481768
Reported-by: Jeroen Roovers <jer@gentoo.org>
Cc: <stable@vger.kernel.org>

diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index a3d2fb4e6dd2..8ecd41938709 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -167,6 +175,9 @@ long arch_ptrace(struct task_struct *child, long request,
 		if ((addr & (sizeof(unsigned long)-1)) ||
 		     addr >= sizeof(struct pt_regs))
 			break;
+		if (addr == PT_IAOQ0 || addr == PT_IAOQ1) {
+			data |= 3; /* ensure userspace privilege */
+		}
 		if ((addr >= PT_GR1 && addr <= PT_GR31) ||
 				addr == PT_IAOQ0 || addr == PT_IAOQ1 ||
 				(addr >= PT_FR0 && addr <= PT_FR31 + 4) ||
@@ -281,6 +292,9 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 			addr = translate_usr_offset(addr);
 			if (addr >= sizeof(struct pt_regs))
 				break;
+			if (addr == PT_IAOQ0 || addr == PT_IAOQ1) {
+				data |= 3; /* ensure userspace privilege */
+			}
 			if (addr >= PT_FR0 && addr <= PT_FR31 + 4) {
 				/* Special case, fp regs are 64 bits anyway */
 				*(__u64 *) ((char *) task_regs(child) + addr) = data;
