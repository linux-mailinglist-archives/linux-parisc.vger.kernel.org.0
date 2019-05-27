Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D65F2BA7A
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 21:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfE0TFF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 15:05:05 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:39758 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbfE0TFF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 15:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=f+w2ecI6Tx268W5Wbi/s5ZH3PVl4QZMbHeLrfttZDdc=; b=WPBU/NNEn6RmYANiS7GBTf35UJ
        rkymAsxSaCNM31gse3gduhuQa6dZYM5SR/n7Scx35+2Kmms5/j7QennTONesFkrf6HSSdupIkcyR9
        pN/ZqoIjcE8680YwfvBe2+vlPMOKYi1ZpU6qSVXtMnPzHDhz9O82KhLd8PK7IdZpzDEs=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hVKvg-0005jT-4v; Mon, 27 May 2019 21:05:04 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 0/6] Dynamic FTRACE for PA-RISC
Date:   Mon, 27 May 2019 21:04:44 +0200
Message-Id: <20190527190450.14988-1-svens@stackframe.org>
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

