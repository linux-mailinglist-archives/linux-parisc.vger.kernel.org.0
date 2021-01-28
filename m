Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3792A3081B9
	for <lists+linux-parisc@lfdr.de>; Fri, 29 Jan 2021 00:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhA1XNS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 28 Jan 2021 18:13:18 -0500
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:35510 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231421AbhA1XNL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 28 Jan 2021 18:13:11 -0500
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20210128231229.JUOI52743.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 28 Jan 2021 18:12:29 -0500
Received: from [192.168.2.49] (really [70.50.109.22]) by mtlspm02.bell.net
          with ESMTP
          id <20210128231229.CSGE3672.mtlspm02.bell.net@[192.168.2.49]>;
          Thu, 28 Jan 2021 18:12:29 -0500
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Bump 64-bit IRQ stack size to 64 KB
Message-ID: <929ac002-615f-97b7-7a2b-bd1d0f89dd40@bell.net>
Date:   Thu, 28 Jan 2021 18:12:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-Analysis: v=2.4 cv=KPWfsHJo c=1 sm=1 tr=0 ts=601344de a=S6gQgrXzeH76ECG4GouVuA==:117 a=S6gQgrXzeH76ECG4GouVuA==:17 a=IkcTkHD0fZMA:10 a=EmqxpYm9HcoA:10 a=FBHGMhGWAAAA:8 a=vp238gT70ZhOhP3UgpEA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4xfGJWJY1YZgj1nYS+NKKN6JuZk3LvfMK5LNAe7eRwLy7rxQWmDkx6ZwVEuigY1XbE0xw0R0QJtIyH0YlTdioUbdBYU4i2Ws3hNQWwjQ9mX3tSgh29M7lu zWRdvZ2kdP42scjSlbOD1gow4AVFhzBQjwLnN8uV/EJP5++FWxQ+wCIZdzZEluJRia5wfxaRODrjU2SPRPXI5Dbg1mI5/RE+XjE=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Bump 64-bit IRQ stack size to 64 KB.

I had a kernel IRQ stack overflow on the mx3210 debian buildd machine.  This patch increases the
64-bit IRQ stack size to 64 KB.  The 64-bit stack size needs to be larger than the 32-bit stack
size since registers are twice as big.

Signed-off-by: John David Anglin <dave.anglin@bell.net>

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index e76c86619949..60f5829d476f 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -376,7 +376,11 @@ static inline int eirr_to_irq(unsigned long eirr)
 /*
  * IRQ STACK - used for irq handler
  */
+#ifdef CONFIG_64BIT
+#define IRQ_STACK_SIZE      (4096 << 4) /* 64k irq stack size */
+#else
 #define IRQ_STACK_SIZE      (4096 << 3) /* 32k irq stack size */
+#endif

 union irq_stack_union {
 	unsigned long stack[IRQ_STACK_SIZE/sizeof(unsigned long)];
