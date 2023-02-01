Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87ED868634C
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Feb 2023 11:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjBAKEN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 Feb 2023 05:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjBAKEM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 Feb 2023 05:04:12 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C0C4ED23
        for <linux-parisc@vger.kernel.org>; Wed,  1 Feb 2023 02:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1675245848; bh=n26wOuYdH9LLSIdtpHXo+px70Ebq4zaPBK+Ga/1W4nc=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=JSwj6wbWI1sSmJSgU0k0RyLg/f5H21CDtoHqlP3te5Dkg37YsPY1QDTXNAZJsthnB
         ylFd4JwZFTk3gBCO44fnqhvLJ4WyY3lzcXQ1jmtIkl5YIOZAGFD2tfcRP3/b1gwlst
         rzMSzCEUpE0+SR55HS95Q4kA9ySqf8j46/m5FhWu1fAxSHbgjAQIg4X8iqd0A7hsc3
         hfk3+y5oXh7u5blNJiLvM1hKsykp++6MTvYJhYzUfe6E8OH4kRe7Zm70s0ZtAEHuLF
         3TZgxtgjSbS1UTIEvbLylQ6oBT+RA1WQ6aLi+/IGIKCn1jFfFV0mFUgGFiaF/3TUJy
         vF8+G0D+SuKGg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.144.73]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvPJ-1pFm0b1ZK9-00RmmY; Wed, 01
 Feb 2023 11:04:08 +0100
Date:   Wed, 1 Feb 2023 11:04:06 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Replace hardcoded value with PRIV_USER constant in
 ptrace.c
Message-ID: <Y9o5Fmtop2rGef/0@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:2I/x5AohZc9c+Ky1cnAkwP0f/EQLGS8SvZEFoKBUFPEk5LJzf+y
 gZzC4K1xQDNidZhrJ0NnNy4+J+4VtT6r3tXrVF9riIqw6gx3C98/NST3QnvCn442BTYdEWY
 8gdyi1u17kb24syNltAMgTHIH+3WMJVqOUga2jYmWRdPzE++3jDqgqif6izMiUAbbs3eeD/
 OO8cb7c1pP6KcXkfv6C4w==
UI-OutboundReport: notjunk:1;M01:P0:fMitwUNDWgg=;pIddiTmNq17bkZwwLw1PyVC9a0y
 B3Rf/KPAvVCQBCKzWuQnv4WsyZCtoJc3ihVzrCQwDwLLFRnspj4H/M+Y59MF7SAcjC/V72kvP
 FKT3Y/1Ppt+PCtT1Q22Xc2HaWyTITeTf0fLjpUoGAuEIm9uZW0tz0YlZozreSi+pkjIoyXn/D
 FotCNcrOuEjyqCV2Xt5tjRlMSXyeAWXUYNDCIAIZGJ0h7pbYP3wSsxcqfTSvHiEwvUQ0Z73Ga
 1j6itNmAyDqEmwUoaBsF0UCzz5WjKmQxNfvDpxyIB9O6ihXvEGkwoCJH743m2WBFUb1b2g1ot
 zqM1idZpcgF4vtKUSy9CW/zSQNQgjy19LJjPgd7gOIupzw4LjUN13fqLK4gtqHgdWStnlY0R7
 9JGS9cvViYzVW7HE5hATBv4rVcHlaogX7G50zB9+QDiZfZODdLR3eFEG8FyTZAVh1W+byLNWz
 5RQBrPZKCBMtKKnvc0TMnB8/6XYyFG7ayjBb6iDT83yPaWpugDZ0+zW+m5EcB3YItqXNkpEaT
 2Mfo6Ak7JLM0piF0IBTA1sdT6bq5CR8XxtCIiV9Xfj+EhYs5GtgoSJpCVZwSC2rmienJVzrfq
 KQjtlZKjtYA7D1H0JwKmHp0x6u0FDt8Er66sYL1OWM6sANvuYjpDMEl5MXwg/KjJAFdbxAfSq
 iv8AgfOGKEjoeXzjszyqUYb09IZ4QNG6N4HC8v8xlx2Z+ABMYdEs1Uy28IYBK4d7zkYa8QMEo
 suFjM8d6eMR0ajsNs/dmduzNyuBfI8MJzaHZlmjLDyY+9F4NHjwW3Bu+Rqzo+KVptL+fmuzei
 wsOJv2r6MxuTndcjf6fT7kPTKAL7OYUswXOITwjtm8g1bh3LAN6clxcT+Xc/6fSRlSbcZjcOW
 fKEOhRgh2zwTOYfsmT7nXlPT/EKt3MgGA1V14qF98c/Bbz+x6L1tRt2JW9rZCmrVjt4EGlm+7
 ln2qXJOEiz4qW8/zoiZHyvF/nMo=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Prefer usage of the PRIV_USER constant over the hard-coded value to set
the lowest 2 bits for the userspace privilege.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 96ef6a6b66e5..79d654976ada 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -166,7 +166,7 @@ long arch_ptrace(struct task_struct *child, long request,
 		     addr >= sizeof(struct pt_regs))
 			break;
 		if (addr == PT_IAOQ0 || addr == PT_IAOQ1) {
-			data |= 3; /* ensure userspace privilege */
+			data |= PRIV_USER; /* ensure userspace privilege */
 		}
 		if ((addr >= PT_GR1 && addr <= PT_GR31) ||
 				addr == PT_IAOQ0 || addr == PT_IAOQ1 ||
@@ -285,7 +285,7 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 			if (addr >= sizeof(struct pt_regs))
 				break;
 			if (addr == PT_IAOQ0+4 || addr == PT_IAOQ1+4) {
-				data |= 3; /* ensure userspace privilege */
+				data |= PRIV_USER; /* ensure userspace privilege */
 			}
 			if (addr >= PT_FR0 && addr <= PT_FR31 + 4) {
 				/* Special case, fp regs are 64 bits anyway */
@@ -483,7 +483,7 @@ static void set_reg(struct pt_regs *regs, int num, unsigned long val)
 	case RI(iaoq[0]):
 	case RI(iaoq[1]):
 			/* set 2 lowest bits to ensure userspace privilege: */
-			regs->iaoq[num - RI(iaoq[0])] = val | 3;
+			regs->iaoq[num - RI(iaoq[0])] = val | PRIV_USER;
 			return;
 	case RI(sar):	regs->sar = val;
 			return;
