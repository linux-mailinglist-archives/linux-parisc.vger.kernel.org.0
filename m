Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD18249B80
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Aug 2020 13:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgHSLRh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 19 Aug 2020 07:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbgHSLRR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 19 Aug 2020 07:17:17 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0AAC061343
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 04:17:09 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id cq28so17771782edb.10
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L/GQUtqJB7h4Ol5M3PCzHtYsEa5HLvnGnATVGMPF8nw=;
        b=KGE8DsZNPdo6bqqkNs6edk3dK4MOXuK9NWd33hMcfdeP5b5y7CI7bU8uUvoUNKNbCL
         BCUpAU5pNdEGRxiF1Tt31HfrXC3dO7lThncHiUa8bV75+8FdTXmnmpT0noHZVFfmMalt
         6eJ1XcN/dw5x7iEHscOqP6Asl2A4A3kLb2fEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L/GQUtqJB7h4Ol5M3PCzHtYsEa5HLvnGnATVGMPF8nw=;
        b=TY3dWKpHPgBS4i2hBxB3qyVclx38DilGGNvXEO1KY6DdtDeXEoGZm+CpQTvTtIHkXd
         Mcr3Pk9nt9wamUctXqaJ9Vtgv5USRdqm6e3DuHcWYt6KqN8765DkPmJpC9RhYBD7OIFb
         P4F+orrJbsNWzNa41CM69WvJLumBNeOU4MacvsCNdQMRr5Vn5NVujdNifhpkpMb/r5C3
         g/74C1i4iUUrLlf3VHdV3aGQXIpp8xUG0FWHNvOgmSJa58fFgIkI1p/KphiIAFUCV9/f
         +Xkc3wMVRi7vfnTJxaNstVmNexfYhUVPXoxolqIt9Pntks5fn5bKbrwlsmuzqWADiaY0
         eAEA==
X-Gm-Message-State: AOAM530UR+1Zm0ERR+gbl1lZ0L4rJ2dNX/wjdNxT+YxMe48HHdKz2wYU
        hIfUKxS2UhP7e+V+HDKQVsgrdb75KxOzxA==
X-Google-Smtp-Source: ABdhPJyPbsppPnFt87adMRGFtQhiEJj5dls5O7weAO75ai6ClEYvn0pPLBQyeA8k2cwsfQ2hmvXK5A==
X-Received: by 2002:a05:6402:305b:: with SMTP id bu27mr24549811edb.300.1597835827698;
        Wed, 19 Aug 2020 04:17:07 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id lc18sm18492870ejb.29.2020.08.19.04.17.06
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 04:17:06 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id t14so1777378wmi.3
        for <linux-parisc@vger.kernel.org>; Wed, 19 Aug 2020 04:17:06 -0700 (PDT)
X-Received: by 2002:a1c:9c91:: with SMTP id f139mr4664795wme.134.1597835823094;
 Wed, 19 Aug 2020 04:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
In-Reply-To: <20200819065555.1802761-6-hch@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 19 Aug 2020 13:16:51 +0200
X-Gmail-Original-Message-ID: <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
Message-ID: <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
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

On Wed, Aug 19, 2020 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The V4L2-FLAG-MEMORY-NON-CONSISTENT flag is entirely unused,

Could you explain what makes you think it's unused? It's a feature of
the UAPI generally supported by the videobuf2 framework and relied on
by Chromium OS to get any kind of reasonable performance when
accessing V4L2 buffers in the userspace.

> and causes
> weird gymanstics with the DMA_ATTR_NON_CONSISTENT flag, which is
> unimplemented except on PARISC and some MIPS configs, and about to be
> removed.

It is implemented by the generic DMA mapping layer [1], which is used
by a number of architectures including ARM64 and supposed to be used
by new architectures going forward.

[1] https://elixir.bootlin.com/linux/v5.9-rc1/source/kernel/dma/mapping.c#L341

When removing features from generic kernel code, I'd suggest first
providing viable alternatives for its users, rather than killing the
users altogether.

Given the above, I'm afraid I have to NAK this.

Best regards,
Tomasz

>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../userspace-api/media/v4l/buffer.rst        | 17 ---------
>  .../media/v4l/vidioc-reqbufs.rst              |  1 -
>  .../media/common/videobuf2/videobuf2-core.c   | 36 +------------------
>  .../common/videobuf2/videobuf2-dma-contig.c   | 19 ----------
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  3 +-
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 12 -------
>  include/media/videobuf2-core.h                |  3 +-
>  include/uapi/linux/videodev2.h                |  2 --
>  8 files changed, 3 insertions(+), 90 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 57e752aaf414a7..2044ed13cd9d7d 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -701,23 +701,6 @@ Memory Consistency Flags
>      :stub-columns: 0
>      :widths:       3 1 4
>
> -    * .. _`V4L2-FLAG-MEMORY-NON-CONSISTENT`:
> -
> -      - ``V4L2_FLAG_MEMORY_NON_CONSISTENT``
> -      - 0x00000001
> -      - A buffer is allocated either in consistent (it will be automatically
> -       coherent between the CPU and the bus) or non-consistent memory. The
> -       latter can provide performance gains, for instance the CPU cache
> -       sync/flush operations can be avoided if the buffer is accessed by the
> -       corresponding device only and the CPU does not read/write to/from that
> -       buffer. However, this requires extra care from the driver -- it must
> -       guarantee memory consistency by issuing a cache flush/sync when
> -       consistency is needed. If this flag is set V4L2 will attempt to
> -       allocate the buffer in non-consistent memory. The flag takes effect
> -       only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
> -       queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> -       <V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> -
>  .. c:type:: v4l2_memory
>
>  enum v4l2_memory
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index 75d894d9c36c42..3180c111d368ee 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -169,7 +169,6 @@ aborting or finishing any DMA in progress, an implicit
>        - This capability is set by the driver to indicate that the queue supports
>          cache and memory management hints. However, it's only valid when the
>          queue is used for :ref:`memory mapping <mmap>` streaming I/O. See
> -        :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT <V4L2-FLAG-MEMORY-NON-CONSISTENT>`,
>          :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
>          :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index f544d3393e9d6b..66a41cef33c1b1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -721,39 +721,14 @@ int vb2_verify_memory_type(struct vb2_queue *q,
>  }
>  EXPORT_SYMBOL(vb2_verify_memory_type);
>
> -static void set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
> -{
> -       q->dma_attrs &= ~DMA_ATTR_NON_CONSISTENT;
> -
> -       if (!vb2_queue_allows_cache_hints(q))
> -               return;
> -       if (!consistent_mem)
> -               q->dma_attrs |= DMA_ATTR_NON_CONSISTENT;
> -}
> -
> -static bool verify_consistency_attr(struct vb2_queue *q, bool consistent_mem)
> -{
> -       bool queue_is_consistent = !(q->dma_attrs & DMA_ATTR_NON_CONSISTENT);
> -
> -       if (consistent_mem != queue_is_consistent) {
> -               dprintk(q, 1, "memory consistency model mismatch\n");
> -               return false;
> -       }
> -       return true;
> -}
> -
>  int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>                      unsigned int flags, unsigned int *count)
>  {
>         unsigned int num_buffers, allocated_buffers, num_planes = 0;
>         unsigned plane_sizes[VB2_MAX_PLANES] = { };
> -       bool consistent_mem = true;
>         unsigned int i;
>         int ret;
>
> -       if (flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> -               consistent_mem = false;
> -
>         if (q->streaming) {
>                 dprintk(q, 1, "streaming active\n");
>                 return -EBUSY;
> @@ -765,8 +740,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>         }
>
>         if (*count == 0 || q->num_buffers != 0 ||
> -           (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
> -           !verify_consistency_attr(q, consistent_mem)) {
> +           (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory)) {
>                 /*
>                  * We already have buffers allocated, so first check if they
>                  * are not in use and can be freed.
> @@ -803,7 +777,6 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>         num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
>         memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>         q->memory = memory;
> -       set_queue_consistency(q, consistent_mem);
>
>         /*
>          * Ask the driver how many buffers and planes per buffer it requires.
> @@ -894,12 +867,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  {
>         unsigned int num_planes = 0, num_buffers, allocated_buffers;
>         unsigned plane_sizes[VB2_MAX_PLANES] = { };
> -       bool consistent_mem = true;
>         int ret;
>
> -       if (flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> -               consistent_mem = false;
> -
>         if (q->num_buffers == VB2_MAX_FRAME) {
>                 dprintk(q, 1, "maximum number of buffers already allocated\n");
>                 return -ENOBUFS;
> @@ -912,15 +881,12 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>                 }
>                 memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>                 q->memory = memory;
> -               set_queue_consistency(q, consistent_mem);
>                 q->waiting_for_buffers = !q->is_output;
>         } else {
>                 if (q->memory != memory) {
>                         dprintk(q, 1, "memory model mismatch\n");
>                         return -EINVAL;
>                 }
> -               if (!verify_consistency_attr(q, consistent_mem))
> -                       return -EINVAL;
>         }
>
>         num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index ec3446cc45b8da..7b1b86ec942d7d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -42,11 +42,6 @@ struct vb2_dc_buf {
>         struct dma_buf_attachment       *db_attach;
>  };
>
> -static inline bool vb2_dc_buffer_consistent(unsigned long attr)
> -{
> -       return !(attr & DMA_ATTR_NON_CONSISTENT);
> -}
> -
>  /*********************************************/
>  /*        scatterlist table functions        */
>  /*********************************************/
> @@ -341,13 +336,6 @@ static int
>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>                                    enum dma_data_direction direction)
>  {
> -       struct vb2_dc_buf *buf = dbuf->priv;
> -       struct sg_table *sgt = buf->dma_sgt;
> -
> -       if (vb2_dc_buffer_consistent(buf->attrs))
> -               return 0;
> -
> -       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
>         return 0;
>  }
>
> @@ -355,13 +343,6 @@ static int
>  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>                                  enum dma_data_direction direction)
>  {
> -       struct vb2_dc_buf *buf = dbuf->priv;
> -       struct sg_table *sgt = buf->dma_sgt;
> -
> -       if (vb2_dc_buffer_consistent(buf->attrs))
> -               return 0;
> -
> -       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
>         return 0;
>  }
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 0a40e00f0d7e5c..a86fce5d8ea8bf 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -123,8 +123,7 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
>         /*
>          * NOTE: dma-sg allocates memory using the page allocator directly, so
>          * there is no memory consistency guarantee, hence dma-sg ignores DMA
> -        * attributes passed from the upper layer. That means that
> -        * V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
> +        * attributes passed from the upper layer.
>          */
>         buf->pages = kvmalloc_array(buf->num_pages, sizeof(struct page *),
>                                     GFP_KERNEL | __GFP_ZERO);
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 30caad27281e1a..de83ad48783821 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -722,20 +722,11 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  #endif
>  }
>
> -static void clear_consistency_attr(struct vb2_queue *q,
> -                                  int memory,
> -                                  unsigned int *flags)
> -{
> -       if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP)
> -               *flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
> -}
> -
>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  {
>         int ret = vb2_verify_memory_type(q, req->memory, req->type);
>
>         fill_buf_caps(q, &req->capabilities);
> -       clear_consistency_attr(q, req->memory, &req->flags);
>         return ret ? ret : vb2_core_reqbufs(q, req->memory,
>                                             req->flags, &req->count);
>  }
> @@ -769,7 +760,6 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>         unsigned i;
>
>         fill_buf_caps(q, &create->capabilities);
> -       clear_consistency_attr(q, create->memory, &create->flags);
>         create->index = q->num_buffers;
>         if (create->count == 0)
>                 return ret != -EBUSY ? ret : 0;
> @@ -998,7 +988,6 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>         int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
>
>         fill_buf_caps(vdev->queue, &p->capabilities);
> -       clear_consistency_attr(vdev->queue, p->memory, &p->flags);
>         if (res)
>                 return res;
>         if (vb2_queue_is_busy(vdev, file))
> @@ -1021,7 +1010,6 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>
>         p->index = vdev->queue->num_buffers;
>         fill_buf_caps(vdev->queue, &p->capabilities);
> -       clear_consistency_attr(vdev->queue, p->memory, &p->flags);
>         /*
>          * If count == 0, then just check if memory and type are valid.
>          * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 52ef92049073e3..4c7f25b07e9375 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -744,8 +744,7 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
>   * vb2_core_reqbufs() - Initiate streaming.
>   * @q:         pointer to &struct vb2_queue with videobuf2 queue.
>   * @memory:    memory type, as defined by &enum vb2_memory.
> - * @flags:     auxiliary queue/buffer management flags. Currently, the only
> - *             used flag is %V4L2_FLAG_MEMORY_NON_CONSISTENT.
> + * @flags:     auxiliary queue/buffer management flags.
>   * @count:     requested buffer count.
>   *
>   * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c7b70ff53bc1dd..5c00f63d9c1b58 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -191,8 +191,6 @@ enum v4l2_memory {
>         V4L2_MEMORY_DMABUF           = 4,
>  };
>
> -#define V4L2_FLAG_MEMORY_NON_CONSISTENT                (1 << 0)
> -
>  /* see also http://vektor.theorem.ca/graphics/ycbcr/ */
>  enum v4l2_colorspace {
>         /*
> --
> 2.28.0
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
