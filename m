Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E441E6C87
	for <lists+linux-parisc@lfdr.de>; Thu, 28 May 2020 22:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407228AbgE1U3p (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 28 May 2020 16:29:45 -0400
Received: from mout.gmx.net ([212.227.15.19]:41699 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407191AbgE1U3j (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 28 May 2020 16:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1590697769;
        bh=UE8hKDPeB/h8OAGkeV6NFIg81bEu9PTU5Fi6my06Jao=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Un/dj9/jwhx5OPde8xuHBi57OSJA+bgn+gx9LvpTv+VXA8yV3H2gAnxr34QuzeG+9
         VtxmRiZfJBONEt0J3MJW9tU3A9djwgsUzGSTPm53PfjGNuzP6NyLzG6iTTlaGHDM7B
         pTuhr6OR13hECzgz0ycGg2S3rBuexEfHe433cxiQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.162.134]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KUd-1iuhHd3WdV-016c7z; Thu, 28
 May 2020 22:29:28 +0200
Date:   Thu, 28 May 2020 22:29:25 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix kernel panic in mem_init()
Message-ID: <20200528202925.GA4575@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:LUU/q5egOpvnruq41WHMIQB53eEaS+UT41BTrIpGujayMp2h4SH
 9KEDYklGKRC5bUBYqyiXXYCVB+XwvBz/9Rfdl0skWTz/wBWUPJB00uIT9tyzkS1lhNcKP/z
 amUkW3CRsuZif+1a4WlPro+TJ8RCCh7qv5dYnkWkNmyurh6G2gUufDt5MZxZEl8PEaNkSzv
 lmnbrhZBrc9RcB2cZ+VIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+9JBu5DfHgg=:UiqS2oim76/kfm0KEWKp55
 RTTX8sy6YKlCgAHEItSsZqxCvzT4oWAGJiQvfQVXvOvohYrD9qcfOSxB1j6wYppsA3EoHMjaa
 eVTJjnDbojXY5SxRdjTHuHa5tFmdHxbfINninsX1ejYuv/vjq+CN7by8IV42Psc1xGR3wCB4n
 LCDRQqzzwb9841fy/dH0n1gAjCsUBTWe30WPnYZPaJVaqqYgjOg7rzuEiRBVJHsNPIOLFN4k4
 2nNBjDtZqYk9ygiYqMQS+f8xnWQJoRQ2xHPkD0z2WOFIghnmJTIBUtK2LUCtKN/Oa81CujZTK
 svMcoe4KKNLb/s5yV1uop/w7yDUdvrarwAE+ldMSOIHKqSnNU961gAyGz6Xys8+jGTT6ZEawW
 9FSUTdA1aCNgOGYTfnN1uoniRCpKa19J6PAC1dEcfrZVQXLoNGBImihTzNMcPFwaPsA6XWGwQ
 brQ7JuVyxl1YERb9H2Kf9vadPn8qrN/67M9nLi8/LZ5+PGqedtXo9O3YO4fPi6EWin+9TpPeL
 VePmMq7+6PkP1g2UGTgCA4pFKZm/FoOYAy12kFKhsycQ7MjUtXsZY5Q7I59GKVnJLE0FgCjj2
 8IM6hoxjpc+B05J/+BRcXWfsQCbO4i+DKIyNtd7tEoJe7v4Oin5qQZB63Uu+2J/hwkqiEibcv
 XVOTC5Tx4dHVrgE8EtxEbrV3hueh8OJrdlyaExpyCLPu+xIMes/Vst4+5CJdHGYqZgyERTibu
 t1/5EctNEvNsDVA1pqGiq2P6MELWjPrhe9/Ts/+6DyyI5HqtfzNU2alfznruJKU18HVhGDPp+
 7R6+x+YOLfqggpezIMV1AT3acnrCn4IsxM1sqWwxt6moQJI8Lh4JXFPtk4m/8gnHAC1N/f1JN
 3tKid8OiLHL3sR20XMhOTq/lJZ8GrcRkQGIHpjvxeabmRIMBPDVBXYkeioKvL1iBzDNiygiYJ
 L+96VaWk12h1O/udLbhHhZHI93jSnzejMoqHay6SYgYjxJUcko22ycTxSPPKzfs6JF/7FB7fN
 glGu56rBm8XtZmNIBWr74hhcweXmrPjDVH+C+itqkBZqKDfpvNq8ycu/egw5H64okbxR9a36y
 gWZqCRwe2UDZGbrG84jcGPzBhCbOW9c2SziUw81pQXQXgRMbDLvfTCY52WOST2BXJ97n2PkYa
 DDvOFQE9eCysEbikwjf7mI2Xj9x2MIWtH07QpZnkM/auatz+yt7dAho0cI1UKazanYSGT/TpE
 95oL+8FG8kPctmO34
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On a HP-PARISC rp3440 machine with this memory layout:
 Memory Ranges:
  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
  1) Start 0x0000004040000000 End 0x00000040ffdfffff Size   3070 MB

the Debian kernel v5.6 triggers a kernel panic:

 Kernel panic - not syncing: Bad Address (null pointer deref?)
 Backtrace:
  [<0000000040101ab4>] start_kernel+0x6c8/0x1190
  [<0000000040108574>] start_parisc+0x158/0x1b8

 Bad Address (null pointer deref?): Code=3D26 (Data memory access rights t=
rap) at addr 0000000000000000
 CPU: 0 PID: 0 Comm: swapper Not tainted 5.6.0-2-parisc64 #1 Debian 5.6.14=
-1
 Hardware name: 9000/800/rp3440

  IAOQ[0]: mem_init+0xb0/0x150
  IAOQ[1]: mem_init+0xb4/0x150
  RP(r2): start_kernel+0x6c8/0x1190
 Backtrace:
  [<0000000040101ab4>] start_kernel+0x6c8/0x1190
  [<0000000040108574>] start_parisc+0x158/0x1b8

During memory initialization in mem_init() the memory zomes have not been =
set
up yet, so avoid using virt_to_page() and similar functions.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.0+


diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 5224fb38d766..0904542966a2 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -562,7 +562,8 @@ void __init mem_init(void)
 			> BITS_PER_LONG);

 	high_memory =3D __va((max_pfn << PAGE_SHIFT));
-	set_max_mapnr(page_to_pfn(virt_to_page(high_memory - 1)) + 1);
+	set_max_mapnr(max_low_pfn);
+
 	memblock_free_all();

 #ifdef CONFIG_PA11
