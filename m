Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 760A011B8D
	for <lists+linux-parisc@lfdr.de>; Thu,  2 May 2019 16:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfEBOe4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Thu, 2 May 2019 10:34:56 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:34886 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726203AbfEBOez (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 May 2019 10:34:55 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190502143454.TFP4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 2 May 2019 10:34:54 -0400
Received: from [192.168.0.183] (really [64.231.94.175])
          by torspm02.bell.net with ESMTP
          id <20190502143454.XKTV30132.torspm02.bell.net@[192.168.0.183]>;
          Thu, 2 May 2019 10:34:54 -0400
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <20190428173431.GA21286@ls3530.dellerweb.de>
 <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com>
 <383ae5f2-cfa9-784f-2f19-8bcc5ade53a4@gmx.de>
 <alpine.LRH.2.02.1905011219190.27284@file01.intranet.prod.int.rdu2.redhat.com>
 <7dfcef75-193f-6373-92f3-f448c59bba63@bell.net>
 <alpine.LRH.2.02.1905020920560.18084@file01.intranet.prod.int.rdu2.redhat.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH][RFC] parisc: Use per-pagetable spinlock (v2)
Message-ID: <3595abed-26ea-9aff-60ef-e0893bf07af2@bell.net>
Date:   Thu, 2 May 2019 10:34:54 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1905020920560.18084@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_f a=BQ4/tlW0byS+YqYqK5JCyg==:117 a=BQ4/tlW0byS+YqYqK5JCyg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=XNbIrCaarcSnhPkpx9IA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfI1Km+qmLSqsJB4IfPQQVQU5jr1MZyDsdgj9zs2WGttxomXkEVNS0B0u5YE/JF252jibT9WBJNQuB2F/MVBClCjRfYwuCXyBOew1dIMkgJctI89/mfVv jx3EsrCc/v/2Gq+ptt+y/AQZLa6yRF4LX+FBI+DNm/TYvptHZSzfhqRBqbc7e77FOmSIU/pWokbeFw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-02 9:43 a.m., Mikulas Patocka wrote:
> My obeservation is:
>
> CONFIG_FLATMEM_MANUAL=y - doesn't compile. With the Helge's patch, it 
> compiles and works - but it only sees the first 1GiB of memory.
I didn't test FLATMEM.
>
> CONFIG_SPARSEMEM_MANUAL=y, CONFIG_SPARSEMEM_VMEMMAP=n - works.
> CONFIG_SPARSEMEM_MANUAL=y, CONFIG_SPARSEMEM_VMEMMAP=y - hangs on boot.
I thought I selected CONFIG_SPARSEMEM_VMEMMAP but will check.  Have multiple
builds with original SPARSEMEM patch that were okay.

Dave

-- 
John David Anglin  dave.anglin@bell.net


