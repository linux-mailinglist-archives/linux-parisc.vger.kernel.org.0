Return-Path: <linux-parisc+bounces-1376-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6998C180C
	for <lists+linux-parisc@lfdr.de>; Thu,  9 May 2024 23:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91D78B20B1E
	for <lists+linux-parisc@lfdr.de>; Thu,  9 May 2024 21:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F70083A0D;
	Thu,  9 May 2024 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HFLxPhB8"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED9282876
	for <linux-parisc@vger.kernel.org>; Thu,  9 May 2024 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715288755; cv=none; b=OUDvAthSG9MUuvx6MQVJZRBQehiKtiNblnC1ATjeT8M61Z9GVOM+tLFX3H4pBmVmWxtf84LoOWY6olBGW3GeT93/Sk89hKU94eA4jER1HYxmo9QLDEEjaAzFbxkNDpwq/IRT8FQXhH1orAvuZdNrWnLptZWyRpEIgrJV7TJ05G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715288755; c=relaxed/simple;
	bh=GGSszYP/aFMcmRMbjmKjqK4b6kv+LQh+OiWLMWhN/R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDCbpc2/Q64M11XYezlTAVVaZZR3Q4TffAwe8u/YEnE+pnkvNcONGnRoIbAHAu39C/9r6eoQSEedofslOwUROAfxIVjj4y6Nt8IC3AmgRbjaoXW8wESkZXbyq76pGa2TtKG/dYQtdmPzv+NpwMiQwu1l4O6P2IK2ItsQAqkjYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HFLxPhB8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715288752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7T3LDIhsXGXUAobvNy/zX3cm6DyL69PkcrlNbmolHko=;
	b=HFLxPhB8CWe14xhvyoJw0i/ngXHMYT6SMDjd68T9LVj5nK5qbL5pCMarjtN2lL4cl2R3ug
	/WIkUvTZLuLIJI8GgwTGhBEjhB+op9h6AlBdredhG1AtVBDqtZXTVPm9EoFMY6fqZE5df3
	ixegWxDd7RvX/sAWJvgaFOpb8KNN/AE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-TKy2cYTcNfSnzuwmZyrkbA-1; Thu, 09 May 2024 17:05:51 -0400
X-MC-Unique: TKy2cYTcNfSnzuwmZyrkbA-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-61be7b0b30aso2002417b3.1
        for <linux-parisc@vger.kernel.org>; Thu, 09 May 2024 14:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715288750; x=1715893550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T3LDIhsXGXUAobvNy/zX3cm6DyL69PkcrlNbmolHko=;
        b=c6r4gzb9TR4Me0LQO/uGc/bgUblZ52ypBsIZhVquDoqhoaBiXtULi2WakZPlx4mv0G
         dxL6EWIYBI/AMhuAluxSfGLFwL2jVfAsiAhBJ/7kzgLJg6XpptFqj29lbQQs0mg3ivmg
         QP1pnPbYsAEeLlAiPqLEsOh1+GhfNnEj594+D6M1ajyGqbZp70xtbQjl/jNO+nrU7PlG
         hB9E7+nY+kyh89YqSdkhY/TrHRZk62fXML2TMbr/SGH+6wLibZIDJQKtP9pO8fN8Z8Gi
         dfdnSsOM1eNiOOtvmp7ftA5T6ETCuxRoeFxtuFhciaF2zwWDm6bd1tCpA9Jc/pOM4Ew1
         R9uA==
X-Forwarded-Encrypted: i=1; AJvYcCXxG+5dMQcDGDaVulBajkVz5/FneMEfGAq7DQDxCNuIaI43mRP52epH1ISf1VvMB63MsGNLRpCbp9dxWCoAPSe7+7HiI7XgIKvbaBF5
X-Gm-Message-State: AOJu0YyjY+nGWz6/3r7lg6p05xRWtWlA61eszIrKjiS4rnpdgYu9OeJS
	0Ubf0kRPRboCg8NeW9di1KixxJKmLtRepusiWwWXCpAM06iOKTcKZsmUzobiOe/0WfeKjamS00W
	XmDo1pHQ6Nh87xtBXG4dWUJEUIx4rikb7ggDP18jj2ofLg5tCvIZzxVrZxwaVVQ==
X-Received: by 2002:a05:690c:380e:b0:61a:e298:54bd with SMTP id 00721157ae682-622afffc878mr7230377b3.5.1715288750065;
        Thu, 09 May 2024 14:05:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS20oQmRUsuSl8lwz2cOfuBq3VxXVmGt3mp7XGUROKc3y0rvlg28/J2adK4SCZ79ErLFWMGg==
X-Received: by 2002:a05:690c:380e:b0:61a:e298:54bd with SMTP id 00721157ae682-622afffc878mr7229957b3.5.1715288749344;
        Thu, 09 May 2024 14:05:49 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e2340a3sm4647617b3.4.2024.05.09.14.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 14:05:48 -0700 (PDT)
Date: Thu, 9 May 2024 17:05:46 -0400
From: Peter Xu <peterx@redhat.com>
To: Axel Rasmussen <axelrasmussen@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Liu Shixin <liushixin2@huawei.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH 1/1] arch/fault: don't print logs for simulated poison
 errors
Message-ID: <Zj06qh2U0wTwAZLK@x1n>
References: <20240509203907.504891-1-axelrasmussen@google.com>
 <20240509203907.504891-2-axelrasmussen@google.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240509203907.504891-2-axelrasmussen@google.com>

On Thu, May 09, 2024 at 01:39:07PM -0700, Axel Rasmussen wrote:
> For real MCEs, various architectures print log messages when poisoned
> memory is accessed (which results in a SIGBUS). These messages can be
> important for users to understand the issue.
> 
> On the other hand, we have the userfaultfd UFFDIO_POISON operation,
> which can "simulate" memory poisoning. That particular process will get

It also coveres swapin errors as we talked before, so not always SIM.

I was thinking we should also do that report for swapin errors, however
then I noticed it wasn't reported before the replacement of pte markers,
in commit 15520a3f04, since 2022:

@@ -3727,8 +3731,6 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
                        put_page(vmf->page);
                } else if (is_hwpoison_entry(entry)) {
                        ret = VM_FAULT_HWPOISON;
-               } else if (is_swapin_error_entry(entry)) {
-                       ret = VM_FAULT_SIGBUS;
                } else if (is_pte_marker_entry(entry)) {
                        ret = handle_pte_marker(vmf);
                } else {

So I am guessing it could be fine to just turn this report off to syslog.
There will be a back-and-forth on this behavior, but hopefully this is even
rarer than hwpoison so nobody will notice.

With that, the idea looks valid to me, but perhaps a rename is needed.
Maybe _QUIESCE or _SILENT?

> SIGBUS on access to the memory, but this effect is tied to an MM, rather
> than being global like a real poison event. So, we don't want to log
> about this case to the global kernel log; instead, let the process
> itself log or whatever else it wants to do. This avoids spamming the
> kernel log, and avoids e.g. drowning out real events with simulated
> ones.
> 
> To identify this situation, add a new VM_FAULT_HWPOISON_SIM flag. This
> is expected to be set *in addition to* one of the existing
> VM_FAULT_HWPOISON or VM_FAULT_HWPOISON_LARGE flags (which are mutually
> exclusive).
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
> ---
>  arch/parisc/mm/fault.c   | 7 +++++--
>  arch/powerpc/mm/fault.c  | 6 ++++--
>  arch/x86/mm/fault.c      | 6 ++++--
>  include/linux/mm_types.h | 5 +++++
>  mm/hugetlb.c             | 3 ++-
>  mm/memory.c              | 2 +-
>  6 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index c39de84e98b0..e5370bcadf27 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -400,9 +400,12 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
>  #ifdef CONFIG_MEMORY_FAILURE
>  		if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
>  			unsigned int lsb = 0;
> -			printk(KERN_ERR
> +
> +			if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> +				pr_err(
>  	"MCE: Killing %s:%d due to hardware memory corruption fault at %08lx\n",
> -			tsk->comm, tsk->pid, address);
> +				tsk->comm, tsk->pid, address);
> +			}
>  			/*
>  			 * Either small page or large page may be poisoned.
>  			 * In other words, VM_FAULT_HWPOISON_LARGE and
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 53335ae21a40..ac5e8a3c7fba 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -140,8 +140,10 @@ static int do_sigbus(struct pt_regs *regs, unsigned long address,
>  	if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
>  		unsigned int lsb = 0; /* shutup gcc */
>  
> -		pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
> -			current->comm, current->pid, address);
> +		if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> +			pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
> +				current->comm, current->pid, address);
> +		}
>  
>  		if (fault & VM_FAULT_HWPOISON_LARGE)
>  			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index e4f3c7721f45..16d077a3ad14 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -928,9 +928,11 @@ do_sigbus(struct pt_regs *regs, unsigned long error_code, unsigned long address,
>  		struct task_struct *tsk = current;
>  		unsigned lsb = 0;
>  
> -		pr_err_ratelimited(
> +		if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> +			pr_err_ratelimited(
>  	"MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
> -			tsk->comm, tsk->pid, address);
> +				tsk->comm, tsk->pid, address);
> +		}
>  		if (fault & VM_FAULT_HWPOISON_LARGE)
>  			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
>  		if (fault & VM_FAULT_HWPOISON)
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 5240bd7bca33..7f8fc3efc5b2 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1226,6 +1226,9 @@ typedef __bitwise unsigned int vm_fault_t;
>   * @VM_FAULT_HWPOISON_LARGE:	Hit poisoned large page. Index encoded
>   *				in upper bits
>   * @VM_FAULT_SIGSEGV:		segmentation fault
> + * @VM_FAULT_HWPOISON_SIM	Hit poisoned, PTE marker; this indicates a
> + *				simulated poison (e.g. via usefaultfd's
> + *                              UFFDIO_POISON), not a "real" hwerror.
>   * @VM_FAULT_NOPAGE:		->fault installed the pte, not return page
>   * @VM_FAULT_LOCKED:		->fault locked the returned page
>   * @VM_FAULT_RETRY:		->fault blocked, must retry
> @@ -1245,6 +1248,7 @@ enum vm_fault_reason {
>  	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x000010,
>  	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x000020,
>  	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x000040,
> +	VM_FAULT_HWPOISON_SIM   = (__force vm_fault_t)0x000080,
>  	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
>  	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
>  	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
> @@ -1270,6 +1274,7 @@ enum vm_fault_reason {
>  	{ VM_FAULT_HWPOISON,            "HWPOISON" },	\
>  	{ VM_FAULT_HWPOISON_LARGE,      "HWPOISON_LARGE" },	\
>  	{ VM_FAULT_SIGSEGV,             "SIGSEGV" },	\
> +	{ VM_FAULT_HWPOISON_SIM,	"HWPOISON_SIM" },	\
>  	{ VM_FAULT_NOPAGE,              "NOPAGE" },	\
>  	{ VM_FAULT_LOCKED,              "LOCKED" },	\
>  	{ VM_FAULT_RETRY,               "RETRY" },	\
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 65456230cc71..2b4e0173e806 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6485,7 +6485,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  				pte_marker_get(pte_to_swp_entry(entry));
>  
>  			if (marker & PTE_MARKER_POISONED) {
> -				ret = VM_FAULT_HWPOISON_LARGE |
> +				ret = VM_FAULT_HWPOISON_SIM |
> +				      VM_FAULT_HWPOISON_LARGE |
>  				      VM_FAULT_SET_HINDEX(hstate_index(h));
>  				goto out_mutex;
>  			}
> diff --git a/mm/memory.c b/mm/memory.c
> index d2155ced45f8..29a833b996ae 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3910,7 +3910,7 @@ static vm_fault_t handle_pte_marker(struct vm_fault *vmf)
>  
>  	/* Higher priority than uffd-wp when data corrupted */
>  	if (marker & PTE_MARKER_POISONED)
> -		return VM_FAULT_HWPOISON;
> +		return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SIM;
>  
>  	if (pte_marker_entry_uffd_wp(entry))
>  		return pte_marker_handle_uffd_wp(vmf);
> -- 
> 2.45.0.118.g7fe29c98d7-goog
> 

-- 
Peter Xu


