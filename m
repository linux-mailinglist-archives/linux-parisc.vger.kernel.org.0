Return-Path: <linux-parisc+bounces-1382-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD828C29E4
	for <lists+linux-parisc@lfdr.de>; Fri, 10 May 2024 20:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA52C2874D5
	for <lists+linux-parisc@lfdr.de>; Fri, 10 May 2024 18:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E792C683;
	Fri, 10 May 2024 18:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iS9TWGmb"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27225779
	for <linux-parisc@vger.kernel.org>; Fri, 10 May 2024 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365774; cv=none; b=Cb3Q/QT60C2helyzvyu/EKka8pJ9QQ3kepPFMBFUFuqFEn8V1wgQhNVGLqYKNwSjEU5HPT4esb6OP1ntqOq4b5C+HNWMb35rYkh2Uy8aadYksZXWdwo4wIfTLtKdZeHBkBACk5isJ2IVturiYW3ZnxCsfazYxHjP8TDu6/hSlGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365774; c=relaxed/simple;
	bh=/ilr/2ns1waKekXdvvpwjHWrlHEH9ZBcNGzimJ7jUN8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JJ9idWSetjEsOj4Rh2HPttkW4BBG+Ew+4bWY5qegiYbgPNk7UKdZtVTJuwtZLZTe60AyZFi5XdzN1PwmM7uEfot8vF6kc6yTrFCCyxcVFibip8Sr4GA86tzCwsSrW5JupbEthiev9vx54fLm/Y6T4J9hruoKG/hUav6ldhcLSq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--axelrasmussen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iS9TWGmb; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--axelrasmussen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61be530d024so38060567b3.2
        for <linux-parisc@vger.kernel.org>; Fri, 10 May 2024 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715365772; x=1715970572; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A4aKdJv+GXjhmJVck0xZk4SxA4FMRyhRNdrsSEfRwe8=;
        b=iS9TWGmbBTIbEUapJtkdRk8ydrpSZHHJ1xhvlYRQupciF7ZH34wt+QS4L6VL0vmcMH
         YD1+uuiSFqs02dvbI9VpxCPp+w2hOv17zZqyjEnsrgqPl6Ck1t7tYGQ89/dCMk5bCk3g
         8KOCjPvykL8HiKNirZRZ3uvcqYHafreODlJ/Qb1f5dOk4yKFvpUbgzuZeIc5EON+xb0M
         Ud3bOgHwCokjUh0zQZSbCG2TwtGE6YXJDk807pY+d2V5x51CFEuLaef/oyLiFtcMRtdH
         Rv7w6M2h7tZTvWAlXTeDobLD/6jdCjcg6ZxxfH4w//VsxnrXktBb4/Wk/GR1ABDP8r1q
         DMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365772; x=1715970572;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4aKdJv+GXjhmJVck0xZk4SxA4FMRyhRNdrsSEfRwe8=;
        b=LOP1/amIJ2xF+1uuuBRnTBwutrnGHt49QNQnMdyjImUOx89XJiZtXqb11tvGPm0Jh8
         dm/clPpsUSxlkxcGx/U7/G7XEU8N6t2sZv9xG5BrfIVZqgM7irbIAaiGOZkWS65rLmnb
         UK8lOu5m2zbd62oCei/x3pj/xcMuJAKMrTn5xwRcwUjoXcdZqKc0yyybemDSspBfqG6M
         QjUjw9t4OTuq15D+NMI4+ifBnx3kovFmsTS1Vd6buzwqIuSW/pI/cksW+l4a1aH79/Bb
         m2iZdbfBZAYsjIVD6C6ZKiBtGfCqTs7cLr8cacifxg5SQxCgDzeRx9eP0uVW4grePMVj
         O5yg==
X-Forwarded-Encrypted: i=1; AJvYcCXXsJP8vW0ouGvSoqAGBrWHcOfiO+xMJh/Y15jbUl+1IrQNwI20L06l1XfxxtrEHUHAasSTEMj15blKKuxnGZMxCPbVJS64O93LVokX
X-Gm-Message-State: AOJu0Yxx8cgSlkpIOLNHPJ+kfEGOH9jfT2QFDxZnPmtZsHvCDxlTriCX
	PZvJGFmYFtzBvEL1p8xuyk06WKH6IU3imIgPLx4QIcsWX6FWIbgsoBIBcNhJlR1pzXpM2tG2MwE
	XlLyiQIxricKp3ZWCMbFnZJldJJWn1A==
X-Google-Smtp-Source: AGHT+IH5+lH6Gx4AKZE0SlsshevL9DXQMpIE/7ZE3IOzzvFIkXEAIqcFqmW78BWgUllATkZqk48MCmCddH9d0kus7++P
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:6f94:7fe7:5ca2:5501])
 (user=axelrasmussen job=sendgmr) by 2002:a05:690c:6211:b0:618:8bdf:9d56 with
 SMTP id 00721157ae682-622afffb2b1mr8008447b3.7.1715365771987; Fri, 10 May
 2024 11:29:31 -0700 (PDT)
Date: Fri, 10 May 2024 11:29:25 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510182926.763131-1-axelrasmussen@google.com>
Subject: [PATCH v2 0/1] arch/fault: don't print logs for simulated poison errors
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

This patch is based on mm-unstable as of 2024-05-10. In particular it
needs this somewhat related fix to apply cleanly:

  [0/2] Minor fixups for hugetlb fault path
  https://lore.kernel.org/r/20240509100148.22384-1-osalvador@suse.de

Changes since v1:
 - Rename flag from VM_FAULT_HWPOISON_SIM to VM_FAULT_HWPOISON_SILENT.
 - Rebase onto mm-unstable, to remove dependency on another patch which it
   appears will not get merged.
 - Update comments / commit message to mention swapin errors in addition to
   UFFDIO_POISON.

Axel Rasmussen (1):
  arch/fault: don't print logs for pte marker poison errors

 arch/parisc/mm/fault.c   |  7 +++++--
 arch/powerpc/mm/fault.c  |  6 ++++--
 arch/x86/mm/fault.c      |  6 ++++--
 include/linux/mm_types.h | 34 ++++++++++++++++++++--------------
 mm/hugetlb.c             |  3 ++-
 mm/memory.c              |  2 +-
 6 files changed, 36 insertions(+), 22 deletions(-)

--
2.45.0.118.g7fe29c98d7-goog


