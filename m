Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691DD4601F0
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 23:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhK0Waq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 17:30:46 -0500
Received: from mta-mtl-002.bell.net ([209.71.208.12]:14906 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232447AbhK0W2q (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 17:28:46 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197756C00C6EEEC
X-CM-Envelope: MS4xfCt3oMzK5l/RrsSjhfRpv+foEyCO4hktvNlsgCXHMpX1EmQknftdGpS6aJPr+KYegZeRgyJq96bMs/l9KTYPa3WFfqC2DtAx9AG4lM+vVxl8wrr1p8yw
 ARmjrqz+wufWxaYokK3/MWjs6s8uNV/gc8+RiRVtnlUuWSArHGuamEABGnabGM+mUjIsXCU0+iof0o3soSadAfL4LgkvSPi1BdJpMl/Q3pK+M2w/FGBN/NWk
 meeIrgsWWtlAjbHBmRyYT1MPdKFXwqR/+k49ypAvSqd+mPBKK0oNg7JQqfQByQP3MWbqe8vCR94G64iYnZcii7JKbEuaNZFmVJvuk4yGDwn3Wk+sXgIYAcew
 Cp3Ps/rumDhkQHuWm9eHmh2gi2HoEIvoPLx3KDOCClLvL1Q3BXY=
X-CM-Analysis: v=2.4 cv=WtFIjfTv c=1 sm=1 tr=0 ts=61a2b056
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=FBHGMhGWAAAA:8
 a=MICf5ksLqv1DdChD9HUA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197756C00C6EEEC; Sat, 27 Nov 2021 17:25:26 -0500
Message-ID: <ee0175ea-aee1-86a0-a337-88bb979f1fa4@bell.net>
Date:   Sat, 27 Nov 2021 17:25:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] parisc: Do not export __lshrdi3 on 64-bit with gcc >= 11
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Sven Schnelle <svens@stackframe.org>,
        Mikulas Patocka <mpatocka@redhat.com>
References: <20211127105818.299902-1-deller@gmx.de>
 <0ed4c18f-79fb-fc95-5baf-ae9a1f99625b@bell.net>
 <a2e9d25d-9a59-1cdf-a0cc-8344625bd2dc@bell.net>
 <67e98d1b-ad50-26ff-7201-047fd0256895@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <67e98d1b-ad50-26ff-7201-047fd0256895@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-27 5:08 p.m., Helge Deller wrote:
> On 11/27/21 22:52, John David Anglin wrote:
>> On 2021-11-27 11:32 a.m., John David Anglin wrote:
>>> On 2021-11-27 5:58 a.m., Helge Deller wrote:
>>>> It seems the __lshrdi3 symbol was dropped from libgcc.a from gcc-11 for
>>>> 64-bit executables.
>>> This is gcc bug.  There's a typo in libgcc/config/pa/t-dimode:
>>>
>>> # Extra DImode libgcc2 functions to build.
>>> lib2difuncs = _muldi3 _negdi2 _lshrdi _ashldi3 _ashrdi3 _cmpdi2 _ucmpdi2
>>>
>>> Will fix.
>> This is now fixed in upstream gcc source.
> Thanks for fixing, Dave!
>
> So, my patch:
> https://patchwork.kernel.org/project/linux-parisc/patch/20211127105818.299902-1-deller@gmx.de/
> and Mikulas patch:
> https://patchwork.kernel.org/project/linux-parisc/patch/alpine.LRH.2.02.2111270717490.10680@file01.intranet.prod.int.rdu2.redhat.com/
> won't be needed.
Yes.  I will rebuild gcc-11 with fix but that will take a day or so.  In the meantime, gcc-10 should work.

But it would be good to know if the shift routines in libgcc are needed with gcc-11.  All the shifts should be inline.

Dave

-- 
John David Anglin  dave.anglin@bell.net

