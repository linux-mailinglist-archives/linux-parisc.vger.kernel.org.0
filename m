Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84F8B36582
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jun 2019 22:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfFEUc0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jun 2019 16:32:26 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:58741 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEUcZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jun 2019 16:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=ckuZbhoLRlvV674gW9uRpnaO6Rpy++3/eGejD8KqiUY=; b=r35swT1gl5x46XXn+v98ZwZsKZ
        BNhzGyTqZEdRBFB6tWRA93IuyTl7YjMOpJolnDsk+zYIlyLqA28HO08qI+Cn3nTqx3l/YOwtxUsrG
        /1EYyuOpdYQOsmLEcPjXPO/6FwyVELtkjKJ420OYZ066hbbBoHHZPm+rlRC5Xi/JlSTg=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYca8-0004ei-CK; Wed, 05 Jun 2019 22:32:24 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v3 0/6] Dynamic FTRACE for PA-RISC
Date:   Wed,  5 Jun 2019 22:32:16 +0200
Message-Id: <20190605203222.6194-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

this series adds support for dynamic ftrace. See the commit message of
the patch for a explanation how it works. For testing, you need a patched
version of gcc because the current version has a bug which misplaces the 
function label. John David Anglin can provide a patch which fixes this issue.
This issue is tracked here: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90751

Changes to v2:

- use offset_in_page() instead of open-coded version

Changes to v1:

- replace a few hardcoded size by sizeof()
- change len parameter of patch_text_multiple() to unsigned
- add link to gcc bugtracker


Sven Schnelle (6):
  parisc: add support for patching multiple words
  parisc: add spinlock to patch function
  parisc: add WARN_ON() to clear_fixmap
  parisc: use pr_debug() in kernel/module.c
  compiler.h: add CC_USING_PATCHABLE_FUNCTION_ENTRY
  parisc: add dynamic ftrace

 arch/parisc/Kconfig               |   2 +
 arch/parisc/Makefile              |  18 +++++
 arch/parisc/include/asm/ftrace.h  |  15 +++-
 arch/parisc/include/asm/patch.h   |   4 +-
 arch/parisc/kernel/Makefile       |   9 ++-
 arch/parisc/kernel/entry.S        |  64 +++++++++++++++
 arch/parisc/kernel/ftrace.c       | 129 +++++++++++++++++++++++++++---
 arch/parisc/kernel/module.c       |  64 +++++++++------
 arch/parisc/kernel/module.lds     |   7 ++
 arch/parisc/kernel/patch.c        |  88 ++++++++++++++++----
 arch/parisc/kernel/vmlinux.lds.S  |   2 +
 arch/parisc/mm/fixmap.c           |   7 +-
 include/asm-generic/vmlinux.lds.h |   7 ++
 include/linux/compiler_types.h    |   2 +
 14 files changed, 358 insertions(+), 60 deletions(-)
 create mode 100644 arch/parisc/kernel/module.lds

-- 
2.20.1

