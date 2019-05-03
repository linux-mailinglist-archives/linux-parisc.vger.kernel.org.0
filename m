Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19DE412D02
	for <lists+linux-parisc@lfdr.de>; Fri,  3 May 2019 13:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbfECL6Y (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 3 May 2019 07:58:24 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:45072 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726572AbfECL6Y (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 May 2019 07:58:24 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190503115822.NHNJ4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Fri, 3 May 2019 07:58:22 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm02.bell.net
          with ESMTP
          id <20190503115822.DJVT30132.torspm02.bell.net@[192.168.2.49]>;
          Fri, 3 May 2019 07:58:22 -0400
Subject: Re: [PATCH][RFC] parisc: Use per-pagetable spinlock (v2)
To:     Helge Deller <deller@gmx.de>, Mikulas Patocka <mpatocka@redhat.com>
Cc:     linux-parisc@vger.kernel.org
References: <20190428173431.GA21286@ls3530.dellerweb.de>
 <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com>
 <383ae5f2-cfa9-784f-2f19-8bcc5ade53a4@gmx.de>
 <alpine.LRH.2.02.1905011219190.27284@file01.intranet.prod.int.rdu2.redhat.com>
 <7dfcef75-193f-6373-92f3-f448c59bba63@bell.net>
 <alpine.LRH.2.02.1905020920560.18084@file01.intranet.prod.int.rdu2.redhat.com>
 <3595abed-26ea-9aff-60ef-e0893bf07af2@bell.net>
 <a98ef81b-cd8e-b81d-df24-8c508e8a01b0@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <e8e6f1f8-3bb0-f0d0-4f0d-1389c01540de@bell.net>
Date:   Fri, 3 May 2019 07:58:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a98ef81b-cd8e-b81d-df24-8c508e8a01b0@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=VwQbUJbxAAAA:8 a=FBHGMhGWAAAA:8 a=9Kr7OL3ZB8381MmquFkA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfHWNEe50ixltjEMOlep5cSVkSdo6anQZqMkWXYcYrCgW+P49s+Cgya6ZSBi5MgUGmugQyATqtl0Qb/lPFq3dQG2b9w0O2ADA2TGwFNyr9+GD5T3vKyNj KxXgMaqi8JWe5xWEjMxGJzCk/VKYfVPdNhpPAAV2QZ+bExW1tvp1nDJ07PxW3USRel9QpxZMbtLQsQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-02 12:14 p.m., Helge Deller wrote:
>>> CONFIG_SPARSEMEM_MANUAL=y, CONFIG_SPARSEMEM_VMEMMAP=n - works.
>>> CONFIG_SPARSEMEM_MANUAL=y, CONFIG_SPARSEMEM_VMEMMAP=y - hangs on boot.
>> I thought I selected CONFIG_SPARSEMEM_VMEMMAP but will check.  Have multiple
>> builds with original SPARSEMEM patch that were okay.
> It sometimes hung for me too.
> I think my VMEMMAP patch overwrites other memory and thus only sometimes crashes the machine...
>
> By the way, I've rebased my for-next tree, fixed a few small issues and dropped the VMEMMAP patch for now.
> Please give it a new try:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next
I had selected CONFIG_SPARSEMEM_VMEMMAP=y.  My c8000 seemed to cold boot okay.  But
I built the above rebased tree using the CONFIG_SPARSEMEM_VMEMMAP=y kernel.  The new kernel
failed to boot when I tried to reboot.  It did boot boot okay when I tried a cold reboot with console
connected.

I then rebuilt the above tree, installed it and it booted okay.  So, I tend to think the memory corruption (?)
carries across a hot reboot.

Dave

-- 
John David Anglin  dave.anglin@bell.net

