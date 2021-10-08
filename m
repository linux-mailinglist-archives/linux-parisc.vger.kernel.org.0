Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A460142728E
	for <lists+linux-parisc@lfdr.de>; Fri,  8 Oct 2021 22:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbhJHUuh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 8 Oct 2021 16:50:37 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:43316 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242932AbhJHUuf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 8 Oct 2021 16:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P7Bvr1zlbgyb93MKOvaQD17uSFFaJUlcy8b4NHuOSgU=; b=a+HilSSxAuuq6lCWKtx05iMTze
        +XBrGGs6Yxq2hvBHuhsMQrSPRelKvBqT0Ri4vChSzhOjm9SgSfEFWUAKSX4bf3BkscuDoKPPYRT5J
        lHYRziiXwgCLyP2Oxr5MTHbC4GynnZgwIgr0ckO9HsMVphGDeGbtO6Rx2NOVBCv+6Tu0=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mYwnF-0006vO-Qg; Fri, 08 Oct 2021 22:48:38 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 0/4] parisc: fixes for CONFIG_PREEMPT
Date:   Fri,  8 Oct 2021 22:48:22 +0200
Message-Id: <20211008204825.6229-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Out of curiosity i enabled CONFIG_PREEMPT on my c8000. The kernel didn't
even compile. After fixing compilation i noticed a lot of segmentation
faults - usually a few processes crashed already at boot, with sshd the
most notable one. Most of the time the processes where crashing with a
DTLB or ITLB miss.

With these fixes, i was able to compile a linux kernel on the c8000
with preemption enabled without crashes.

Sven Schnelle (4):
  parisc: disable preemption during local tlb flush
  parisc: fix preempt_count() check in entry.S
  parisc: disable preemption in send_IPI_allbutself()
  parisc: fix warning in flush_tlb_all

 arch/parisc/kernel/cache.c | 3 +++
 arch/parisc/kernel/entry.S | 5 +++--
 arch/parisc/kernel/smp.c   | 3 ++-
 arch/parisc/mm/init.c      | 4 ++--
 4 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.33.0

