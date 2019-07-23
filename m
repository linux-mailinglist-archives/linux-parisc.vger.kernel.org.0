Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE54771513
	for <lists+linux-parisc@lfdr.de>; Tue, 23 Jul 2019 11:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729638AbfGWJ1C (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 Jul 2019 05:27:02 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36664 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727797AbfGWJ1B (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 Jul 2019 05:27:01 -0400
Received: by mail-qt1-f195.google.com with SMTP id z4so41256182qtc.3
        for <linux-parisc@vger.kernel.org>; Tue, 23 Jul 2019 02:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=w9+uTBVD5eL1yIizEhpB/pr3lxHAjPOpAJ2J7t/uPjY=;
        b=DDCjA+jkozhlBX6cpRmWPA9a6sTV/7cGs8s87IrFrRBBYSxA3JJQrpAQUzyCVjVL0u
         37Y1QH+MyvuA24tM21CgToBKbnA8PD4A6en5GRyLRTe0y4FSdFUYluIjXMSfrhRxJCH+
         YUyrzDf/zDPbbXh2NhK2MyjZB+XmUZhlHibnnfiTtkkhreGqYW5ZfkDxApk3PIrTiq1W
         R7fWi9RaUN9YPItBJqI4/7b0N/smylMJ81mBTFe10ImDf66Vi3SJzCpokUzeR4P6JTrf
         SqPR0BLYcmM1pyFbacNpmfaJv2uEtANEWi9LRhJ+7gFasCaodutAT37BvcDgGD+Km0Sf
         bzyQ==
X-Gm-Message-State: APjAAAWaJKCR/hJYM/ikSAjC9EbpnV6zcNGL3j3Q/s5d1IfL9c/FmpCT
        6Drb0w0p7G1S/Yj18JKa3LRdhg==
X-Google-Smtp-Source: APXvYqznQz1jb6/VqV6QAjRFsQRchbKNzzWw6vrke7ravYfqDHLLyPR0Ru5U5FkLQQwrSBJvjXKcDw==
X-Received: by 2002:ac8:2e5d:: with SMTP id s29mr52712693qta.70.1563874020622;
        Tue, 23 Jul 2019 02:27:00 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
        by smtp.gmail.com with ESMTPSA id r5sm19239957qkc.42.2019.07.23.02.26.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 02:26:59 -0700 (PDT)
Date:   Tue, 23 Jul 2019 05:26:50 -0400
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
Message-ID: <20190723051828-mutt-send-email-mst@kernel.org>
References: <20190721081447-mutt-send-email-mst@kernel.org>
 <85dd00e2-37a6-72b7-5d5a-8bf46a3526cf@redhat.com>
 <20190722040230-mutt-send-email-mst@kernel.org>
 <4bd2ff78-6871-55f2-44dc-0982ffef3337@redhat.com>
 <20190723010019-mutt-send-email-mst@kernel.org>
 <b4696f2e-678a-bdb2-4b7c-fb4ce040ec2a@redhat.com>
 <20190723032024-mutt-send-email-mst@kernel.org>
 <1d14de4d-0133-1614-9f64-3ded381de04e@redhat.com>
 <20190723035725-mutt-send-email-mst@kernel.org>
 <3f4178f1-0d71-e032-0f1f-802428ceca59@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f4178f1-0d71-e032-0f1f-802428ceca59@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jul 23, 2019 at 04:49:01PM +0800, Jason Wang wrote:
> 
> On 2019/7/23 下午4:10, Michael S. Tsirkin wrote:
> > On Tue, Jul 23, 2019 at 03:53:06PM +0800, Jason Wang wrote:
> > > On 2019/7/23 下午3:23, Michael S. Tsirkin wrote:
> > > > > > Really let's just use kfree_rcu. It's way cleaner: fire and forget.
> > > > > Looks not, you need rate limit the fire as you've figured out?
> > > > See the discussion that followed. Basically no, it's good enough
> > > > already and is only going to be better.
> > > > 
> > > > > And in fact,
> > > > > the synchronization is not even needed, does it help if I leave a comment to
> > > > > explain?
> > > > Let's try to figure it out in the mail first. I'm pretty sure the
> > > > current logic is wrong.
> > > 
> > > Here is what the code what to achieve:
> > > 
> > > - The map was protected by RCU
> > > 
> > > - Writers are: MMU notifier invalidation callbacks, file operations (ioctls
> > > etc), meta_prefetch (datapath)
> > > 
> > > - Readers are: memory accessor
> > > 
> > > Writer are synchronized through mmu_lock. RCU is used to synchronized
> > > between writers and readers.
> > > 
> > > The synchronize_rcu() in vhost_reset_vq_maps() was used to synchronized it
> > > with readers (memory accessors) in the path of file operations. But in this
> > > case, vq->mutex was already held, this means it has been serialized with
> > > memory accessor. That's why I think it could be removed safely.
> > > 
> > > Anything I miss here?
> > > 
> > So invalidate callbacks need to reset the map, and they do
> > not have vq mutex. How can they do this and free
> > the map safely? They need synchronize_rcu or kfree_rcu right?
> 
> 
> Invalidation callbacks need but file operations (e.g ioctl) not.
> 
> 
> > 
> > And I worry somewhat that synchronize_rcu in an MMU notifier
> > is a problem, MMU notifiers are supposed to be quick:
> 
> 
> Looks not, since it can allow to be blocked and lots of driver depends on
> this. (E.g mmu_notifier_range_blockable()).

Right, they can block. So why don't we take a VQ mutex and be
done with it then? No RCU tricks.

> 
> > they are on a read side critical section of SRCU.
> > 
> > If we could get rid of RCU that would be even better.
> > 
> > But now I wonder:
> > 	invalidate_start has to mark page as dirty
> > 	(this is what my patch added, current code misses this).
> 
> 
> Nope, current code did this but not the case when map need to be invalidated
> in the vhost control path (ioctl etc).
> 
> 
> > 
> > 	at that point kernel can come and make the page clean again.
> > 
> > 	At that point VQ handlers can keep a copy of the map
> > 	and change the page again.
> 
> 
> We will increase invalidate_count which prevent the page being used by map.
> 
> Thanks

OK I think I got it, thanks!


> 
> > 
> > 
> > At this point I don't understand how we can mark page dirty
> > safely.
> > 
> > > > > > > Btw, for kvm ioctl it still uses synchronize_rcu() in kvm_vcpu_ioctl(),
> > > > > > > (just a little bit more hard to trigger):
> > > > > > AFAIK these never run in response to guest events.
> > > > > > So they can take very long and guests still won't crash.
> > > > > What if guest manages to escape to qemu?
> > > > > 
> > > > > Thanks
> > > > Then it's going to be slow. Why do we care?
> > > > What we do not want is synchronize_rcu that guest is blocked on.
> > > > 
> > > Ok, this looks like that I have some misunderstanding here of the reason why
> > > synchronize_rcu() is not preferable in the path of ioctl. But in kvm case,
> > > if rcu_expedited is set, it can triggers IPIs AFAIK.
> > > 
> > > Thanks
> > > 
> > Yes, expedited is not good for something guest can trigger.
> > Let's just use kfree_rcu if we can. Paul said even though
> > documentation still says it needs to be rate-limited, that
> > part is basically stale and will get updated.
> > 
