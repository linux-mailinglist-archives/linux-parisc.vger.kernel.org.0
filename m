Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC43371397
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 10:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbfGWIKj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 04:10:39 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53667 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbfGWIKj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 04:10:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id x15so37552593wmj.3
        for <linux-parisc@vger.kernel.org>; Tue, 23 Jul 2019 01:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6iDuqxmKcASOOFXh75MkQ8KIrlMWj9tNOgqU0O447i0=;
        b=V2G/wY2JgHu7ryMeJOvUHYcKBU/gtIzPBjTMey0nTy0Kz4vcKIp4ifJnfQeQ6xK1/+
         WnD4wuCvLmf6pHSNNc9M7DqWp9K6cVJIJu5MLHx8kxSx8atttMcJrGJNa0cqRSwqAj8j
         9WuZbEgzZIYezX2tSuROE6QmbXgWCIdD63RLT4Nvjs+DlgHgyGXwfSVksfKyV09KQnJ+
         GSZB4qsBGr2HwsekBCk1swYDqljClSUTb33RgYxlX/YWrhd/aBw5Xwu9FWbkxei60EH1
         w89NYjhoRjg3B+16SwQUPRyqraEFrZskb87NrDJp/uTl/ALB88UlWntyrVh2fFIjOB/B
         TS9g==
X-Gm-Message-State: APjAAAWLLJlTVrhRlV2IkfhkYnl54VECt12ZnD26XjUF9GnExvj5FKIO
        FksAx/CGLbSkyFgX0WB3UjyAew==
X-Google-Smtp-Source: APXvYqxscCG5zV7WA3DgTwEOV7g+JI81JPQ3KtiJr3uwJoC6TgABoTfwOxAcc4Y8uQvIaAafGVRR6A==
X-Received: by 2002:a1c:a1c5:: with SMTP id k188mr67874643wme.102.1563869436805;
        Tue, 23 Jul 2019 01:10:36 -0700 (PDT)
Received: from redhat.com ([185.120.125.30])
        by smtp.gmail.com with ESMTPSA id y12sm36236469wrm.79.2019.07.23.01.10.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 01:10:36 -0700 (PDT)
Date:   Tue, 23 Jul 2019 04:10:31 -0400
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
Message-ID: <20190723035725-mutt-send-email-mst@kernel.org>
References: <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <20190721081447-mutt-send-email-mst@kernel.org>
 <85dd00e2-37a6-72b7-5d5a-8bf46a3526cf@redhat.com>
 <20190722040230-mutt-send-email-mst@kernel.org>
 <4bd2ff78-6871-55f2-44dc-0982ffef3337@redhat.com>
 <20190723010019-mutt-send-email-mst@kernel.org>
 <b4696f2e-678a-bdb2-4b7c-fb4ce040ec2a@redhat.com>
 <20190723032024-mutt-send-email-mst@kernel.org>
 <1d14de4d-0133-1614-9f64-3ded381de04e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d14de4d-0133-1614-9f64-3ded381de04e@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jul 23, 2019 at 03:53:06PM +0800, Jason Wang wrote:
> 
> On 2019/7/23 下午3:23, Michael S. Tsirkin wrote:
> > > > Really let's just use kfree_rcu. It's way cleaner: fire and forget.
> > > Looks not, you need rate limit the fire as you've figured out?
> > See the discussion that followed. Basically no, it's good enough
> > already and is only going to be better.
> > 
> > > And in fact,
> > > the synchronization is not even needed, does it help if I leave a comment to
> > > explain?
> > Let's try to figure it out in the mail first. I'm pretty sure the
> > current logic is wrong.
> 
> 
> Here is what the code what to achieve:
> 
> - The map was protected by RCU
> 
> - Writers are: MMU notifier invalidation callbacks, file operations (ioctls
> etc), meta_prefetch (datapath)
> 
> - Readers are: memory accessor
> 
> Writer are synchronized through mmu_lock. RCU is used to synchronized
> between writers and readers.
> 
> The synchronize_rcu() in vhost_reset_vq_maps() was used to synchronized it
> with readers (memory accessors) in the path of file operations. But in this
> case, vq->mutex was already held, this means it has been serialized with
> memory accessor. That's why I think it could be removed safely.
> 
> Anything I miss here?
> 

So invalidate callbacks need to reset the map, and they do
not have vq mutex. How can they do this and free
the map safely? They need synchronize_rcu or kfree_rcu right?

And I worry somewhat that synchronize_rcu in an MMU notifier
is a problem, MMU notifiers are supposed to be quick:
they are on a read side critical section of SRCU.

If we could get rid of RCU that would be even better.

But now I wonder:
	invalidate_start has to mark page as dirty
	(this is what my patch added, current code misses this).

	at that point kernel can come and make the page clean again.

	At that point VQ handlers can keep a copy of the map
	and change the page again.


At this point I don't understand how we can mark page dirty
safely.

> > 
> > > > > Btw, for kvm ioctl it still uses synchronize_rcu() in kvm_vcpu_ioctl(),
> > > > > (just a little bit more hard to trigger):
> > > > AFAIK these never run in response to guest events.
> > > > So they can take very long and guests still won't crash.
> > > What if guest manages to escape to qemu?
> > > 
> > > Thanks
> > Then it's going to be slow. Why do we care?
> > What we do not want is synchronize_rcu that guest is blocked on.
> > 
> 
> Ok, this looks like that I have some misunderstanding here of the reason why
> synchronize_rcu() is not preferable in the path of ioctl. But in kvm case,
> if rcu_expedited is set, it can triggers IPIs AFAIK.
> 
> Thanks
>

Yes, expedited is not good for something guest can trigger.
Let's just use kfree_rcu if we can. Paul said even though
documentation still says it needs to be rate-limited, that
part is basically stale and will get updated.

-- 
MST 
