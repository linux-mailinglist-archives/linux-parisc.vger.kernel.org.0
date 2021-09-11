Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA49407AF4
	for <lists+linux-parisc@lfdr.de>; Sun, 12 Sep 2021 01:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234629AbhIKXz7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 11 Sep 2021 19:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37903 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234562AbhIKXz6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 11 Sep 2021 19:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631404485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XhzTiX0DZYV1X5ckSDoJZp4U7aZCZRTdTtc5atz14SI=;
        b=HIYOtFgY4HxMNyU0nzLti5A8vG2pVu6p4v3N2hqr9VCqnSjvaEgH03c0xLylchB2XX6JhZ
        MZja69E6+/mBnkFFoaH07qfH2BNOXewJXF/fF6FcQeepTpcoGIs0L1KGN//6havxYew7HX
        7hUkBeY6or6zno1I58JXf2KSUB2lf60=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-C8R6rYTeOF6A4qK6MBNAaQ-1; Sat, 11 Sep 2021 19:54:44 -0400
X-MC-Unique: C8R6rYTeOF6A4qK6MBNAaQ-1
Received: by mail-ej1-f69.google.com with SMTP id 22-20020a170906301600b005ca77a21183so2255409ejz.20
        for <linux-parisc@vger.kernel.org>; Sat, 11 Sep 2021 16:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XhzTiX0DZYV1X5ckSDoJZp4U7aZCZRTdTtc5atz14SI=;
        b=78mqN2b7T8S1AZ2Um/TDa65WJ9HRbysZ0q74GVJ2//bfoFHgjIfulDb0wcFvbNy7kl
         pV9UKTEhgA0m4uiuMZj8M+HvwJFYXTdcwlBE3Cm0fyQBy71+bSdGaLeJGntYEQBnZeBY
         B5oS+eAFPotqmFyBp4NL6omsUoxyWSfRmvvK+BZdltck0bhBrWg3RFWCpNFf98651bks
         dVLCnefibUD/kE4/RYsB/D3VI+YLrvCVT4IFGtUE1chXmg4ImLTP+JUVDpem6FVuVvON
         veVwb1pRrMvaExxcEEoKNPeMYrVBxuI0PZ3d0R0DMakGHvmTbcUmMrRf0nyxQwMC1G4/
         BC8Q==
X-Gm-Message-State: AOAM531CkzmIpjaOcVJLg8qQf9WbA8l5xzj5XUHK30F9psVtADLjB7Ve
        IbfxPRdN8e3ZVk62plqqZPACufsQS9LB9LrLjLJVWD1+s2pH+ZkmeF52qTl2VGituYcmKi2H9ux
        biqKHLrRzwvXqLF4dZ3wA4Fuk
X-Received: by 2002:a17:906:5855:: with SMTP id h21mr4944809ejs.230.1631404482987;
        Sat, 11 Sep 2021 16:54:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUJ/Dz7qpoDYQNg7a7mY8Cl7pe7fwOabdq++HQzqfzjVSc2KbxoH+7byBLBBXMvIdUmNqg2Q==
X-Received: by 2002:a17:906:5855:: with SMTP id h21mr4944788ejs.230.1631404482774;
        Sat, 11 Sep 2021 16:54:42 -0700 (PDT)
Received: from redhat.com ([2.55.27.174])
        by smtp.gmail.com with ESMTPSA id n13sm1309780ejk.97.2021.09.11.16.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 16:54:41 -0700 (PDT)
Date:   Sat, 11 Sep 2021 19:54:36 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        "Kuppuswamy, Sathyanarayanan" 
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
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Message-ID: <20210911195006-mutt-send-email-mst@kernel.org>
References: <20210824053830-mutt-send-email-mst@kernel.org>
 <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
 <20210829112105-mutt-send-email-mst@kernel.org>
 <09b340dd-c8a8-689c-4dad-4fe0e36d39ae@linux.intel.com>
 <20210829181635-mutt-send-email-mst@kernel.org>
 <3a88a255-a528-b00a-912b-e71198d5f58f@linux.intel.com>
 <20210830163723-mutt-send-email-mst@kernel.org>
 <69fc30f4-e3e2-add7-ec13-4db3b9cc0cbd@linux.intel.com>
 <20210910054044-mutt-send-email-mst@kernel.org>
 <f672dc1c-5280-7bbc-7a56-7c7aab31725c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f672dc1c-5280-7bbc-7a56-7c7aab31725c@linux.intel.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Sep 10, 2021 at 09:34:45AM -0700, Andi Kleen wrote:
> > > that's why
> > > an extra level of defense of ioremap opt-in is useful.
> > OK even assuming this, why is pci_iomap opt-in useful?
> > That never happens before probe - there's simply no pci_device then.
> 
> 
> Hmm, yes that's true. I guess we can make it default to opt-in for
> pci_iomap.
> 
> It only really matters for device less ioremaps.

OK. And same thing for other things with device, such as
devm_platform_ioremap_resource.
If we agree on all that, this will basically remove virtio
changes from the picture ;)

-- 
MST

