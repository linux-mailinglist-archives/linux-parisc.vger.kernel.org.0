Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 360AB7135C
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 09:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731767AbfGWH5I (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 03:57:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51948 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfGWH5I (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 03:57:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so37516854wma.1
        for <linux-parisc@vger.kernel.org>; Tue, 23 Jul 2019 00:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NuBuDWbWdf8l32+iu6ukRfvQ2sFsDsKWrnzqVzUjoWY=;
        b=tyjstqfRNx5a7mtO1T7vVRdYFG/VY+IdP2ch/OxsEo/dp4sX4GihW4dCwGP6dfgSXc
         47eWQMDJ7e4V2nxSpaqaxC+FPOLaBCMyZTLpdSeonYqYaSNZyseXngL8DPu4C4z7DLur
         hsT7txEGR69L3uEsYevw+vxRyY3k9cuj82QvD51MgZcXdnFos4JWuGni5ueqnuAVYdGT
         ueKxh1QQRPhLLMfcHWqLW7yKF511OIyVtUn8i9ZKbYaLaBbzbeaBdv2TEUL9UEG3/uxX
         fLhZVPb//4AsBtxVg3F/CjYrHbSX7Bl1+AHY4U4JfKKRte79gxGA0H5/pj06oYEf/p1F
         h3cw==
X-Gm-Message-State: APjAAAV2/BS0UQeCMgO0RsKEsr6cjCxfE9ZFFTT2Wda9Y8ynBVt/XmYD
        WW4FFmiuAulfJu3Y+fxh2tX4sA==
X-Google-Smtp-Source: APXvYqwC6nxHFSKANPxUR95/LMIHBztJQp0xUlXaK+OKZPP7Be9c6QxkDQQUebiClFlcOPoFVqhw9g==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr69969515wma.34.1563868625384;
        Tue, 23 Jul 2019 00:57:05 -0700 (PDT)
Received: from redhat.com ([185.120.125.30])
        by smtp.gmail.com with ESMTPSA id t13sm51368730wrr.0.2019.07.23.00.57.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 00:57:04 -0700 (PDT)
Date:   Tue, 23 Jul 2019 03:56:59 -0400
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
Message-ID: <20190723032800-mutt-send-email-mst@kernel.org>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <75c43998-3a1c-676f-99ff-3d04663c3fcc@redhat.com>
 <20190722035657-mutt-send-email-mst@kernel.org>
 <cfcd330d-5f4a-835a-69f7-c342d5d0d52d@redhat.com>
 <20190723010156-mutt-send-email-mst@kernel.org>
 <124be1a2-1c53-8e65-0f06-ee2294710822@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <124be1a2-1c53-8e65-0f06-ee2294710822@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jul 23, 2019 at 01:48:52PM +0800, Jason Wang wrote:
> 
> On 2019/7/23 下午1:02, Michael S. Tsirkin wrote:
> > On Tue, Jul 23, 2019 at 11:55:28AM +0800, Jason Wang wrote:
> > > On 2019/7/22 下午4:02, Michael S. Tsirkin wrote:
> > > > On Mon, Jul 22, 2019 at 01:21:59PM +0800, Jason Wang wrote:
> > > > > On 2019/7/21 下午6:02, Michael S. Tsirkin wrote:
> > > > > > On Sat, Jul 20, 2019 at 03:08:00AM -0700, syzbot wrote:
> > > > > > > syzbot has bisected this bug to:
> > > > > > > 
> > > > > > > commit 7f466032dc9e5a61217f22ea34b2df932786bbfc
> > > > > > > Author: Jason Wang <jasowang@redhat.com>
> > > > > > > Date:   Fri May 24 08:12:18 2019 +0000
> > > > > > > 
> > > > > > >        vhost: access vq metadata through kernel virtual address
> > > > > > > 
> > > > > > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149a8a20600000
> > > > > > > start commit:   6d21a41b Add linux-next specific files for 20190718
> > > > > > > git tree:       linux-next
> > > > > > > final crash:    https://syzkaller.appspot.com/x/report.txt?x=169a8a20600000
> > > > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=129a8a20600000
> > > > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3430a151e1452331
> > > > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=e58112d71f77113ddb7b
> > > > > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10139e68600000
> > > > > > > 
> > > > > > > Reported-by: syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com
> > > > > > > Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual
> > > > > > > address")
> > > > > > > 
> > > > > > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> > > > > > OK I poked at this for a bit, I see several things that
> > > > > > we need to fix, though I'm not yet sure it's the reason for
> > > > > > the failures:
> > > > > > 
> > > > > > 
> > > > > > 1. mmu_notifier_register shouldn't be called from vhost_vring_set_num_addr
> > > > > >       That's just a bad hack,
> > > > > This is used to avoid holding lock when checking whether the addresses are
> > > > > overlapped. Otherwise we need to take spinlock for each invalidation request
> > > > > even if it was the va range that is not interested for us. This will be very
> > > > > slow e.g during guest boot.
> > > > KVM seems to do exactly that.
> > > > I tried and guest does not seem to boot any slower.
> > > > Do you observe any slowdown?
> > > 
> > > Yes I do.
> > > 
> > > 
> > > > Now I took a hard look at the uaddr hackery it really makes
> > > > me nervious. So I think for this release we want something
> > > > safe, and optimizations on top. As an alternative revert the
> > > > optimization and try again for next merge window.
> > > 
> > > Will post a series of fixes, let me know if you're ok with that.
> > > 
> > > Thanks
> > I'd prefer you to take a hard look at the patch I posted
> > which makes code cleaner,
> 
> 
> I did. But it looks to me a series that is only about 60 lines of code can
> fix all the issues we found without reverting the uaddr optimization.

Another thing I like about the patch I posted is that
it removes 60 lines of code, instead of adding more :)
Mostly because of unifying everything into
a single cleanup function and using kfree_rcu.

So how about this: do exactly what you propose but as a 2 patch series:
start with the slow safe patch, and add then return uaddr optimizations
on top. We can then more easily reason about whether they are safe.

Basically you are saying this:
	- notifiers are only needed to invalidate maps
	- we make sure any uaddr change invalidates maps anyway
	- thus it's ok not to have notifiers since we do
	  not have maps

All this looks ok but the question is why do we
bother unregistering them. And the answer seems to
be that this is so we can start with a balanced
counter: otherwise we can be between _start and
_end calls.

I also wonder about ordering. kvm has this:
       /*
         * Used to check for invalidations in progress, of the pfn that is
         * returned by pfn_to_pfn_prot below.
         */
        mmu_seq = kvm->mmu_notifier_seq;
        /*
         * Ensure the read of mmu_notifier_seq isn't reordered with PTE reads in
         * gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
         * risk the page we get a reference to getting unmapped before we have a
         * chance to grab the mmu_lock without mmu_notifier_retry() noticing.
         *
         * This smp_rmb() pairs with the effective smp_wmb() of the combination
         * of the pte_unmap_unlock() after the PTE is zapped, and the
         * spin_lock() in kvm_mmu_notifier_invalidate_<page|range_end>() before
         * mmu_notifier_seq is incremented.
         */
        smp_rmb();

does this apply to us? Can't we use a seqlock instead so we do
not need to worry?

-- 
MST
