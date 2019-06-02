Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA6B43239C
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jun 2019 16:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfFBOiw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jun 2019 10:38:52 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:59678 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725977AbfFBOiv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jun 2019 10:38:51 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20190602143850.FLXH4947.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 2 Jun 2019 10:38:50 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20190602143850.WSLY21689.mtlspm02.bell.net@[192.168.2.49]>;
          Sun, 2 Jun 2019 10:38:50 -0400
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
From:   John David Anglin <dave.anglin@bell.net>
To:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <20190528153815.GB16860@t470p.stackframe.org>
 <674f8b61-e897-f657-68a2-648babca00be@bell.net>
 <1943613.tnj53yOHQY@daneel.sf-tec.de>
 <20190528173922.GA32192@t470p.stackframe.org>
 <f782e9cd-0824-6c29-09bc-986813dd1e56@bell.net>
 <61253aef-2571-f8bb-756a-bf2018e533e4@gmx.de>
 <20190530195543.GB683@t470p.stackframe.org>
 <20190530205955.GD683@t470p.stackframe.org>
 <b7763436-cee8-6d8d-87cd-992947a9d651@bell.net>
Openpgp: preference=signencrypt
Message-ID: <dbb338c9-fbd5-79ce-8609-11eaae72d260@bell.net>
Date:   Sun, 2 Jun 2019 10:38:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b7763436-cee8-6d8d-87cd-992947a9d651@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-Analysis: v=2.3 cv=bJBo382Z c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=dq6fvYVFJ5YA:10 a=cH6R9-kdAAAA:8 a=FBHGMhGWAAAA:8 a=TpkFxMM0uow9CducRJMA:9 a=QEXdDO2ut3YA:10 a=zd9IsfMelfkA:10 a=TAmO-0A30C4A:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfPgOBDodGQ6PiKHsk5Vqp26BCDFPXptltgfrIvM4Iit2cQoX0x7k5zJFj/Mq2WeiKZmVO4ujOtMZsRQCd9X+/VOPcTz6CnMStLz3hoHm3D/Pd6Axs/Ok q5GS36QG0Uu40tctO4Nx/e2ZW4CyXq+HjriOUn3HAZS13E5LjVF2Azq4PsnhIYSDsp/rC7Bj4JTOnA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-31 8:23 a.m., John David Anglin wrote:
> On 2019-05-30 4:59 p.m., Sven Schnelle wrote:
>> Hi,
>>
>> On Thu, May 30, 2019 at 09:55:43PM +0200, Sven Schnelle wrote:
>>> Hi,
>>>
>>> On Wed, May 29, 2019 at 04:15:03PM +0200, Helge Deller wrote:
>>>>>> Exactly. And as:
>>>>>>
>>>>>> a) All C3600 PDC versions clear the NP bit
>>>>>> b) All C37XX/J5000 PDC version set the NP bit
>>>>>>
>>>>>> i don't think there's some bug in the PDC. I would guess that the patch Carlo
>>>>>> reported to fix issues is just hiding the real problem. Would be interesting
>>>>>> to run Carlo's Test on a C37XX.
>>>>> Probably, hardware cache coherent I/O is not implemented correctly for Elroy based systems.
>>>>> https://www.hpl.hp.com/hpjournal/96feb/feb96a6.pdf
>>>>> Does it work on C360?
>>>> I slowly start to get confused...
>>>> Just thinking about another possibility: Maybe we can rely on the value of the
>>>> NP iopdir_fdc bit only on machines with >= PA8700 CPUs?
>>>> For older machines (which would need opdir_fdc) HP-UX or other operating
>>>> systems decides on the found CPU.
>>>> This would explain why it's not  set on Carlo's C3600, and if Sven's C240
>>>> (with a PA8200 CPU) doesn't has the bit set too, then this could explain this theory.
>>> I just re-tested my kexec branch, and the HPMC i was seeing when kexec'ing a new
>>> kernel on my J5000 is now gone with Helge's patch. J5000 also has PCX-W. It was
>>> only triggered when i had SMP enabled, but this is somehow not suprising given
>>> the fact that a cache flush was missing.
>> Looks like i'm also confused now. My J5000 crashed with the kexec stuff again.
>> It's much less than before, only 1 out of 10 times.
>>
>> The patch does:
>>
>>                 if ((cond & ALT_COND_NO_IOC_FDC) &&
>>                        ((boot_cpu_data.cpu_type < pcxw) ||
>>                         (boot_cpu_data.cpu_type == pcxw_) ||
>>                         (boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC)))
>>                         continue;
>>
>> So there should be no change for PCX-W and my statement that this fixes anything
>> on my J5000 is wrong. I think i'll disable the patching and see whether the problem
>> disappears.
> Is it possible that we are running in a mode where the cache/TLB does not issue coherent
> operations?  There is a PDC_CACHE call to set the coherence state.

I checked the machines that I have and they all have coherent caches and TLBs.  I think
flush and sync are required on all machines with write-back caches.  This makes write
visible to I/O adapter (memory).  The c3600 has a write-back data cache.  See "PDC Procedures"
page 4-21.

This might be affected by the TLB U bit.  Possibly, the U bit is not set for pages in the
I/O address region (IO-PDIR) and we need flush/sync as a result.

-- 
John David Anglin  dave.anglin@bell.net
