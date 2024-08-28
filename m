Return-Path: <linux-parisc+bounces-2101-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F96D961ED8
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Aug 2024 07:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C746283699
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Aug 2024 05:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080E315E5B7;
	Wed, 28 Aug 2024 05:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Muc3Jk/v"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2574815D5C7
	for <linux-parisc@vger.kernel.org>; Wed, 28 Aug 2024 05:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824219; cv=none; b=XtssgZQPh0ygK5bdIhhEpH+zuWU2f6mhe3TlEc+kP1divYMZeDLDvcnJonIVogv9mPFU73xy+NtQ1EsbE7qWW2T7veLLOJ46wrO+HxNkIF4UjGmXfrdNsJqM33bZ/qZ4pyfT7vB1I5QkpgoYlyKzvScCq9TkUvirHdO/5hfc62c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824219; c=relaxed/simple;
	bh=wabvkTSjqwqq+1cwlxkGF9sQYYmBw7yR2/kPTnsB9SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0KnYXS9VmRLfMifO3ORovfozmD9LVH2PCWoCxO5jn7VJCKFH5x5MQY75NfRbBueE+8iG6aXJpb/HKicjuql6o+eaWKgoZA4ytKc4dBwTI2mgQBTnI9cJCw/k9m3uL23pm18FSbJnyOxysdIu7mvZ+jP9tUJTjYA5yIsavh96Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Muc3Jk/v; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201f2b7fe0dso54344705ad.1
        for <linux-parisc@vger.kernel.org>; Tue, 27 Aug 2024 22:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824217; x=1725429017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N47VMRtMS+23qmQV6QvpGjMmEbWavAKSyy/PH2d+fuI=;
        b=Muc3Jk/vUmTkn7nTLubhYG6OEJoLJjeuKuGvizQhnNJsv8TWR0QrABV+YexkALVh7V
         7NafIHcie1AMv2c2d16rNEVQhtdJBimR5H2CQz2GemrFBqmFXkaqIMp2Ik8tn5PHlyD9
         ux0WoQTfyK0n122Z+XHeVA+QU34OIPsvJX3GYd2PmMOIPmDq4TC4EkYToS/zE7A2WjXu
         SbciLekHx5Vf7aiytKM2bqEktf/ZE0J3iekWcF7EQxW7vyZi7jC3seSlemgaibXoYEST
         V8iWI34NouelaLb4gK/fEo5r4ObaiD2PCGMrWQUsqq3Jtvw+VaHMQ5sBoaDseIJkCknQ
         D6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824217; x=1725429017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N47VMRtMS+23qmQV6QvpGjMmEbWavAKSyy/PH2d+fuI=;
        b=D+6FVybnsW1Prxl2cYq3q3hy7nnbBhpKmaGVpRSlB6+uiAuoZTK/nXgfzHU+X+ic+R
         mPTXnA9WIBnwpmP2pt61qfZG+bAHIYp48/O9n1Q5/9t5YUeCB9044G/RwftcjgkibWNy
         5Io6SPYAROFD87g64LG4wy+ROK+G0bzJUqYk0vD5s33N7QCuDpfn6zFHaT3OY0pS6TkS
         rCi2p/CQfXiGLmp7X6CPFYS9oWI7GvlMrG0qKsU+MXtPfkqolqqqhHB47J+NKqRdo/Lu
         1F89txyBIH+bemDH3dQXPzWH5bIS5lN3FyJ91yyLTOCfzUnvjkw4Nn+lFSwSJSvCZ4Os
         RFWg==
X-Forwarded-Encrypted: i=1; AJvYcCVytuOrBw8STaQIO4Pn9RPadwfy+ATmFH2II+7313AF/vQl+FDGAo7SxVHDlTD4eNQxgOVycUHKehki+aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywBARpi3kEHFS7XYKBgji5bYlAN9Tw7FuFQcXctU6f/1nO0Q5A
	YaaImaypAediW6f24egRD8CtBnCzuQxQa0035DdxnHLnC+x8e4lMWdibFzdgqjI=
X-Google-Smtp-Source: AGHT+IE/8VPZ5WR+s//SHKXEyZvEaL/le/g9NWegqdCzDXKzmKgVVr+pZGJ3+/nFrNKyDvBxKE7OYQ==
X-Received: by 2002:a17:902:da87:b0:202:18de:b419 with SMTP id d9443c01a7336-2039e544ea3mr139583445ad.63.1724824217429;
        Tue, 27 Aug 2024 22:50:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:21 -0700
Subject: [PATCH 15/16] sparc: mm: Support MAP_BELOW_HINT
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-15-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=wabvkTSjqwqq+1cwlxkGF9sQYYmBw7yR2/kPTnsB9SA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XYlrm85cSrl9L9mw2HGFibquxLlDQQX5BVPY7r2Kn
 Fj9yFu3o5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInUNTIynHcLq9918a3O8avu
 Dw03fBV2dVbdxHna5i+P48xVwp561Qz/s5amcHn+vlr756VDtfCFS81padcPXfr2ZkdR7ZMDnv/
 PsgMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/sparc/kernel/sys_sparc_64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index d9c3b34ca744..b9ce9988551a 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -129,6 +129,8 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = min(task_size, VA_EXCLUDE_START);
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = do_color_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -137,6 +139,8 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 		VM_BUG_ON(addr != -ENOMEM);
 		info.low_limit = VA_EXCLUDE_END;
 		info.high_limit = task_size;
+		if (flags & MAP_BELOW_HINT)
+			info.high_limit = MIN(info.high_limit, addr + len);
 		addr = vm_unmapped_area(&info);
 	}
 
@@ -192,6 +196,8 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = mm->mmap_base;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = do_color_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -207,6 +213,8 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		info.flags = 0;
 		info.low_limit = TASK_UNMAPPED_BASE;
 		info.high_limit = STACK_TOP32;
+		if (flags & MAP_BELOW_HINT)
+			info.high_limit = MIN(info.high_limit, addr + len);
 		addr = vm_unmapped_area(&info);
 	}
 

-- 
2.45.0


