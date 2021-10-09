Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7F6427DB9
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Oct 2021 23:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhJIVlA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 9 Oct 2021 17:41:00 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:54504 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhJIVk7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 9 Oct 2021 17:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xP5hjElqx8hRoUXUDCct1HY1dSkW3EHY5/fm5LgIqvs=; b=KYRpWBTiXhrDIDvzhN7g4qLBE9
        vKNh/lIusVuAW94tYQCy8ezBSrIghYRf6wPP39kMkiCBnUa8BOuFc+h2P6KB9k03LboVX8fAnlIZ5
        /Hp4qfL7hdx+w/s/t+f48x5WuylzmWUY80pgDxYft0JCVKLXrKbR83f+1BfqFz7ulYzU=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZK3Y-0003R2-KF; Sat, 09 Oct 2021 23:39:00 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH 0/2] add TOC support
Date:   Sat,  9 Oct 2021 23:38:54 +0200
Message-Id: <20211009213856.3326-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This adds support for the TOC switches found on most PA-RISC
machines. I tested this on my c8000 and a HP 16702A, which is
basically a B160L with some logic analyzer hardware.

Sven Schnelle (2):
  parisc/firmware: add functions to retrieve TOC data
  parisc: add support for TOC (transfer of control)

 arch/parisc/include/asm/pdc.h       |  2 +
 arch/parisc/include/asm/processor.h |  4 ++
 arch/parisc/include/uapi/asm/pdc.h  | 28 +++++++++-
 arch/parisc/kernel/entry.S          | 69 +++++++++++++++++++++++++
 arch/parisc/kernel/firmware.c       | 32 ++++++++++++
 arch/parisc/kernel/processor.c      | 21 ++++++++
 arch/parisc/kernel/traps.c          | 79 +++++++++++++++++++++++++++++
 7 files changed, 233 insertions(+), 2 deletions(-)

-- 
2.33.0

