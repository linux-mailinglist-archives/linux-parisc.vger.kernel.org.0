Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD402E2BC
	for <lists+linux-parisc@lfdr.de>; Wed, 29 May 2019 19:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbfE2RBy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Wed, 29 May 2019 13:01:54 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:36409 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725948AbfE2RBy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 29 May 2019 13:01:54 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20190529170152.FHRQ4947.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 29 May 2019 13:01:52 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by mtlspm02.bell.net
          with ESMTP
          id <20190529170152.PVUE21689.mtlspm02.bell.net@[192.168.0.183]>;
          Wed, 29 May 2019 13:01:52 -0400
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <20190528153815.GB16860@t470p.stackframe.org>
 <674f8b61-e897-f657-68a2-648babca00be@bell.net>
 <1943613.tnj53yOHQY@daneel.sf-tec.de>
 <20190528173922.GA32192@t470p.stackframe.org>
 <f782e9cd-0824-6c29-09bc-986813dd1e56@bell.net>
 <61253aef-2571-f8bb-756a-bf2018e533e4@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <c29f856e-4790-dc3c-ca03-767ea2dd814e@bell.net>
Date:   Wed, 29 May 2019 13:01:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <61253aef-2571-f8bb-756a-bf2018e533e4@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bJBo382Z c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=MvuuwTCpAAAA:8 a=cH6R9-kdAAAA:8 a=FBHGMhGWAAAA:8 a=CWg6UkeRU0lEsp2CWaMA:9 a=QEXdDO2ut3YA:10 a=zd9IsfMelfkA:10 a=TAmO-0A30C4A:10 a=dVHiktpip_riXrfdqayU:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfLGeEcP+lF3BZFUy2KcriGDNujfall6igX2w2ADsl1/RWhyOSrCYzCuDdnYlvfXuciVawTW8N9dd1T913v8tqg1oUDwa2+g+hesP1LoTnGshLgKrFOyY t0hcUlw2PfrA6O5n9G5GuepxrgohvgUrVlJ1RYvogiVGRkMNO44bhYx3aWXCLmWCy16A8dr2y92dAg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-29 10:15 a.m., Helge Deller wrote:
> On 28.05.19 20:40, John David Anglin wrote:
>> On 2019-05-28 1:39 p.m., Sven Schnelle wrote:
>>> Hi,
>>>
>>> On Tue, May 28, 2019 at 07:24:29PM +0200, Rolf Eike Beer wrote:
>>>> Am Dienstag, 28. Mai 2019, 19:06:48 CEST schrieb John David Anglin:
>>>>> On 2019-05-28 11:38 a.m., Sven Schnelle wrote:
>>>>>> Interesting. Now that you mention it i see that my C3750 reports the same.
>>>>>> Google returned the following page
>>>>>> https://support.hpe.com/hpsc/swd/public/detail?swItemId=PF_CCJ70020
>>>>>>
>>>>>> Which is 2.0, and only mentions "C3650/C3700/C3750/J6700/J6750 firmware"
>>>>>> So maybe these machines have NP set, and machines "below" (like C3600)
>>>>>> don't have it set.
>>>>>>
>>>>>> I wonder what happens if you try to flash a 5.0 firmware to such a box.
>>>>> From what I see, the "C3650/C3700/C3750/J6700/J6750" and "HP 9000 Model
>>>>> B1000/C3000/J5000/J7000" use different firmware.
>>>> Which makes sense as the former have use a 8600 CPU, while the latter have
>>>> 8700 ones.
>>> Exactly. And as:
>>>
>>> a) All C3600 PDC versions clear the NP bit
>>> b) All C37XX/J5000 PDC version set the NP bit
>>>
>>> i don't think there's some bug in the PDC. I would guess that the patch Carlo
>>> reported to fix issues is just hiding the real problem. Would be interesting
>>> to run Carlo's Test on a C37XX.
>> Probably, hardware cache coherent I/O is not implemented correctly for Elroy based systems.
>> https://www.hpl.hp.com/hpjournal/96feb/feb96a6.pdf
>> Does it work on C360?
> I slowly start to get confused...
Ditto.
> Just thinking about another possibility: Maybe we can rely on the value of the
> NP iopdir_fdc bit only on machines with >= PA8700 CPUs?
> For older machines (which would need opdir_fdc) HP-UX or other operating
> systems decides on the found CPU.
> This would explain why it's not  set on Carlo's C3600, and if Sven's C240
> (with a PA8200 CPU) doesn't has the bit set too, then this could explain this theory.
We have this comment in ccio-dma.c:

        /* FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
        **        PCX-U/U+ do. (eg C200/C240)
        **        PCX-T'? Don't know. (eg C110 or similar K-class)
        **
        ** See PDC_MODEL/option 0/SW_CAP word for "Non-coherent IO-PDIR bit".
        **
        ** "Since PCX-U employs an offset hash that is incompatible with
        ** the real mode coherence index generation of U2, the PDIR entry
        ** must be flushed to memory to retain coherence."
        */

The NP bit is set in C3700 series, C8000 and rp3440.  It needs to be set in PCX-U/U+ because the
PCX-U employs an offset hash that is incompatible with the real mode coherence index generation
of U2.

The above states that C360 doesn't need FDC/SYNC.  It would be interesting to test C360.  The comment
seems wrong since openpa states C200/C240 use the UTurn I/O adapter Runway to GSC bridge.

The C3000 and up use Astro instead of UTurn.  The NP bit suggests the C3000 to C3600 don't need to
flush.  Yet latter versions C3650-C3750 need to flush.  This seems like a strange regression as HP went
to some trouble to do coherent I/O.

Anyway, I'm wondering if this has something to do with offset relationship of physical to virtual memory
in the kernel space.  It seems to me that the I/O adapter has to generate virtual addresses that are
compatible with the kernel.

Do we have ERS for one of the Cxxxx machines?

Dave

-- 
John David Anglin  dave.anglin@bell.net


