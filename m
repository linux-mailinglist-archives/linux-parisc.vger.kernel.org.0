Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE9CD6FAE9
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jul 2019 10:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfGVIIz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jul 2019 04:08:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47594 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfGVIIz (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jul 2019 04:08:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 10D6B2F8BC9;
        Mon, 22 Jul 2019 08:08:54 +0000 (UTC)
Received: from redhat.com (ovpn-120-233.rdu2.redhat.com [10.10.120.233])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 41D3F5FCA3;
        Mon, 22 Jul 2019 08:08:46 +0000 (UTC)
Date:   Mon, 22 Jul 2019 04:08:44 -0400
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
Message-ID: <20190722040230-mutt-send-email-mst@kernel.org>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <20190721081447-mutt-send-email-mst@kernel.org>
 <85dd00e2-37a6-72b7-5d5a-8bf46a3526cf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85dd00e2-37a6-72b7-5d5a-8bf46a3526cf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 22 Jul 2019 08:08:54 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jul 22, 2019 at 01:24:24PM +0800, Jason Wang wrote:
> 
> On 2019/7/21 下午8:18, Michael S. Tsirkin wrote:
> > On Sun, Jul 21, 2019 at 06:02:52AM -0400, Michael S. Tsirkin wrote:
> > > On Sat, Jul 20, 2019 at 03:08:00AM -0700, syzbot wrote:
> > > > syzbot has bisected this bug to:
> > > > 
> > > > commit 7f466032dc9e5a61217f22ea34b2df932786bbfc
> > > > Author: Jason Wang<jasowang@redhat.com>
> > > > Date:   Fri May 24 08:12:18 2019 +0000
> > > > 
> > > >      vhost: access vq metadata through kernel virtual address
> > > > 
> > > > bisection log:https://syzkaller.appspot.com/x/bisect.txt?x=149a8a20600000
> > > > start commit:   6d21a41b Add linux-next specific files for 20190718
> > > > git tree:       linux-next
> > > > final crash:https://syzkaller.appspot.com/x/report.txt?x=169a8a20600000
> > > > console output:https://syzkaller.appspot.com/x/log.txt?x=129a8a20600000
> > > > kernel config:https://syzkaller.appspot.com/x/.config?x=3430a151e1452331
> > > > dashboard link:https://syzkaller.appspot.com/bug?extid=e58112d71f77113ddb7b
> > > > syz repro:https://syzkaller.appspot.com/x/repro.syz?x=10139e68600000
> > > > 
> > > > Reported-by:syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com
> > > > Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual
> > > > address")
> > > > 
> > > > For information about bisection process see:https://goo.gl/tpsmEJ#bisection
> > > OK I poked at this for a bit, I see several things that
> > > we need to fix, though I'm not yet sure it's the reason for
> > > the failures:
> > > 
> > > 
> > > 1. mmu_notifier_register shouldn't be called from vhost_vring_set_num_addr
> > >     That's just a bad hack, in particular I don't think device
> > >     mutex is taken and so poking at two VQs will corrupt
> > >     memory.
> > >     So what to do? How about a per vq notifier?
> > >     Of course we also have synchronize_rcu
> > >     in the notifier which is slow and is now going to be called twice.
> > >     I think call_rcu would be more appropriate here.
> > >     We then need rcu_barrier on module unload.
> > >     OTOH if we make pages linear with map then we are good
> > >     with kfree_rcu which is even nicer.
> > > 
> > > 2. Doesn't map leak after vhost_map_unprefetch?
> > >     And why does it poke at contents of the map?
> > >     No one should use it right?
> > > 
> > > 3. notifier unregister happens last in vhost_dev_cleanup,
> > >     but register happens first. This looks wrong to me.
> > > 
> > > 4. OK so we use the invalidate count to try and detect that
> > >     some invalidate is in progress.
> > >     I am not 100% sure why do we care.
> > >     Assuming we do, uaddr can change between start and end
> > >     and then the counter can get negative, or generally
> > >     out of sync.
> > > 
> > > So what to do about all this?
> > > I am inclined to say let's just drop the uaddr optimization
> > > for now. E.g. kvm invalidates unconditionally.
> > > 3 should be fixed independently.
> > Above implements this but is only build-tested.
> > Jason, pls take a look. If you like the approach feel
> > free to take it from here.
> > 
> > One thing the below does not have is any kind of rate-limiting.
> > Given it's so easy to restart I'm thinking it makes sense
> > to add a generic infrastructure for this.
> > Can be a separate patch I guess.
> 
> 
> I don't get why must use kfree_rcu() instead of synchronize_rcu() here.

synchronize_rcu has very high latency on busy systems.
It is not something that should be used on a syscall path.
KVM had to switch to SRCU to keep it sane.
Otherwise one guest can trivially slow down another one.

> 
> > 
> > Signed-off-by: Michael S. Tsirkin<mst@redhat.com>
> 
> 
> Let me try to figure out the root cause then decide whether or not to go for
> this way.
> 
> Thanks

The root cause of the crash is relevant, but we still need
to fix issues 1-4.

More issues (my patch tries to fix them too):

5. page not dirtied when mappings are torn down outside
   of invalidate callback

6. potential cross-VM DOS by one guest keeping system busy
   and increasing synchronize_rcu latency to the point where
   another guest stars timing out and crashes



-- 
MST
