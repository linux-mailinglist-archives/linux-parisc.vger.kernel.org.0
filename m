Return-Path: <linux-parisc+bounces-1374-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC198C17AD
	for <lists+linux-parisc@lfdr.de>; Thu,  9 May 2024 22:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C8BE1F21470
	for <lists+linux-parisc@lfdr.de>; Thu,  9 May 2024 20:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8937B7E0EA;
	Thu,  9 May 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vNJnzrOL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC857CF16
	for <linux-parisc@vger.kernel.org>; Thu,  9 May 2024 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287154; cv=none; b=Ns2niISjItuAQZVsEB2Gzu7W5cNe9E744DDAoA/hK4pHd9Ox7D8H06z06VFZgfueARxp2SX6HgW/vhrfBS9sbzJZfsz4Az09wY6Y32epRKKVZr+OjCfoqE6DYKX83cd9oJpPQs/jsD0VAIRPZZcLhl0HGwRA0aI5FEOB7rThD0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287154; c=relaxed/simple;
	bh=OFtfeZMgbGqPFPCcL0g1X880SGx7GmE9rDbCocfF/LE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IYGGJTW3phKlFtv83XkEADenhzrGfmcFzG2PkuQ+kf2ZnImaJuPmhu9BCWTJ41+erG7dBf53CeVwwLmmTIcTWOFtxTKRnLjzT38wg6SXDg9WdDe8s3brVADQyLfYhui2aCKld307a+qhRpVxtJhnAikL8n9CCRvnbRtEaKYlCHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--axelrasmussen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vNJnzrOL; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--axelrasmussen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61bb09d8fecso23129237b3.0
        for <linux-parisc@vger.kernel.org>; Thu, 09 May 2024 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715287152; x=1715891952; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8H0foUzLc+DNKUibRdC2bbcsFy9WZnKfOBJjcXN9vjM=;
        b=vNJnzrOLy9dtBOv0ba9LKcFPEXHLb4vETgVR1+DEnxWA/2Llp7054SwpVxOLMTmmch
         yrgmndLe62SmbpnRH4RUmyezYwCTxXBMzKF3reMCANWkNbsCxb3Auc8PKLsAOSUFSf1A
         KkG0PRBghKW285bglVQrD5gaNbQfMFoh0PMyWJNp5LzZHtzBSJxyGWTdVx1YdcA74nex
         zfePHah3PkGaorYayqFAkEK9HcUuXk8yaEqSsKMwZ3D1HaGsrH7nXH9cPvRXk+85/40m
         NB4WWBWgKorq3JwwPq83xH3zeRrvG7JcwqFioXglU1mS3zok1r72/MNjzmGo6+bb5g72
         KQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287152; x=1715891952;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8H0foUzLc+DNKUibRdC2bbcsFy9WZnKfOBJjcXN9vjM=;
        b=g3epwW0sqLWYRtw1vM+6CI+6PtZYSeonnkbD0IfVQlsbyiDuZLpbaRc7ODCxW4C+YW
         V3lRgj8N34jvrW0eIDsu/ikj7Mw0UAX60Nn0K9gaeFqTmf1cJswuRWU7oCXU7X/uTtet
         kypMRFIqaHi0ABwHy4mbBycXvvvp1VB5aLpbUJgoinkKvgLnsGtMbZTXsJQY2Xz6+wm4
         6Sej0lYeaWUkmozkkv/03W3i8nIxinFTfasMqNe3IGybMeJL+iDalBS5SaR/A+LJBrRG
         lbNZ1aegSNm55txvzx149dZ49rPpNqCL2fNKeD4i9vddSM+HtwkEHiYFAw5XJQovdyYj
         2yDA==
X-Forwarded-Encrypted: i=1; AJvYcCWR5oz2Jf+vWbTJPOPw+I9Zd4S695tJ1lThVsz5jj37+4cPV7VHtLmDmwqufjNzQEAyTUMB3j5XnxZqv2QF/Za3eQJThHhlE5I+bV7r
X-Gm-Message-State: AOJu0YxRZtyj8WGR2dRkV0lTUS9Zvi1qNRaGetlTvQTYGn2o2Wq7yc0e
	BnBQgPiyDGdTP1D2iYGhunTSrVvxas6U9+8Lh9c+q69E/xIyFHFQpBV/n3vu8ytvgC/m6zGp4dB
	QUuOf1lGekuYI/MQ1VMYfjtiPOgN29w==
X-Google-Smtp-Source: AGHT+IHw+Ly/UkJisBJVqZ94ZjHYJRR327iKkqlhJCNLn3MTfbX2oJhIScyImN5vnpoTsLVJRylwSVasWSMq7OxW06/3
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:22b1:9c9e:3544:83b8])
 (user=axelrasmussen job=sendgmr) by 2002:a25:1982:0:b0:dcd:2f3e:4d18 with
 SMTP id 3f1490d57ef6-dee4f364f84mr62533276.12.1715287151918; Thu, 09 May 2024
 13:39:11 -0700 (PDT)
Date: Thu,  9 May 2024 13:39:06 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509203907.504891-1-axelrasmussen@google.com>
Subject: [PATCH 0/1] arch/fault: don't print logs for simulated poison errors
From: Axel Rasmussen <axelrasmussen@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, John Hubbard <jhubbard@nvidia.com>, 
	Liu Shixin <liushixin2@huawei.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: Axel Rasmussen <axelrasmussen@google.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch expects to be applied on top of both of the following related
fixes:

- x86/fault: speed up uffd-unit-test by 10x: rate-limit "MCE: Killing" logs
  https://lore.kernel.org/r/20240507022939.236896-1-jhubbard@nvidia.com
- [0/2] Minor fixups for hugetlb fault path
  https://lore.kernel.org/r/20240509100148.22384-1-osalvador@suse.de

The latter is in mm-unstable currently, but the former is not (yet?). It
would need to be taken before this patch for it to apply cleanly.

Axel Rasmussen (1):
  arch/fault: don't print logs for simulated poison errors

 arch/parisc/mm/fault.c   | 7 +++++--
 arch/powerpc/mm/fault.c  | 6 ++++--
 arch/x86/mm/fault.c      | 6 ++++--
 include/linux/mm_types.h | 5 +++++
 mm/hugetlb.c             | 3 ++-
 mm/memory.c              | 2 +-
 6 files changed, 21 insertions(+), 8 deletions(-)

--
2.45.0.118.g7fe29c98d7-goog


