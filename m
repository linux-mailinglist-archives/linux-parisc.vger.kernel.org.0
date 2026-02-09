Return-Path: <linux-parisc+bounces-4548-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BOcBrHyiWnGEgAAu9opvQ
	(envelope-from <linux-parisc+bounces-4548-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Mon, 09 Feb 2026 15:44:01 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 039A8110CDE
	for <lists+linux-parisc@lfdr.de>; Mon, 09 Feb 2026 15:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDDF13039718
	for <lists+linux-parisc@lfdr.de>; Mon,  9 Feb 2026 14:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A902337BE7F;
	Mon,  9 Feb 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNIMGaab"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80952276028;
	Mon,  9 Feb 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648074; cv=none; b=pzEFBGW/+/fYH7pMxJE4ktNFtjSVTjaQMyo/ipsvuM33hUjfpPgXSH7eEaECFEtopl7maJWXAHNhTcVnQSzsy0QdSAvThtOxjoT3Fb0DDQnnHbFp/Cgns7I0KUPV0/IATmwsJcoFThxRuaI1BRwWtUBsV6A9ARCNyNoVdnbnBOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648074; c=relaxed/simple;
	bh=B2mkA4JyLV5P+26Kji7kOaADSMAhZAUHx96+BlD9dVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CX+Gb2aGdQfbocNBgVdCKOGJ01BSnrhgI9DnvUxE28DDWhvtl3Vs0QvlcmcHYQxmkIgU+zqI2SfuPc1cPJV3JqSVFwhzBkdM7XFB8s5hZIqKWGoYK8E/eBTCjzBYypUp1sTLu8yNDuY7qC+dR72PflhkQDxJXl3WMKS013cwLk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNIMGaab; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803B4C19422;
	Mon,  9 Feb 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770648074;
	bh=B2mkA4JyLV5P+26Kji7kOaADSMAhZAUHx96+BlD9dVA=;
	h=From:To:Cc:Subject:Date:From;
	b=lNIMGaabE0qBHyKmiQQ82ePHeKOk12FZcvy7uIhl99+FK8xY+dvBmwJnHq448tgU5
	 yWCM6YFfxDvwT1wI5+Rt+hhXZLLV4D0u0LeJHpDec1IByx2uLPHCfHaX3Y6XpJ+rsw
	 JJVxqM5D44XNcn4x0x+Kh3J6eZihZBMhmxySUsLGosdfZbLuXcXqIysNK+I7TUQbg9
	 O8HeuEegeOHjXjoPICHlHeBzr1Z+8ulczKwGXjAXkwEVNlDEDH7KqeCc5+hLTfRZaH
	 Codl9ykicppLg+KhR0t3MGY3QhvKdyqCU/tVEiccSKm1jaUu/OhlXAz7EKTzkg5T6F
	 18AZs0Gxi+VGg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v2 0/4] arch, mm: consolidate empty_zero_page
Date: Mon,  9 Feb 2026 16:40:53 +0200
Message-ID: <20260209144058.2092871-1-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	TAGGED_FROM(0.00)[bounces-4548-lists,linux-parisc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-parisc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[53];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-parisc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 039A8110CDE
X-Rspamd-Action: no action

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

These patches cleanup handling of ZERO_PAGE() and zero_pfn.

v2 changes:
* add patches that cleanup zero_pfn code a bit (patches 1,2)
* add a patch that caches struct page for empty_zero_page (patch 4)
* use uint8_t instead of unsigned long for empty_zero_page
* fix sparc64 changes in patch 3

v1: https://lore.kernel.org/all/20260124095628.668870-1-rppt@kernel.org

Mike Rapoport (Microsoft) (4):
  mm: don't special case !MMU for is_zero_pfn() and my_zero_pfn()
  mm: rename my_zero_pfn() to zero_pfn()
  arch, mm: consolidate empty_zero_page
  mm: cache struct page for empty_zero_page and return it from ZERO_PAGE()

 arch/alpha/include/asm/pgtable.h          |  6 ---
 arch/arc/include/asm/pgtable.h            |  3 --
 arch/arc/mm/init.c                        |  2 -
 arch/arm/include/asm/pgtable.h            |  9 -----
 arch/arm/mm/mmu.c                         |  7 ----
 arch/arm/mm/nommu.c                       |  7 ----
 arch/arm64/include/asm/pgtable.h          |  7 ----
 arch/arm64/mm/init.c                      |  5 +++
 arch/arm64/mm/mmu.c                       |  7 ----
 arch/csky/include/asm/pgtable.h           |  3 --
 arch/csky/mm/init.c                       |  3 --
 arch/hexagon/include/asm/pgtable.h        |  6 ---
 arch/hexagon/kernel/head.S                |  5 ---
 arch/hexagon/kernel/hexagon_ksyms.c       |  1 -
 arch/loongarch/include/asm/pgtable.h      |  9 -----
 arch/loongarch/mm/init.c                  |  3 --
 arch/m68k/include/asm/pgtable_mm.h        |  9 -----
 arch/m68k/include/asm/pgtable_no.h        |  7 ----
 arch/m68k/mm/init.c                       |  9 -----
 arch/m68k/mm/mcfmmu.c                     |  2 -
 arch/m68k/mm/motorola.c                   |  6 ---
 arch/m68k/mm/sun3mmu.c                    |  2 -
 arch/microblaze/include/asm/pgtable.h     | 10 -----
 arch/microblaze/kernel/head.S             |  4 --
 arch/microblaze/kernel/microblaze_ksyms.c |  2 -
 arch/mips/mm/init.c                       | 11 +-----
 arch/nios2/include/asm/pgtable.h          |  7 ----
 arch/nios2/kernel/head.S                  | 10 -----
 arch/nios2/kernel/nios2_ksyms.c           |  1 -
 arch/openrisc/include/asm/pgtable.h       |  4 --
 arch/openrisc/kernel/head.S               |  3 --
 arch/openrisc/kernel/or32_ksyms.c         |  1 -
 arch/openrisc/mm/init.c                   |  3 --
 arch/parisc/include/asm/pgtable.h         | 11 ------
 arch/parisc/mm/init.c                     |  6 ---
 arch/powerpc/include/asm/pgtable.h        |  6 ---
 arch/powerpc/mm/mem.c                     |  3 --
 arch/riscv/include/asm/pgtable.h          |  7 ----
 arch/riscv/mm/init.c                      |  4 --
 arch/s390/mm/init.c                       |  4 +-
 arch/sh/include/asm/pgtable.h             |  8 ----
 arch/sh/include/asm/setup.h               |  3 +-
 arch/sh/kernel/head_32.S                  |  4 +-
 arch/sh/kernel/sh_ksyms_32.c              |  1 -
 arch/sh/mm/init.c                         |  1 -
 arch/sparc/include/asm/pgtable_32.h       |  8 ----
 arch/sparc/include/asm/pgtable_64.h       |  3 --
 arch/sparc/include/asm/setup.h            |  2 -
 arch/sparc/kernel/head_32.S               |  7 ----
 arch/sparc/mm/init_32.c                   |  4 --
 arch/sparc/mm/init_64.c                   | 24 +++++-------
 arch/um/include/asm/pgtable.h             |  9 -----
 arch/um/include/shared/kern_util.h        |  1 -
 arch/um/kernel/mem.c                      | 16 --------
 arch/um/kernel/um_arch.c                  |  1 -
 arch/x86/include/asm/pgtable.h            |  8 ----
 arch/x86/kernel/head_32.S                 |  4 --
 arch/x86/kernel/head_64.S                 |  7 ----
 arch/x86/kvm/mmu/spte.h                   |  2 +-
 arch/xtensa/include/asm/pgtable.h         |  4 --
 arch/xtensa/kernel/head.S                 |  3 --
 arch/xtensa/kernel/xtensa_ksyms.c         |  2 -
 fs/dax.c                                  |  2 +-
 fs/proc/vmcore.c                          |  2 +-
 include/linux/pgtable.h                   | 48 ++++++++++++++---------
 mm/huge_memory.c                          |  2 +-
 mm/memory.c                               | 15 +------
 mm/migrate.c                              |  2 +-
 mm/mm_init.c                              | 28 +++++++++++++
 mm/userfaultfd.c                          |  4 +-
 70 files changed, 86 insertions(+), 354 deletions(-)


base-commit: 50c7f34c5c7403a12003c6759f6f6ca9a5a10872
--
2.51.0

