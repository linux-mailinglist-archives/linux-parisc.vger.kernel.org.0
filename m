Return-Path: <linux-parisc+bounces-1413-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C538C668F
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 14:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA68F1C21E68
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 12:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A94B84D0B;
	Wed, 15 May 2024 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHPV0K+U"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272EB84D05
	for <linux-parisc@vger.kernel.org>; Wed, 15 May 2024 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715777646; cv=none; b=r1+ovXqdJrm71vqbr+7DDNo/FtItoC4wgV0hqdfOZ4287TzQvItDdV/ICCEmLfd6Psqz/fBPYIpa4M6Zio6ekg7BCnQX5KNHmYW82/vilzaexF3+Y/nuzQAmCwNM3FJfoKnSvTpLnEw4aawS6jL4yeaRtBqE3w5IYSWSuie1qEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715777646; c=relaxed/simple;
	bh=J6tHnTXaxW4j34Z7h378cPoXrROtzx6x0960Sk68cUA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dSP253Rb3lmLDSKlHcwGs+z+Hj/2SNnyz2kDj5ibkPsOI4i3gh8hA6u6hBn1U7Su+hSyDNkaGD/1rx2V+MtpeMc1+p4B6H0mEXiZI6du2RtDEByuYvM+0dooRzhmfxUMI4+8xWxiFzMu3ssfVdrav+/PJ0uIN4cPoz9mi3SN864=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHPV0K+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C46C32782
	for <linux-parisc@vger.kernel.org>; Wed, 15 May 2024 12:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715777646;
	bh=J6tHnTXaxW4j34Z7h378cPoXrROtzx6x0960Sk68cUA=;
	h=From:To:Subject:Date:From;
	b=PHPV0K+U8hyvbcRF6nbh0072d9MmZTH2fRvOMqZf5lgV2ngWLuAiJFQJrCVqtinJn
	 nSl1NS7HoGjpkemjoEQVOIF3rfy5kQUAhOpenmSEI+c3Cn9f75nay7EDRUmCVFIXde
	 YazCYcwWzr465jvQGLWCI7+sQcuXaYT6XWK0xcVf93zL0DGrRLP0XBX/+gTsM1skiZ
	 Hz47mlzYGeseQk3yAU+EUC0VxLxodMqa4oyn8FAJTmiI1P+aT5k9AVIUA1QwLzuT6u
	 jmolaFdxpB2gLpUURhJcVAGeWunp6jf470B5lFc/S9FcS7MO8EnTWSh9iTZo984PTk
	 x7W8FS8EgvdZA==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
Date: Wed, 15 May 2024 14:53:25 +0200
Message-ID: <20240515125324.89101-2-deller@kernel.org>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Define the HAVE_ARCH_HUGETLB_UNMAPPED_AREA macro like other platforms do in
their page.h files to avoid this compile warning:
arch/parisc/mm/hugetlbpage.c:25:1: warning: no previous prototype for 'hugetlb_get_unmapped_area' [-Wmissing-prototypes]

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org  # 6.0+
Reported-by: John David Anglin <dave.anglin@bell.net>
---
 arch/parisc/include/asm/page.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index ad4e15d12ed1..4bea2e95798f 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -8,6 +8,7 @@
 #define PAGE_SIZE	(_AC(1,UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE-1))
 
+#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
 
 #ifndef __ASSEMBLY__
 
-- 
2.45.0


