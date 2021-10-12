Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654E742AEF1
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Oct 2021 23:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbhJLVct (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Oct 2021 17:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48127 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234146AbhJLVcs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Oct 2021 17:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634074245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eq+RzJgPHGQ1lh7AV+pnk4SW99n38qW+iDQrUerrfKQ=;
        b=S1pGqFAtZflV7/4+/KOYFjNtM4GsgLjuwrKSu3HlmI2O0Tdow9hi/sRxk83gb6UMEM7O1P
        WIFfwfgDJLdrIsgmbPPytJXrJBTbIQsnNZzNAT2xGu8JI28+yP9hkdtsYaN3krU8sVm/15
        ZqMRay0JPNxMs8Qwi3lnsQjkOd4Dfpo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-P--vhG7JNASJrc7_hgFKdg-1; Tue, 12 Oct 2021 17:30:44 -0400
X-MC-Unique: P--vhG7JNASJrc7_hgFKdg-1
Received: by mail-wr1-f72.google.com with SMTP id p12-20020adfc38c000000b00160d6a7e293so321338wrf.18
        for <linux-parisc@vger.kernel.org>; Tue, 12 Oct 2021 14:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eq+RzJgPHGQ1lh7AV+pnk4SW99n38qW+iDQrUerrfKQ=;
        b=em/QXyp8HcswzHZPxlgYYm13nzBXFWK5AWsSlFkSLVSUu54Vl3z9psx90DlBTTEDTM
         sxH4iqW1KaTm0knfYG3SYLEKrqLFohORMyB/45LeYttIOYb6FNTBeTt90WxxpXGboLDa
         jeLIbVcW4419TZAsyelpZOf2yohzNFsoG47sRhu0nOJIkSACo/73fzdutjXo5WN6CxDL
         JTz7IfMSub4mQ9uSkR3xfEsxQJFOnB5Bk/vtCikK4awshFJ1LdM1FCjSdN1RTogduftB
         qVCWfvTlfoTWlfUz+ABHnbvE0yjR4KgzCOHLJdMuwCrZy74ZGk2MbWQ6ZG2OOBTfGv7N
         LD6w==
X-Gm-Message-State: AOAM533ZHdtYmm6Vem6y7m5CiLF0IBEV10GMDckkTYeG1xYiIMP5cTxF
        bZZ4kCHoLewqejsPEeaiAcWG1uFlWOxJfHSmQZoMkUaUQMU/JXsQ9m/n31QsJMJ9yZD6Z7wphvr
        G1DxRBujNe+EYxHO7NyPeexV6
X-Received: by 2002:a1c:f216:: with SMTP id s22mr8596854wmc.27.1634074243393;
        Tue, 12 Oct 2021 14:30:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDiipoOYS8wHel/0NefRnO1CIzQW9KYRq/ON4whSk4X4kD3O7SLlEE9ljv12IUks5+RmoxVw==
X-Received: by 2002:a1c:f216:: with SMTP id s22mr8596816wmc.27.1634074243191;
        Tue, 12 Oct 2021 14:30:43 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
        by smtp.gmail.com with ESMTPSA id k17sm3951985wmj.0.2021.10.12.14.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 14:30:42 -0700 (PDT)
Date:   Tue, 12 Oct 2021 17:30:36 -0400
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
Message-ID: <20211012171846-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009070132-mutt-send-email-mst@kernel.org>
 <8c906de6-5efa-b87a-c800-6f07b98339d0@linux.intel.com>
 <20211011075945-mutt-send-email-mst@kernel.org>
 <9d0ac556-6a06-0f2e-c4ff-0c3ce742a382@linux.intel.com>
 <20211011142330-mutt-send-email-mst@kernel.org>
 <4fe8d60a-2522-f111-995c-dcbefd0d5e31@linux.intel.com>
 <20211012165705-mutt-send-email-mst@kernel.org>
 <c09c961d-f433-4a68-0b38-208ffe8b36c7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c09c961d-f433-4a68-0b38-208ffe8b36c7@linux.intel.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Oct 12, 2021 at 02:18:01PM -0700, Andi Kleen wrote:
> 
> > Interesting. VT-d tradeoffs ... what are they?
> 
> The connection to the device is not encrypted and also not authenticated.
> 
> This is different that even talking to the (untrusted) host through shared
> memory where you at least still have a common key.

Well it's different sure enough but how is talking to host less secure?
Cold boot attacks and such?

> > Allowing hypervisor to write into BIOS looks like it will
> > trivially lead to code execution, won't it?
> 
> This is not about BIOS code executing. While the guest firmware runs it is
> protected of course. This is for BIOS structures like ACPI tables that are
> mapped by Linux. While AML can run byte code it can normally not write to
> arbitrary memory.

I thought you basically create an OperationRegion of SystemMemory type,
and off you go. Maybe the OSPM in Linux is clever and protects
some memory, I wouldn't know.

> The risk is more that all the Linux code dealing with this hasn't been
> hardened to deal with malicious input.
> 
> -Andi


-- 
MST

