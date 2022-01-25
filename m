Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868C949BA5A
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Jan 2022 18:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356162AbiAYR26 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 25 Jan 2022 12:28:58 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:59832 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S243073AbiAYR0U (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:26:20 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E9B8D0005DF66C
X-CM-Envelope: MS4xfKsAj1QS4w2pICvt7ktb7XP3vx8Dfq97lRRTGiQeYAy2Kgq9dmwvu5tv1rQVp5nUdZebW1Xc/A7oc2/QTXy8wlRO7xE7SVF1SZ/Btuy3tHiQsjof7agA
 AVHDpIvr+52rgGSGCOFyMCt7s8T06O13TvS/m2njz/ovq4lHB1EgFfIhz3cPSMtmkeOq1JaxyvVpPA4jmlMf5kbCXME+v+LsE4ShuS4JaExkOFxZRabh8ZaZ
 1oQTXQgbFa52P5m8Ty9SYJIqbHiPSGn0JESw5USNZBU=
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61f032b6
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=1E80NrEGeS-ZdDQDv_MA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E9B8D0005DF66C; Tue, 25 Jan 2022 12:26:14 -0500
Message-ID: <e045d706-62cb-d3ff-53a9-727192068d5d@bell.net>
Date:   Tue, 25 Jan 2022 12:26:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: pagefaults and hang with 5.15.11
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
 <f872b4fc-2d26-5b89-c985-261966c9f49d@bell.net>
 <a23a26c3-6760-33e1-a390-5f51b103dd17@bell.net>
 <4711347.31r3eYUQgx@eto.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <4711347.31r3eYUQgx@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-01-25 11:54 a.m., Rolf Eike Beer wrote:
> Am Montag, 24. Januar 2022, 18:41:27 CET schrieb John David Anglin:
>> On 2022-01-24 12:24 p.m., John David Anglin wrote:
>>> Faulting instruction is "ldw 18(r3),r24".  Address in $r3 (and $r5) seems
>>> bad.  Think the sglist argument
>>> to sba_unmap_sg() is bad.  Don't have a clue as to why this might be.
>> Maybe try interchanging operands of following &&
>>
>>           while (sg_dma_len(sglist) && nents--) {
>>
>> so nents is checked first.
> But nents would be increased then even for the case that sg_dma_len() returns
> false, which may or may not be wanted.
You are correct.  The decrement of nents needs to be in loop so count in following DBG_RUN_SG is correct:

         while (sg_dma_len(sglist) && nents--) {

                 sba_unmap_page(dev, sg_dma_address(sglist), sg_dma_len(sglist),
                                 direction, 0);
#ifdef SBA_COLLECT_STATS
                 ioc->usg_pages += ((sg_dma_address(sglist) & ~IOVP_MASK) + sg_dma_len(sglist) + IOVP_SIZE - 1) >> PAGE_SHIFT;
                 ioc->usingle_calls--;   /* kluge since call is unmap_sg() */
#endif
                 ++sglist;
         }

         DBG_RUN_SG("%s() DONE (nents %d)\n", __func__,  nents);

However, nents still needs to be checked first.

What has happened is the sglist pointer has crossed a page boundary causing the TLB miss.  The offset of sg_dma_len is 0x18
and checking sg_dma_len(sglist) first causes the fault.

-- 
John David Anglin  dave.anglin@bell.net

