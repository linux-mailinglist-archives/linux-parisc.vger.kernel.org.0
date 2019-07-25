Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6E2274F55
	for <lists+linux-parisc@lfdr.de>; Thu, 25 Jul 2019 15:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfGYN05 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 25 Jul 2019 09:26:57 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:37637 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfGYN04 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 25 Jul 2019 09:26:56 -0400
Received: by mail-qk1-f169.google.com with SMTP id d15so36352908qkl.4
        for <linux-parisc@vger.kernel.org>; Thu, 25 Jul 2019 06:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KjjBu7BMfk8xmpq06aF6LWsxATJ7zX54K3XmB9nU8ns=;
        b=FKktEgdqRr/upzCiXoLoNdrCmSbaIy7TpjnhpttZZjp1BIgpDuGLAJnfFnGnjuzBv0
         qd8XwkCqqfQZGppcvVqHj9ZYm2ljd/eyZom1DYb6FpuhBx7yzEmGr3gVIGmWp27Mn2qB
         nJWZUnfpy3sySNJKZX/5AP84L7JY/FQwjjX5Kr0a4lRzrnHG052M34T9MGiPnMzStMKS
         PqRPPxW2m0BSU7HdI0loN96RGBhTJusqnL75is9PtKTr8tMpfG0vD6YLCGQrdjCNUW4X
         xeWb3F8FFvhZKYZUrZKP2D6Gw+bdZkuQIHcuhgqvnMzYcdCAc3rM1RPa2y3yXPTqKWzt
         1s/A==
X-Gm-Message-State: APjAAAWvqdm1NriWq5QI4bZtBV1KInuz56+CWyA0e+ACoED4WpgHN03I
        Zjk66bEi+MlSlno20hFkA77OPw==
X-Google-Smtp-Source: APXvYqxOAsHTrNRpwq6vcJ7tGMHpKurQRE42kOps0/crxS2PgQFMsqddCIqZtIPX1c6ngHTE5rQAdg==
X-Received: by 2002:a05:620a:1447:: with SMTP id i7mr59552516qkl.254.1564061215681;
        Thu, 25 Jul 2019 06:26:55 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
        by smtp.gmail.com with ESMTPSA id 47sm29804600qtw.90.2019.07.25.06.26.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 06:26:54 -0700 (PDT)
Date:   Thu, 25 Jul 2019 09:26:46 -0400
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
Message-ID: <20190725092332-mutt-send-email-mst@kernel.org>
References: <20190723032024-mutt-send-email-mst@kernel.org>
 <1d14de4d-0133-1614-9f64-3ded381de04e@redhat.com>
 <20190723035725-mutt-send-email-mst@kernel.org>
 <3f4178f1-0d71-e032-0f1f-802428ceca59@redhat.com>
 <20190723051828-mutt-send-email-mst@kernel.org>
 <caff362a-e208-3468-3688-63e1d093a9d3@redhat.com>
 <20190725012149-mutt-send-email-mst@kernel.org>
 <55e8930c-2695-365f-a07b-3ad169654d28@redhat.com>
 <20190725042651-mutt-send-email-mst@kernel.org>
 <84bb2e31-0606-adff-cf2a-e1878225a847@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84bb2e31-0606-adff-cf2a-e1878225a847@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Jul 25, 2019 at 09:21:22PM +0800, Jason Wang wrote:
> 
> On 2019/7/25 下午4:28, Michael S. Tsirkin wrote:
> > On Thu, Jul 25, 2019 at 03:43:41PM +0800, Jason Wang wrote:
> > > On 2019/7/25 下午1:52, Michael S. Tsirkin wrote:
> > > > On Tue, Jul 23, 2019 at 09:31:35PM +0800, Jason Wang wrote:
> > > > > On 2019/7/23 下午5:26, Michael S. Tsirkin wrote:
> > > > > > On Tue, Jul 23, 2019 at 04:49:01PM +0800, Jason Wang wrote:
> > > > > > > On 2019/7/23 下午4:10, Michael S. Tsirkin wrote:
> > > > > > > > On Tue, Jul 23, 2019 at 03:53:06PM +0800, Jason Wang wrote:
> > > > > > > > > On 2019/7/23 下午3:23, Michael S. Tsirkin wrote:
> > > > > > > > > > > > Really let's just use kfree_rcu. It's way cleaner: fire and forget.
> > > > > > > > > > > Looks not, you need rate limit the fire as you've figured out?
> > > > > > > > > > See the discussion that followed. Basically no, it's good enough
> > > > > > > > > > already and is only going to be better.
> > > > > > > > > > 
> > > > > > > > > > > And in fact,
> > > > > > > > > > > the synchronization is not even needed, does it help if I leave a comment to
> > > > > > > > > > > explain?
> > > > > > > > > > Let's try to figure it out in the mail first. I'm pretty sure the
> > > > > > > > > > current logic is wrong.
> > > > > > > > > Here is what the code what to achieve:
> > > > > > > > > 
> > > > > > > > > - The map was protected by RCU
> > > > > > > > > 
> > > > > > > > > - Writers are: MMU notifier invalidation callbacks, file operations (ioctls
> > > > > > > > > etc), meta_prefetch (datapath)
> > > > > > > > > 
> > > > > > > > > - Readers are: memory accessor
> > > > > > > > > 
> > > > > > > > > Writer are synchronized through mmu_lock. RCU is used to synchronized
> > > > > > > > > between writers and readers.
> > > > > > > > > 
> > > > > > > > > The synchronize_rcu() in vhost_reset_vq_maps() was used to synchronized it
> > > > > > > > > with readers (memory accessors) in the path of file operations. But in this
> > > > > > > > > case, vq->mutex was already held, this means it has been serialized with
> > > > > > > > > memory accessor. That's why I think it could be removed safely.
> > > > > > > > > 
> > > > > > > > > Anything I miss here?
> > > > > > > > > 
> > > > > > > > So invalidate callbacks need to reset the map, and they do
> > > > > > > > not have vq mutex. How can they do this and free
> > > > > > > > the map safely? They need synchronize_rcu or kfree_rcu right?
> > > > > > > Invalidation callbacks need but file operations (e.g ioctl) not.
> > > > > > > 
> > > > > > > 
> > > > > > > > And I worry somewhat that synchronize_rcu in an MMU notifier
> > > > > > > > is a problem, MMU notifiers are supposed to be quick:
> > > > > > > Looks not, since it can allow to be blocked and lots of driver depends on
> > > > > > > this. (E.g mmu_notifier_range_blockable()).
> > > > > > Right, they can block. So why don't we take a VQ mutex and be
> > > > > > done with it then? No RCU tricks.
> > > > > This is how I want to go with RFC and V1. But I end up with deadlock between
> > > > > vq locks and some MM internal locks. So I decide to use RCU which is 100%
> > > > > under the control of vhost.
> > > > > 
> > > > > Thanks
> > > > And I guess the deadlock is because GUP is taking mmu locks which are
> > > > taken on mmu notifier path, right?
> > > 
> > > Yes, but it's not the only lock. I don't remember the details, but I can
> > > confirm I meet issues with one or two other locks.
> > > 
> > > 
> > > >     How about we add a seqlock and take
> > > > that in invalidate callbacks?  We can then drop the VQ lock before GUP,
> > > > and take it again immediately after.
> > > > 
> > > > something like
> > > > 	if (!vq_meta_mapped(vq)) {
> > > > 		vq_meta_setup(&uaddrs);
> > > > 		mutex_unlock(vq->mutex)
> > > > 		vq_meta_map(&uaddrs);
> > > 
> > > The problem is the vq address could be changed at this time.
> > > 
> > > 
> > > > 		mutex_lock(vq->mutex)
> > > > 
> > > > 		/* recheck both sock->private_data and seqlock count. */
> > > > 		if changed - bail out
> > > > 	}
> > > > 
> > > > And also requires that VQ uaddrs is defined like this:
> > > > - writers must have both vq mutex and dev mutex
> > > > - readers must have either vq mutex or dev mutex
> > > > 
> > > > 
> > > > That's a big change though. For now, how about switching to a per-vq SRCU?
> > > > That is only a little bit more expensive than RCU, and we
> > > > can use synchronize_srcu_expedited.
> > > > 
> > > Consider we switch to use kfree_rcu(), what's the advantage of per-vq SRCU?
> > > 
> > > Thanks
> > 
> > I thought we established that notifiers must wait for
> > all readers to finish before they mark page dirty, to
> > prevent page from becoming dirty after address
> > has been invalidated.
> > Right?
> 
> 
> Exactly, and that's the reason actually I use synchronize_rcu() there.
> 
> So the concern is still the possible synchronize_expedited()?


I think synchronize_srcu_expedited.

synchronize_expedited sends lots of IPI and is bad for realtime VMs.

> Can I do this
> on through another series on top of the incoming V2?
> 
> Thanks
> 

The question is this: is this still a gain if we switch to the
more expensive srcu? If yes then we can keep the feature on,
if not we'll put it off until next release and think
of better solutions. rcu->srcu is just a find and replace,
don't see why we need to defer that. can be a separate patch
for sure, but we need to know how well it works.

-- 
MST
