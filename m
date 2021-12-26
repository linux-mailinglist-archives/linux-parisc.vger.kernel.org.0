Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D84147F861
	for <lists+linux-parisc@lfdr.de>; Sun, 26 Dec 2021 18:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhLZRWS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 26 Dec 2021 12:22:18 -0500
Received: from mta-tor-003.bell.net ([209.71.212.30]:16304 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230484AbhLZRWR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 26 Dec 2021 12:22:17 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C7809F00121B61
X-CM-Envelope: MS4xfLD65poLiV36KJhJvtyPT7bscP2+WsXg2pSQftamVmdW7pCS8UJ0a4B9RlRiG1ehWK2WjC3KsQ9eo5LmOYL8ggeDbMs1qaSQKYIW6J/WkaA4k9GyVW9h
 P+6jTwA51mYFf3+Y+kUW6OP+BcUhGQQWsbNZc+rZY6FHUUHPeWQjfA7FB+cg1G09mke1TqSP7MaiazR9qL+ZFXk8hU9DwmC5FA9aSVRP+wQyo0UxdmKhvFQ6
 lQjx5HmcHUVHdSYneIj06aHPWHQlQBKt0QNNcsLBrIBA2g0Z8yoSfIxKq6xVrxcT
X-CM-Analysis: v=2.4 cv=W7Vb6Tak c=1 sm=1 tr=0 ts=61c8a4c3
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=KK8sOFBPj50ue7zwYMEA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C7809F00121B61; Sun, 26 Dec 2021 12:22:11 -0500
Message-ID: <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
Date:   Sun, 26 Dec 2021 12:22:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: pagefaults and hang with 5.15.11
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
> [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613 rcu_eqs_enter.constprop.0+0x8c/0x98
This is probably not reproducible. You might try this change from Sven

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index cf92ece20b75..0cd97fa004c5 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -228,11 +228,13 @@ static inline void
  send_IPI_allbutself(enum ipi_message_type op)
  {
         int i;
-
+
+       preempt_disable();
         for_each_online_cpu(i) {
                 if (i != smp_processor_id())
                         send_IPI_single(i, op);
         }
+       preempt_enable();
  }

  #ifdef CONFIG_KGDB

and my "[PATCH v3] parisc: Rewrite light-weight syscall and futex code" change. Page faults in the LWS code
can mess up scheduling.

I haven't found 5.15.11 to be stable.

Dave

-- 
John David Anglin  dave.anglin@bell.net

