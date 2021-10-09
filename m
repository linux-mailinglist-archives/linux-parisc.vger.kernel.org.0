Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C82A427CA3
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 20:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhJIS0q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 14:26:46 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:45708 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhJIS0q (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 14:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4H+a6O2FTd9PzR3BzfoDv60g7rpfftVVX9pFTq5nDz4=; b=JJXswxAG8Dlo9c7FojnODZqfZr
        6BHOYglKAPZMF42EU+C8CK3IQ7w7LkhQ3/2w36cu5JsLUjUVMuPGDAoHiwL2pwg+vt3zgN2Cxd7E+
        q4z7IMZKaIfzfIRb5XHYcZ1xQaesI2QAdvy7ZJRdiwBwVsOb3QDbkcMDf8vMW9g1CPS4=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZH1b-0001dj-4z; Sat, 09 Oct 2021 20:24:47 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v2 0/5] parisc: fixes for CONFIG_PREEMPT
Date:   Sat,  9 Oct 2021 20:24:34 +0200
Message-Id: <20211009182439.30016-1-svens@stackframe.org>
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

Changes in v2:
- also fix flush_cache_range(), also extend the preemption-disabled
  region to the end of the function, as there's also a tlb flush in
  the last for loop
- add patch to deduplicate code a bit

Sven Schnelle (5):
  parisc: disable preemption during local tlb flush
  parisc: deduplicate code in flush_cache_mm() and flush_cache_range()
  parisc: fix preempt_count() check in entry.S
  parisc: disable preemption in send_IPI_allbutself()
  parisc: fix warning in flush_tlb_all

 arch/parisc/kernel/cache.c | 87 ++++++++++++++++----------------------
 arch/parisc/kernel/entry.S |  4 +-
 arch/parisc/kernel/smp.c   |  4 +-
 arch/parisc/mm/init.c      |  4 +-
 4 files changed, 43 insertions(+), 56 deletions(-)

-- 
2.33.0

