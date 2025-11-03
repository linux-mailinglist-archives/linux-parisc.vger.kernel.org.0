Return-Path: <linux-parisc+bounces-4250-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01639C2E4D0
	for <lists+linux-parisc@lfdr.de>; Mon, 03 Nov 2025 23:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0C644E29DC
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Nov 2025 22:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3651DED63;
	Mon,  3 Nov 2025 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwPoXP3p"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49BF1C3C18
	for <linux-parisc@vger.kernel.org>; Mon,  3 Nov 2025 22:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762209756; cv=none; b=flQqa/GObakHKst3egr3IYAy8HCvy1uYL9n1r0AQAMuJPEWzmzYl/7316eXL1s2nC/5bM6Mr6tIWaO2dJEBR3gRZMejcqpeySylYPNqeXFPdKbRvYC0DsNzkMlVn+7LXpUgMFUdC6+SmILISXeLEJh1CJcJmVrYyNRTSDKRS2K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762209756; c=relaxed/simple;
	bh=vZz8hLZHl3yo+H+t/J5m/JEPqK7xzGD9lPN2pFTI7OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thDqDPnsRtmeKPEfngBsE+szy0bzEGu3ULDTGJ93zUZwqEq1VyN0MbhELL8J4z3Qyk8bD750oI/kawWSMbpRnXI+9kcaPZfBgYHbnIAQCJjQoQuWm3yBUNzsglLRw9YKOn91jiFnKjM10lveMn1FGZq0+FTJ8Sut/7Ve75+GU8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwPoXP3p; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b99dc8f439cso782423a12.0
        for <linux-parisc@vger.kernel.org>; Mon, 03 Nov 2025 14:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762209754; x=1762814554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4shHKbY0GvQGnOM1w4nl9uewlypzFYNw5rgQwBl4+M=;
        b=FwPoXP3pOdY4EvKBQx9lGTPSPgVQ1XcrgndnRI0zbmiT8ocamUoDdu/+Y1jNtSlUGr
         iO6RCXGUMKNOflFpai/2K1CMFQzfvK4JA7rHs/L2XR2k80Fr3D7yq2j8AfcO04ZBa7XH
         MDkDDDIna4x2HFSBdCBYF04YAqKTsixmQptRo7pHa47gqufp9ejgUeAi2fkV3pLQYFzk
         +DrXVOwBEC5m7u2uU/PVmJ8wNhJkIUMaO3Mi4WfrydiB/MymelnCRcuGk1T2XSpZFnfH
         nzITVlPKgaR4WUNaXV2p7SrE9WlwKpafNDK6XM76u0PsofVzGFbfqhuDngBDmJhALg/X
         wQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762209754; x=1762814554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4shHKbY0GvQGnOM1w4nl9uewlypzFYNw5rgQwBl4+M=;
        b=mM67xua+roiS9sI4tu5UufqIGsW1wHatvvuUqxAi9Qv7UH5M8fzw88jNrK70/t1T9c
         07MnrxMsodtOS7z9PLnXrDckBCppGn+vcV8PJfbe09j0rK8rNZOpbdOVJ12xABZegali
         J+Q3ZHkxElUzyIkUp2V/eXpAhYdUku07+3yYjZwFqNaoJmgwmkA36GXiDTzJqoqFfqyo
         WmnmV9GXlIoORZZYCZ8EcLCSagyraK1fzVyfFSXUM2HAbHtVvLY8dt3HMRd29MA7A4kM
         t4nTxkYdX4LvDmhDYBquwuS9rhRsEkHaEA7dNxW0loD/PaM5+Rx7RxkzMxA1GTw57Kj5
         Q2/A==
X-Gm-Message-State: AOJu0YyODNrqaiQZvfqmxNPPaL9nlL74LgHADzt/Zes2hwrS1z3GZaym
	tk4DdqFFZbS4HKZ/KqQ2KlYMgxx/TbpM70z3gpk1dqfKzHnSvwfXT9Bh
X-Gm-Gg: ASbGncvNxyEcv6uaQnmg57/4SKAmpz+cRByjsZu+enFcnqv1aYQf/+lhbwSuhgHw+Qc
	n07Xn9UCsbQExhtVL9erReCi99ji6guhPvpf1cLEyRARzs/+enLlnxBO2BHscbbbYV24SMelZy8
	nMzXhfSLIRDypS/fDvGkoZkHKkQNrYkm2nV3n3x+eH8g1QAjsM373SVHNvUGF/xb1jyQ9mkMNTw
	gMbVpVjTGS+g2Zdm149wU4ASawckDZ4NteTqTFjiwYmfCRU896IrYxLjRqB1WmnBok0tz2FBzMv
	Ttk7uzwuJ3bNZr03ftcy5rJh33OG51LPBgugfk9V2E/dr0e6Z1HhrkxGWpzaX+BmdwMTb3O1svK
	2dR4sQKJHSuBmWr+QKnCJC6xFCHY0nvw38uwtu7EEAxdbFIb/fNSdlxMzwcgxGY9Z8DK/ubApA5
	XuOfjCSmTWXHMus2l/9mU0g9U=
X-Google-Smtp-Source: AGHT+IGj+1cRZMrKUuGL8R5FZFq6faDLQTjGakYUUWz32LX38yHiSfVm4oE2gX09XHlCI60+MnwQFQ==
X-Received: by 2002:a17:902:e5c5:b0:295:7f1f:a808 with SMTP id d9443c01a7336-2957f1fb664mr93550725ad.38.1762209753795;
        Mon, 03 Nov 2025 14:42:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2960199901dsm2673675ad.34.2025.11.03.14.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 14:42:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 3 Nov 2025 14:42:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: deller@kernel.org
Cc: linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: Avoid crash due to unaligned access in unwinder
Message-ID: <a3561d53-2d18-45d7-bd50-b39c4ec77fa5@roeck-us.net>
References: <20251103221112.38617-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103221112.38617-1-deller@kernel.org>

On Mon, Nov 03, 2025 at 11:11:10PM +0100, deller@kernel.org wrote:
> From: Helge Deller <deller@gmx.de>
> 
> Guenter Roeck reported this kernel crash on his emulated B160L machine:
> 
> Starting network: udhcpc: started, v1.36.1
>  Backtrace:
>   [<104320d4>] unwind_once+0x1c/0x5c
>   [<10434a00>] walk_stackframe.isra.0+0x74/0xb8
>   [<10434a6c>] arch_stack_walk+0x28/0x38
>   [<104e5efc>] stack_trace_save+0x48/0x5c
>   [<105d1bdc>] set_track_prepare+0x44/0x6c
>   [<105d9c80>] ___slab_alloc+0xfc4/0x1024
>   [<105d9d38>] __slab_alloc.isra.0+0x58/0x90
>   [<105dc80c>] kmem_cache_alloc_noprof+0x2ac/0x4a0
>   [<105b8e54>] __anon_vma_prepare+0x60/0x280
>   [<105a823c>] __vmf_anon_prepare+0x68/0x94
>   [<105a8b34>] do_wp_page+0x8cc/0xf10
>   [<105aad88>] handle_mm_fault+0x6c0/0xf08
>   [<10425568>] do_page_fault+0x110/0x440
>   [<10427938>] handle_interruption+0x184/0x748
>   [<11178398>] schedule+0x4c/0x190
>   BUG: spinlock recursion on CPU#0, ifconfig/2420
>   lock: terminate_lock.2+0x0/0x1c, .magic: dead4ead, .owner: ifconfig/2420, .owner_cpu: 0
> 
> While creating the stack trace, the unwinder uses the stack pointer to guess
> the previous frame to read the previous stack pointer from memory.  The crash
> happens, because the unwinder tries to read from unaligned memory and as such
> triggers the unalignment trap handler which then leads to the spinlock
> recursion and finally to a deadlock.
> 
> Fix it by checking the alignment before accessing the memory.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: <stable@vger.kernel.org> # v6.12+

Tested-by: Guenter Roeck <linux@roeck-us.net>

