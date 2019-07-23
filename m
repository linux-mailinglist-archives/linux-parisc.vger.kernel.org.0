Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F9271608
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 12:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730141AbfGWK17 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 06:27:59 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36273 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387880AbfGWK17 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 06:27:59 -0400
Received: by mail-qt1-f193.google.com with SMTP id z4so41393597qtc.3
        for <linux-parisc@vger.kernel.org>; Tue, 23 Jul 2019 03:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BenoyznfTyLcx1/8jObFzEFhYgrS+1A5bA/DCD6z1+I=;
        b=iN2j/3qCn/gytInuPJAgrP7mgwAEwezLLUhuXremR3i/PcOke6hMl6N0T8HRsopJNa
         h8+YdTWvwCUHTU7HEO/QDsfM2n1VwMwX1l0UZNISSFJ8U7b1y8Jd8YBFmx9fyBPi02SA
         JhtusYjLfEXwEYHnCZCAhyOcQuAOepT8bxdi+6frO4d9q8aSRsK2K77rtHMy+8c+MlhD
         2Wv1lvsyWHn2Q4GJBvz8QuMpYcKWIvqPIZu4xCFN/uiIqPaqeXrYX1jkOhZkf+IadW3I
         viJytcoKGheeAVPKNrePfpB3Yoy1QGf5zWr7cgEOdWgf4iDUGrz3kowS2rqinqhUmJB3
         suPA==
X-Gm-Message-State: APjAAAXKVQZecL/XS345M52ehnCHsXAdto0Z7Sc19z+bK6AJCBS/RJ9Y
        9NVXFh3DMO9ClDj9Q1Bb/IkjKQ==
X-Google-Smtp-Source: APXvYqwZ6OYsefBRjfzyywhyIbfQiowEEJG908kuZZQl/RMZTRF+2Kzuq3TqlfZM8y5m7uQqXQ3hzQ==
X-Received: by 2002:a0c:ae6d:: with SMTP id z42mr53764098qvc.8.1563877678094;
        Tue, 23 Jul 2019 03:27:58 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
        by smtp.gmail.com with ESMTPSA id l5sm19178166qte.9.2019.07.23.03.27.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 03:27:57 -0700 (PDT)
Date:   Tue, 23 Jul 2019 06:27:48 -0400
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
Message-ID: <20190723062221-mutt-send-email-mst@kernel.org>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <75c43998-3a1c-676f-99ff-3d04663c3fcc@redhat.com>
 <20190722035657-mutt-send-email-mst@kernel.org>
 <cfcd330d-5f4a-835a-69f7-c342d5d0d52d@redhat.com>
 <20190723010156-mutt-send-email-mst@kernel.org>
 <124be1a2-1c53-8e65-0f06-ee2294710822@redhat.com>
 <20190723032800-mutt-send-email-mst@kernel.org>
 <e2e01a05-63d8-4388-2bcd-b2be3c865486@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2e01a05-63d8-4388-2bcd-b2be3c865486@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jul 23, 2019 at 04:42:19PM +0800, Jason Wang wrote:
> 
> On 2019/7/23 下午3:56, Michael S. Tsirkin wrote:
> > On Tue, Jul 23, 2019 at 01:48:52PM +0800, Jason Wang wrote:
> > > On 2019/7/23 下午1:02, Michael S. Tsirkin wrote:
> > > > On Tue, Jul 23, 2019 at 11:55:28AM +0800, Jason Wang wrote:
> > > > > On 2019/7/22 下午4:02, Michael S. Tsirkin wrote:
> > > > > > On Mon, Jul 22, 2019 at 01:21:59PM +0800, Jason Wang wrote:
> > > > > > > On 2019/7/21 下午6:02, Michael S. Tsirkin wrote:
> > > > > > > > On Sat, Jul 20, 2019 at 03:08:00AM -0700, syzbot wrote:
> > > > > > > > > syzbot has bisected this bug to:
> > > > > > > > > 
> > > > > > > > > commit 7f466032dc9e5a61217f22ea34b2df932786bbfc
> > > > > > > > > Author: Jason Wang <jasowang@redhat.com>
> > > > > > > > > Date:   Fri May 24 08:12:18 2019 +0000
> > > > > > > > > 
> > > > > > > > >         vhost: access vq metadata through kernel virtual address
> > > > > > > > > 
> > > > > > > > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149a8a20600000
> > > > > > > > > start commit:   6d21a41b Add linux-next specific files for 20190718
> > > > > > > > > git tree:       linux-next
> > > > > > > > > final crash:    https://syzkaller.appspot.com/x/report.txt?x=169a8a20600000
> > > > > > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=129a8a20600000
> > > > > > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3430a151e1452331
> > > > > > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=e58112d71f77113ddb7b
> > > > > > > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10139e68600000
> > > > > > > > > 
> > > > > > > > > Reported-by: syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com
> > > > > > > > > Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual
> > > > > > > > > address")
> > > > > > > > > 
> > > > > > > > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> > > > > > > > OK I poked at this for a bit, I see several things that
> > > > > > > > we need to fix, though I'm not yet sure it's the reason for
> > > > > > > > the failures:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 1. mmu_notifier_register shouldn't be called from vhost_vring_set_num_addr
> > > > > > > >        That's just a bad hack,
> > > > > > > This is used to avoid holding lock when checking whether the addresses are
> > > > > > > overlapped. Otherwise we need to take spinlock for each invalidation request
> > > > > > > even if it was the va range that is not interested for us. This will be very
> > > > > > > slow e.g during guest boot.
> > > > > > KVM seems to do exactly that.
> > > > > > I tried and guest does not seem to boot any slower.
> > > > > > Do you observe any slowdown?
> > > > > Yes I do.
> > > > > 
> > > > > 
> > > > > > Now I took a hard look at the uaddr hackery it really makes
> > > > > > me nervious. So I think for this release we want something
> > > > > > safe, and optimizations on top. As an alternative revert the
> > > > > > optimization and try again for next merge window.
> > > > > Will post a series of fixes, let me know if you're ok with that.
> > > > > 
> > > > > Thanks
> > > > I'd prefer you to take a hard look at the patch I posted
> > > > which makes code cleaner,
> > > 
> > > I did. But it looks to me a series that is only about 60 lines of code can
> > > fix all the issues we found without reverting the uaddr optimization.
> > Another thing I like about the patch I posted is that
> > it removes 60 lines of code, instead of adding more :)
> > Mostly because of unifying everything into
> > a single cleanup function and using kfree_rcu.
> 
> 
> Yes.
> 
> 
> > 
> > So how about this: do exactly what you propose but as a 2 patch series:
> > start with the slow safe patch, and add then return uaddr optimizations
> > on top. We can then more easily reason about whether they are safe.
> 
> 
> If you stick, I can do this.

Given I realized my patch is buggy in that
it does not wait for outstanding maps, I don't
insist.

> 
> > Basically you are saying this:
> > 	- notifiers are only needed to invalidate maps
> > 	- we make sure any uaddr change invalidates maps anyway
> > 	- thus it's ok not to have notifiers since we do
> > 	  not have maps
> > 
> > All this looks ok but the question is why do we
> > bother unregistering them. And the answer seems to
> > be that this is so we can start with a balanced
> > counter: otherwise we can be between _start and
> > _end calls.
> 
> 
> Yes, since there could be multiple co-current invalidation requests. We need
> count them to make sure we don't pin wrong pages.
> 
> 
> > 
> > I also wonder about ordering. kvm has this:
> >         /*
> >           * Used to check for invalidations in progress, of the pfn that is
> >           * returned by pfn_to_pfn_prot below.
> >           */
> >          mmu_seq = kvm->mmu_notifier_seq;
> >          /*
> >           * Ensure the read of mmu_notifier_seq isn't reordered with PTE reads in
> >           * gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
> >           * risk the page we get a reference to getting unmapped before we have a
> >           * chance to grab the mmu_lock without mmu_notifier_retry() noticing.
> >           *
> >           * This smp_rmb() pairs with the effective smp_wmb() of the combination
> >           * of the pte_unmap_unlock() after the PTE is zapped, and the
> >           * spin_lock() in kvm_mmu_notifier_invalidate_<page|range_end>() before
> >           * mmu_notifier_seq is incremented.
> >           */
> >          smp_rmb();
> > 
> > does this apply to us? Can't we use a seqlock instead so we do
> > not need to worry?
> 
> 
> I'm not familiar with kvm MMU internals, but we do everything under of
> mmu_lock.
> 
> Thanks

I don't think this helps at all.

There's no lock between checking the invalidate counter and
get user pages fast within vhost_map_prefetch. So it's possible
that get user pages fast reads PTEs speculatively before
invalidate is read.

-- 
MST
