Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0C571B01
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 17:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732908AbfGWPCr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 11:02:47 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45542 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730674AbfGWPCr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 11:02:47 -0400
Received: by mail-qk1-f196.google.com with SMTP id s22so31373744qkj.12
        for <linux-parisc@vger.kernel.org>; Tue, 23 Jul 2019 08:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R5M2K4AjBjzXbSZ/zP6imFgwCWLsiDqliCyMwtU6WVA=;
        b=BpKdl5RDpagdQ2fQG+cPNUJ8jaBG8UnYMKAn19dqrzf8D+6JXQvTqNiALDd6HUoK8f
         0iSaBR7HxfNzf7dKKvf6F54E12DBj6cbfyK97aTqqAjXksI1UCLzdAZTQw93uBZWRfKb
         0Oi48nKdSyRJbMfB6PobKdLhegwQZ1lps/hETmtjs4UB1HYhsB4exP8Df+Uk1GPO+e4y
         N4Mwg7GN92dhdTD5v2jlkuD0zI9KPrW/xd4LDIhdHSvW9shafv5hYm7rm7VjlE7wFuSr
         Sk2rXTrNIhYGZHvxJ5wG5bxZ1WEwmxZV+PSNJe6QD6OGg+xXbQf/W7EAsk6T9svPtGHt
         x2FA==
X-Gm-Message-State: APjAAAXpXxbGI2ie/+XxDBAzUzu5jlhGW0J7kZcDfPbvGlbTMdJvZGMN
        4tTzNhsUE/Zu5NHOX1rvVqCD5Q==
X-Google-Smtp-Source: APXvYqxzk6SWsTdinjKSsA/de1iMdf+1ZzQW/oUQt2F/o3dsQk8ga4tD5zxAx4DzheYaNy643xaKrA==
X-Received: by 2002:ae9:e20c:: with SMTP id c12mr49989037qkc.210.1563894166621;
        Tue, 23 Jul 2019 08:02:46 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
        by smtp.gmail.com with ESMTPSA id s25sm18898787qkm.130.2019.07.23.08.02.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 08:02:45 -0700 (PDT)
Date:   Tue, 23 Jul 2019 11:02:37 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     syzbot <syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com>,
        aarcange@redhat.com, akpm@linux-foundation.org,
        christian@brauner.io, davem@davemloft.net, ebiederm@xmission.com,
        elena.reshetova@intel.com, guro@fb.com, hch@infradead.org,
        james.bottomley@hansenpartnership.com, jglisse@redhat.com,
        keescook@chromium.org, ldv@altlinux.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-parisc@vger.kernel.org,
        luto@amacapital.net, mhocko@suse.com, mingo@kernel.org,
        namit@vmware.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk,
        wad@chromium.org
Subject: Re: WARNING in __mmdrop
Message-ID: <20190723110219-mutt-send-email-mst@kernel.org>
References: <20190721044615-mutt-send-email-mst@kernel.org>
 <75c43998-3a1c-676f-99ff-3d04663c3fcc@redhat.com>
 <20190722035657-mutt-send-email-mst@kernel.org>
 <cfcd330d-5f4a-835a-69f7-c342d5d0d52d@redhat.com>
 <20190723010156-mutt-send-email-mst@kernel.org>
 <124be1a2-1c53-8e65-0f06-ee2294710822@redhat.com>
 <20190723032800-mutt-send-email-mst@kernel.org>
 <e2e01a05-63d8-4388-2bcd-b2be3c865486@redhat.com>
 <20190723062221-mutt-send-email-mst@kernel.org>
 <9baa4214-67fd-7ad2-cbad-aadf90bbfc20@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9baa4214-67fd-7ad2-cbad-aadf90bbfc20@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jul 23, 2019 at 09:34:29PM +0800, Jason Wang wrote:
> 
> On 2019/7/23 下午6:27, Michael S. Tsirkin wrote:
> > > Yes, since there could be multiple co-current invalidation requests. We need
> > > count them to make sure we don't pin wrong pages.
> > > 
> > > 
> > > > I also wonder about ordering. kvm has this:
> > > >          /*
> > > >            * Used to check for invalidations in progress, of the pfn that is
> > > >            * returned by pfn_to_pfn_prot below.
> > > >            */
> > > >           mmu_seq = kvm->mmu_notifier_seq;
> > > >           /*
> > > >            * Ensure the read of mmu_notifier_seq isn't reordered with PTE reads in
> > > >            * gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
> > > >            * risk the page we get a reference to getting unmapped before we have a
> > > >            * chance to grab the mmu_lock without mmu_notifier_retry() noticing.
> > > >            *
> > > >            * This smp_rmb() pairs with the effective smp_wmb() of the combination
> > > >            * of the pte_unmap_unlock() after the PTE is zapped, and the
> > > >            * spin_lock() in kvm_mmu_notifier_invalidate_<page|range_end>() before
> > > >            * mmu_notifier_seq is incremented.
> > > >            */
> > > >           smp_rmb();
> > > > 
> > > > does this apply to us? Can't we use a seqlock instead so we do
> > > > not need to worry?
> > > I'm not familiar with kvm MMU internals, but we do everything under of
> > > mmu_lock.
> > > 
> > > Thanks
> > I don't think this helps at all.
> > 
> > There's no lock between checking the invalidate counter and
> > get user pages fast within vhost_map_prefetch. So it's possible
> > that get user pages fast reads PTEs speculatively before
> > invalidate is read.
> > 
> > -- 
> 
> 
> In vhost_map_prefetch() we do:
> 
>         spin_lock(&vq->mmu_lock);
> 
>         ...
> 
>         err = -EFAULT;
>         if (vq->invalidate_count)
>                 goto err;
> 
>         ...
> 
>         npinned = __get_user_pages_fast(uaddr->uaddr, npages,
>                                         uaddr->write, pages);
> 
>         ...
> 
>         spin_unlock(&vq->mmu_lock);
> 
> Is this not sufficient?
> 
> Thanks

So what orders __get_user_pages_fast wrt invalidate_count read?

-- 
MST
