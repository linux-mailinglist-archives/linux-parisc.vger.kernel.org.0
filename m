Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931BA6FADA
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jul 2019 10:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfGVICZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jul 2019 04:02:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59764 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbfGVICY (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jul 2019 04:02:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 269F7308424C;
        Mon, 22 Jul 2019 08:02:24 +0000 (UTC)
Received: from redhat.com (ovpn-120-233.rdu2.redhat.com [10.10.120.233])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D54DC610A6;
        Mon, 22 Jul 2019 08:02:14 +0000 (UTC)
Date:   Mon, 22 Jul 2019 04:02:13 -0400
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
Message-ID: <20190722035657-mutt-send-email-mst@kernel.org>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <75c43998-3a1c-676f-99ff-3d04663c3fcc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75c43998-3a1c-676f-99ff-3d04663c3fcc@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 22 Jul 2019 08:02:24 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jul 22, 2019 at 01:21:59PM +0800, Jason Wang wrote:
> 
> On 2019/7/21 下午6:02, Michael S. Tsirkin wrote:
> > On Sat, Jul 20, 2019 at 03:08:00AM -0700, syzbot wrote:
> > > syzbot has bisected this bug to:
> > > 
> > > commit 7f466032dc9e5a61217f22ea34b2df932786bbfc
> > > Author: Jason Wang <jasowang@redhat.com>
> > > Date:   Fri May 24 08:12:18 2019 +0000
> > > 
> > >      vhost: access vq metadata through kernel virtual address
> > > 
> > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149a8a20600000
> > > start commit:   6d21a41b Add linux-next specific files for 20190718
> > > git tree:       linux-next
> > > final crash:    https://syzkaller.appspot.com/x/report.txt?x=169a8a20600000
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=129a8a20600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3430a151e1452331
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=e58112d71f77113ddb7b
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10139e68600000
> > > 
> > > Reported-by: syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com
> > > Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual
> > > address")
> > > 
> > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> > 
> > OK I poked at this for a bit, I see several things that
> > we need to fix, though I'm not yet sure it's the reason for
> > the failures:
> > 
> > 
> > 1. mmu_notifier_register shouldn't be called from vhost_vring_set_num_addr
> >     That's just a bad hack,
> 
> 
> This is used to avoid holding lock when checking whether the addresses are
> overlapped. Otherwise we need to take spinlock for each invalidation request
> even if it was the va range that is not interested for us. This will be very
> slow e.g during guest boot.

KVM seems to do exactly that.
I tried and guest does not seem to boot any slower.
Do you observe any slowdown?

Now I took a hard look at the uaddr hackery it really makes
me nervious. So I think for this release we want something
safe, and optimizations on top. As an alternative revert the
optimization and try again for next merge window.


-- 
MST
