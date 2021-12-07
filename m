Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F03F46BF92
	for <lists+linux-parisc@lfdr.de>; Tue,  7 Dec 2021 16:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbhLGPkW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 7 Dec 2021 10:40:22 -0500
Received: from mta-tor-004.bell.net ([209.71.212.31]:26428 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S239030AbhLGPkK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 7 Dec 2021 10:40:10 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197648701A8329A
X-CM-Envelope: MS4xfLxsq6hPfY/9ZDuCRFSQe8Faz94MlncbuLE6H3cC8TdVm05XDrqBGRn0Og4RjiMZy9Kqhj5f+SuH/rx9ozuey2pU3mrQqbTYw8vfTL1llrzvN8bdD0wj
 IEKx2d7TZK5o7StmSuLRDgpC64XcrVIoVQnCTqE+tGsW8ypq61xcY3Z99gUcZjd1RkB/ZF4oJbg3G66KZMK/cgsRrSqPdUp3ZYtAwxGMvMhDBksTaNSahC2W
 pNHTufJ5UgKoJns1hFLlPeXQupjlCCEdrYQUsMr6loM=
X-CM-Analysis: v=2.4 cv=W7Vb6Tak c=1 sm=1 tr=0 ts=61af7f86
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=x35WnGInAYXiAG2AhQIA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197648701A8329A; Tue, 7 Dec 2021 10:36:38 -0500
Message-ID: <fafa4a5e-8e2d-351a-5a41-56b30f9cf48a@bell.net>
Date:   Tue, 7 Dec 2021 10:36:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Your System ate a SPARC! Gah! in map_pages()
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
 <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
 <8341244f-5db3-3dd0-5952-88e706eb9e81@bell.net>
 <a00c91d7-85d4-7c5d-85db-af812aadcb31@bell.net>
 <e76b69c3-0351-7054-bf8c-6de2bd9c33ca@gmx.de>
 <0b9576fe-12f5-1d4c-0540-77fca7e2d619@bell.net>
In-Reply-To: <0b9576fe-12f5-1d4c-0540-77fca7e2d619@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-06 2:07 p.m., John David Anglin wrote:
> On 2021-12-06 1:41 p.m., Helge Deller wrote:
>> On 12/6/21 00:05, John David Anglin wrote:
>>> On 2021-12-05 4:00 p.m., John David Anglin wrote:
>>>>> Does it boot if you remove the __init in front of map_pages?
>>>> I'll try.  I thought of trying it but wasn't sure if map_pages() had to be an init routine or not.
>>> This appears to fix boot.  System booted okay about six times.
>> Do you have huge pages enabled?
> Yes.  It's enabled on both mx3210 (rp3440) and atlas (c8000).
>> If so you could try this patch (instead of markung map_pages __init):
> I'll try it.
The patch made things worse on rp3440 (8 GB).  Going back to removing __init marking.

Dave

-- 
John David Anglin  dave.anglin@bell.net

