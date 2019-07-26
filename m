Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B9376C46
	for <lists+linux-parisc@lfdr.de>; Fri, 26 Jul 2019 17:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfGZPD0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 26 Jul 2019 11:03:26 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35086 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfGZPD0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 26 Jul 2019 11:03:26 -0400
Received: by mail-qt1-f193.google.com with SMTP id d23so52921731qto.2
        for <linux-parisc@vger.kernel.org>; Fri, 26 Jul 2019 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GJNtLWUjNKGuqf/4gWb/0hY3o63IJN+bigrvbnAEvoQ=;
        b=O6JUVwIuDaoRGTyw9VDj8CvDSgLGWaKe8W4Wqb4w+dbn+4ZFH7a+6nHcjk/wUFFm6c
         0OYFTUoD9kHzSda3BQ8LyYRfdBubXwXZJVnNplw+uVLkHyKDz4X4NKH3Iz+7fyGTXvHZ
         SAmJImRDUCcOoWsYveIBTPNVruXFj0AXDPvuupRJe2nNzzPjk3KJWpIwPdb/PyZI5Fwj
         1x+AzU4fu6Hr7MypuEf996Ujkld5D3SALeRfN0ESQsNEl+iLcmRk7VOM3gFucanIizsp
         TEtB+vFjXNcz2vsGefQVJGHCZUG+6dpBQ5WpVqBd3HCf7f1KtoQETLm3B6MhLgC1B2Ry
         ndDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GJNtLWUjNKGuqf/4gWb/0hY3o63IJN+bigrvbnAEvoQ=;
        b=lFq/nLdsTk0FAEcmpK1aEkEcKUk9ekGyGJqd9Z3z0PuxgykWGXDapndTsMBwPVi0qG
         luyna0NkHgA71/xhqtEKfyKTFej06H3VuMJLM8pcE8ND7Mkh7K14O2gSFU8yvEClufTq
         iGSXERhw8Qip7nFOuVxOiRJ85+nr/vCqQwmUkmSPzuDG/Y3kjM76QyuvVpMbybHNNrhs
         n3BaQYkB9+fjiqO92hcTCTVtES/EJDLZeFnGYRV8Mnu/IfywMFvRogrlBMPd0Xr2/6vn
         ocQBDhXZI1NG7xb11Se2LxElJMt4/RsAGBT5fSldhqNWsjuKG8shPKdmfGqyRGpUuCsb
         9hfA==
X-Gm-Message-State: APjAAAXHpwynd9zTtI5kidhnpEuCgw1tYkxhzz0fDJ7zcK2mefhum5jO
        pvwnc9Nn8rVJ2wZiBIrMjrzEOA==
X-Google-Smtp-Source: APXvYqw5bM9aE7bDAsR6CkrbhbbwLJ5RGlTlhcmaAHdDamcGQSO6zz4CR/XGVWg0EnLb37ZxhxrkYw==
X-Received: by 2002:a0c:d14e:: with SMTP id c14mr68086462qvh.206.1564153405057;
        Fri, 26 Jul 2019 08:03:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id u71sm25391649qka.21.2019.07.26.08.03.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 08:03:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hr1kg-0000d9-RM; Fri, 26 Jul 2019 12:03:22 -0300
Date:   Fri, 26 Jul 2019 12:03:22 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Jason Wang <jasowang@redhat.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
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
Message-ID: <20190726150322.GB8695@ziepe.ca>
References: <20190725042651-mutt-send-email-mst@kernel.org>
 <84bb2e31-0606-adff-cf2a-e1878225a847@redhat.com>
 <20190725092332-mutt-send-email-mst@kernel.org>
 <11802a8a-ce41-f427-63d5-b6a4cf96bb3f@redhat.com>
 <20190726074644-mutt-send-email-mst@kernel.org>
 <5cc94f15-b229-a290-55f3-8295266edb2b@redhat.com>
 <20190726082837-mutt-send-email-mst@kernel.org>
 <ada10dc9-6cab-e189-5289-6f9d3ff8fed2@redhat.com>
 <20190726094353-mutt-send-email-mst@kernel.org>
 <63754251-a39a-1e0e-952d-658102682094@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63754251-a39a-1e0e-952d-658102682094@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Jul 26, 2019 at 10:00:20PM +0800, Jason Wang wrote:
> The question is, MMU notifier are allowed to be blocked on
> invalidate_range_start() which could be much slower than synchronize_rcu()
> to finish.
> 
> Looking at amdgpu_mn_invalidate_range_start_gfx() which calls
> amdgpu_mn_invalidate_node() which did:
> 
>                 r = reservation_object_wait_timeout_rcu(bo->tbo.resv,
>                         true, false, MAX_SCHEDULE_TIMEOUT);
> 
> ...

The general guidance has been that invalidate_start should block
minimally, if at all.

I would say synchronize_rcu is outside that guidance.

BTW, always returning EAGAIN for mmu_notifier_range_blockable() is not
good either, it should instead only return EAGAIN if any
vhost_map_range_overlap() is true.

Jason
