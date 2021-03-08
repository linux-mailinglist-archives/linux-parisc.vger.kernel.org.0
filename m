Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C407330841
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Mar 2021 07:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234885AbhCHGln (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 8 Mar 2021 01:41:43 -0500
Received: from foss.arm.com ([217.140.110.172]:60292 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234961AbhCHGl2 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 8 Mar 2021 01:41:28 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29A34ED1;
        Sun,  7 Mar 2021 22:41:28 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.67.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E5973F73C;
        Sun,  7 Mar 2021 22:41:23 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-mm@kvack.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>, x86@kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] mm: some config cleanups
Date:   Mon,  8 Mar 2021 12:11:39 +0530
Message-Id: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This series contains config cleanup patches which reduces code duplication
across platforms and also improves maintainability. There is no functional
change intended with this series. This has been boot tested on arm64 but
only build tested on some other platforms.

This applies on 5.12-rc2

Cc: x86@kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (6):
  mm: Generalize ARCH_HAS_CACHE_LINE_SIZE
  mm: Generalize SYS_SUPPORTS_HUGETLBFS (rename as ARCH_SUPPORTS_HUGETLBFS)
  mm: Generalize ARCH_ENABLE_MEMORY_[HOTPLUG|HOTREMOVE]
  mm: Drop redundant ARCH_ENABLE_[HUGEPAGE|THP]_MIGRATION
  mm: Drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK
  mm: Drop redundant HAVE_ARCH_TRANSPARENT_HUGEPAGE

 arch/arc/Kconfig                       |  9 ++------
 arch/arm/Kconfig                       | 10 ++-------
 arch/arm64/Kconfig                     | 30 ++++++--------------------
 arch/ia64/Kconfig                      |  8 ++-----
 arch/mips/Kconfig                      |  6 +-----
 arch/parisc/Kconfig                    |  5 +----
 arch/powerpc/Kconfig                   | 11 ++--------
 arch/powerpc/platforms/Kconfig.cputype | 16 +++++---------
 arch/riscv/Kconfig                     |  5 +----
 arch/s390/Kconfig                      | 12 +++--------
 arch/sh/Kconfig                        |  7 +++---
 arch/sh/mm/Kconfig                     |  8 -------
 arch/x86/Kconfig                       | 29 ++++++-------------------
 fs/Kconfig                             |  5 ++++-
 mm/Kconfig                             |  9 ++++++++
 15 files changed, 48 insertions(+), 122 deletions(-)

-- 
2.20.1

