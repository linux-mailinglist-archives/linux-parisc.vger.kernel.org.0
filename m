Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A9E7849E
	for <lists+linux-parisc@lfdr.de>; Mon, 29 Jul 2019 07:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfG2FzD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 29 Jul 2019 01:55:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43666 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbfG2FzD (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 29 Jul 2019 01:55:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3B5AF30BD1C0;
        Mon, 29 Jul 2019 05:55:02 +0000 (UTC)
Received: from [10.72.12.53] (ovpn-12-53.pek2.redhat.com [10.72.12.53])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3C5D55D9C3;
        Mon, 29 Jul 2019 05:54:50 +0000 (UTC)
Subject: Re: WARNING in __mmdrop
To:     "Michael S. Tsirkin" <mst@redhat.com>
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
References: <55e8930c-2695-365f-a07b-3ad169654d28@redhat.com>
 <20190725042651-mutt-send-email-mst@kernel.org>
 <84bb2e31-0606-adff-cf2a-e1878225a847@redhat.com>
 <20190725092332-mutt-send-email-mst@kernel.org>
 <11802a8a-ce41-f427-63d5-b6a4cf96bb3f@redhat.com>
 <20190726074644-mutt-send-email-mst@kernel.org>
 <5cc94f15-b229-a290-55f3-8295266edb2b@redhat.com>
 <20190726082837-mutt-send-email-mst@kernel.org>
 <ada10dc9-6cab-e189-5289-6f9d3ff8fed2@redhat.com>
 <aaefa93e-a0de-1c55-feb0-509c87aae1f3@redhat.com>
 <20190726094756-mutt-send-email-mst@kernel.org>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <0792ee09-b4b7-673c-2251-e5e0ce0fbe32@redhat.com>
Date:   Mon, 29 Jul 2019 13:54:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726094756-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 29 Jul 2019 05:55:02 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


On 2019/7/26 下午9:49, Michael S. Tsirkin wrote:
>>> Ok, let me retry if necessary (but I do remember I end up with deadlocks
>>> last try).
>> Ok, I play a little with this. And it works so far. Will do more testing
>> tomorrow.
>>
>> One reason could be I switch to use get_user_pages_fast() to
>> __get_user_pages_fast() which doesn't need mmap_sem.
>>
>> Thanks
> OK that sounds good. If we also set a flag to make
> vhost_exceeds_weight exit, then I think it will be all good.


After some experiments, I came up two methods:

1) switch to use vq->mutex, then we must take the vq lock during range 
checking (but I don't see obvious slowdown for 16vcpus + 16queues). 
Setting flags during weight check should work but it still can't address 
the worst case: wait for the page to be swapped in. Is this acceptable?

2) using current RCU but replace synchronize_rcu() with 
vhost_work_flush(). The worst case is the same as 1) but we can check 
range without holding any locks.

Which one did you prefer?

Thanks

