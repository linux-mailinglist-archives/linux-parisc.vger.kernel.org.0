Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428C542E22D
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Oct 2021 21:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbhJNTv2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 14 Oct 2021 15:51:28 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:52102 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbhJNTv1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 14 Oct 2021 15:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=M/vfC0dn/2pM18vTPb/xN1H2UHCibvUqmnRPXcFllJU=; b=M+2Of+lJ1ZOkx3wSjIZczZY7K/
        K3W3AKHiMHtIyvS0r+jzgFrLdliqWuphC++NzIgVW21d5X6WaVUBJKLzLLUClsCcUyTZktRhLBOBJ
        RJeHKoW67mSQyOeMlOADsJqkdUMby4cebV/f4PckHVP+uB2lJyCqqiQ6TOHFwaJOjOj0=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org)
        by smtp.duncanthrax.net with esmtpa (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mb6jA-0006Sn-Bz; Thu, 14 Oct 2021 21:49:20 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH v3 0/4] add TOC support
Date:   Thu, 14 Oct 2021 21:49:12 +0200
Message-Id: <20211014194916.13901-1-svens@stackframe.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This adds support for the TOC switches found on most PA-RISC
machines. I tested this on my c8000 and a HP 16702A, which is
basically a B160L with some logic analyzer hardware.

Changes in v3:
- add config option
- move toc code to its own c & .S file
- use early_initcall for setup
- split out struct declarations
- use sizeof(*ret) instead of sizeof(struct x)
- move virt_map to assembly.h so it can be used from other files

Changes in v2:
- fix stack allocation
- align toc_lock on 16 byte boundary
- move toc_lock declaration to processor.c

Sven Schnelle (4):
  parisc: move virt_map macro to assembly.h
  parisc: add PIM TOC data structures
  parisc/firmware: add functions to retrieve TOC data
  parisc: add support for TOC (transfer of control)

 arch/parisc/Kconfig                 |  14 ++++
 arch/parisc/include/asm/assembly.h  |  25 +++++++
 arch/parisc/include/asm/pdc.h       |   2 +
 arch/parisc/include/asm/processor.h |   4 +
 arch/parisc/include/uapi/asm/pdc.h  |  28 ++++++-
 arch/parisc/kernel/Makefile         |   1 +
 arch/parisc/kernel/entry.S          |  24 ------
 arch/parisc/kernel/firmware.c       |  32 ++++++++
 arch/parisc/kernel/toc.c            | 111 ++++++++++++++++++++++++++++
 arch/parisc/kernel/toc_asm.S        |  88 ++++++++++++++++++++++
 10 files changed, 303 insertions(+), 26 deletions(-)
 create mode 100644 arch/parisc/kernel/toc.c
 create mode 100644 arch/parisc/kernel/toc_asm.S

-- 
2.33.0

