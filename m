Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E189253C668
	for <lists+linux-parisc@lfdr.de>; Fri,  3 Jun 2022 09:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242509AbiFCHkd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 3 Jun 2022 03:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240948AbiFCHka (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 Jun 2022 03:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 39CD63630D
        for <linux-parisc@vger.kernel.org>; Fri,  3 Jun 2022 00:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654242028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eYjqkS3PHghhH041dR1/8tuiqCHdVdZdlqIsI00+zvE=;
        b=af6+CMelc6FZgdbEWHXVnJYrZdiZHD2u0SlmkbAXWT5sDnnwdBpvgKs5L/TQuxvLDP21nl
        fIycck5ujB/tI7NgounluANsJp+8UYHffrfOXkTTPpG0erzpqxwvS8LKUGgSpwoYQY1XaZ
        ornoU4JDlK/h3zlh1zHmrwaMGb3c6j4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-VInXxXJCMZmG0-4DoG13OA-1; Fri, 03 Jun 2022 03:40:24 -0400
X-MC-Unique: VInXxXJCMZmG0-4DoG13OA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61BF38117B0;
        Fri,  3 Jun 2022 07:40:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 55FE4492CA2;
        Fri,  3 Jun 2022 07:40:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 2537eOuC000330;
        Fri, 3 Jun 2022 03:40:24 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 2537eNXV000326;
        Fri, 3 Jun 2022 03:40:24 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Fri, 3 Jun 2022 03:40:23 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH v2] parisc: fix a crash with multicore scheduler
In-Reply-To: <bbb8bd99-195f-6f7e-a4a6-277734dffd28@gmx.de>
Message-ID: <alpine.LRH.2.02.2206030335260.31673@file01.intranet.prod.int.rdu2.redhat.com>
References: <YpZYPokZr9s4uwtt@p100> <alpine.LRH.2.02.2206010911370.15916@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2206011053050.20771@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2206011146110.23169@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2206011316440.25830@file01.intranet.prod.int.rdu2.redhat.com> <bbb8bd99-195f-6f7e-a4a6-277734dffd28@gmx.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Thu, 2 Jun 2022, Helge Deller wrote:

> Hi Mikulas,
> 
> Thanks a lot !!!
> 
> It took me some time to test it, but it looks good and boots on
> all of my machines so far. I was curious if 32-bit kernels still
> work since that was one of the issues with the older patches...
> 
> With your patch we can drop the "config SCHED_MC" entry from
> arch/parisc/Kconfig as well.
> Will you respin, or should I simply add this to your patch?
> 
> Helge

I think that we don't have to drop "config SCHED_MC". It is used in 
kernel/sched/topology.c to select the multicore-aware scheduler. There is 
no reason why the multicore scheduler would not work on parisc.

Mikulas

