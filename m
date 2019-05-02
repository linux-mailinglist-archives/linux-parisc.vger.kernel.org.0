Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A381212A
	for <lists+linux-parisc@lfdr.de>; Thu,  2 May 2019 19:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfEBRkx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 2 May 2019 13:40:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39470 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbfEBRkx (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 May 2019 13:40:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EF3C9859FF;
        Thu,  2 May 2019 17:40:52 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B52BE5C224;
        Thu,  2 May 2019 17:40:52 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x42HeqHn032643;
        Thu, 2 May 2019 13:40:52 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x42Hept6032639;
        Thu, 2 May 2019 13:40:52 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 2 May 2019 13:40:51 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH][RFC] parisc: Use per-pagetable spinlock (v2)
In-Reply-To: <a98ef81b-cd8e-b81d-df24-8c508e8a01b0@gmx.de>
Message-ID: <alpine.LRH.2.02.1905021340230.32620@file01.intranet.prod.int.rdu2.redhat.com>
References: <20190428173431.GA21286@ls3530.dellerweb.de> <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com> <383ae5f2-cfa9-784f-2f19-8bcc5ade53a4@gmx.de> <alpine.LRH.2.02.1905011219190.27284@file01.intranet.prod.int.rdu2.redhat.com>
 <7dfcef75-193f-6373-92f3-f448c59bba63@bell.net> <alpine.LRH.2.02.1905020920560.18084@file01.intranet.prod.int.rdu2.redhat.com> <3595abed-26ea-9aff-60ef-e0893bf07af2@bell.net> <a98ef81b-cd8e-b81d-df24-8c508e8a01b0@gmx.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="185206533-572099765-1556818852=:32620"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 02 May 2019 17:40:53 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185206533-572099765-1556818852=:32620
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 2 May 2019, Helge Deller wrote:

> On 02.05.19 16:34, John David Anglin wrote:
> > On 2019-05-02 9:43 a.m., Mikulas Patocka wrote:
> >> My obeservation is:
> >>
> >> CONFIG_FLATMEM_MANUAL=y - doesn't compile. With the Helge's patch, it
> >> compiles and works - but it only sees the first 1GiB of memory.
> > I didn't test FLATMEM.
> 
> It should compile now if you check out the for-next branch again.
> And it only sees 1GiB of memory, which is correct for FLATMEM.
> Instead it tells you to turn on CONFIG_SPARSEMEM:
> 
> [0.000000] Large gap in memory detected (786432 pages). Consider turning on CONFIG_SPARSEMEM
> [0.000000] Memory Ranges:
> [0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
> [0.000000] Total Memory: 1024 MB
> ..
> 
> >> CONFIG_SPARSEMEM_MANUAL=y, CONFIG_SPARSEMEM_VMEMMAP=n - works.
> >> CONFIG_SPARSEMEM_MANUAL=y, CONFIG_SPARSEMEM_VMEMMAP=y - hangs on boot.
> > I thought I selected CONFIG_SPARSEMEM_VMEMMAP but will check.  Have multiple
> > builds with original SPARSEMEM patch that were okay.
> 
> It sometimes hung for me too.
> I think my VMEMMAP patch overwrites other memory and thus only sometimes crashes the machine...
> 
> By the way, I've rebased my for-next tree, fixed a few small issues and dropped the VMEMMAP patch for now.
> Please give it a new try:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next

OK. I confirm that this branch works.

Mikulas

> In addition I addded a for-next-testing branch for further testing of the remaining patches (VMEMMAP, JUMP_LABEL, ...).
> 
> Helge
> 
--185206533-572099765-1556818852=:32620--
