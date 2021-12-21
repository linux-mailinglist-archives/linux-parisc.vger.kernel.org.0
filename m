Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC39B47C6AF
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Dec 2021 19:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241402AbhLUSdU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Dec 2021 13:33:20 -0500
Received: from mta-mtl-001.bell.net ([209.71.208.11]:36814 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbhLUSdS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Dec 2021 13:33:18 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C1D09100113C52
X-CM-Envelope: MS4xfFArREeLxANwq65bRExC7QxlppnPo0K80yBuam3dSXjzHQ0DlHP27BpzpZUZbZE5MuJAGYZ35IIS4fv+tnzDB5tu2R8RHiVPRxI0p4XtqSQMuki9Y58o
 hSzeliF5u24XSBnoXp7XAoRahrO7G+xVkUMst0+mHSciHjB2dkPpPjgYws7ml1kBtLzlPF1N+KRmmsoFM6D5NrOGSL7nrYhvVfecFom0etYe/rfbfksHz4j2
 Wp1BK3GrXVrUij2Cdi0Rathc4TbXAAs2N8ndwJxEZb/Gxt4bF36k7IuGXhUqecSlNbN6oPUowj2bmLbICRXPCF0Ks6dtuco6gUU+EDE1wrdq3iQMAOi1m77C
 j1wofJit
X-CM-Analysis: v=2.4 cv=WtFIjfTv c=1 sm=1 tr=0 ts=61c21ded
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=98SgIFmtDj0AI48OE8IA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C1D09100113C52; Tue, 21 Dec 2021 13:33:17 -0500
Message-ID: <8186e8fe-1c64-c9fd-ca3c-f7514fb40428@bell.net>
Date:   Tue, 21 Dec 2021 13:33:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix mask used to select futex spinlock
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix mask used to select futex spinlock.

The address bits used to select the futex spinlock need to match those used in the LWS code in
syscall.S. The mask 0x3f8 only selects 7 bits.  It should select 8 bits.

This change fixes the glibc nptl/tst-cond24 and nptl/tst-cond25 tests.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 70cf8f0a7617..9cd4dd6e63ad 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -14,7 +14,7 @@ static inline void
  _futex_spin_lock(u32 __user *uaddr)
  {
  	extern u32 lws_lock_start[];
-	long index = ((long)uaddr & 0x3f8) >> 1;
+	long index = ((long)uaddr & 0x7f8) >> 1;
  	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
  	preempt_disable();
  	arch_spin_lock(s);
@@ -24,7 +24,7 @@ static inline void
  _futex_spin_unlock(u32 __user *uaddr)
  {
  	extern u32 lws_lock_start[];
-	long index = ((long)uaddr & 0x3f8) >> 1;
+	long index = ((long)uaddr & 0x7f8) >> 1;
  	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
  	arch_spin_unlock(s);
  	preempt_enable();
