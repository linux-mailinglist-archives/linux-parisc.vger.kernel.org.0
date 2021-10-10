Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB3F4282F4
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Oct 2021 20:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhJJSkT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 10 Oct 2021 14:40:19 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:55034 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhJJSkT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 10 Oct 2021 14:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Jiyb2ZqMcyuM9/gTCqwb5TNabIJmc2huWyRA/Kr6S+w=; b=RqMVezbP8Z3GD+YXV5IZXxZaVd
        EqoITchHA41WlProBcws0tDC36nkqYDbofh+sBwLdJ288QK0jj9dxqb+HJ04gyS+r1KTqUHaetCta
        WmMoRHSrA7oRWAj4uee6YsikLImWNESKFOKL1rj2N7/f7e9J/pdSbBYcQDo4Go9GuYAY=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZdiE-000661-2i; Sun, 10 Oct 2021 20:38:18 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v2 0/2] add TOC support
Date:   Sun, 10 Oct 2021 20:38:13 +0200
Message-Id: <20211010183815.5780-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This adds support for the TOC switches found on most PA-RISC
machines. I tested this on my c8000 and a HP 16702A, which is
basically a B160L with some logic analyzer hardware.

Changes in v2:
- fix stack allocation
- align toc_lock on 16 byte boundary
- move toc_lock declaration to processor.c

Sven Schnelle (2):
  parisc/firmware: add functions to retrieve TOC data
  parisc: add support for TOC (transfer of control)

 arch/parisc/include/asm/pdc.h       |  2 +
 arch/parisc/include/asm/processor.h |  4 ++
 arch/parisc/include/uapi/asm/pdc.h  | 28 +++++++++-
 arch/parisc/kernel/entry.S          | 74 +++++++++++++++++++++++++++
 arch/parisc/kernel/firmware.c       | 32 ++++++++++++
 arch/parisc/kernel/processor.c      | 22 ++++++++
 arch/parisc/kernel/traps.c          | 79 +++++++++++++++++++++++++++++
 7 files changed, 239 insertions(+), 2 deletions(-)

-- 
2.33.0

