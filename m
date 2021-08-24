Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5153F5A94
	for <lists+linux-parisc@lfdr.de>; Tue, 24 Aug 2021 11:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235658AbhHXJNA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 24 Aug 2021 05:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42815 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235687AbhHXJM5 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 24 Aug 2021 05:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629796333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UO2zBbBs1G6uT3R3xch5pdAd9JzMFmQCenqYTZnnAws=;
        b=fpWA2k7Ff1r+7o5/7AJED6+9hMf/ftD+cWivp+Y6vpPldH1jtx/mv3MayvQ0fVwJBvPdxG
        yXPDRIsnkQVylBV1nZGmfOyu/oleXLmtoQp0k414lSrCfYvBxZITC9CqntIKWM+Wh9UK9v
        ILsO22UJTdFzndzI9kc44TvipG3s/c4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-1sGJ9M56OMeU14Il_2QBsw-1; Tue, 24 Aug 2021 05:12:11 -0400
X-MC-Unique: 1sGJ9M56OMeU14Il_2QBsw-1
Received: by mail-ej1-f70.google.com with SMTP id yz13-20020a170906dc4d00b005c61ad936f0so2015697ejb.12
        for <linux-parisc@vger.kernel.org>; Tue, 24 Aug 2021 02:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UO2zBbBs1G6uT3R3xch5pdAd9JzMFmQCenqYTZnnAws=;
        b=sFfC3+e4nLxXvyb9SqkJHC0H+MDWbB2XmsPa93NAH7uCRpVpPJsocxHLwhpeSu20bf
         ZfKNU8e43k4XOP17azEaqD7o3uvnDuz36oBdX7+3GBP2QUh4isqV00bh2DTBLC08m6QV
         7zEehpYp8kprD32x7INqO/pDJNnjN1waP1NdB9yIaZC3rrSnPfUKF298SDtR43SY2Pxi
         cwMJWaremZL95LMXBMoNCND52LMc30+RrpucYTQX8Agbp3jkVuzcdjBu5FxmP1twxG/4
         TjgZ0/Eg/1VmeLWqQk1UdwJtCeh7hYw+XAPestZLf2Oe1X4ciCprSeyQ7dTLTDCdFfO/
         WthQ==
X-Gm-Message-State: AOAM530WTZo2/7bzORdemijy2hP2Reg9oNMSDxOvQcW7222VLstf2/8p
        OuiPdQNn/+uoB0/WuBLshCUBom3NaaHgncT2krsgMCN467uRzYexJexBnDsIK3x2tPMA7JI8BKI
        DM/W9blWVn78gwbc5ItnPTmA4
X-Received: by 2002:a17:906:544f:: with SMTP id d15mr39905067ejp.520.1629796330482;
        Tue, 24 Aug 2021 02:12:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3bMICaqu3WLm0C02mi3EAPqHyfBIAeSrxUN0aqhXmoBEhQ7Pz6k5PO9S6BLCHr/N7T4Bnvg==
X-Received: by 2002:a17:906:544f:: with SMTP id d15mr39905053ejp.520.1629796330344;
        Tue, 24 Aug 2021 02:12:10 -0700 (PDT)
Received: from redhat.com ([2.55.137.225])
        by smtp.gmail.com with ESMTPSA id b18sm2737239ejl.90.2021.08.24.02.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 02:12:09 -0700 (PDT)
Date:   Tue, 24 Aug 2021 05:12:03 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
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
        Dan Williams <dan.j.williams@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Message-ID: <20210824050842-mutt-send-email-mst@kernel.org>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Aug 23, 2021 at 05:30:54PM -0700, Kuppuswamy, Sathyanarayanan wrote:
> 
> 
> On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
> > > Add a new variant of pci_iomap for mapping all PCI resources
> > > of a devices as shared memory with a hypervisor in a confidential
> > > guest.
> > > 
> > > Signed-off-by: Andi Kleen<ak@linux.intel.com>
> > > Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> > I'm a bit puzzled by this part. So why should the guest*not*  map
> > pci memory as shared? And if the answer is never (as it seems to be)
> > then why not just make regular pci_iomap DTRT?
> 
> It is in the context of confidential guest (where VMM is un-trusted). So
> we don't want to make all PCI resource as shared. It should be allowed
> only for hardened drivers/devices.

I can't say this answers the question at all. PCI devices are part of
the VMM and so un-trusted. In particular PCI devices do not have
the key to decrypt memory. Therefore as far as I can see PCI resources
should not be encrypted.  I conclude they all should be marked
shared.

If I'm wrong can you please give an example of a PCI resource
that is encrypted?

-- 
MST

