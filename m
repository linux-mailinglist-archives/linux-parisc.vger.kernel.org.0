Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD53538F2E
	for <lists+linux-parisc@lfdr.de>; Tue, 31 May 2022 12:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239301AbiEaKnr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 May 2022 06:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237727AbiEaKnq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 May 2022 06:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E89533A11
        for <linux-parisc@vger.kernel.org>; Tue, 31 May 2022 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653993824;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=v4hZFguzretBwFfbHVJ7QiWD8cRqyvmyeP5r68GSuKU=;
        b=NNFQP62tNKKTGTSxJuiA48xu94s+NsRCOXCSSBlJRvMe3OM06WLoBaxY0/SXvJQavmj21r
        EWPANN0hqS46yNd/uVFp6ob75gzVTZuLJ+AmH5m18IhAFmXvoh0o2FJ6eR+ifezFN9oQpE
        kkNhCw6VUY0ocNRbGbBTuRB4DuvqNcs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-kuXuWoFKN7SUVdXHyIFiKQ-1; Tue, 31 May 2022 06:43:40 -0400
X-MC-Unique: kuXuWoFKN7SUVdXHyIFiKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18DAB2809CB0;
        Tue, 31 May 2022 10:43:40 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D56D1121314;
        Tue, 31 May 2022 10:43:40 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 24VAheBC008672;
        Tue, 31 May 2022 06:43:40 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 24VAhdUS008669;
        Tue, 31 May 2022 06:43:39 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Tue, 31 May 2022 06:43:39 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: non-booting kernel caused by "parisc: Switch from GENERIC_CPU_DEVICES
 to GENERIC_ARCH_TOPOLOGY"
Message-ID: <alpine.LRH.2.02.2205310542460.5691@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi

The kernel 5.18 doesn't boot on my C8000 with two dual-core CPUs. It hangs 
at this point:

[    0.000000] NR_IRQS: 80
[    0.000002] sched_clock: 64 bits at 1000MHz, resolution 1ns, wraps every 4398046511103ns
[    0.107049] Console: colour dummy device 160x64
[    0.166791] Calibrating delay loop... 1991.60 BogoMIPS (lpj=3317760)
[    0.270079] pid_max: default: 32768 minimum: 301
[    0.330158] random: get_random_bytes called from net_ns_init+0x118/0x4c8 with crng_init=0
[    0.330394] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.536892] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.644729] cblist_init_generic: Setting adjustable number of callback queues.
[    0.740083] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.820179] TOC handler registered
[    0.866852] rcu: Hierarchical SRCU implementation.
[    0.930550] smp: Bringing up secondary CPUs ...
[    0.990084] smp: Brought up 1 node, 1 CPU

I bisected it and it is caused by the commit 
62773112acc55d29727465d075fc61ed08a0a532 ("parisc: Switch from 
GENERIC_CPU_DEVICES to GENERIC_ARCH_TOPOLOGY")

When I revert this patch on the kernel 5.18 (and resolve several 
conflcits), the kernel boots.

Mikulas

