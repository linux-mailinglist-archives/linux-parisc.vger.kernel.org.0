Return-Path: <linux-parisc+bounces-4010-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE856B552A2
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Sep 2025 17:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A96B11886F9E
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Sep 2025 15:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B911212568;
	Fri, 12 Sep 2025 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK9b1Uqh"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E889721019E
	for <linux-parisc@vger.kernel.org>; Fri, 12 Sep 2025 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689451; cv=none; b=EOKKX0HQ2VAJKUrNfYQQGkbK3ddEgtHk3iZS8c+VPVr4trG7U825JMdsX2f3TX/eYs2tIEIXiXG88eKVczMHavYG0vzeu8A6Kdpgfz33gklce3LQIHAMDEKjcvZOsX64Dliu7q0Vlmhvk3y7/KQn1vVK2zWhfY0G5cXzfs+y0DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689451; c=relaxed/simple;
	bh=aJLuEIAp9V/uCGf6PEQj6zz7MXZ2gzmalP2D/DeZujI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hGdPo0MxsmJNOP1dHMpWbMdCUz7wS8ACE69UvxXYjYi6q/GT3+lxC2ZMlHnvHLGIaYx2S0nu/heeCZuS5iiU5gXKmMGbcf9srxhZhCXUdRkDeGt4VTPvWq1bFvy9rI9s6+5A6r5/HOgGDiupRqyQgBTpurZnRL8yzJ+fim0F1c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK9b1Uqh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBFBC4CEF1;
	Fri, 12 Sep 2025 15:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757689450;
	bh=aJLuEIAp9V/uCGf6PEQj6zz7MXZ2gzmalP2D/DeZujI=;
	h=Date:From:To:Subject:From;
	b=lK9b1UqhTljbAj4g+blMlhA4X1wMFgzDTctN7roiK34DP+Q4F5dYp+k8DBcyTuS1O
	 D62+y0QfPeLpW7O/PUj+6nqJ34TRT0VtCHQ++HWTFpz2DRLasgNZkaj5Iijh8BUAmN
	 qls33WbB8gcWz0h6A3kDgNIASFjWJNFh+nkvl4clVY5/KhpZbPzrHnNDj4Sxv0U/89
	 W6ALLRLzRzCSJxe5qdOCXeyK15JkvTYihBh9xu/+kcrRxnxlh1A/jOt8ozpxnB0NyW
	 kIT2mGgK+Hh9pChYhYyFbfLjnPx91gOOYijmHZxI5z51Ho6cDHO1IckuBGbZxATfdi
	 1UCqld45GvkuA==
Date: Fri, 12 Sep 2025 17:04:06 +0200
From: Helge Deller <deller@kernel.org>
To: David Hildenbrand <david@redhat.com>,
	Toke =?iso-8859-15?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux parisc List <linux-parisc@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] Fix 32-bit boot failure due inaccurate page_pool_page_is_pp()
Message-ID: <aMQ2ZjZNyNwAiUk-@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them when
destroying the pool") changed PP_MAGIC_MASK from 0xFFFFFFFC to 0xc000007c on
32-bit platforms.

The function page_pool_page_is_pp() uses PP_MAGIC_MASK to identify page pool
pages, but the remaining bits are not sufficient to unambiguously identify
such pages any longer.

So page_pool_page_is_pp() now sometimes wrongly reports pages as page pool
pages and as such triggers a kernel BUG as it believes it found a page pool
leak.

There are patches upcoming where page_pool_page_is_pp() will not depend on
PP_MAGIC_MASK and instead use page flags to identify page pool pages. Until
those patches are merged, the easiest temporary fix is to disable the check
on 32-bit platforms.

Cc: David Hildenbrand <david@redhat.com>
Cc: Toke Høiland-Jørgensen <toke@redhat.com>
Cc: Linux Memory Management List <linux-mm@kvack.org>
Cc: Linux parisc List <linux-parisc@vger.kernel.org>
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Helge Deller <deller@gmx.de>
Link: https://www.spinics.net/lists/kernel/msg5849623.html
Fixes: ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them when destroying the pool")

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1ae97a0b8ec7..f3822ae70a81 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4190,7 +4190,7 @@ int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
  */
 #define PP_MAGIC_MASK ~(PP_DMA_INDEX_MASK | 0x3UL)
 
-#ifdef CONFIG_PAGE_POOL
+#if defined(CONFIG_PAGE_POOL) && defined(CONFIG_64BIT)
 static inline bool page_pool_page_is_pp(const struct page *page)
 {
 	treturn (page->pp_magic & PP_MAGIC_MASK) == PP_SIGNATURE;

