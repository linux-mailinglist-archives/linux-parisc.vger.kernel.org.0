Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4F9787DF
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Jul 2019 10:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbfG2I7i (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 29 Jul 2019 04:59:38 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39078 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfG2I7i (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 29 Jul 2019 04:59:38 -0400
Received: by mail-qt1-f194.google.com with SMTP id l9so58851120qtu.6
        for <linux-parisc@vger.kernel.org>; Mon, 29 Jul 2019 01:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q68Dj7R63I2Ecvb2PPGzHjYhrCQecwVv+3ZzbHMtRrM=;
        b=LdVy0MCqrL2mgTtqHVXC8IUZBlNOW+EgQ+o3Pq7VGKLXK2XB3ucfvrFnNP07bLHDm5
         nuxIVzGIPNEYR3wEef8VfS49cClrhLw6GllgynG4IYPeoc+lLXk4aFA6r+OPffI/AsSg
         Ws5lSx9d7U9wJMLMtOlAp4plHgQPhvyJzKnv5AUnDXhTiIvEOmsWW/N6ahmjNVp/aWS6
         eaNlo1c9z5wuCEk6t4CN4QIRXL88l3QyxYv0FEhgOXxChl4QhOMuLSWQVab2OX8KMFnv
         mjEJMykRdAmckdVZFg6WIUdAZZwk6DYIivr3hMZVk9h6X1fsItH+lxMix9rCmxSoKMtG
         ZPNQ==
X-Gm-Message-State: APjAAAXR1l8m24pyaO1Ojb/dIhmJKqswx1goJmf5/U5RIrrzdzX6/+5B
        ih/IEgAJTRNHo2f5sjrODDNxmQ==
X-Google-Smtp-Source: APXvYqzdpBbLibFicHdiT5TefWqFoQxYcTCr3KhKgWnun67P5z4zFpu5Vd0tQv7j2SaN95sYflY5Ng==
X-Received: by 2002:aed:39e7:: with SMTP id m94mr80555924qte.0.1564390777624;
        Mon, 29 Jul 2019 01:59:37 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
        by smtp.gmail.com with ESMTPSA id z1sm27810714qke.122.2019.07.29.01.59.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 01:59:36 -0700 (PDT)
Date:   Mon, 29 Jul 2019 04:59:27 -0400
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
Message-ID: <20190729045127-mutt-send-email-mst@kernel.org>
References: <84bb2e31-0606-adff-cf2a-e1878225a847@redhat.com>
 <20190725092332-mutt-send-email-mst@kernel.org>
 <11802a8a-ce41-f427-63d5-b6a4cf96bb3f@redhat.com>
 <20190726074644-mutt-send-email-mst@kernel.org>
 <5cc94f15-b229-a290-55f3-8295266edb2b@redhat.com>
 <20190726082837-mutt-send-email-mst@kernel.org>
 <ada10dc9-6cab-e189-5289-6f9d3ff8fed2@redhat.com>
 <aaefa93e-a0de-1c55-feb0-509c87aae1f3@redhat.com>
 <20190726094756-mutt-send-email-mst@kernel.org>
 <0792ee09-b4b7-673c-2251-e5e0ce0fbe32@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0792ee09-b4b7-673c-2251-e5e0ce0fbe32@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jul 29, 2019 at 01:54:49PM +0800, Jason Wang wrote:
> 
> On 2019/7/26 下午9:49, Michael S. Tsirkin wrote:
> > > > Ok, let me retry if necessary (but I do remember I end up with deadlocks
> > > > last try).
> > > Ok, I play a little with this. And it works so far. Will do more testing
> > > tomorrow.
> > > 
> > > One reason could be I switch to use get_user_pages_fast() to
> > > __get_user_pages_fast() which doesn't need mmap_sem.
> > > 
> > > Thanks
> > OK that sounds good. If we also set a flag to make
> > vhost_exceeds_weight exit, then I think it will be all good.
> 
> 
> After some experiments, I came up two methods:
> 
> 1) switch to use vq->mutex, then we must take the vq lock during range
> checking (but I don't see obvious slowdown for 16vcpus + 16queues). Setting
> flags during weight check should work but it still can't address the worst
> case: wait for the page to be swapped in. Is this acceptable?
> 
> 2) using current RCU but replace synchronize_rcu() with vhost_work_flush().
> The worst case is the same as 1) but we can check range without holding any
> locks.
> 
> Which one did you prefer?
> 
> Thanks

I would rather we start with 1 and switch to 2 after we
can show some gain.

But the worst case needs to be addressed.  How about sending a signal to
the vhost thread?  We will need to fix up error handling (I think that
at the moment it will error out in that case, handling this as EFAULT -
and we don't want to drop packets if we can help it, and surely not
enter any error states.  In particular it might be especially tricky if
we wrote into userspace memory and are now trying to log the write.
I guess we can disable the optimization if log is enabled?).

-- 
MST
