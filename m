Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5F4110E0
	for <lists+linux-parisc@lfdr.de>; Thu,  2 May 2019 03:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfEBB1h (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 May 2019 21:27:37 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:50286 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726166AbfEBB1h (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 May 2019 21:27:37 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190502012735.LLJP4584.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 1 May 2019 21:27:35 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm01.bell.net
          with ESMTP
          id <20190502012735.VKWU39285.torspm01.bell.net@[192.168.2.49]>;
          Wed, 1 May 2019 21:27:35 -0400
Subject: Re: [PATCH][RFC] parisc: Use per-pagetable spinlock (v2)
To:     Mikulas Patocka <mpatocka@redhat.com>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
References: <20190428173431.GA21286@ls3530.dellerweb.de>
 <alpine.LRH.2.02.1905011021300.6862@file01.intranet.prod.int.rdu2.redhat.com>
 <383ae5f2-cfa9-784f-2f19-8bcc5ade53a4@gmx.de>
 <alpine.LRH.2.02.1905011219190.27284@file01.intranet.prod.int.rdu2.redhat.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <7dfcef75-193f-6373-92f3-f448c59bba63@bell.net>
Date:   Wed, 1 May 2019 21:27:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1905011219190.27284@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=VwQbUJbxAAAA:8 a=FBHGMhGWAAAA:8 a=relEtQ-KctroQuzq6YUA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfCc4P85qyxBxZRmbLnEI8O5zjq51gZlJvNIlTLI1YoRAIIlefg5rBiqxBDkfIQwS9I6vzIO73lVf86xYNA34rWI4fp+TGMbTZQqHfApqxNL26QPZxI7t TOcONJWk44KdT1lywN5Tl0phxSfbGZa66Za4NQEdzWexPlcruSOUqVa1DDd3EmJGG+1oneOewC3iIw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-01 12:21 p.m., Mikulas Patocka wrote:
> On Wed, 1 May 2019, Helge Deller wrote:
>
>> Hi Mikulas,
>>
>> On 01.05.19 16:22, Mikulas Patocka wrote:
>>> I tested it on C8000 and confim that it works.
>> Thanks for testing!
>>
>> By the way, I made you the author of the patch in git:
>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=f1abe94b271807902d5b286c7216b812645713e2
>>
>> In general, there are so many new cool features and patches pending
>> in the for-next tree, so I appreciate every kind of testing:
>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next
>>
>> Helge
> The new kernel hangs on boot here:
My c8000 booted okay using above tree.

Dave

-- 
John David Anglin  dave.anglin@bell.net

