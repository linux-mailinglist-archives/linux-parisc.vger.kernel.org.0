Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA4A66F32E
	for <lists+linux-parisc@lfdr.de>; Sun, 21 Jul 2019 14:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfGUMTJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 21 Jul 2019 08:19:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47868 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726188AbfGUMTJ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 21 Jul 2019 08:19:09 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 24D1E308425C;
        Sun, 21 Jul 2019 12:19:08 +0000 (UTC)
Received: from redhat.com (ovpn-120-23.rdu2.redhat.com [10.10.120.23])
        by smtp.corp.redhat.com (Postfix) with SMTP id DAFF01001DE1;
        Sun, 21 Jul 2019 12:18:59 +0000 (UTC)
Date:   Sun, 21 Jul 2019 08:18:58 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     syzbot <syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com>
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
Subject: Re: WARNING in __mmdrop
Message-ID: <20190721081447-mutt-send-email-mst@kernel.org>
References: <0000000000008dd6bb058e006938@google.com>
 <000000000000964b0d058e1a0483@google.com>
 <20190721044615-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190721044615-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sun, 21 Jul 2019 12:19:08 +0000 (UTC)
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
> 
> 
> 1. mmu_notifier_register shouldn't be called from vhost_vring_set_num_addr
>    That's just a bad hack, in particular I don't think device
>    mutex is taken and so poking at two VQs will corrupt
>    memory.
>    So what to do? How about a per vq notifier?
>    Of course we also have synchronize_rcu
>    in the notifier which is slow and is now going to be called twice.
>    I think call_rcu would be more appropriate here.
>    We then need rcu_barrier on module unload.
>    OTOH if we make pages linear with map then we are good
>    with kfree_rcu which is even nicer.
> 
> 2. Doesn't map leak after vhost_map_unprefetch?
>    And why does it poke at contents of the map?
>    No one should use it right?
> 
> 3. notifier unregister happens last in vhost_dev_cleanup,
>    but register happens first. This looks wrong to me.
> 
> 4. OK so we use the invalidate count to try and detect that
>    some invalidate is in progress.
>    I am not 100% sure why do we care.
>    Assuming we do, uaddr can change between start and end
>    and then the counter can get negative, or generally
>    out of sync.
> 
> So what to do about all this?
> I am inclined to say let's just drop the uaddr optimization
> for now. E.g. kvm invalidates unconditionally.
> 3 should be fixed independently.


Above implements this but is only build-tested.
Jason, pls take a look. If you like the approach feel
free to take it from here.

One thing the below does not have is any kind of rate-limiting.
Given it's so easy to restart I'm thinking it makes sense
to add a generic infrastructure for this.
Can be a separate patch I guess.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 0536f8526359..1d89715af89d 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -299,53 +299,30 @@ static void vhost_vq_meta_reset(struct vhost_dev *d)
 }
 
 #if VHOST_ARCH_CAN_ACCEL_UACCESS
-static void vhost_map_unprefetch(struct vhost_map *map)
-{
-	kfree(map->pages);
-	map->pages = NULL;
-	map->npages = 0;
-	map->addr = NULL;
-}
-
-static void vhost_uninit_vq_maps(struct vhost_virtqueue *vq)
+static void __vhost_cleanup_vq_maps(struct vhost_virtqueue *vq)
 {
 	struct vhost_map *map[VHOST_NUM_ADDRS];
 	int i;
 
-	spin_lock(&vq->mmu_lock);
 	for (i = 0; i < VHOST_NUM_ADDRS; i++) {
 		map[i] = rcu_dereference_protected(vq->maps[i],
 				  lockdep_is_held(&vq->mmu_lock));
-		if (map[i])
+		if (map[i]) {
+			if (vq->uaddrs[i].write) {
+				for (i = 0; i < map[i]->npages; i++)
+					set_page_dirty(map[i]->pages[i]);
+			}
 			rcu_assign_pointer(vq->maps[i], NULL);
+			kfree_rcu(map[i], head);
+		}
 	}
+}
+
+static void vhost_cleanup_vq_maps(struct vhost_virtqueue *vq)
+{
+	spin_lock(&vq->mmu_lock);
+	__vhost_cleanup_vq_maps(vq);
 	spin_unlock(&vq->mmu_lock);
-
-	synchronize_rcu();
-
-	for (i = 0; i < VHOST_NUM_ADDRS; i++)
-		if (map[i])
-			vhost_map_unprefetch(map[i]);
-
-}
-
-static void vhost_reset_vq_maps(struct vhost_virtqueue *vq)
-{
-	int i;
-
-	vhost_uninit_vq_maps(vq);
-	for (i = 0; i < VHOST_NUM_ADDRS; i++)
-		vq->uaddrs[i].size = 0;
-}
-
-static bool vhost_map_range_overlap(struct vhost_uaddr *uaddr,
-				     unsigned long start,
-				     unsigned long end)
-{
-	if (unlikely(!uaddr->size))
-		return false;
-
-	return !(end < uaddr->uaddr || start > uaddr->uaddr - 1 + uaddr->size);
 }
 
 static void vhost_invalidate_vq_start(struct vhost_virtqueue *vq,
@@ -353,31 +330,11 @@ static void vhost_invalidate_vq_start(struct vhost_virtqueue *vq,
 				      unsigned long start,
 				      unsigned long end)
 {
-	struct vhost_uaddr *uaddr = &vq->uaddrs[index];
-	struct vhost_map *map;
-	int i;
-
-	if (!vhost_map_range_overlap(uaddr, start, end))
-		return;
-
 	spin_lock(&vq->mmu_lock);
 	++vq->invalidate_count;
 
-	map = rcu_dereference_protected(vq->maps[index],
-					lockdep_is_held(&vq->mmu_lock));
-	if (map) {
-		if (uaddr->write) {
-			for (i = 0; i < map->npages; i++)
-				set_page_dirty(map->pages[i]);
-		}
-		rcu_assign_pointer(vq->maps[index], NULL);
-	}
+	__vhost_cleanup_vq_maps(vq);
 	spin_unlock(&vq->mmu_lock);
-
-	if (map) {
-		synchronize_rcu();
-		vhost_map_unprefetch(map);
-	}
 }
 
 static void vhost_invalidate_vq_end(struct vhost_virtqueue *vq,
@@ -385,9 +342,6 @@ static void vhost_invalidate_vq_end(struct vhost_virtqueue *vq,
 				    unsigned long start,
 				    unsigned long end)
 {
-	if (!vhost_map_range_overlap(&vq->uaddrs[index], start, end))
-		return;
-
 	spin_lock(&vq->mmu_lock);
 	--vq->invalidate_count;
 	spin_unlock(&vq->mmu_lock);
@@ -483,7 +437,7 @@ static void vhost_vq_reset(struct vhost_dev *dev,
 	vq->invalidate_count = 0;
 	__vhost_vq_meta_reset(vq);
 #if VHOST_ARCH_CAN_ACCEL_UACCESS
-	vhost_reset_vq_maps(vq);
+	vhost_cleanup_vq_maps(vq);
 #endif
 }
 
@@ -833,6 +787,7 @@ static void vhost_setup_uaddr(struct vhost_virtqueue *vq,
 			      size_t size, bool write)
 {
 	struct vhost_uaddr *addr = &vq->uaddrs[index];
+	spin_lock(&vq->mmu_lock);
 
 	addr->uaddr = uaddr;
 	addr->size = size;
@@ -841,6 +796,8 @@ static void vhost_setup_uaddr(struct vhost_virtqueue *vq,
 
 static void vhost_setup_vq_uaddr(struct vhost_virtqueue *vq)
 {
+	spin_lock(&vq->mmu_lock);
+
 	vhost_setup_uaddr(vq, VHOST_ADDR_DESC,
 			  (unsigned long)vq->desc,
 			  vhost_get_desc_size(vq, vq->num),
@@ -853,6 +810,8 @@ static void vhost_setup_vq_uaddr(struct vhost_virtqueue *vq)
 			  (unsigned long)vq->used,
 			  vhost_get_used_size(vq, vq->num),
 			  true);
+
+	spin_unlock(&vq->mmu_lock);
 }
 
 static int vhost_map_prefetch(struct vhost_virtqueue *vq,
@@ -874,13 +833,11 @@ static int vhost_map_prefetch(struct vhost_virtqueue *vq,
 		goto err;
 
 	err = -ENOMEM;
-	map = kmalloc(sizeof(*map), GFP_ATOMIC);
+	map = kmalloc(sizeof(*map) + sizeof(*map->pages) * npages, GFP_ATOMIC);
 	if (!map)
 		goto err;
 
-	pages = kmalloc_array(npages, sizeof(struct page *), GFP_ATOMIC);
-	if (!pages)
-		goto err_pages;
+	pages = map->pages;
 
 	err = EFAULT;
 	npinned = __get_user_pages_fast(uaddr->uaddr, npages,
@@ -907,7 +864,6 @@ static int vhost_map_prefetch(struct vhost_virtqueue *vq,
 
 	map->addr = vaddr + (uaddr->uaddr & (PAGE_SIZE - 1));
 	map->npages = npages;
-	map->pages = pages;
 
 	rcu_assign_pointer(vq->maps[index], map);
 	/* No need for a synchronize_rcu(). This function should be
@@ -919,8 +875,6 @@ static int vhost_map_prefetch(struct vhost_virtqueue *vq,
 	return 0;
 
 err_gup:
-	kfree(pages);
-err_pages:
 	kfree(map);
 err:
 	spin_unlock(&vq->mmu_lock);
@@ -942,6 +896,10 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
 		vhost_vq_reset(dev, dev->vqs[i]);
 	}
 	vhost_dev_free_iovecs(dev);
+#if VHOST_ARCH_CAN_ACCEL_UACCESS
+	if (dev->mm)
+		mmu_notifier_unregister(&dev->mmu_notifier, dev->mm);
+#endif
 	if (dev->log_ctx)
 		eventfd_ctx_put(dev->log_ctx);
 	dev->log_ctx = NULL;
@@ -957,16 +915,8 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
 		kthread_stop(dev->worker);
 		dev->worker = NULL;
 	}
-	if (dev->mm) {
-#if VHOST_ARCH_CAN_ACCEL_UACCESS
-		mmu_notifier_unregister(&dev->mmu_notifier, dev->mm);
-#endif
+	if (dev->mm)
 		mmput(dev->mm);
-	}
-#if VHOST_ARCH_CAN_ACCEL_UACCESS
-	for (i = 0; i < dev->nvqs; i++)
-		vhost_uninit_vq_maps(dev->vqs[i]);
-#endif
 	dev->mm = NULL;
 }
 EXPORT_SYMBOL_GPL(vhost_dev_cleanup);
@@ -1426,7 +1376,7 @@ static inline int vhost_get_used_event(struct vhost_virtqueue *vq,
 		map = rcu_dereference(vq->maps[VHOST_ADDR_AVAIL]);
 		if (likely(map)) {
 			avail = map->addr;
-			*event = (__virtio16)avail->ring[vq->num];
+			*event = avail->ring[vq->num];
 			rcu_read_unlock();
 			return 0;
 		}
@@ -1830,6 +1780,8 @@ static void vhost_vq_map_prefetch(struct vhost_virtqueue *vq)
 	struct vhost_map __rcu *map;
 	int i;
 
+	vhost_setup_vq_uaddr(vq);
+
 	for (i = 0; i < VHOST_NUM_ADDRS; i++) {
 		rcu_read_lock();
 		map = rcu_dereference(vq->maps[i]);
@@ -1838,6 +1790,10 @@ static void vhost_vq_map_prefetch(struct vhost_virtqueue *vq)
 			vhost_map_prefetch(vq, i);
 	}
 }
+#else
+static void vhost_vq_map_prefetch(struct vhost_virtqueue *vq)
+{
+}
 #endif
 
 int vq_meta_prefetch(struct vhost_virtqueue *vq)
@@ -1845,9 +1801,7 @@ int vq_meta_prefetch(struct vhost_virtqueue *vq)
 	unsigned int num = vq->num;
 
 	if (!vq->iotlb) {
-#if VHOST_ARCH_CAN_ACCEL_UACCESS
 		vhost_vq_map_prefetch(vq);
-#endif
 		return 1;
 	}
 
@@ -2060,16 +2014,6 @@ static long vhost_vring_set_num_addr(struct vhost_dev *d,
 
 	mutex_lock(&vq->mutex);
 
-#if VHOST_ARCH_CAN_ACCEL_UACCESS
-	/* Unregister MMU notifer to allow invalidation callback
-	 * can access vq->uaddrs[] without holding a lock.
-	 */
-	if (d->mm)
-		mmu_notifier_unregister(&d->mmu_notifier, d->mm);
-
-	vhost_uninit_vq_maps(vq);
-#endif
-
 	switch (ioctl) {
 	case VHOST_SET_VRING_NUM:
 		r = vhost_vring_set_num(d, vq, argp);
@@ -2081,13 +2025,6 @@ static long vhost_vring_set_num_addr(struct vhost_dev *d,
 		BUG();
 	}
 
-#if VHOST_ARCH_CAN_ACCEL_UACCESS
-	vhost_setup_vq_uaddr(vq);
-
-	if (d->mm)
-		mmu_notifier_register(&d->mmu_notifier, d->mm);
-#endif
-
 	mutex_unlock(&vq->mutex);
 
 	return r;
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 819296332913..584bb13c4d6d 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -86,7 +86,8 @@ enum vhost_uaddr_type {
 struct vhost_map {
 	int npages;
 	void *addr;
-	struct page **pages;
+	struct rcu_head head;
+	struct page *pages[];
 };
 
 struct vhost_uaddr {
