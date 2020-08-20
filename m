Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78AB24C4CA
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Aug 2020 19:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgHTRrD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Aug 2020 13:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726745AbgHTRrB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Aug 2020 13:47:01 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D811C061385
        for <linux-parisc@vger.kernel.org>; Thu, 20 Aug 2020 10:47:01 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id cq28so2295227edb.10
        for <linux-parisc@vger.kernel.org>; Thu, 20 Aug 2020 10:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TdWdmS9KmpqRDKTTx4ZFKlZV0sk8Q5cLOhIOkZ1gD+w=;
        b=cAZtzVYP2n3YvXgVkbJ7dbST+g3SP0UPbXQ9iKKyhX4VXr8jHpSYHqZMaG5ucNVipI
         bzzpnQCIz78GKzn14VpRAj8Y6mpMr87iyH7UMbPsjr5O6z0niDquexdhhjTmn1y5QjQv
         l8iJOpqbyOslL4LKhF6zS+g3cTQ+z78POnoVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdWdmS9KmpqRDKTTx4ZFKlZV0sk8Q5cLOhIOkZ1gD+w=;
        b=LJqCVTnaYPrfUJpiZaplGMfTK1NriTNTC4Z9Uw7+y2TwVCkku7teyvpjb+sgTYnp30
         rKsqkvYs6LSI56BKXBJciNMK4FRuuoRFPayR9da5bBf9c2y5hrqcpJdXNl2KaCk70Ib+
         6PI2usKki28hsxE+N/EvqZbdYNx3jQH4PAXmMMfyT3FpDVsP86XMV67iPDFdT+QAnETY
         4rxyN5FZmMAQib3gWSF2x70gLrNEHUNW8T+9Vq/YWdp2mqwcdPEAzTCz1X/ux5X7iuSI
         Neqo7kTJLeaVAVhB/WoFe5z3e0L/dhaVZU1gMr7c1UBaiKa/YbAlxddUP0SGNPs37YLA
         C5pQ==
X-Gm-Message-State: AOAM531Ewf6CehFxgmUVh6bpubBjOi2hYSUO5sC8LJqJg5tBgpbZsv/e
        BQjIDBfGwLuoGQVojyuN+9dsQ58610DfFg==
X-Google-Smtp-Source: ABdhPJzJfgfOANOoPz/9yz3eP2FKsYpO/LRZh8uTPRFjmPtOlgKR5AJvobZJaZKlTkRWrVNeg78JxQ==
X-Received: by 2002:aa7:c357:: with SMTP id j23mr4073870edr.228.1597945619518;
        Thu, 20 Aug 2020 10:46:59 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id u22sm1829154ejf.87.2020.08.20.10.46.59
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 10:46:59 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id x5so2431684wmi.2
        for <linux-parisc@vger.kernel.org>; Thu, 20 Aug 2020 10:46:59 -0700 (PDT)
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr4512279wmh.55.1597945276327;
 Thu, 20 Aug 2020 10:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com> <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com> <20200820050214.GA4815@lst.de>
 <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com> <20200820165213.GC12693@lst.de>
In-Reply-To: <20200820165213.GC12693@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 20 Aug 2020 19:41:03 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BcH-_S=WDvqYvSPxMvQuN5atO8q=xktbMaPS-DOCAYbw@mail.gmail.com>
Message-ID: <CAAFQd5BcH-_S=WDvqYvSPxMvQuN5atO8q=xktbMaPS-DOCAYbw@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>, alsa-devel@alsa-project.org,
        linux-ia64@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-scsi@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Pawel Osciak <pawel@osciak.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Aug 20, 2020 at 6:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 20, 2020 at 12:24:31PM +0200, Tomasz Figa wrote:
> > > Of course this still uses the scatterlist structure with its annoying
> > > mix of input and output parametes, so I'd rather not expose it as
> > > an official API at the DMA layer.
> >
> > The problem with the above open coded approach is that it requires
> > explicit handling of the non-IOMMU and IOMMU cases and this is exactly
> > what we don't want to have in vb2 and what was actually the job of the
> > DMA API to hide. Is the plan to actually move the IOMMU handling out
> > of the DMA API?
> >
> > Do you think we could instead turn it into a dma_alloc_noncoherent()
> > helper, which has similar semantics as dma_alloc_attrs() and handles
> > the various corner cases (e.g. invalidate_kernel_vmap_range and
> > flush_kernel_vmap_range) to achieve the desired functionality without
> > delegating the "hell", as you called it, to the users?
>
> Yes, I guess I could do something in that direction.  At least for
> dma-iommu, which thanks to Robin should be all you'll need in the
> foreseeable future.

That would be really great. Let me know if we can help by testing with
V4L2/vb2 or in any other way.

Best regards,
Tomasz
