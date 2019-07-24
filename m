Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01C5F73681
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Jul 2019 20:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387534AbfGXSZ0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 24 Jul 2019 14:25:26 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38835 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387496AbfGXSZZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 24 Jul 2019 14:25:25 -0400
Received: by mail-qt1-f195.google.com with SMTP id n11so46457026qtl.5
        for <linux-parisc@vger.kernel.org>; Wed, 24 Jul 2019 11:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/8SpAXACt/H0ZjS+gW4ox0Hhxo1Ofk7o0k1709Jn7z0=;
        b=Jwg+gCLJlprAESCzj46Nka2a86RPLNHAI6IRoJgt5RLr49HfUpreLrMIwTYAr5Rx1l
         oS1R8s5MIUa3wGvQ+ArX/OZTZhXRPr4Ndr1yiswfJ9lLoHwX6s/Jf3ir12vrWOWlAo2V
         VJzpsaQgRFoWXMu1EAVJXMZ+OxrEFLy+lVzm37pQ0NSxggHviC6cM7duQS9dCmHA8Fk4
         iD2D5zSPTY/6pn7yIREaQybn/aR9tf7hqq4iNckzqLbR30gxXOZmij8sOuoCBUffOxkZ
         LJRl9A1jFRQ+46GoXmzngLXIrK6lvmlzOzMZDr+lX0fNfy6h2Uq6OVmY6Qc4G4IKZI7b
         vbMQ==
X-Gm-Message-State: APjAAAWqfgweKKSjRmuXn0Xu6i2RsOEZz4+fUWNKe2ZVmUlrZGbESbyF
        CuOTPcGAwwo0X5W5olL8epW3GQ==
X-Google-Smtp-Source: APXvYqxChd/0aII9lYKOFDT2kMgtEOZZfG9pHDvB+TKQrkk+gyvE7N4AF8TKeYtvP4hnErvwYvbJPQ==
X-Received: by 2002:ac8:74cb:: with SMTP id j11mr54557383qtr.67.1563992725087;
        Wed, 24 Jul 2019 11:25:25 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
        by smtp.gmail.com with ESMTPSA id z19sm22080696qkg.28.2019.07.24.11.25.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 11:25:24 -0700 (PDT)
Date:   Wed, 24 Jul 2019 14:25:15 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>
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
Message-ID: <20190724142417-mutt-send-email-mst@kernel.org>
References: <20190723010156-mutt-send-email-mst@kernel.org>
 <124be1a2-1c53-8e65-0f06-ee2294710822@redhat.com>
 <20190723032800-mutt-send-email-mst@kernel.org>
 <e2e01a05-63d8-4388-2bcd-b2be3c865486@redhat.com>
 <20190723062221-mutt-send-email-mst@kernel.org>
 <9baa4214-67fd-7ad2-cbad-aadf90bbfc20@redhat.com>
 <20190723110219-mutt-send-email-mst@kernel.org>
 <e0c91b89-d1e8-9831-00fe-23fe92d79fa2@redhat.com>
 <20190724040238-mutt-send-email-mst@kernel.org>
 <20190724165317.GD28493@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724165317.GD28493@ziepe.ca>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Jul 24, 2019 at 01:53:17PM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 24, 2019 at 04:05:17AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Jul 24, 2019 at 10:17:14AM +0800, Jason Wang wrote:
> > > So even PTE is read speculatively before reading invalidate_count (only in
> > > the case of invalidate_count is zero). The spinlock has guaranteed that we
> > > won't read any stale PTEs.
> > 
> > I'm sorry I just do not get the argument.
> > If you want to order two reads you need an smp_rmb
> > or stronger between them executed on the same CPU.
> 
> No, that is only for unlocked algorithms.
> 
> In this case the spinlock provides all the 'or stronger' ordering
> required.
> 
> For invalidate_count going 0->1 the spin_lock ensures that any
> following PTE update during invalidation does not order before the
> spin_lock()
> 
> While holding the lock and observing 1 in invalidate_count the PTE
> values might be changing, but are ignored. C's rules about sequencing
> make this safe.
> 
> For invalidate_count going 1->0 the spin_unlock ensures that any
> preceeding PTE update during invalidation does not order after the
> spin_unlock
> 
> While holding the lock and observing 0 in invalidating_count the PTE
> values cannot be changing.
> 
> Jason

Oh right. So prefetch holds the spinlock the whole time.
Sorry about the noise.

-- 
MST
