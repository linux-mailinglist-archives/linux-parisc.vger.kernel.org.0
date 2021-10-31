Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB835441187
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Nov 2021 00:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhJaX71 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 31 Oct 2021 19:59:27 -0400
Received: from mta-mtl-002.bell.net ([209.71.208.12]:39430 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229982AbhJaX70 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 31 Oct 2021 19:59:26 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C894590A786CA5
X-CM-Envelope: MS4xfAY4VsUGSZuIdT+0I0LF+yilwy5jLUmPDYQEt0fdKPSSZ1796QMpxyDJLPG/0wwzfI3r6IWAozu+xrrqqoyRhiaBZe9ll2LrDHWrDpdGCsEPcqTulYnj
 oRE2gpCutaKcp5ZBX6tfACwTyd1JTLauEHvNj+DxVt7AXOuADMEC1bXzkor16GF+UbU0MIyr2hs0XdnuEKibLDXOvelFbvloLTf3Flaw9WobaeMmKOr1Y5y8
 JRKlZY1ecfM5gXfAGXB0fZo6nkazzXDZRfJ5+o6v/GIppzr4F+7y6hYIjJLOLWhN
X-CM-Analysis: v=2.4 cv=ENdlb3VC c=1 sm=1 tr=0 ts=617f2d45
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=kDtRSllwvbIA_3ebYdEA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C894590A786CA5; Sun, 31 Oct 2021 19:56:53 -0400
Message-ID: <86ce35e1-7ef0-1f5c-5cbe-a498a280be29@bell.net>
Date:   Sun, 31 Oct 2021 19:56:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: fixmap problem on PA11 hardware
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     deller@kernel.org
References: <3b8410fd-f688-862f-3c3c-7ccf5d523075@gmx.de>
 <a10ff403-3869-9eb1-8213-b51e6ca8d219@bell.net>
 <0a068f90-84bb-dbe1-b8b3-6fd7709b814a@gmx.de>
 <dba5227c-0616-f51e-b716-9569304804bd@bell.net>
 <c25d8ffb-be2b-fb56-f0c9-11323d256a15@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <c25d8ffb-be2b-fb56-f0c9-11323d256a15@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-10-31 7:07 p.m., Helge Deller wrote:
> On 10/31/21 23:47, John David Anglin wrote:
>> My sense is the invalidate patch isn't correct.  The main difference between pdc and fdc is that
>> it is optional whether pdc writes the cache line back to memory when it's dirty at priority 0.
> That's true, nevertheless I've seen different behaviour on real hardware.
>
> It might be, that:
>
> -	flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
> +	invalidate_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
> (here the flush might be sufficient)
>   	if (mapped)
>   		patch_unmap(FIX_TEXT_POKE0, &flags);
> +	invalidate_kernel_vmap_range((void *)start, end - start);
> (but here the pdc is necessary to actually drop data from I-cache)
>   	flush_icache_range(start, end);
>
> I can test tomorrow...
Maybe sync is needed before releasing lock.  pdc/fdc are weakly ordered.

Dave

-- 
John David Anglin  dave.anglin@bell.net

