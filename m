Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F77176931
	for <lists+linux-parisc@lfdr.de>; Fri, 26 Jul 2019 15:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387971AbfGZNt4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 26 Jul 2019 09:49:56 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44444 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388448AbfGZNtt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 26 Jul 2019 09:49:49 -0400
Received: by mail-qt1-f194.google.com with SMTP id 44so21601466qtg.11
        for <linux-parisc@vger.kernel.org>; Fri, 26 Jul 2019 06:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Arc7jiA/gNfqVVW7QNfgaMfkpV6mHYMiv3nUsNQh21Q=;
        b=hmLc8zO2nsV32cS7oIazq0jXP+3Jiypbryu819U9INWcwiTnH5OXUcXJfVaQD3SvS5
         0qwicvQMXDDO8DyWNSa0HjSMhyi9JkRZiA1W9qmzMoAJguI9PA8yQUmQj4welY3Av6tn
         18ZT/JSF9ONdfZkJCrTfJr+XpvaMY9h2toTWNT818zfsxrZUNvfAup2aQqU55ScYCgwd
         xw0MR6jw+n/d1hlgPCgk23hk8lKDULP7LAuDZ/1NB2QrFAVzLuqHcztUChlR46G+wEM2
         HmgoGqM4nCH5C7bNWp0I5/AUF8iYj7OkA9iJqshfcgmRQIvGT1hMYGVIfT8T6b6n467K
         xYjg==
X-Gm-Message-State: APjAAAW9aSHPn3YGmOV6OikxrkD9XgW7Ru/Tw3SMVrTYr65f4APutflO
        a+lX1l225MaTQjbGPDwzwKzXyg==
X-Google-Smtp-Source: APXvYqwJQHLCc1j1lFY5aAZTn5kwYloU8xFZNwjN11XBjJ1dY1OXNTBegRGc33x5aUh2wiZJ7uMG3w==
X-Received: by 2002:a0c:9233:: with SMTP id a48mr67054287qva.66.1564148988892;
        Fri, 26 Jul 2019 06:49:48 -0700 (PDT)
Received: from redhat.com ([212.92.104.165])
        by smtp.gmail.com with ESMTPSA id w19sm20959381qkj.66.2019.07.26.06.49.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 06:49:48 -0700 (PDT)
Date:   Fri, 26 Jul 2019 09:49:39 -0400
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
Message-ID: <20190726094756-mutt-send-email-mst@kernel.org>
References: <55e8930c-2695-365f-a07b-3ad169654d28@redhat.com>
 <20190725042651-mutt-send-email-mst@kernel.org>
 <84bb2e31-0606-adff-cf2a-e1878225a847@redhat.com>
 <20190725092332-mutt-send-email-mst@kernel.org>
 <11802a8a-ce41-f427-63d5-b6a4cf96bb3f@redhat.com>
 <20190726074644-mutt-send-email-mst@kernel.org>
 <5cc94f15-b229-a290-55f3-8295266edb2b@redhat.com>
 <20190726082837-mutt-send-email-mst@kernel.org>
 <ada10dc9-6cab-e189-5289-6f9d3ff8fed2@redhat.com>
 <aaefa93e-a0de-1c55-feb0-509c87aae1f3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaefa93e-a0de-1c55-feb0-509c87aae1f3@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Jul 26, 2019 at 09:36:18PM +0800, Jason Wang wrote:
> 
> On 2019/7/26 下午8:53, Jason Wang wrote:
> > 
> > On 2019/7/26 下午8:38, Michael S. Tsirkin wrote:
> > > On Fri, Jul 26, 2019 at 08:00:58PM +0800, Jason Wang wrote:
> > > > On 2019/7/26 下午7:49, Michael S. Tsirkin wrote:
> > > > > On Thu, Jul 25, 2019 at 10:25:25PM +0800, Jason Wang wrote:
> > > > > > On 2019/7/25 下午9:26, Michael S. Tsirkin wrote:
> > > > > > > > Exactly, and that's the reason actually I use
> > > > > > > > synchronize_rcu() there.
> > > > > > > > 
> > > > > > > > So the concern is still the possible synchronize_expedited()?
> > > > > > > I think synchronize_srcu_expedited.
> > > > > > > 
> > > > > > > synchronize_expedited sends lots of IPI and is bad for realtime VMs.
> > > > > > > 
> > > > > > > > Can I do this
> > > > > > > > on through another series on top of the incoming V2?
> > > > > > > > 
> > > > > > > > Thanks
> > > > > > > > 
> > > > > > > The question is this: is this still a gain if we switch to the
> > > > > > > more expensive srcu? If yes then we can keep the feature on,
> > > > > > I think we only care about the cost on srcu_read_lock()
> > > > > > which looks pretty
> > > > > > tiny form my point of view. Which is basically a
> > > > > > READ_ONCE() + WRITE_ONCE().
> > > > > > 
> > > > > > Of course I can benchmark to see the difference.
> > > > > > 
> > > > > > 
> > > > > > > if not we'll put it off until next release and think
> > > > > > > of better solutions. rcu->srcu is just a find and replace,
> > > > > > > don't see why we need to defer that. can be a separate patch
> > > > > > > for sure, but we need to know how well it works.
> > > > > > I think I get here, let me try to do that in V2 and
> > > > > > let's see the numbers.
> > > > > > 
> > > > > > Thanks
> > > > 
> > > > It looks to me for tree rcu, its srcu_read_lock() have a mb()
> > > > which is too
> > > > expensive for us.
> > > I will try to ponder using vq lock in some way.
> > > Maybe with trylock somehow ...
> > 
> > 
> > Ok, let me retry if necessary (but I do remember I end up with deadlocks
> > last try).
> 
> 
> Ok, I play a little with this. And it works so far. Will do more testing
> tomorrow.
> 
> One reason could be I switch to use get_user_pages_fast() to
> __get_user_pages_fast() which doesn't need mmap_sem.
> 
> Thanks

OK that sounds good. If we also set a flag to make
vhost_exceeds_weight exit, then I think it will be all good.

-- 
MST
