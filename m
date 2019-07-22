Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE528701F1
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jul 2019 16:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730781AbfGVOL4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jul 2019 10:11:56 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:33022 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbfGVOLz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jul 2019 10:11:55 -0400
Received: by mail-qt1-f196.google.com with SMTP id r6so34427039qtt.0
        for <linux-parisc@vger.kernel.org>; Mon, 22 Jul 2019 07:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LtBWSYY5RJyJ5bjGuD8GT1ULGrE6M+cxt5l8yU6kpN0=;
        b=AqJLL2tAQ8qmfza+BbBBA30hBmiEi4pm7Bd30lUGLJdSyVKKuDWuxFlP7RyECIj17b
         XJpeqNQH2wamruofikS+opbhHXR87C/2P4+HHr/txKjdnmmTrCfU3/FvIDauFeGsqdLX
         9N8TDemI/FqJTetBBb+eMeMhgwvnuJ3+QSjcM18BJqZFbPTYbz22jGuEVhjAl1NeRhMe
         gMsST/gm4oj7anPp1NAGwwTiAl7EGdHZhvi9wPgzVP0639DiVRWlp0mKEsh+gaWi/vPE
         9sF4SdwiKYxgei4G8H6O23RQvFqbuu976015rHkp6asEVORyBSYPRzufJqJdiSfpQaVD
         Edlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LtBWSYY5RJyJ5bjGuD8GT1ULGrE6M+cxt5l8yU6kpN0=;
        b=jtBnjE2uBj9eooCYkP/bHLseOEcNT2nX2IXjufFJetpfAqP6ubwYnMJ4GP6PERnFx8
         VOchdBEjpvk2oXc8Jkl3xGS989YpfnmIQGu3HfzHxkztQi0FKl0ql50L5ejAJNivYpLq
         Sr9CcY0QGQsNB1m0Qcywbnq5uMb6pbSzB2qy/vEBRQhunGr/O/glXq4CLoXBdzWg8VOR
         YBTqMydZOGXue07iRpnAuNwDh2h2qEd8jg2Bpo/hNdut3q8aDoNR1saxY0WfmWma5B2U
         gnarHKwBB0U+WIY8DkZd+gCOVFehe0M6Ld56I3fe8E+hbaJOvHHDJvpMQp08MmkGN12/
         c8LA==
X-Gm-Message-State: APjAAAWNbWx9lY3Yn4q6+qUtqPMTpmQiky0NWmNz6RBPkGv/i1myzYjQ
        jFEtmo/HDKHsOrndqasfepIpCw==
X-Google-Smtp-Source: APXvYqzJhWJh0JG/V+RW4LMQbSCenJcJXUz5oFlysoNrpAnk6aDKO1gmwVookMZq2D7vPB1tr+gYAg==
X-Received: by 2002:ac8:3794:: with SMTP id d20mr49622645qtc.392.1563804713889;
        Mon, 22 Jul 2019 07:11:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id x46sm25518922qtx.96.2019.07.22.07.11.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 07:11:53 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hpZ2e-0003yO-Ou; Mon, 22 Jul 2019 11:11:52 -0300
Date:   Mon, 22 Jul 2019 11:11:52 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     syzbot <syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com>,
        aarcange@redhat.com, akpm@linux-foundation.org,
        christian@brauner.io, davem@davemloft.net, ebiederm@xmission.com,
        elena.reshetova@intel.com, guro@fb.com, hch@infradead.org,
        james.bottomley@hansenpartnership.com, jasowang@redhat.com,
        jglisse@redhat.com, keescook@chromium.org, ldv@altlinux.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-parisc@vger.kernel.org,
        luto@amacapital.net, mhocko@suse.com, mingo@kernel.org,
        namit@vmware.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk,
        wad@chromium.org
Subject: Re: WARNING in __mmdrop
Message-ID: <20190722141152.GA13711@ziepe.ca>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190721044615-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Jul 21, 2019 at 06:02:52AM -0400, Michael S. Tsirkin wrote:
> On Sat, Jul 20, 2019 at 03:08:00AM -0700, syzbot wrote:
> > syzbot has bisected this bug to:
> > 
> > commit 7f466032dc9e5a61217f22ea34b2df932786bbfc
> > Author: Jason Wang <jasowang@redhat.com>
> > Date:   Fri May 24 08:12:18 2019 +0000
> > 
> >     vhost: access vq metadata through kernel virtual address
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149a8a20600000
> > start commit:   6d21a41b Add linux-next specific files for 20190718
> > git tree:       linux-next
> > final crash:    https://syzkaller.appspot.com/x/report.txt?x=169a8a20600000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=129a8a20600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3430a151e1452331
> > dashboard link: https://syzkaller.appspot.com/bug?extid=e58112d71f77113ddb7b
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10139e68600000
> > 
> > Reported-by: syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com
> > Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual
> > address")
> > 
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> 
> OK I poked at this for a bit, I see several things that
> we need to fix, though I'm not yet sure it's the reason for
> the failures:

This stuff looks quite similar to the hmm_mirror use model and other
places in the kernel. I'm still hoping we can share this code a bit more.

There is another bug, this sequence here:

vhost_vring_set_num_addr()
   mmu_notifier_unregister()
   [..]
   mmu_notifier_register()

Which I think is trying to create a lock to protect dev->vqs..

Has the problem that mmu_notifier_unregister() doesn't guarantee that
invalidate_start/end are fully paired.

So after any unregister the code has to clean up any resulting
unbalanced invalidate_count before it can call mmu_notifier_register
again. ie zero the invalidate_count.

It also seems really weird that vhost_map_prefetch() can fail, ie due
to __get_user_pages_fast needing to block, but that just silently
(permanently?) disables the optimization?? At least the usage here
would be better done with a seqcount lock and a normal blocking call
to get_user_pages_fast()...

Jason
