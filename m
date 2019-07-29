Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02AB378E4A
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Jul 2019 16:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387556AbfG2Oot (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 29 Jul 2019 10:44:49 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37591 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387396AbfG2Oot (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 29 Jul 2019 10:44:49 -0400
Received: by mail-qt1-f193.google.com with SMTP id y26so59909088qto.4
        for <linux-parisc@vger.kernel.org>; Mon, 29 Jul 2019 07:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DoNqX8RWU8p5wa0hRf4mpfQk5+CoY4k3BggOB+rTukY=;
        b=nj3rqafssPRHQbS9P5hE5crKh08WvGmYnQKdvV91PafCGHO+qUCH6eKH1KsiURb1S+
         0SmvUSsUvFOlC4l8lXUChbdI86RiOZcOYRfO3Jx7JNmCdkVe6fism38RI9gPJv/aOq6B
         wYA4FI2ZgS9RsLVrRo95NnYOjFcG1xtqbfhDha336/AFEs7SrTdxMc3veaVxGlS4N/Sn
         mIgRgWvIHhOF25kfzTGyodXDA/I8LEfBjgQgLrGgCGp0HRXL0ytiAFR2QwM8hQIJvti2
         Y1ZkziNeV5txKv15lDhPQn2PW86+iVfOFz2ycUslGXJaGS518rbeZEnX2WPHB9i1hXZS
         tT+g==
X-Gm-Message-State: APjAAAU2aclsEhoJrjC+/3RxQlMB03m8ZfH7FioAU/0+3CgkZqtcE1p7
        7pK8nUrn8UgkU43Ux7V+T8Fb5Q==
X-Google-Smtp-Source: APXvYqzNcK5rFMdgsRbkuArHCZVYZl892hVxXOzQtGKKSReE48444ntmi3JNc+/o/FUr3NCS9WKM/g==
X-Received: by 2002:ac8:384c:: with SMTP id r12mr77572808qtb.153.1564411487834;
        Mon, 29 Jul 2019 07:44:47 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
        by smtp.gmail.com with ESMTPSA id h40sm35464987qth.4.2019.07.29.07.44.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 07:44:46 -0700 (PDT)
Date:   Mon, 29 Jul 2019 10:44:38 -0400
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
Message-ID: <20190729104028-mutt-send-email-mst@kernel.org>
References: <11802a8a-ce41-f427-63d5-b6a4cf96bb3f@redhat.com>
 <20190726074644-mutt-send-email-mst@kernel.org>
 <5cc94f15-b229-a290-55f3-8295266edb2b@redhat.com>
 <20190726082837-mutt-send-email-mst@kernel.org>
 <ada10dc9-6cab-e189-5289-6f9d3ff8fed2@redhat.com>
 <aaefa93e-a0de-1c55-feb0-509c87aae1f3@redhat.com>
 <20190726094756-mutt-send-email-mst@kernel.org>
 <0792ee09-b4b7-673c-2251-e5e0ce0fbe32@redhat.com>
 <20190729045127-mutt-send-email-mst@kernel.org>
 <4d43c094-44ed-dbac-b863-48fc3d754378@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d43c094-44ed-dbac-b863-48fc3d754378@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jul 29, 2019 at 10:24:43PM +0800, Jason Wang wrote:
> 
> On 2019/7/29 下午4:59, Michael S. Tsirkin wrote:
> > On Mon, Jul 29, 2019 at 01:54:49PM +0800, Jason Wang wrote:
> > > On 2019/7/26 下午9:49, Michael S. Tsirkin wrote:
> > > > > > Ok, let me retry if necessary (but I do remember I end up with deadlocks
> > > > > > last try).
> > > > > Ok, I play a little with this. And it works so far. Will do more testing
> > > > > tomorrow.
> > > > > 
> > > > > One reason could be I switch to use get_user_pages_fast() to
> > > > > __get_user_pages_fast() which doesn't need mmap_sem.
> > > > > 
> > > > > Thanks
> > > > OK that sounds good. If we also set a flag to make
> > > > vhost_exceeds_weight exit, then I think it will be all good.
> > > 
> > > After some experiments, I came up two methods:
> > > 
> > > 1) switch to use vq->mutex, then we must take the vq lock during range
> > > checking (but I don't see obvious slowdown for 16vcpus + 16queues). Setting
> > > flags during weight check should work but it still can't address the worst
> > > case: wait for the page to be swapped in. Is this acceptable?
> > > 
> > > 2) using current RCU but replace synchronize_rcu() with vhost_work_flush().
> > > The worst case is the same as 1) but we can check range without holding any
> > > locks.
> > > 
> > > Which one did you prefer?
> > > 
> > > Thanks
> > I would rather we start with 1 and switch to 2 after we
> > can show some gain.
> > 
> > But the worst case needs to be addressed.
> 
> 
> Yes.
> 
> 
> > How about sending a signal to
> > the vhost thread?  We will need to fix up error handling (I think that
> > at the moment it will error out in that case, handling this as EFAULT -
> > and we don't want to drop packets if we can help it, and surely not
> > enter any error states.  In particular it might be especially tricky if
> > we wrote into userspace memory and are now trying to log the write.
> > I guess we can disable the optimization if log is enabled?).
> 
> 
> This may work but requires a lot of changes.

I agree.

> And actually it's the price of
> using vq mutex. 

Not sure what's meant here.

> Actually, the critical section should be rather small, e.g
> just inside memory accessors.

Also true.

> 
> I wonder whether or not just do synchronize our self like:
> 
> static void inline vhost_inc_vq_ref(struct vhost_virtqueue *vq)
> {
>         int ref = READ_ONCE(vq->ref);
> 
>         WRITE_ONCE(vq->ref, ref + 1);
> smp_rmb();
> }
> 
> static void inline vhost_dec_vq_ref(struct vhost_virtqueue *vq)
> {
>         int ref = READ_ONCE(vq->ref);
> 
> smp_wmb();
>         WRITE_ONCE(vq->ref, ref - 1);
> }
> 
> static void inline vhost_wait_for_ref(struct vhost_virtqueue *vq)
> {
>         while (READ_ONCE(vq->ref));
> mb();
> }

Looks good but I'd like to think of a strategy/existing lock that let us
block properly as opposed to spinning, that would be more friendly to
e.g. the realtime patch.

> 
> Or using smp_load_acquire()/smp_store_release() instead?
> 
> Thanks

These are cheaper on x86, yes.

> > 
