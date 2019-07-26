Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F11476607
	for <lists+linux-parisc@lfdr.de>; Fri, 26 Jul 2019 14:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfGZMiZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 26 Jul 2019 08:38:25 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42302 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfGZMiY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 26 Jul 2019 08:38:24 -0400
Received: by mail-qt1-f196.google.com with SMTP id h18so52397160qtm.9
        for <linux-parisc@vger.kernel.org>; Fri, 26 Jul 2019 05:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7AAahzA3S5OmAp3WHwhPen11x5qmdYBmT/Y66i6DKGs=;
        b=g8la0kkoe2wucU899VOj2VUVQPkNch4G1/sI0CoPKDHpgRCtjHB/6o8YgeyzSUFgNg
         5N74RmCJJ764sx/3NbJrtea8bqopJJQNxh1Bdu7s10MbFDkUWYrBV2MZmuj6Z3XUvsA+
         VwQ902CsEJX9jL/bE7Ly5OVpq0bidqKr5mydckY4kRCh6rFUD/hpgHf2ykVssjL5rE1H
         I1FW+xrJzWaHVk6z33Ior94D4LpdPrB1JNVlIltVVdr2nSBqkvRXqO5M6iZcS51r9u/c
         sLW9NcjvqQjMM8pip3w4lMbrU2IRSlNulPFhXev0XADS2x91TG3iGv+qPuDVkl9atC9l
         sFcw==
X-Gm-Message-State: APjAAAVI7r8ypC7CogcuUZ1apEcKcqcfv5eVTR0yXoMyVcp3UtrtZV3C
        dhEXBH+IRjUpauRIqped0siSMg==
X-Google-Smtp-Source: APXvYqzmq5+4vWxaDwMY+05UXlQp7huBRpq3YhuBZEQ2PajFPNo/CMYsaRV1rBY4ljt21ew7Zf/M7w==
X-Received: by 2002:ac8:37b8:: with SMTP id d53mr65290476qtc.227.1564144703827;
        Fri, 26 Jul 2019 05:38:23 -0700 (PDT)
Received: from redhat.com ([212.92.104.165])
        by smtp.gmail.com with ESMTPSA id v7sm25082729qte.86.2019.07.26.05.38.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 05:38:23 -0700 (PDT)
Date:   Fri, 26 Jul 2019 08:38:13 -0400
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
Message-ID: <20190726082837-mutt-send-email-mst@kernel.org>
References: <20190723051828-mutt-send-email-mst@kernel.org>
 <caff362a-e208-3468-3688-63e1d093a9d3@redhat.com>
 <20190725012149-mutt-send-email-mst@kernel.org>
 <55e8930c-2695-365f-a07b-3ad169654d28@redhat.com>
 <20190725042651-mutt-send-email-mst@kernel.org>
 <84bb2e31-0606-adff-cf2a-e1878225a847@redhat.com>
 <20190725092332-mutt-send-email-mst@kernel.org>
 <11802a8a-ce41-f427-63d5-b6a4cf96bb3f@redhat.com>
 <20190726074644-mutt-send-email-mst@kernel.org>
 <5cc94f15-b229-a290-55f3-8295266edb2b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cc94f15-b229-a290-55f3-8295266edb2b@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Jul 26, 2019 at 08:00:58PM +0800, Jason Wang wrote:
> 
> On 2019/7/26 下午7:49, Michael S. Tsirkin wrote:
> > On Thu, Jul 25, 2019 at 10:25:25PM +0800, Jason Wang wrote:
> > > On 2019/7/25 下午9:26, Michael S. Tsirkin wrote:
> > > > > Exactly, and that's the reason actually I use synchronize_rcu() there.
> > > > > 
> > > > > So the concern is still the possible synchronize_expedited()?
> > > > I think synchronize_srcu_expedited.
> > > > 
> > > > synchronize_expedited sends lots of IPI and is bad for realtime VMs.
> > > > 
> > > > > Can I do this
> > > > > on through another series on top of the incoming V2?
> > > > > 
> > > > > Thanks
> > > > > 
> > > > The question is this: is this still a gain if we switch to the
> > > > more expensive srcu? If yes then we can keep the feature on,
> > > 
> > > I think we only care about the cost on srcu_read_lock() which looks pretty
> > > tiny form my point of view. Which is basically a READ_ONCE() + WRITE_ONCE().
> > > 
> > > Of course I can benchmark to see the difference.
> > > 
> > > 
> > > > if not we'll put it off until next release and think
> > > > of better solutions. rcu->srcu is just a find and replace,
> > > > don't see why we need to defer that. can be a separate patch
> > > > for sure, but we need to know how well it works.
> > > 
> > > I think I get here, let me try to do that in V2 and let's see the numbers.
> > > 
> > > Thanks
> 
> 
> It looks to me for tree rcu, its srcu_read_lock() have a mb() which is too
> expensive for us.

I will try to ponder using vq lock in some way.
Maybe with trylock somehow ...


> If we just worry about the IPI,

With synchronize_rcu what I would worry about is that guest is stalled
because system is busy because of other guests.
With expedited it's the IPIs...


> can we do something like in
> vhost_invalidate_vq_start()?
> 
>         if (map) {
>                 /* In order to avoid possible IPIs with
>                  * synchronize_rcu_expedited() we use call_rcu() +
>                  * completion.
> */
> init_completion(&c.completion);
>                 call_rcu(&c.rcu_head, vhost_finish_vq_invalidation);
> wait_for_completion(&c.completion);
>                 vhost_set_map_dirty(vq, map, index);
> vhost_map_unprefetch(map);
>         }
> 
> ?

Why would that be faster than synchronize_rcu?



> 
> > There's one other thing that bothers me, and that is that
> > for large rings which are not physically contiguous
> > we don't implement the optimization.
> > 
> > For sure, that can wait, but I think eventually we should
> > vmap large rings.
> 
> 
> Yes, worth to try. But using direct map has its own advantage: it can use
> hugepage that vmap can't
> 
> Thanks

Sure, so we can do that for small rings.

-- 
MST
