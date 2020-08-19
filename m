Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A69C24A290
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Aug 2020 17:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgHSPLo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 11:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgHSPLm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 11:11:42 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF2DC061757
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 08:11:41 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id c16so26700278ejx.12
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 08:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gblnYCzc62i56nCc5LRWss+Qf5wc+kIzyZ60hUww65Y=;
        b=CmFRV9MF78Io9lyU3ZTHQoxCUWL8rgrVpgpqOj4nEXWpRTCd1+KGSochi2kuoVhtFt
         PQJJembCFDIORAph3WzrpDoRd2cIGJpwf9VAtP5a9ydpphhRkHDHcmKRPuhZGWASaGfl
         y6rPrnsIqK2MPfXnYUVbYzJtuDwuiigpqdGRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gblnYCzc62i56nCc5LRWss+Qf5wc+kIzyZ60hUww65Y=;
        b=bN8er5n7rdMW8dHOSN+iqDpvTPf5/D2pn91zZ0+lE2hpYQeNcMbm9YhR9OdifeVliM
         0OGFQAcypWnVIaC66YWMS+2jcsYiwklS0u5jgJfQlQxwvOqObY6xzYMC9EbPZOoeJawh
         ve+/ObXn59ZA2M+7y0n5p18ln0N/EHx6rya3ACln+bAK2AD3lo6n4VS5G5BkvjZAGnQe
         ivlLOb7xZByx2rLd134KbMfLdUaFnz3JR9oDtOjhCyYooIaX/sHnZOhbyc+SymeOi0qT
         Gf4qdew6+fj8UfP2bR5KxXHTIOi+c4hBUPmuSXHRGc1nV+SEJKyth7lJehRWHA9EPY5z
         Mznw==
X-Gm-Message-State: AOAM530JDEUqMT2uas5GZl+pIW3qSEFoMUorqVtSafoYpMQADMGSygZn
        M4fi0MP7eB4MnIlv1lRy4FbW/LgCnLYCQQ==
X-Google-Smtp-Source: ABdhPJy0ZcnyNZ+0zJw9CpzYp66QC9xVmUj2FuL+wZrXW/bdBoMcuJdGN9wNbutaRr0FwPFWtynAoA==
X-Received: by 2002:a17:906:2e86:: with SMTP id o6mr26664242eji.380.1597849899983;
        Wed, 19 Aug 2020 08:11:39 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id p23sm13942202edm.31.2020.08.19.08.11.39
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 08:11:39 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id g8so2433601wmk.3
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 08:11:39 -0700 (PDT)
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr5316483wmh.55.1597849448826;
 Wed, 19 Aug 2020 08:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-20-hch@lst.de>
In-Reply-To: <20200819065555.1802761-20-hch@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 19 Aug 2020 17:03:52 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
Message-ID: <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
Subject: Re: [PATCH 19/28] dma-mapping: replace DMA_ATTR_NON_CONSISTENT with
 dma_{alloc, free}_pages
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        alsa-devel@alsa-project.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-ia64@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        nouveau@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-nvme@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, netdev@vger.kernel.org,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Christoph,

On Wed, Aug 19, 2020 at 8:57 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a new API to allocate and free pages that are guaranteed to be
> addressable by a device, but otherwise behave like pages allocated by
> alloc_pages.  The intended APIs to sync them for use with the device
> and cpu are dma_sync_single_for_{device,cpu} that are also used for
> streaming mappings.
>
> Switch all drivers over to this new API, but keep the usage of the
> crufty dma_cache_sync API for now, which will be cleaned up on a driver
> by driver basis.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/core-api/dma-api.rst        | 68 +++++++++++------------
>  Documentation/core-api/dma-attributes.rst |  8 ---
>  arch/alpha/kernel/pci_iommu.c             |  2 +
>  arch/arm/mm/dma-mapping-nommu.c           |  2 +
>  arch/arm/mm/dma-mapping.c                 |  4 ++
>  arch/ia64/hp/common/sba_iommu.c           |  2 +
>  arch/mips/jazz/jazzdma.c                  |  7 +--
>  arch/powerpc/kernel/dma-iommu.c           |  2 +
>  arch/powerpc/platforms/ps3/system-bus.c   |  4 ++
>  arch/powerpc/platforms/pseries/vio.c      |  2 +
>  arch/s390/pci/pci_dma.c                   |  2 +
>  arch/x86/kernel/amd_gart_64.c             |  2 +
>  drivers/iommu/dma-iommu.c                 |  2 +
>  drivers/iommu/intel/iommu.c               |  4 ++
>  drivers/net/ethernet/i825xx/lasi_82596.c  | 13 ++---
>  drivers/net/ethernet/seeq/sgiseeq.c       | 12 ++--
>  drivers/parisc/ccio-dma.c                 |  2 +
>  drivers/parisc/sba_iommu.c                |  2 +
>  drivers/scsi/53c700.c                     |  8 +--
>  drivers/scsi/sgiwd93.c                    | 12 ++--
>  drivers/xen/swiotlb-xen.c                 |  2 +
>  include/linux/dma-direct.h                |  5 ++
>  include/linux/dma-mapping.h               | 29 ++++++++--
>  include/linux/dma-noncoherent.h           |  3 -
>  kernel/dma/direct.c                       | 51 ++++++++++++++++-
>  kernel/dma/mapping.c                      | 43 +++++++++++++-
>  kernel/dma/ops_helpers.c                  | 35 ++++++++++++
>  kernel/dma/virt.c                         |  2 +
>  sound/mips/hal2.c                         | 20 +++----
>  29 files changed, 254 insertions(+), 96 deletions(-)
>

Thanks for the patch. The general design looks quite nice, but please
see my comments inline.


> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 90239348b30f6f..047fcfffa0e5cf 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -516,48 +516,53 @@ routines, e.g.:::
>         }
>
>
> -Part II - Advanced dma usage
> -----------------------------
> +Part II - Non-coherent DMA allocations
> +--------------------------------------
>
> -Warning: These pieces of the DMA API should not be used in the
> -majority of cases, since they cater for unlikely corner cases that
> -don't belong in usual drivers.
> +These APIs allow to allocate pages that can be used like normal pages
> +in the kernel direct mapping, but are guaranteed to be DMA addressable.

Could we elaborate a bit more on what "like normal pages in kernel
direct mapping" mean from the driver perspective?

>
>  If you don't understand how cache line coherency works between a
>  processor and an I/O device, you should not be using this part of the
> -API at all.
> +API.
>
>  ::
>
>         void *
> -       dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
> -                       gfp_t flag, unsigned long attrs)
> +       dma_alloc_pages(struct device *dev, size_t size, dma_addr_t *dma_handle,
> +                       enum dma_data_direction dir, gfp_t gfp)
> +
> +This routine allocates a region of <size> bytes of consistent memory.  It
> +returns a pointer to the allocated region (in the processor's virtual address
> +space) or NULL if the allocation failed. The returned memory is guanteed to
> +behave like memory allocated using alloc_pages.

There is one aspect that the existing dma_alloc_attrs() handles, but
this new function doesn't: IOMMU support. The function will always
allocate a physically-contiguous block memory, which is a costly
operation and not even guaranteed to succeed, even if enough free
memory is available.

Modern SoCs employ IOMMUs to avoid the need to allocate
physically-contiguous memory and those happen to be also the devices
that could benefit from non-coherent allocations a lot. One of the
tasks of the DMA API was making it possible to allocate suitable
memory for a given device, without having the driver know about the
SoC integration details, such as the presence of an IOMMU.

Today, dma_alloc_attrs() uses the .alloc callback of the dma_ops
struct and the IOMMU-aware implementations, like the dma-iommu helpers
[1], would allocate discontiguous pages. Therefore, while I see the
DMA-aware page allocation functionality as a useful functionality on
its own for scatter-gather-capable hardware, I believe it is not a
complete replacement for dma_alloc_attrs() with the
DMA_ATTR_NON_CONSISTENT attribute.

[1] https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/iommu/dma-iommu.c#L510

Best regards,
Tomasz
