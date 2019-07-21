Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C39E06F470
	for <lists+linux-parisc@lfdr.de>; Sun, 21 Jul 2019 19:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfGURxe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 21 Jul 2019 13:53:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60316 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726902AbfGURxd (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 21 Jul 2019 13:53:33 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 6475685541;
        Sun, 21 Jul 2019 17:53:32 +0000 (UTC)
Received: from redhat.com (ovpn-120-128.rdu2.redhat.com [10.10.120.128])
        by smtp.corp.redhat.com (Postfix) with SMTP id DABC4600C0;
        Sun, 21 Jul 2019 17:53:24 +0000 (UTC)
Date:   Sun, 21 Jul 2019 13:53:23 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     aarcange@redhat.com, akpm@linux-foundation.org,
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
Subject: Re: RFC: call_rcu_outstanding (was Re: WARNING in __mmdrop)
Message-ID: <20190721134614-mutt-send-email-mst@kernel.org>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
 <20190721081933-mutt-send-email-mst@kernel.org>
 <20190721131725.GR14271@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190721131725.GR14271@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Sun, 21 Jul 2019 17:53:32 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, Jul 21, 2019 at 06:17:25AM -0700, Paul E. McKenney wrote:
> On Sun, Jul 21, 2019 at 08:28:05AM -0400, Michael S. Tsirkin wrote:
> > Hi Paul, others,
> > 
> > So it seems that vhost needs to call kfree_rcu from an ioctl. My worry
> > is what happens if userspace starts cycling through lots of these
> > ioctls.  Given we actually use rcu as an optimization, we could just
> > disable the optimization temporarily - but the question would be how to
> > detect an excessive rate without working too hard :) .
> > 
> > I guess we could define as excessive any rate where callback is
> > outstanding at the time when new structure is allocated.  I have very
> > little understanding of rcu internals - so I wanted to check that the
> > following more or less implements this heuristic before I spend time
> > actually testing it.
> > 
> > Could others pls take a look and let me know?
> 
> These look good as a way of seeing if there are any outstanding callbacks,
> but in the case of Tree RCU, call_rcu_outstanding() would almost never
> return false on a busy system.


Hmm, ok. Maybe I could rename this to e.g. call_rcu_busy
and change the tree one to do rcu_segcblist_n_lazy_cbs > 1000?

> 
> Here are some alternatives:
> 
> o	RCU uses some pieces of Rao Shoaib kfree_rcu() patches.
> 	The idea is to make kfree_rcu() locally buffer requests into
> 	batches of (say) 1,000, but processing smaller batches when RCU
> 	is idle, or when some smallish amout of time has passed with
> 	no more kfree_rcu() request from that CPU.  RCU than takes in
> 	the batch using not call_rcu(), but rather queue_rcu_work().
> 	The resulting batch of kfree() calls would therefore execute in
> 	workqueue context rather than in softirq context, which should
> 	be much easier on the system.
> 
> 	In theory, this would allow people to use kfree_rcu() without
> 	worrying quite so much about overload.  It would also not be
> 	that hard to implement.
> 
> o	Subsystems vulnerable to user-induced kfree_rcu() flooding use
> 	call_rcu() instead of kfree_rcu().  Keep a count of the number
> 	of things waiting for a grace period, and when this gets too
> 	large, disable the optimization.  It will then drain down, at
> 	which point the optimization can be re-enabled.
> 
> 	But please note that callbacks are -not- guaranteed to run on
> 	the CPU that queued them.  So yes, you would need a per-CPU
> 	counter, but you would need to periodically sum it up to check
> 	against the global state.  Or keep track of the CPU that
> 	did the call_rcu() so that you can atomically decrement in
> 	the callback the same counter that was atomically incremented
> 	just before the call_rcu().  Or any number of other approaches.

I'm really looking for something we can do this merge window
and without adding too much code, and kfree_rcu is intended to
fix a bug.
Adding call_rcu and careful accounting is something that I'm not
happy adding with merge window already open.

> 
> Also, the overhead is important.  For example, as far as I know,
> current RCU gracefully handles close(open(...)) in a tight userspace
> loop.  But there might be trouble due to tight userspace loops around
> lighter-weight operations.
> 
> So an important question is "Just how fast is your ioctl?"  If it takes
> (say) 100 microseconds to execute, there should be absolutely no problem.
> On the other hand, if it can execute in 50 nanoseconds, this very likely
> does need serious attention.
> 
> Other thoughts?
> 
> 							Thanx, Paul

Hmm the answer to this would be I'm not sure.
It's setup time stuff we never tested it.

> > Thanks!
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > 
> > diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
> > index 477b4eb44af5..067909521d72 100644
> > --- a/kernel/rcu/tiny.c
> > +++ b/kernel/rcu/tiny.c
> > @@ -125,6 +125,25 @@ void synchronize_rcu(void)
> >  }
> >  EXPORT_SYMBOL_GPL(synchronize_rcu);
> > 
> > +/*
> > + * Helpful for rate-limiting kfree_rcu/call_rcu callbacks.
> > + */
> > +bool call_rcu_outstanding(void)
> > +{
> > +	unsigned long flags;
> > +	struct rcu_data *rdp;
> > +	bool outstanding;
> > +
> > +	local_irq_save(flags);
> > +	rdp = this_cpu_ptr(&rcu_data);
> > +	outstanding = rcu_segcblist_empty(&rdp->cblist);
> > +	outstanding = rcu_ctrlblk.donetail != rcu_ctrlblk.curtail;
> > +	local_irq_restore(flags);
> > +
> > +	return outstanding;
> > +}
> > +EXPORT_SYMBOL_GPL(call_rcu_outstanding);
> > +
> >  /*
> >   * Post an RCU callback to be invoked after the end of an RCU grace
> >   * period.  But since we have but one CPU, that would be after any
> > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > index a14e5fbbea46..d4b9d61e637d 100644
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -2482,6 +2482,24 @@ static void rcu_leak_callback(struct rcu_head *rhp)
> >  {
> >  }
> > 
> > +/*
> > + * Helpful for rate-limiting kfree_rcu/call_rcu callbacks.
> > + */
> > +bool call_rcu_outstanding(void)
> > +{
> > +	unsigned long flags;
> > +	struct rcu_data *rdp;
> > +	bool outstanding;
> > +
> > +	local_irq_save(flags);
> > +	rdp = this_cpu_ptr(&rcu_data);
> > +	outstanding = rcu_segcblist_empty(&rdp->cblist);
> > +	local_irq_restore(flags);
> > +
> > +	return outstanding;
> > +}
> > +EXPORT_SYMBOL_GPL(call_rcu_outstanding);
> > +
> >  /*
> >   * Helper function for call_rcu() and friends.  The cpu argument will
> >   * normally be -1, indicating "currently running CPU".  It may specify
