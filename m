Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49CB07343F
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Jul 2019 18:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfGXQxU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 24 Jul 2019 12:53:20 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:38554 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbfGXQxU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 24 Jul 2019 12:53:20 -0400
Received: by mail-qk1-f196.google.com with SMTP id a27so34274297qkk.5
        for <linux-parisc@vger.kernel.org>; Wed, 24 Jul 2019 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N+5GDocIaGJNeeiAfHSOPi2SmVdT4rQLPHKSD9PsZ+I=;
        b=YDxsaLxkea1VSwYyvtzIkxG5oCvSkigPxhBkQShb6z3NiUMmOxfDu1eZ6zFkom7daU
         u8h/zoLkQOxwJRbiaCw2/8hNE/Bht5HY3TCoiCttwyptVd1mPoS+GRxRkwK0cCm3iq22
         7qkf+dpbC+KGjNEaO8b5+LWigp5rJLzAXzsj2ylO1gPUf+tQ5JrgQJnV1nENWsjnyYa9
         9VarDOham+q+ATGl5AwzqF39bSfue6F3vqwEURcqG21pxm9lVbVSoUgMl1phRmPztF8C
         CtiYbpiK44hufWFvehcheJDYUXoVOSEOaAY2meip1/99aZ9WTovpxbewVKfaicsyRLaG
         Ke3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N+5GDocIaGJNeeiAfHSOPi2SmVdT4rQLPHKSD9PsZ+I=;
        b=sGr9rzxWmS9Ts8gDZNzURVRQCCvJuFX2yYVXHXftcDZIh5M9TiABeIZgW3pBuClcdX
         Rjc30TulbTT5wyL1FgZjOXWb4tK0aV+QzfcM6Dk9HzjKsvdEqR3XKjqRiSOsvRQkJpLv
         yKMyLRdKcu6GrF7hwsaq8qHkcwSeOmCcUr2EhVeSJIm+RoThzxHnC0yd6NyfIGn6Md2B
         xJ6EM/lGOhYJHpEP0zR7nGNNSTLehefPEGc/1+ARlZFVAdVemuR2eYBHxjJa5WODnpwr
         xDiZxOuu3pbsxgCikwGUPO4RXEYtkFFCl5Rn2nsMBHK8nqn0MWTNGKISrd+tMV2nHzj3
         vn7A==
X-Gm-Message-State: APjAAAWLTTHTHRJsWFSmAuWtigXH9RlNkbca3rAarCEPKgxYC505tHMS
        voXFCxxd5YqnNpLgabyxdDb1/A==
X-Google-Smtp-Source: APXvYqwTV2my7RFNNmAmi8390juQo6CDY6coH8KBA9OiHHx09ixIjX0uw+ns25AF40VQtymPk2wh6Q==
X-Received: by 2002:a05:620a:232:: with SMTP id u18mr53141490qkm.131.1563987199405;
        Wed, 24 Jul 2019 09:53:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id q12sm19415581qkm.126.2019.07.24.09.53.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2019 09:53:18 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hqKVx-0002lr-R9; Wed, 24 Jul 2019 13:53:17 -0300
Date:   Wed, 24 Jul 2019 13:53:17 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        syzbot <syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com>,
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
Message-ID: <20190724165317.GD28493@ziepe.ca>
References: <cfcd330d-5f4a-835a-69f7-c342d5d0d52d@redhat.com>
 <20190723010156-mutt-send-email-mst@kernel.org>
 <124be1a2-1c53-8e65-0f06-ee2294710822@redhat.com>
 <20190723032800-mutt-send-email-mst@kernel.org>
 <e2e01a05-63d8-4388-2bcd-b2be3c865486@redhat.com>
 <20190723062221-mutt-send-email-mst@kernel.org>
 <9baa4214-67fd-7ad2-cbad-aadf90bbfc20@redhat.com>
 <20190723110219-mutt-send-email-mst@kernel.org>
 <e0c91b89-d1e8-9831-00fe-23fe92d79fa2@redhat.com>
 <20190724040238-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724040238-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Jul 24, 2019 at 04:05:17AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jul 24, 2019 at 10:17:14AM +0800, Jason Wang wrote:
> > So even PTE is read speculatively before reading invalidate_count (only in
> > the case of invalidate_count is zero). The spinlock has guaranteed that we
> > won't read any stale PTEs.
> 
> I'm sorry I just do not get the argument.
> If you want to order two reads you need an smp_rmb
> or stronger between them executed on the same CPU.

No, that is only for unlocked algorithms.

In this case the spinlock provides all the 'or stronger' ordering
required.

For invalidate_count going 0->1 the spin_lock ensures that any
following PTE update during invalidation does not order before the
spin_lock()

While holding the lock and observing 1 in invalidate_count the PTE
values might be changing, but are ignored. C's rules about sequencing
make this safe.

For invalidate_count going 1->0 the spin_unlock ensures that any
preceeding PTE update during invalidation does not order after the
spin_unlock

While holding the lock and observing 0 in invalidating_count the PTE
values cannot be changing.

Jason
