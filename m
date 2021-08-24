Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DFD3F6B65
	for <lists+linux-parisc@lfdr.de>; Tue, 24 Aug 2021 23:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238557AbhHXV4q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 24 Aug 2021 17:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238427AbhHXV4q (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 24 Aug 2021 17:56:46 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EE7C0613CF
        for <linux-parisc@vger.kernel.org>; Tue, 24 Aug 2021 14:56:01 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id y23so21094174pgi.7
        for <linux-parisc@vger.kernel.org>; Tue, 24 Aug 2021 14:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0skVvO4SGPlA/J6kwOdnD9awH4QB9ReOisx8edtYBMQ=;
        b=td+p5L6oApTGIECN+ygfdkt+RZDjHSiqYQ90d7SsipgbdzrvwzlwsX9gKbnz170ozc
         VLmcKWqYLFsRiZ7d5lBcMcpU05xsqBHaj5BtzBQd6H4St7YTyOWoz9iIlfb8AvbkLeCW
         1gNnuQo+3BcAU7zndpjjl8/92FDO8rVrHrULQuLDgjx0eMAf0jAvAForvOSFch4Jx0ak
         hdhEbuiQ57z3GbDl3KVmKKey9WFa0Mcfc61kOn7X5qhr1Kva3yrI14ChRzCIySRXwT4R
         DXSVDt4eG6CgSvmr3BHGYl+RUUV3FKAKOldIU9DmcNVJDs4+Jpxct0sg1vOLOvpMICcR
         J3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0skVvO4SGPlA/J6kwOdnD9awH4QB9ReOisx8edtYBMQ=;
        b=KVP+q2QyHLjSML4d1DoSCW13mqX8un2hrgfzZWMgJRrHX/wbAZ/1oFT7oiWeR3xmZk
         +WUjxD6G7ofH4mPydxj3GG8CDZKdzXwjKmGPHT8Cw2Q+xwOC+Jnmj5GGGqYnS1/qHoK3
         Q4/3btrD/qkKgzlpUsRAy93Tv/HKk63NyWn6qO/pqtNRcU3hooRijwaSvIr860fPSzSy
         Gao52PQjz4phe4u1nUjk5Uy7nCEw0VPPe99bxB4QBbHjgw/f385D6EO64Bl3L/6jViXM
         BT3jlZCH0+202c8mr1QnsuvV56u3QEa1Bgox6rYyiWZz9aNaCj11dBdxx8esP3jsKIEt
         /DQQ==
X-Gm-Message-State: AOAM532pbLCIDMLB10pMDO1mTGfwHOqLFJTcPFf0yqrwzWkNQyAwXkXU
        tl12PIf8WM2cvE7odZGqMWbGNQf0JICMeqCaLDcF2A==
X-Google-Smtp-Source: ABdhPJy53qjYKOgleV9wHJ9ler14y20UTDnQwlr+oeS3RBFiHGiYWJ5VH+8aEVcyHLXvsrveMN4GeeU+tR1NWVcXvTU=
X-Received: by 2002:a05:6a00:150d:b0:3e2:13fc:dd2b with SMTP id
 q13-20020a056a00150d00b003e213fcdd2bmr40939043pfu.71.1629842160839; Tue, 24
 Aug 2021 14:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com> <20210824185541.GA3485816@bjorn-Precision-5520>
In-Reply-To: <20210824185541.GA3485816@bjorn-Precision-5520>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 24 Aug 2021 14:55:24 -0700
Message-ID: <CACK8Z6GaKb58OWu-hxabweFKX8MBPngmWQa6vhDgFJy9pWp_vQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Dan Williams <dan.j.williams@intel.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Thanks a lot Bjorn for adding me!


On Tue, Aug 24, 2021 at 11:55 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Rajat; I still don't know what "shared memory with a hypervisor
> in a confidential guest" means, but now we're talking about hardened
> drivers and allow lists, which Rajat is interested in]
>
> On Tue, Aug 24, 2021 at 10:20:44AM -0700, Andi Kleen wrote:
> >
> > > I see. Hmm. It's a bit of a random thing to do it at the map time
> > > though. E.g. DMA is all handled transparently behind the DMA API.
> > > Hardening is much more than just replacing map with map_shared
> > > and I suspect what you will end up with is basically
> > > vendors replacing map with map shared to make things work
> > > for their users and washing their hands.
> >
> > That concept exists too. There is a separate allow list for the drivers. So
> > just adding shared to a driver is not enough, until it's also added to the
> > allowlist
> >
> > Users can of course chose to disable the allowlist, but they need to
> > understand the security implications.

This is great. I'd be interested in looking at this allowlist
mechanism. Is this something in-kernel or in userspace? Is this
available upstream or are you maintaining this allowlist elsewhere?
(Background: https://lore.kernel.org/linux-pci/CACK8Z6E8pjVeC934oFgr=VB3pULx_GyT2NkzAogdRQJ9TKSX9A@mail.gmail.com/)

Short Summary: we also have our security team that audits drivers, and
we'd like to enable only audited drivers for the untrusted devices.
Currently, we're carrying this allowlist mechanism on our own since
the idea was Nack'ed by upstream. So if there is something available,
we'd like to use it too.

Thanks,

Rajat


> >
> > > I would say an explicit flag in the driver that says "hardened"
> > > and refusing to init a non hardened one would be better.
> >
> > We have that too (that's the device filtering)
> >
> > But the problem is that device filtering just stops the probe functions, not
> > the initcalls, and lot of legacy drivers do MMIO interactions before going
> > into probe. In some cases it's unavoidable because of the device doesn't
> > have a separate enumeration mechanism it needs some kind of probing to even
> > check for its existence And since we don't want to change all of them it's
> > far safer to make the ioremap opt-in.
> >
> >
> > -Andi
> >
