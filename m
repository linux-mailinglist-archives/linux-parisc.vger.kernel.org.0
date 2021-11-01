Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5499E44118D
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Nov 2021 01:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhKAAJW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 31 Oct 2021 20:09:22 -0400
Received: from mta-tor-004.bell.net ([209.71.212.31]:48440 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230121AbhKAAJV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 31 Oct 2021 20:09:21 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C8868809F1C4C1
X-CM-Envelope: MS4xfANO9cyDTdhgaY49mNNFHhhTx+7f/+/4J/OhJ+Ndexr1JrfHGKGQm8LctEuwbZHNsrlcEHYGq517k70XkbZ9+9FehvaNbRw+GxZEfaW380PZ8oAI3w62
 nfsVW68yhkJJcUOd52YtpHPepzUgyPxwPVQTq5UTirXZzOs3DENRaocTt8DxTMb2oRJI/wymnmJG65wDKaX4Wdus2hFT4YS4P7+m3MOA3d5g7U1MT8aGstAI
 5R4fGlovaremTtzHq79SzoxwlwtFZmLwfMxehmn8jSOyMxHtWrp6ihXkKvO9b8Hw
X-CM-Analysis: v=2.4 cv=Udwy9IeN c=1 sm=1 tr=0 ts=617f2f97
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=5lqBLR4tE87TEXlRbFAA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C8868809F1C4C1; Sun, 31 Oct 2021 20:06:47 -0400
Message-ID: <93de32e2-9922-99cf-17ce-95409d6c0813@bell.net>
Date:   Sun, 31 Oct 2021 20:06:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: fixmap problem on PA11 hardware
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     deller@kernel.org
References: <3b8410fd-f688-862f-3c3c-7ccf5d523075@gmx.de>
 <a10ff403-3869-9eb1-8213-b51e6ca8d219@bell.net>
 <0a068f90-84bb-dbe1-b8b3-6fd7709b814a@gmx.de>
 <dba5227c-0616-f51e-b716-9569304804bd@bell.net>
 <c25d8ffb-be2b-fb56-f0c9-11323d256a15@gmx.de>
 <86ce35e1-7ef0-1f5c-5cbe-a498a280be29@bell.net>
 <5650aab0-5cfd-a114-6a69-e8dc86123b93@bell.net>
In-Reply-To: <5650aab0-5cfd-a114-6a69-e8dc86123b93@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-10-31 8:01 p.m., John David Anglin wrote:
> On 2021-10-31 7:56 p.m., John David Anglin wrote:
>> n 2021-10-31 7:07 p.m., Helge Deller wrote:
>>> On 10/31/21 23:47, John David Anglin wrote:
>>>> My sense is the invalidate patch isn't correct.  The main difference between pdc and fdc is that
>>>> it is optional whether pdc writes the cache line back to memory when it's dirty at priority 0.
>>> That's true, nevertheless I've seen different behaviour on real hardware.
>>>
>>> It might be, that:
>>>
>>> -    flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
>>> +    invalidate_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
>>> (here the flush might be sufficient)
>>>       if (mapped)
>>>           patch_unmap(FIX_TEXT_POKE0, &flags);
>>> +    invalidate_kernel_vmap_range((void *)start, end - start);
>>> (but here the pdc is necessary to actually drop data from I-cache)
>>>       flush_icache_range(start, end);
>>>
>>> I can test tomorrow...
>> Maybe sync is needed before releasing lock.  pdc/fdc are weakly ordered.
> Forget that.  There already is a sync.
Could it be we incorrectly change the flush/purge operations to nops?
89:     ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)

Dave

-- 
John David Anglin  dave.anglin@bell.net

