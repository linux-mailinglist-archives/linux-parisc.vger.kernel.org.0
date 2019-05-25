Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEB82A5C9
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 19:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfEYRUV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 13:20:21 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:57055 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726001AbfEYRUT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 13:20:19 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190525172018.HMZE4684.torfep02.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 25 May 2019 13:20:18 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm01.bell.net
          with ESMTP
          id <20190525172018.KKTM39285.torspm01.bell.net@[192.168.2.49]>;
          Sat, 25 May 2019 13:20:18 -0400
Subject: Re: HPPA problems with the PCI
To:     Helge Deller <deller@gmx.de>,
        Carlo Pisani <carlojpisani@gmail.com>,
        Grant Grundler <grantgrundler@gmail.com>
Cc:     Sven Schnelle <svens@stackframe.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
 <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net>
 <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org>
 <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
 <9aa6caf2-c9d0-8bbb-8f62-dc1becea841d@bell.net>
 <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <8577d5b1-dabc-34ca-a266-18d9c91e00fa@bell.net>
Date:   Sat, 25 May 2019 13:20:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=5ypQrAzGAAAA:8 a=FBHGMhGWAAAA:8 a=ILR-EG_UVoUYwfzK2ssA:9 a=QEXdDO2ut3YA:10 a=QnlTcYk_iZbCEFXf-YqT:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfE6cclFY6lb29C0WfC0QUYAqtvDJfznk8/donlVg2NfT6XyepYf/oVAQKG441XBXarrUAFBHF2O+IQY+NjjfoLd+NS/w/7wPC2ySFn43sbgaG90I3ghC BFDntGcNmW88JuvHzHSfBDJN1nQALE1K7UTzFiV07NfHPsMc6dOkRndCHStYe52mEaX2s7UEL7MfKw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-25 1:15 p.m., Helge Deller wrote:
> On 25.05.19 16:13, John David Anglin wrote:
>> On 2019-05-25 5:01 a.m., Carlo Pisani wrote:
>>> on  kernel 5.1, from the git repository, compiled with SMP
>>>
>>> dmesg | grep altern
>>> [    2.551002] alternatives: applied 156 out of 175 patches
>>>
>>> this patch has made my day!
>>> It seems the solution for the problem!
>>>
>>> the card is still working after 10 hours of burn-in test!
>>> --- a/arch/parisc/include/asm/cache.h
>>> +++ b/arch/parisc/include/asm/cache.h
>>> @@ -52,7 +52,6 @@ void parisc_setup_cache_timing(void);
>>>
>>>  #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
>>>                         ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
>>> -                       ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) \
>>>                         : : "r" (addr) : "memory")
>>>  #define asm_io_sync()  asm volatile("sync" \
>>>                         ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
>> The change isn't fully correct as the alternative should also have been removed from
>> the asm_io_sync() define.
>>
>> If the change actually fixes controller, then there must be a problem with the test in
>> arch/parisc/kernel/alternative.c that determines whether or not to patch out fdc instruction
>> on c3600.  See Helge's patch to fix alternative coding for PCX-U CPUs.  It would help to
>> print boot_cpu_data.pdc.capabilities and boot_cpu_data.cpu_type on your machine.
> I wonder as well. c3600 seems to have a PA-8600 CPUs (according to openpa.net) which is pcxw_
> (according to  arch/parisc/kernel/hardware.c) and it should be fine to replace the fdc by nop
> if the PDC_MODEL_IOPDIR_FDC capabilities bit is not set.
> Carlo, can you run "cat /proc/cpuinfo" and paste the output here?
I'm thinking that machines with Elroy PCI bridges may need flush but I don't know why.

Dave

-- 
John David Anglin  dave.anglin@bell.net

