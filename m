Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAEC36570
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jun 2019 22:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfFEU1W (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jun 2019 16:27:22 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34755 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfFEU1W (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jun 2019 16:27:22 -0400
Received: by mail-qt1-f195.google.com with SMTP id m29so119963qtu.1
        for <linux-parisc@vger.kernel.org>; Wed, 05 Jun 2019 13:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wGxHiQlWFn1uiPqF46GhGASLxDFDSqAuue1nQQO+VCs=;
        b=I93DefSfGh7O0Gou3nkQ7Sxim+Emlk3mgU9BuoAjJ8azFiAkKrNcWNi15dZYfCbDBk
         6UCWNs1l3e9vXSAqLXf3dRA8rqYKtwnSs/SCTXm/sUYDcFZD3j70H3spJXup36+m8pFe
         dWuw6rHkSEdmDtlwfILSF4LqpU3iiAeluWIpAHioT5vZMq1dalzUpjR7DknGhozuQR87
         eYavGUIyjWAK1K6Qj/0f5BLADWVhEDkqrpYaLX8ohJqlGEHmcQdg+C975Aq4eN3oc8UH
         bOGb4nPz0JZ4punI8oUcFHEt29DbnGgl6OtZ+pMH6WJAy0xAzydz/40Bv/sERN37CpFn
         5sOw==
X-Gm-Message-State: APjAAAVBvb1pgI+jv1LMlMTEB0lVMcjgnYB2q5SP8pzNIxczvW9AM6t+
        MYhRiEmd9NPWkQecAt3TthcqVw==
X-Google-Smtp-Source: APXvYqyNZwCNllCffk9CW8iJVZnNw6kyLj1Wao5YfIYT6vXREYUpwAyvBsDlsGb5oilKvNDw7Zk3hw==
X-Received: by 2002:aed:254c:: with SMTP id w12mr37738167qtc.127.1559766441824;
        Wed, 05 Jun 2019 13:27:21 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net. [100.0.197.103])
        by smtp.gmail.com with ESMTPSA id z20sm14611825qtz.34.2019.06.05.13.27.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 13:27:20 -0700 (PDT)
Date:   Wed, 5 Jun 2019 16:27:18 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        peterx@redhat.com, James.Bottomley@hansenpartnership.com,
        hch@infradead.org, davem@davemloft.net, jglisse@redhat.com,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-parisc@vger.kernel.org, christophe.de.dinechin@gmail.com,
        jrdr.linux@gmail.com
Subject: Re: [PATCH net-next 0/6] vhost: accelerate metadata access
Message-ID: <20190605162631-mutt-send-email-mst@kernel.org>
References: <20190524081218.2502-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524081218.2502-1-jasowang@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, May 24, 2019 at 04:12:12AM -0400, Jason Wang wrote:
> Hi:
> 
> This series tries to access virtqueue metadata through kernel virtual
> address instead of copy_user() friends since they had too much
> overheads like checks, spec barriers or even hardware feature
> toggling like SMAP. This is done through setup kernel address through
> direct mapping and co-opreate VM management with MMU notifiers.
> 
> Test shows about 23% improvement on TX PPS. TCP_STREAM doesn't see
> obvious improvement.
> 
> Thanks


Thanks this is queued for next.

Did you want to rebase and repost packed ring support on top?
IIUC it's on par with split ring with these patches.


> Changes from RFC V3:
> - rebase to net-next
> - Tweak on the comments
> Changes from RFC V2:
> - switch to use direct mapping instead of vmap()
> - switch to use spinlock + RCU to synchronize MMU notifier and vhost
>   data/control path
> - set dirty pages in the invalidation callbacks
> - always use copy_to/from_users() friends for the archs that may need
>   flush_dcache_pages()
> - various minor fixes
> Changes from V4:
> - use invalidate_range() instead of invalidate_range_start()
> - track dirty pages
> Changes from V3:
> - don't try to use vmap for file backed pages
> - rebase to master
> Changes from V2:
> - fix buggy range overlapping check
> - tear down MMU notifier during vhost ioctl to make sure
>   invalidation request can read metadata userspace address and vq size
>   without holding vq mutex.
> Changes from V1:
> - instead of pinning pages, use MMU notifier to invalidate vmaps
>   and remap duing metadata prefetch
> - fix build warning on MIPS
> 
> Jason Wang (6):
>   vhost: generalize adding used elem
>   vhost: fine grain userspace memory accessors
>   vhost: rename vq_iotlb_prefetch() to vq_meta_prefetch()
>   vhost: introduce helpers to get the size of metadata area
>   vhost: factor out setting vring addr and num
>   vhost: access vq metadata through kernel virtual address
> 
>  drivers/vhost/net.c   |   4 +-
>  drivers/vhost/vhost.c | 850 ++++++++++++++++++++++++++++++++++++------
>  drivers/vhost/vhost.h |  38 +-
>  3 files changed, 766 insertions(+), 126 deletions(-)
> 
> -- 
> 2.18.1
