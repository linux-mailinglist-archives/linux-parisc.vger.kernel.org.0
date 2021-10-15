Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C871642E982
	for <lists+linux-parisc@lfdr.de>; Fri, 15 Oct 2021 08:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbhJOG7o (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 15 Oct 2021 02:59:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44851 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235809AbhJOG7i (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 15 Oct 2021 02:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634281052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XrPIV2fprNlCi1MFN3D9uad/uIU7Ev00FM5PU9k9D8g=;
        b=C3PbEB7xE7mcwU+QYayRXhFogfghbKaCxUoVFresog2GSD32Xvc/ZG2LfJ3OkZE2Pnj9XV
        nCtvKP3J7BTlcq8p5R3a/sd5Bu55rMpGc3a4+zH7MdQ68GQC45aZGiFk+fJSpeXvBhM4zA
        /AwZBGd2WNUCOpzoOeiKyCHQUNnzM8Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-GY6klsboOyeE4C38r554DQ-1; Fri, 15 Oct 2021 02:57:26 -0400
X-MC-Unique: GY6klsboOyeE4C38r554DQ-1
Received: by mail-ed1-f72.google.com with SMTP id v2-20020a50f082000000b003db24e28d59so7358335edl.5
        for <linux-parisc@vger.kernel.org>; Thu, 14 Oct 2021 23:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XrPIV2fprNlCi1MFN3D9uad/uIU7Ev00FM5PU9k9D8g=;
        b=20MYxNqnDsNuLMJVr/NbSOYOsg4LFptfFIR4cQFlvd1UCP2+NkPNEnyktka2z2JsE0
         Ab6f7LqXuUG3NwI9ci1uJIq1XUF4LkchxvDf4AhVMa6aM4dfyui4byGBUcfEAfp9spu9
         u5lRq4GALmxIeyaV028Y4IGwOLIxC9TDEBx2ki0ftZS8iwKNgShWInxPFya8LvoavFM7
         f+ziOFZWzqPsekNxEozsm0DakHkMU2+IpaJPKIZYf+SJ8jBxIapqpL/SEmIcjBdsnLnE
         8ikkfcgw47TDzqVkCy5wMQoCfCX23N07t3wF1hUX/c8mszQZ0qFv1d2jptJ5wxcG51xU
         tRtg==
X-Gm-Message-State: AOAM532ne47CfXhB3BQ6RYP5LvbWiHixUYmQs2HOWCGew1Tb0uEJL/z5
        kDvtUgvHLVvO8fn4FEK6T9FwM5ktwuKeygxUgEDjPXfhx9+A+Xt9zhE8ViKi5SybW5P7NlZMml4
        oIHV+j01ZXBrmgRMj5Ig8QwlL
X-Received: by 2002:a05:6402:447:: with SMTP id p7mr15322752edw.261.1634281045396;
        Thu, 14 Oct 2021 23:57:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3wsrR7axiFHmfph2bLnxYqxO8ciYC1BIDrnzojSmvwa6tk0pkkVI5pGdF1DtDsbmx8LCmYQ==
X-Received: by 2002:a05:6402:447:: with SMTP id p7mr15322726edw.261.1634281045218;
        Thu, 14 Oct 2021 23:57:25 -0700 (PDT)
Received: from redhat.com ([2.55.1.196])
        by smtp.gmail.com with ESMTPSA id e11sm4094212edl.70.2021.10.14.23.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 23:57:24 -0700 (PDT)
Date:   Fri, 15 Oct 2021 02:57:16 -0400
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
Message-ID: <20211015024923-mutt-send-email-mst@kernel.org>
References: <20211009070132-mutt-send-email-mst@kernel.org>
 <8c906de6-5efa-b87a-c800-6f07b98339d0@linux.intel.com>
 <20211011075945-mutt-send-email-mst@kernel.org>
 <9d0ac556-6a06-0f2e-c4ff-0c3ce742a382@linux.intel.com>
 <20211011142330-mutt-send-email-mst@kernel.org>
 <4fe8d60a-2522-f111-995c-dcbefd0d5e31@linux.intel.com>
 <20211012165705-mutt-send-email-mst@kernel.org>
 <c09c961d-f433-4a68-0b38-208ffe8b36c7@linux.intel.com>
 <20211012171846-mutt-send-email-mst@kernel.org>
 <c2ce5ad8-4df7-3a37-b235-8762a76b1fd3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2ce5ad8-4df7-3a37-b235-8762a76b1fd3@linux.intel.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Oct 14, 2021 at 10:50:59PM -0700, Andi Kleen wrote:
> 
> > I thought you basically create an OperationRegion of SystemMemory type,
> > and off you go. Maybe the OSPM in Linux is clever and protects
> > some memory, I wouldn't know.
> 
> 
> I investigated this now, and it looks like acpi is using ioremap_cache(). We
> can hook into that and force non sharing. It's probably safe to assume that
> this is not used on real IO devices.
> 
> I think there are still some other BIOS mappings that use just plain
> ioremap() though.
> 
> 
> -Andi

Hmm don't you mean the reverse? If you make ioremap shared then OS is
protected from malicious ACPI? If you don't make it shared then
malicious ACPI can poke at arbitrary OS memory.  Looks like making
ioremap non shared by default is actually less safe than shared.
Interesting.

For BIOS I suspect there's no way around it, it needs to be
audited since it's executable.

-- 
MST

