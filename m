Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 640967057B
	for <lists+linux-parisc@lfdr.de>; Mon, 22 Jul 2019 18:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbfGVQca (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 Jul 2019 12:32:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42700 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728270AbfGVQc3 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 Jul 2019 12:32:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 474C430821A0;
        Mon, 22 Jul 2019 16:32:29 +0000 (UTC)
Received: from redhat.com (ovpn-124-54.rdu2.redhat.com [10.10.124.54])
        by smtp.corp.redhat.com (Postfix) with SMTP id DE2DB5D9D3;
        Mon, 22 Jul 2019 16:32:18 +0000 (UTC)
Date:   Mon, 22 Jul 2019 12:32:17 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     Joel Fernandes <joel@joelfernandes.org>,
        Matthew Wilcox <willy@infradead.org>, aarcange@redhat.com,
        akpm@linux-foundation.org, christian@brauner.io,
        davem@davemloft.net, ebiederm@xmission.com,
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
Message-ID: <20190722123016-mutt-send-email-mst@kernel.org>
References: <20190721044615-mutt-send-email-mst@kernel.org>
 <20190721081933-mutt-send-email-mst@kernel.org>
 <20190721131725.GR14271@linux.ibm.com>
 <20190721210837.GC363@bombadil.infradead.org>
 <20190721233113.GV14271@linux.ibm.com>
 <20190722151439.GA247639@google.com>
 <20190722114612-mutt-send-email-mst@kernel.org>
 <20190722155534.GG14271@linux.ibm.com>
 <20190722120011-mutt-send-email-mst@kernel.org>
 <20190722162551.GK14271@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722162551.GK14271@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 22 Jul 2019 16:32:29 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jul 22, 2019 at 09:25:51AM -0700, Paul E. McKenney wrote:
> On Mon, Jul 22, 2019 at 12:13:40PM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jul 22, 2019 at 08:55:34AM -0700, Paul E. McKenney wrote:
> > > On Mon, Jul 22, 2019 at 11:47:24AM -0400, Michael S. Tsirkin wrote:
> > > > On Mon, Jul 22, 2019 at 11:14:39AM -0400, Joel Fernandes wrote:
> > > > > [snip]
> > > > > > > Would it make sense to have call_rcu() check to see if there are many
> > > > > > > outstanding requests on this CPU and if so process them before returning?
> > > > > > > That would ensure that frequent callers usually ended up doing their
> > > > > > > own processing.
> > > > > 
> > > > > Other than what Paul already mentioned about deadlocks, I am not sure if this
> > > > > would even work for all cases since call_rcu() has to wait for a grace
> > > > > period.
> > > > > 
> > > > > So, if the number of outstanding requests are higher than a certain amount,
> > > > > then you *still* have to wait for some RCU configurations for the grace
> > > > > period duration and cannot just execute the callback in-line. Did I miss
> > > > > something?
> > > > > 
> > > > > Can waiting in-line for a grace period duration be tolerated in the vhost case?
> > > > > 
> > > > > thanks,
> > > > > 
> > > > >  - Joel
> > > > 
> > > > No, but it has many other ways to recover (try again later, drop a
> > > > packet, use a slower copy to/from user).
> > > 
> > > True enough!  And your idea of taking recovery action based on the number
> > > of callbacks seems like a good one while we are getting RCU's callback
> > > scheduling improved.
> > > 
> > > By the way, was this a real problem that you could make happen on real
> > > hardware?
> > 
> > >  If not, I would suggest just letting RCU get improved over
> > > the next couple of releases.
> > 
> > So basically use kfree_rcu but add a comment saying e.g. "WARNING:
> > in the future callers of kfree_rcu might need to check that
> > not too many callbacks get queued. In that case, we can
> > disable the optimization, or recover in some other way.
> > Watch this space."
> 
> That sounds fair.
> 
> > > If it is something that you actually made happen, please let me know
> > > what (if anything) you need from me for your callback-counting EBUSY
> > > scheme.
> > > 
> > > 							Thanx, Paul
> > 
> > If you mean kfree_rcu causing OOM then no, it's all theoretical.
> > If you mean synchronize_rcu stalling to the point where guest will OOPs,
> > then yes, that's not too hard to trigger.
> 
> Is synchronize_rcu() being stalled by the userspace loop that is invoking
> your ioctl that does kfree_rcu()?  Or instead by the resulting callback
> invocation?
> 
> 							Thanx, Paul

Sorry, let me clarify.  We currently have synchronize_rcu in a userspace
loop. I have a patch replacing that with kfree_rcu.  This isn't the
first time synchronize_rcu is stalling a VM for a long while so I didn't
investigate further.

-- 
MST
