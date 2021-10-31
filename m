Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8D6441146
	for <lists+linux-parisc@lfdr.de>; Sun, 31 Oct 2021 23:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhJaWu1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 31 Oct 2021 18:50:27 -0400
Received: from mta-mtl-003.bell.net ([209.71.208.13]:18884 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230303AbhJaWu0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 31 Oct 2021 18:50:26 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C894590A77417D
X-CM-Envelope: MS4xfChJcRMlqh5WueOB48c5nlhod04oBsC1wwrG/xWKVq+vk+ZfXznuo9q9z5ZvPbCoQySbo1u4+xeV6xaqKQoF8HDTRhvW+ZpWl6HEYy4QGQHnAjEhVwQY
 5v9yLFlGTVN5CEobVZO0piYbKv3XxKoUHHT5r+gPCDnqG2ej3l6qqjHUfLcT68jNkzOEs0hZZwPgfDOc6sq+ywAZUwWALYk88d+0+z5LB4F552ohEOBnshnb
 /Vc/BsHSeUOv1MpNRNaWVthtUcJAnOxEEBWHLrSlUPb0AizZ0uJsh33tfvVvkR0M
X-CM-Analysis: v=2.4 cv=ENdlb3VC c=1 sm=1 tr=0 ts=617f1d18
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=OLL_FvSJAAAA:8 a=FBHGMhGWAAAA:8 a=o2Rzp98XkTbou3TCc_0A:9
 a=QEXdDO2ut3YA:10 a=E4aW7Zid9gMA:10 a=d-Xp-GvoW_QA:10
 a=oIrB72frpwYPwTMnlWqB:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C894590A77417D; Sun, 31 Oct 2021 18:47:52 -0400
Message-ID: <dba5227c-0616-f51e-b716-9569304804bd@bell.net>
Date:   Sun, 31 Oct 2021 18:47:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: fixmap problem on PA11 hardware
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <3b8410fd-f688-862f-3c3c-7ccf5d523075@gmx.de>
 <a10ff403-3869-9eb1-8213-b51e6ca8d219@bell.net>
 <0a068f90-84bb-dbe1-b8b3-6fd7709b814a@gmx.de>
Cc:     deller@kernel.org
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <0a068f90-84bb-dbe1-b8b3-6fd7709b814a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

My sense is the invalidate patch isn't correct.  The main difference between pdc and fdc is that
it is optional whether pdc writes the cache line back to memory when it's dirty at priority 0.

Note also that flush_kernel_vmap_range and invalidate_kernel_vmap_range both have this hunk
which may behave differently:

         if ((!IS_ENABLED(CONFIG_SMP) || !arch_irqs_disabled()) &&
             (unsigned long)size >= parisc_cache_flush_threshold) {
                 flush_tlb_kernel_range(start, end);
                 flush_data_cache();
                 return;
         }

Dave

On 2021-10-31 5:22 p.m., Helge Deller wrote:
> On 10/27/21 22:14, John David Anglin wrote:
>> On 2021-10-27 3:09 p.m., Helge Deller wrote:
>>> In the archives I found this old thread, which might be related:
>>> https://www.spinics.net/lists/linux-parisc/msg09391.html
>> These seems unlikely as both 7100LC and 7300LC are PA-RISC 1.1 processors (1.1c vs. 1.1e).  Big difference
>> seems to be cache.
> Yes, there were at least two problems.
> I just sent two patches to the list which fix the crashes.
> But FTRACE still doesn't work on PA1.x machines as expected,
> while the same code seems to work on PA2.x machines (running the same 32bit kernel).


-- 
John David Anglin  dave.anglin@bell.net

