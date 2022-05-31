Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98136539344
	for <lists+linux-parisc@lfdr.de>; Tue, 31 May 2022 16:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236615AbiEaOpO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 May 2022 10:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345276AbiEaOpA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 May 2022 10:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3D47B7674
        for <linux-parisc@vger.kernel.org>; Tue, 31 May 2022 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654008298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=e7Wd1fLGY4/cUMkP8Jdtk+ZTP85m42P3zThFQwXSLns=;
        b=ZXaTvAG2iS0Z/jgNoxBBD1/XXXg76MNO7jLCj+Sk7VI8jmxB/iGgYrScIYDuuei57Wb2yI
        W+hLtSQ927Ts+qBtG6FJkRN+tuO2+vcQ5V4A9XsBSLvBx73jMBOmwG88W4YozpWNXB1ytj
        5u0XXd4ogzLzEVgOfP2vxagvSlFbCj0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-EtppGpmdPtWDKAMZgdB-yw-1; Tue, 31 May 2022 10:44:54 -0400
X-MC-Unique: EtppGpmdPtWDKAMZgdB-yw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90EE6803B22;
        Tue, 31 May 2022 14:44:54 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 85E5B492C3B;
        Tue, 31 May 2022 14:44:54 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 24VEiswP005215;
        Tue, 31 May 2022 10:44:54 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 24VEisuu005211;
        Tue, 31 May 2022 10:44:54 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Tue, 31 May 2022 10:44:54 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: non-booting kernel caused by "parisc: Switch from GENERIC_CPU_DEVICES
 to GENERIC_ARCH_TOPOLOGY"
In-Reply-To: <alpine.LRH.2.02.2205310832260.16547@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2205311035450.1173@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2205310542460.5691@file01.intranet.prod.int.rdu2.redhat.com> <4dcb485a-d0ae-9c49-5bd2-43327e930ee5@gmx.de> <alpine.LRH.2.02.2205310832260.16547@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Tue, 31 May 2022, Mikulas Patocka wrote:

> > So, right now I'm somehow lost how I can help.
> 
> If you don't know what causes it, I can try to add some debug printks into 
> the kernel and analyze it when I have time.
> 
> > You could you send me your .config, then I'll check locally.
> > Please also try a "make oldconfig" with your .config so that the options don't have any leftovers.
> 
> I uploaded my config here: 
> https://people.redhat.com/~mpatocka/testcases/parisc-config-5.18.txt

CONFIG_SCHED_MC is causing it. It's on in my config, off in your config. 
If I turn it off, the crash goes away.

The crash happens in "sd_init":

sd_span = sched_domain_span(sd);	sets sd_span to an empty cpumask.
sd_id = cpumask_first(sd_span);		sets sd_id to 4 (it is out of 
					range because CONFIG_NR_CPUS=4)
sd->shared = *per_cpu_ptr(sdd->sds, sd_id);  sets sd->shared to NULL
atomic_inc(&sd->shared->ref);		crashes without printing anything

Mikulas

