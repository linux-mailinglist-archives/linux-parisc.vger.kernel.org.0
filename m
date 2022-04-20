Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED15507D78
	for <lists+linux-parisc@lfdr.de>; Wed, 20 Apr 2022 02:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235851AbiDTAOd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Apr 2022 20:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiDTAOd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Apr 2022 20:14:33 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-001.bell.net [209.71.208.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD85811168
        for <linux-parisc@vger.kernel.org>; Tue, 19 Apr 2022 17:11:48 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 625E3C90001C281C
X-CM-Envelope: MS4xfK796r1e/cIsS19yE3Gh6TteSldO7Kq7QMd5laje6NO4RVU+ilIwGI3xTomuKVHRFcpIMHUDxO7F6cigIiQ/5TAkarV0tgrGGdEYKFKGyD+ZBDsd7Rbl
 OaXqmlgkhQURXNDqN1ZMJVbmAY2pSBoF1hmIKMc+0+VUgaD6vJby3GnxCzE4WlrmP1FvTucmyRCGXaTWo1+w5mWaxiH/0Dm2tZDawn6EUVzcwDyCJ9TDYZh2
 NOtMAs3pTmZ5XFHWXXL6LfVYBK29g07ksJcfse0ZJ1iA8mO740Fp0W5iGdVhe1bWuZQkGClNbTthuR/J3WHIMUuUeRSEKKg5H6zGSqKPRha4yi42yzWyA8c7
 QconCXzQ
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=625f4fba
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=QlFwIB6b5F7VdJFLFREA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 625E3C90001C281C; Tue, 19 Apr 2022 20:11:38 -0400
Message-ID: <d1fe607e-ee63-184d-4d47-7fd98dc0cd8e@bell.net>
Date:   Tue, 19 Apr 2022 20:11:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Sam James <sam@gentoo.org>
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
 <94439119-D2B6-4961-B61D-95784E09798D@gentoo.org>
 <cb19a0a0-69b2-ab14-7767-a0cd7bd671b0@bell.net>
 <383d6dfa-bef1-e56f-8f82-dfc0682cdacc@bell.net>
 <93BE3A28-6EBE-4DC4-92BE-867E7ACB255B@gentoo.org>
 <FD03A5C5-9B87-4117-9FFF-545E31668AD0@gentoo.org>
 <7a25a890-461b-0ba4-0b77-57d639de0007@bell.net>
 <137e0b6f4dcaceafeac4b1ecfa30e4249939028d.camel@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <137e0b6f4dcaceafeac4b1ecfa30e4249939028d.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-04-19 5:52 p.m., James Bottomley wrote:
> On Tue, 2022-04-19 at 17:29 -0400, John David Anglin wrote:
>>   We know that the PDC call to determine cache
>> characteristics indicates that the alias boundary on PA8800/PA8900 is
>> larger than 16 MB.
> Sorry, late to the party.  What the PDC tells you is unreliable.
Are you sure?  The PDC reference that I have is version 1.1E dated July 22, 2004.
That's after the c8000 and rp34xx were released.

It seems likely that the PDC firmware would have returned the value for 4 MB
if that were the case for these machines.
>   
> However, the Architecture guide Appendix F says "These rules provide
> offset aliasing on 16 Mbyte boundaries, with optional support for
> offset aliasing on smaller power of two sized boundaries, and either
> restricted or unlimited space aliasing."
Correct.  The Architecture that I have has an errata note changing the value
from 1 MB to 16 MB.  However, if you search on equivalent aliases you will
find inconsistencies in the number of offset bits (requirement 2).
>
> So unless someone has an update to the architecture guide, 16MB as a
> cache stride is architecturally required to work.  The tmpalias code in
> pacache.S is predicated on an assurance by the old HP chip designers
> that no chip was released with a cache stride greater than 4MB, meaning
> we could safely relax the 16MB architectural rules down to 4MB.
The patches that I sent change to hard coded bit definitions in pacache.S and
entry.S.  This makes it easy to test any alias boundary.  I went with 64 MB for
CONFIG_64BIT since a 128 MB region is only a small part of the address space.
It seemed to me unlikely that the alias boundary would be larger than the size
of the L2 cache.

I still don't know why the tmpalias code doesn't work for kernel virtual addresses.
Yet, even 4 MB seems to work fine for user virtual addresses.

As far as I can tell, space register hashing is off.

While it easy to make the tmpalias region larger, it not easy to increase SHM_COLOUR
which is currently 0x00400000.

It appears the gentoo folks are still having problems with random segmentation faults.
Yet, I'm not seeing them at anywhere near the same rate as other debian buildds.

Withe the patch, it's relatively easy to swithch between tmpalias flushing and flushing
through the user mappings.  Performance is about the same.

Dave

-- 
John David Anglin  dave.anglin@bell.net

