Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2195C764DE
	for <lists+linux-parisc@lfdr.de>; Fri, 26 Jul 2019 13:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfGZLta (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 26 Jul 2019 07:49:30 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34703 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfGZLta (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 26 Jul 2019 07:49:30 -0400
Received: by mail-qt1-f194.google.com with SMTP id k10so52326729qtq.1
        for <linux-parisc@vger.kernel.org>; Fri, 26 Jul 2019 04:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=i8wjsn/J7AjCMbxusJs+A5ywmyPLK0X8wVGP+ZIy8uY=;
        b=TiKJgGZB7IRJ9rL7P4MUfr6lTBassWJZAuXAJNwXxX4+HXlcCvG/+L3jw2zG3oe9q7
         l/CK9/1N+OkQsUj9/qVRmElRwRu57GQFyDgnouoSH5JkRB9LSUK/zWEaso4p8dXBDrNx
         Vq3SoULGlYwmBHgDvrKVtWamjt/yQNDHIq9c8lybDuzhMSJG0+Dvo4NF61+8mTDgP1tB
         YWOYtuNzpJ8yyR/9/EupVP/aOOTtdRrUzr8ESNOkvD1fvJDrNqv/A+m6crjwEk9cAPu4
         L210Qvscv2jjmhTGuzPj+BRLZEL6bw/ovQLCPyYlW76CZel29y3WHvQ0TzQiY5Au6jZV
         8juQ==
X-Gm-Message-State: APjAAAWbwuttGPNpwWPACDhDmIurtwdY/mM8MQ2cTKEYF4dC11MqsLwP
        R8dyyRrKX/LAP9OVR36SPxRsJQ==
X-Google-Smtp-Source: APXvYqwMsTGjfM7uQAnObrU4lf6ZCQqoJiT3HpWwMpyDoRsBS/oRMj++843f20ueHHr8c24KKPsFiw==
X-Received: by 2002:ac8:32e8:: with SMTP id a37mr66953459qtb.231.1564141769219;
        Fri, 26 Jul 2019 04:49:29 -0700 (PDT)
Received: from redhat.com ([212.92.104.165])
        by smtp.gmail.com with ESMTPSA id f14sm21725527qto.11.2019.07.26.04.49.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 04:49:28 -0700 (PDT)
Date:   Fri, 26 Jul 2019 07:49:19 -0400
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
Message-ID: <20190726074644-mutt-send-email-mst@kernel.org>
References: <20190723035725-mutt-send-email-mst@kernel.org>
 <3f4178f1-0d71-e032-0f1f-802428ceca59@redhat.com>
 <20190723051828-mutt-send-email-mst@kernel.org>
 <caff362a-e208-3468-3688-63e1d093a9d3@redhat.com>
 <20190725012149-mutt-send-email-mst@kernel.org>
 <55e8930c-2695-365f-a07b-3ad169654d28@redhat.com>
 <20190725042651-mutt-send-email-mst@kernel.org>
 <84bb2e31-0606-adff-cf2a-e1878225a847@redhat.com>
 <20190725092332-mutt-send-email-mst@kernel.org>
 <11802a8a-ce41-f427-63d5-b6a4cf96bb3f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11802a8a-ce41-f427-63d5-b6a4cf96bb3f@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Jul 25, 2019 at 10:25:25PM +0800, Jason Wang wrote:
> 
> On 2019/7/25 下午9:26, Michael S. Tsirkin wrote:
> > > Exactly, and that's the reason actually I use synchronize_rcu() there.
> > > 
> > > So the concern is still the possible synchronize_expedited()?
> > I think synchronize_srcu_expedited.
> > 
> > synchronize_expedited sends lots of IPI and is bad for realtime VMs.
> > 
> > > Can I do this
> > > on through another series on top of the incoming V2?
> > > 
> > > Thanks
> > > 
> > The question is this: is this still a gain if we switch to the
> > more expensive srcu? If yes then we can keep the feature on,
> 
> 
> I think we only care about the cost on srcu_read_lock() which looks pretty
> tiny form my point of view. Which is basically a READ_ONCE() + WRITE_ONCE().
> 
> Of course I can benchmark to see the difference.
> 
> 
> > if not we'll put it off until next release and think
> > of better solutions. rcu->srcu is just a find and replace,
> > don't see why we need to defer that. can be a separate patch
> > for sure, but we need to know how well it works.
> 
> 
> I think I get here, let me try to do that in V2 and let's see the numbers.
> 
> Thanks

There's one other thing that bothers me, and that is that
for large rings which are not physically contiguous
we don't implement the optimization.

For sure, that can wait, but I think eventually we should
vmap large rings.

-- 
MST
