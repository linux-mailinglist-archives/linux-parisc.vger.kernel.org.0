Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C99B24B598
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Aug 2020 12:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731621AbgHTKZ5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Aug 2020 06:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731603AbgHTKYs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Aug 2020 06:24:48 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AD9C061757
        for <linux-parisc@vger.kernel.org>; Thu, 20 Aug 2020 03:24:47 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id c16so1822821ejx.12
        for <linux-parisc@vger.kernel.org>; Thu, 20 Aug 2020 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FU3+CiJFzLHmOFDuQMwlaisWRGuHRN+5AV6txupwZrU=;
        b=QFNCCjnhRiVXX1RwHJMrjJrm3FMIDmNx/PgDGVaGoYPr2orRHBTBO48N0vE/bjgnJ+
         SYuYytDiRhiYZtZgJZ7z4/4vPKus2MwWgTKmnlMmLZQ4o8gAgDqGKHg0dO0uTStdh95b
         tHYxvzFh9iEVHBmlKA/EhqmNwNT52r2I3xUhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FU3+CiJFzLHmOFDuQMwlaisWRGuHRN+5AV6txupwZrU=;
        b=OAsvL6EByzdSa7iBBTj+yQuRBQ1yaCAAx8n1O99oJYafIyTKSufYgOzkWwuGllUOPc
         qZnG1VVxJwidYdUTYnBbBaJNpI0i1YaUdDexEm/RkJCCQd1be9z72pXzv+wEi/y7RU80
         prsfWzj+rYSi+EcAUPZQXDDkdBbSTzVPJQQNbctEkt4hRrbFT+d16bz8VeGUMMmqs0Kw
         H8dfTk2Z4nAvRtJ3kXDiwKcAu0+M6PWcHTuNoU0SAUnVQiDXPVx6RzVuoTqi9+vSwC89
         k2BWJcvPyVpQZKfad/xPi8hPh/NrZJ8giPKx3cXs3NhRngfcSWo/aKqTF0XbgcrPF4n8
         G32Q==
X-Gm-Message-State: AOAM532+CHYtZ3caNxNb6v08fQW9Ww6hR7jQKVaNwxVtuAPycQRFRoFA
        Zzm0nGiONyQ0FnFoOYZ2rumff4HXF4JfTEry
X-Google-Smtp-Source: ABdhPJxL3MxNQ3ZBx3Cg48JuPNwYuxg9YEm8DHb9UHo6sKUL1mnnp8Cf9NAR6QNrQd8GpXdVOxS0VQ==
X-Received: by 2002:a17:906:1392:: with SMTP id f18mr2439427ejc.521.1597919085924;
        Thu, 20 Aug 2020 03:24:45 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id di5sm1067693edb.16.2020.08.20.03.24.45
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 03:24:45 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id m22so1834866eje.10
        for <linux-parisc@vger.kernel.org>; Thu, 20 Aug 2020 03:24:45 -0700 (PDT)
X-Received: by 2002:a5d:6744:: with SMTP id l4mr2717742wrw.105.1597919084826;
 Thu, 20 Aug 2020 03:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com> <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com> <20200820050214.GA4815@lst.de>
In-Reply-To: <20200820050214.GA4815@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 20 Aug 2020 12:24:31 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com>
Message-ID: <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com>
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

On Thu, Aug 20, 2020 at 7:02 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 19, 2020 at 03:07:04PM +0100, Robin Murphy wrote:
> >> FWIW, I asked back in time what the plan is for non-coherent
> >> allocations and it seemed like DMA_ATTR_NON_CONSISTENT and
> >> dma_sync_*() was supposed to be the right thing to go with. [2] The
> >> same thread also explains why dma_alloc_pages() isn't suitable for the
> >> users of dma_alloc_attrs() and DMA_ATTR_NON_CONSISTENT.
> >
> > AFAICS even back then Christoph was implying getting rid of NON_CONSISTENT
> > and *replacing* it with something streaming-API-based - i.e. this series -
> > not encouraging mixing the existing APIs. It doesn't seem impossible to
> > implement a remapping version of this new dma_alloc_pages() for
> > IOMMU-backed ops if it's really warranted (although at that point it seems
> > like "non-coherent" vb2-dc starts to have significant conceptual overlap
> > with vb2-sg).
>
> You can alway vmap the returned pages from dma_alloc_pages, but it will
> make cache invalidation hell - you'll need to use
> invalidate_kernel_vmap_range and flush_kernel_vmap_range to properly
> handle virtually indexed caches.
>
> Or with remapping you mean using the iommu do de-scatter/gather?

Ideally, both.

For remapping in the CPU sense, there are drivers which rely on a
contiguous kernel mapping of the vb2 buffers, which was provided by
dma_alloc_attrs(). I think they could be reworked to work on single
pages, but that would significantly complicate the code. At the same
time, such drivers would actually benefit from a cached mapping,
because they often have non-bursty, random access patterns.

Then, in the IOMMU sense, the whole idea of videobuf2-dma-contig is to
rely on the DMA API to always provide device-contiguous memory, as
required by the hardware which only has a single pointer and size.

>
> You can implement that trivially implement it yourself for the iommu
> case:
>
> {
>         merge_boundary = dma_get_merge_boundary(dev);
>         if (!merge_boundary || merge_boundary > chunk_size - 1) {
>                 /* can't coalesce */
>                 return -EINVAL;
>         }
>
>
>         nents = DIV_ROUND_UP(total_size, chunk_size);
>         sg = sgl_alloc();
>         for_each_sgl() {
>                 sg->page = __alloc_pages(get_order(chunk_size))
>                 sg->len = chunk_size;
>         }
>         dma_map_sg(sg, DMA_ATTR_SKIP_CPU_SYNC);
>         // you are guaranteed to get a single dma_addr out
> }
>
> Of course this still uses the scatterlist structure with its annoying
> mix of input and output parametes, so I'd rather not expose it as
> an official API at the DMA layer.

The problem with the above open coded approach is that it requires
explicit handling of the non-IOMMU and IOMMU cases and this is exactly
what we don't want to have in vb2 and what was actually the job of the
DMA API to hide. Is the plan to actually move the IOMMU handling out
of the DMA API?

Do you think we could instead turn it into a dma_alloc_noncoherent()
helper, which has similar semantics as dma_alloc_attrs() and handles
the various corner cases (e.g. invalidate_kernel_vmap_range and
flush_kernel_vmap_range) to achieve the desired functionality without
delegating the "hell", as you called it, to the users?

Best regards,
Tomasz
