Return-Path: <linux-parisc+bounces-1375-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2036F8C17AF
	for <lists+linux-parisc@lfdr.de>; Thu,  9 May 2024 22:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 875B9B20C5B
	for <lists+linux-parisc@lfdr.de>; Thu,  9 May 2024 20:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661DA80BE5;
	Thu,  9 May 2024 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FZQNA1aq"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990117F7FD
	for <linux-parisc@vger.kernel.org>; Thu,  9 May 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287156; cv=none; b=TIBcKthtHvdSXuSbaZSX8z/peL/znZp2zW+HbbaxdnvT6x+ObRyorPLzmby6nGK5w0wxMtn96duAScTGcRXNZvW0VZturzDZbcnT4ZfZl3CvxumawcZZ3YyqPdZKvGsXSP7SnYCzoleWDo6pM0UGq8Ec2i1+Y+Sa0/gXeEEjaT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287156; c=relaxed/simple;
	bh=OgELSVNmqwbZweBAv9t8WIscVMIPvXW0Q9emR5MQyYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bvpxy+uVT8wwov0Ql6lqcIyPuigUdUU3Pp3TcLIfoc7QqEn0LR0+bY0ntBwwLvUS1gqIREG19vGPExWIMvKTdUB3z6a3uQOuqr/NU0X9VZinLn7XPfrRCjiZ4N0kaNuiRrVBWjq2x7stY7XyFt9AWqeXAoxXp3OzMW21dmCmVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--axelrasmussen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FZQNA1aq; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--axelrasmussen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-deb45f85880so2031354276.2
        for <linux-parisc@vger.kernel.org>; Thu, 09 May 2024 13:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715287154; x=1715891954; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=72EB+jPmMFAxQhDugLcn3MtcnlhS5/KVvKJQ1v/oDoM=;
        b=FZQNA1aqucPBciveBgbDZB2RAKL0C/HkhdldlvyPYtbEVn/lLnbweZvrtsjlajMeWA
         XtuPrG1hWmR1Y31Tv78QClEL0Y5JQAXPM4cGlNJqBGut9Xkj5/pxU6DT0JIRK7qyaZba
         RI/LpXG2bc9wXGjIz73Uhmtrl4Zd2VqIhlq63PqpoSkPL2PbAkzKyhO718ceQzsPlCIT
         U1eILyspkPphTG/niqwVfHlezmESnUGJ+Dqb1kiRJcvAyBybY3M3P6PkZJ11JB/SsWpp
         6FN07FjzS+LM3g2PWa1PwkZgpKyHUpYxtgCVz6558dTPmCaALNYevVtzjnJ3qfddiYmC
         JmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287154; x=1715891954;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72EB+jPmMFAxQhDugLcn3MtcnlhS5/KVvKJQ1v/oDoM=;
        b=Kl4deTRONLqyJW3TL/aVdmzk1mgFEorY11Xrf2e2hkDUl0AlGdNbefdas3YjPXlJNJ
         Se9il/cd0OtmAaGQJSeDrKLrXpWVjdo6Vu1M6uoZhUoS3L7QxemOEp4PJlZTR6siRwLa
         qKJ7p7O9e/K8RI6u8xAigYkZcU6A5UWnB1B0sTKMYmx0Av9kEBPxV9Ma2E1tuXQXB7Dt
         S008gd5/jpVTxZdPwdMKPE+Nj2KDwvpk+3DA1SodnOqnP0Vhz3KIXgkAFmXEGsT7ECCd
         leYgePO7h/03+eqUfLvMwBsj5g080zqa2XscmDrr5LhkSbwFlnnODekfGH00p+yaKYPO
         zG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXl+ddGDesrxatGggNhLjN1zxeA9h1K2usnCBXIaqScdydXmswWD8ohSiDD201FGQpR8u701K2MKWLQdPhZlpLABW8kyPgdoqK7xMZj
X-Gm-Message-State: AOJu0YxRGSb6iMUiceArDg3KJ0JOVNcRy+OYgyI/sHLA5VzQsA4F0u+N
	0r4IzT0aup3kBCd5ba3VMem9Mdetzll/CeEwCOqJq4TWhfHANApyB+qW7B7iK6Ukm/LRm/GZvkG
	6Er+rzz1u8pYrDzqFYjzZ4Fpdyp9yMg==
X-Google-Smtp-Source: AGHT+IEc4cDi9d04mUFz7pcyCUYCCTXc24pB4av/QXdROM2NygUWuAhnkvV0KMdhUE3//ZdLw4UfzyQBI3tbL3GiAWOd
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:22b1:9c9e:3544:83b8])
 (user=axelrasmussen job=sendgmr) by 2002:a05:6902:c09:b0:de5:5304:3206 with
 SMTP id 3f1490d57ef6-dee4f52d715mr74188276.11.1715287153666; Thu, 09 May 2024
 13:39:13 -0700 (PDT)
Date: Thu,  9 May 2024 13:39:07 -0700
In-Reply-To: <20240509203907.504891-1-axelrasmussen@google.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240509203907.504891-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509203907.504891-2-axelrasmussen@google.com>
Subject: [PATCH 1/1] arch/fault: don't print logs for simulated poison errors
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

For real MCEs, various architectures print log messages when poisoned
memory is accessed (which results in a SIGBUS). These messages can be
important for users to understand the issue.

On the other hand, we have the userfaultfd UFFDIO_POISON operation,
which can "simulate" memory poisoning. That particular process will get
SIGBUS on access to the memory, but this effect is tied to an MM, rather
than being global like a real poison event. So, we don't want to log
about this case to the global kernel log; instead, let the process
itself log or whatever else it wants to do. This avoids spamming the
kernel log, and avoids e.g. drowning out real events with simulated
ones.

To identify this situation, add a new VM_FAULT_HWPOISON_SIM flag. This
is expected to be set *in addition to* one of the existing
VM_FAULT_HWPOISON or VM_FAULT_HWPOISON_LARGE flags (which are mutually
exclusive).

Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 arch/parisc/mm/fault.c   | 7 +++++--
 arch/powerpc/mm/fault.c  | 6 ++++--
 arch/x86/mm/fault.c      | 6 ++++--
 include/linux/mm_types.h | 5 +++++
 mm/hugetlb.c             | 3 ++-
 mm/memory.c              | 2 +-
 6 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index c39de84e98b0..e5370bcadf27 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -400,9 +400,12 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 #ifdef CONFIG_MEMORY_FAILURE
 		if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
 			unsigned int lsb = 0;
-			printk(KERN_ERR
+
+			if (!(fault & VM_FAULT_HWPOISON_SIM)) {
+				pr_err(
 	"MCE: Killing %s:%d due to hardware memory corruption fault at %08lx\n",
-			tsk->comm, tsk->pid, address);
+				tsk->comm, tsk->pid, address);
+			}
 			/*
 			 * Either small page or large page may be poisoned.
 			 * In other words, VM_FAULT_HWPOISON_LARGE and
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 53335ae21a40..ac5e8a3c7fba 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -140,8 +140,10 @@ static int do_sigbus(struct pt_regs *regs, unsigned long address,
 	if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
 		unsigned int lsb = 0; /* shutup gcc */
 
-		pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
-			current->comm, current->pid, address);
+		if (!(fault & VM_FAULT_HWPOISON_SIM)) {
+			pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
+				current->comm, current->pid, address);
+		}
 
 		if (fault & VM_FAULT_HWPOISON_LARGE)
 			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index e4f3c7721f45..16d077a3ad14 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -928,9 +928,11 @@ do_sigbus(struct pt_regs *regs, unsigned long error_code, unsigned long address,
 		struct task_struct *tsk = current;
 		unsigned lsb = 0;
 
-		pr_err_ratelimited(
+		if (!(fault & VM_FAULT_HWPOISON_SIM)) {
+			pr_err_ratelimited(
 	"MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
-			tsk->comm, tsk->pid, address);
+				tsk->comm, tsk->pid, address);
+		}
 		if (fault & VM_FAULT_HWPOISON_LARGE)
 			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
 		if (fault & VM_FAULT_HWPOISON)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5240bd7bca33..7f8fc3efc5b2 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1226,6 +1226,9 @@ typedef __bitwise unsigned int vm_fault_t;
  * @VM_FAULT_HWPOISON_LARGE:	Hit poisoned large page. Index encoded
  *				in upper bits
  * @VM_FAULT_SIGSEGV:		segmentation fault
+ * @VM_FAULT_HWPOISON_SIM	Hit poisoned, PTE marker; this indicates a
+ *				simulated poison (e.g. via usefaultfd's
+ *                              UFFDIO_POISON), not a "real" hwerror.
  * @VM_FAULT_NOPAGE:		->fault installed the pte, not return page
  * @VM_FAULT_LOCKED:		->fault locked the returned page
  * @VM_FAULT_RETRY:		->fault blocked, must retry
@@ -1245,6 +1248,7 @@ enum vm_fault_reason {
 	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x000010,
 	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x000020,
 	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x000040,
+	VM_FAULT_HWPOISON_SIM   = (__force vm_fault_t)0x000080,
 	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
 	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
 	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
@@ -1270,6 +1274,7 @@ enum vm_fault_reason {
 	{ VM_FAULT_HWPOISON,            "HWPOISON" },	\
 	{ VM_FAULT_HWPOISON_LARGE,      "HWPOISON_LARGE" },	\
 	{ VM_FAULT_SIGSEGV,             "SIGSEGV" },	\
+	{ VM_FAULT_HWPOISON_SIM,	"HWPOISON_SIM" },	\
 	{ VM_FAULT_NOPAGE,              "NOPAGE" },	\
 	{ VM_FAULT_LOCKED,              "LOCKED" },	\
 	{ VM_FAULT_RETRY,               "RETRY" },	\
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 65456230cc71..2b4e0173e806 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6485,7 +6485,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 				pte_marker_get(pte_to_swp_entry(entry));
 
 			if (marker & PTE_MARKER_POISONED) {
-				ret = VM_FAULT_HWPOISON_LARGE |
+				ret = VM_FAULT_HWPOISON_SIM |
+				      VM_FAULT_HWPOISON_LARGE |
 				      VM_FAULT_SET_HINDEX(hstate_index(h));
 				goto out_mutex;
 			}
diff --git a/mm/memory.c b/mm/memory.c
index d2155ced45f8..29a833b996ae 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3910,7 +3910,7 @@ static vm_fault_t handle_pte_marker(struct vm_fault *vmf)
 
 	/* Higher priority than uffd-wp when data corrupted */
 	if (marker & PTE_MARKER_POISONED)
-		return VM_FAULT_HWPOISON;
+		return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SIM;
 
 	if (pte_marker_entry_uffd_wp(entry))
 		return pte_marker_handle_uffd_wp(vmf);
-- 
2.45.0.118.g7fe29c98d7-goog


