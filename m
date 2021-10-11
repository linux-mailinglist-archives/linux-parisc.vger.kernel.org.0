Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFDB428C82
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Oct 2021 14:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236339AbhJKMG1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 11 Oct 2021 08:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40421 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234320AbhJKMG0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 11 Oct 2021 08:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633953865;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6/UQYl/XVfz1u8aL1mV3gDk9yEhwnmg9oxdpI3UoFb8=;
        b=KvXHy3fh1FPYpujiGXPgtA1C79NPw5HgdNUuh7vu9WhSMbi81dBjH79lX2JzSMxlqHUmbF
        zj5THRZfUhysKGTBvngQV29JrpN0/5a5RbwhvHnirJelsa0QTfpbLqk0N2Qb/UADggulbt
        Iib4q6Qnv6OootSKKbpNLQCiMYnEz1A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-6HdcrOHRPg--jgacZuFDpg-1; Mon, 11 Oct 2021 08:04:24 -0400
X-MC-Unique: 6HdcrOHRPg--jgacZuFDpg-1
Received: by mail-ed1-f71.google.com with SMTP id g28-20020a50d0dc000000b003dae69dfe3aso15659837edf.7
        for <linux-parisc@vger.kernel.org>; Mon, 11 Oct 2021 05:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6/UQYl/XVfz1u8aL1mV3gDk9yEhwnmg9oxdpI3UoFb8=;
        b=4CW4QDo7mQsfdsA1lbA7AHOA4LLrKvNab6PavQLyQ+7WBJHH3qJFHJbTGUPjRisR+L
         THF4B31YtqjR4QyZZYJIKPfL3Z4Bw9hSz9i0lQVILpHv2CNf8Tb/I8d/SBnxVyaDdb5+
         z+hMOPGAgQ5T3kb4fS1fmsV7nc/6wH6HSWB6U0aGdqLb+tybD0DFebhPBZkwHO43k9ke
         nz1W7f5ATmqqdxlYD7+1KX0CQI0udAMwYzkRStIaemeXTo+zKNGfKiNyribNizMm9Dfj
         70z72P1tZ7maPBDJLoN5PZi2id05peBt+nAo+ghuWQuzYIn3E87YFbsS1B5efoMxammJ
         01iw==
X-Gm-Message-State: AOAM530Z8NtHf0ceaUtAvu9PFGLCWtTIzO2BPW5uHeWNQZSn73VarQxU
        Rl9POwlLAAqWiHuo9cGNcHp4NHCZYKsYGT3rlwjbxo8L/rn3hu+ctuSm4/9EeKpD7y8FY8r33NJ
        wjj2LSwqo+V3O/MI5+w5ntkr1
X-Received: by 2002:a17:906:6bce:: with SMTP id t14mr5105167ejs.546.1633953863649;
        Mon, 11 Oct 2021 05:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVo7pMtVffuQEXqsF/L2jnPTyIClLeLABvDqmnuGdNXl4W+vIVe08L9GSGn7GemWiCV8sawQ==
X-Received: by 2002:a17:906:6bce:: with SMTP id t14mr5105145ejs.546.1633953863516;
        Mon, 11 Oct 2021 05:04:23 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
        by smtp.gmail.com with ESMTPSA id j22sm3412840ejt.11.2021.10.11.05.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 05:04:22 -0700 (PDT)
Date:   Mon, 11 Oct 2021 08:04:16 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James E J Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v5 16/16] x86/tdx: Add cmdline option to force use of
 ioremap_host_shared
Message-ID: <20211011075945-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009070132-mutt-send-email-mst@kernel.org>
 <8c906de6-5efa-b87a-c800-6f07b98339d0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c906de6-5efa-b87a-c800-6f07b98339d0@linux.intel.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Oct 10, 2021 at 07:39:55PM -0700, Andi Kleen wrote:
> 
> > The connection is quite unfortunate IMHO.
> > Can't there be an option
> > that unbreaks drivers *without* opening up security holes by
> > making BIOS shared?
> 
> That would require new low level APIs that distinguish both cases, and a
> tree sweep.
> 
> 
> -Andi

Presumably bios code is in arch/x86 and drivers/acpi, right?
Up to 200 calls the majority of which is likely private ...

I don't have better ideas but the current setup will just
result in people making their guests vulnerable whenever they
want to allow device pass-through.

-- 
MST

