Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3C311A6C
	for <lists+linux-parisc@lfdr.de>; Thu,  2 May 2019 15:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfEBNn1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 2 May 2019 09:43:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59850 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbfEBNn1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 May 2019 09:43:27 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id DFDDE7DCC4;
        Thu,  2 May 2019 13:43:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A6210027BA;
        Thu,  2 May 2019 13:43:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x42DhQHe021795;
        Thu, 2 May 2019 09:43:26 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x42DhPxi021791;
        Thu, 2 May 2019 09:43:26 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 2 May 2019 09:43:25 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     John David Anglin <dave.anglin@bell.net>
cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: [PATCH][RFC] parisc: Use per-pagetable spinlock (v2)
In-Reply-To: <7dfcef75-193f-6373-92f3-f448c59bba63@bell.net>
Message-ID: <alpine.LRH.2.02.1905020920560.18084@file01.intranet.prod.int.rdu2.redhat.com>
References: <20190428173431.GA21286@ls3530.dellerweb.de> <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com> <383ae5f2-cfa9-784f-2f19-8bcc5ade53a4@gmx.de> <alpine.LRH.2.02.1905011219190.27284@file01.intranet.prod.int.rdu2.redhat.com>
 <7dfcef75-193f-6373-92f3-f448c59bba63@bell.net>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <alpine.LRH.2.02.1905020938141.21087@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 02 May 2019 13:43:27 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Wed, 1 May 2019, John David Anglin wrote:

> On 2019-05-01 12:21 p.m., Mikulas Patocka wrote:
> > On Wed, 1 May 2019, Helge Deller wrote:
> >
> >> Hi Mikulas,
> >>
> >> On 01.05.19 16:22, Mikulas Patocka wrote:
> >>> I tested it on C8000 and confim that it works.
> >> Thanks for testing!
> >>
> >> By the way, I made you the author of the patch in git:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=f1abe94b271807902d5b286c7216b812645713e2
> >>
> >> In general, there are so many new cool features and patches pending
> >> in the for-next tree, so I appreciate every kind of testing:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next
> >>
> >> Helge
> > The new kernel hangs on boot here:
> My c8000 booted okay using above tree.
> 
> Dave

My obeservation is:

CONFIG_FLATMEM_MANUAL=y - doesn't compile. With the Helge's patch, it 
compiles and works - but it only sees the first 1GiB of memory.

CONFIG_SPARSEMEM_MANUAL=y, CONFIG_SPARSEMEM_VMEMMAP=n - works.
CONFIG_SPARSEMEM_MANUAL=y, CONFIG_SPARSEMEM_VMEMMAP=y - hangs on boot.

Mikulas
