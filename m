Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271542A5BE
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 19:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfEYRP1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 13:15:27 -0400
Received: from mout.gmx.net ([212.227.15.18]:46251 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726001AbfEYRP1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 13:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558804522;
        bh=jU3O2A4AwIs9O06hrpg0q7Bg4SWQkS8z+Scu+uWBagY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=J69/3FLhYwUzX2vELtRlw5oojR53aJbo8w067BamknCy3bD8jt+UAnWfIb8ixwHXq
         U4pzChIs+ur/5ba6BSvCdnsA6ewfUeppbHmFpcF8Dh6pAhXakN2bmUVg0Sz1nMHRrs
         cmwYX5MisQfmTP08+1bZpS9GiEU3H9XRJJSoa6jw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.242]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Mb8MV-1hAzD71WBf-00KhFL; Sat, 25
 May 2019 19:15:22 +0200
Subject: Re: HPPA problems with the PCI
To:     John David Anglin <dave.anglin@bell.net>,
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
From:   Helge Deller <deller@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=deller@gmx.de; keydata=
 xsBNBFDPIPYBCAC6PdtagIE06GASPWQJtfXiIzvpBaaNbAGgmd3Iv7x+3g039EV7/zJ1do/a
 y9jNEDn29j0/jyd0A9zMzWEmNO4JRwkMd5Z0h6APvlm2D8XhI94r/8stwroXOQ8yBpBcP0yX
 +sqRm2UXgoYWL0KEGbL4XwzpDCCapt+kmarND12oFj30M1xhTjuFe0hkhyNHkLe8g6MC0xNg
 KW3x7B74Rk829TTAtj03KP7oA+dqsp5hPlt/hZO0Lr0kSAxf3kxtaNA7+Z0LLiBqZ1nUerBh
 OdiCasCF82vQ4/y8rUaKotXqdhGwD76YZry9AQ9p6ccqKaYEzWis078Wsj7p0UtHoYDbABEB
 AAHNHEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT7CwJIEEwECADwCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEE9M/0wAvkPPtRU6Boh8nBUbUeOGQFAlrHzIICGQEACgkQh8nB
 UbUeOGT1GAgAt+EeoHB4DbAx+pZoGbBYp6ZY8L6211n8fSi7wiwgM5VppucJ+C+wILoPkqiU
 +ZHKlcWRbttER2oBUvKOt0+yDfAGcoZwHS0P+iO3HtxR81h3bosOCwek+TofDXl+TH/WSQJa
 iaitof6iiPZLygzUmmW+aLSSeIAHBunpBetRpFiep1e5zujCglKagsW78Pq0DnzbWugGe26A
 288JcK2W939bT1lZc22D9NhXXRHfX2QdDdrCQY7UsI6g/dAm1d2ldeFlGleqPMdaaQMcv5+E
 vDOur20qjTlenjnR/TFm9tA1zV+K7ePh+JfwKc6BSbELK4EHv8J8WQJjfTphakYLVM7ATQRQ
 zyD2AQgA2SJJapaLvCKdz83MHiTMbyk8yj2AHsuuXdmB30LzEQXjT3JEqj1mpvcEjXrX1B3h
 +0nLUHPI2Q4XWRazrzsseNMGYqfVIhLsK6zT3URPkEAp7R1JxoSiLoh4qOBdJH6AJHex4CWu
 UaSXX5HLqxKl1sq1tO8rq2+hFxY63zbWINvgT0FUEME27Uik9A5t8l9/dmF0CdxKdmrOvGMw
 T770cTt76xUryzM3fAyjtOEVEglkFtVQNM/BN/dnq4jDE5fikLLs8eaJwsWG9k9wQUMtmLpL
 gRXeFPRRK+IT48xuG8rK0g2NOD8aW5ThTkF4apznZe74M7OWr/VbuZbYW443QQARAQABwsBf
 BBgBAgAJBQJQzyD2AhsMAAoJEIfJwVG1HjhkNTgH/idWz2WjLE8DvTi7LvfybzvnXyx6rWUs
 91tXUdCzLuOtjqWVsqBtSaZynfhAjlbqRlrFZQ8i8jRyJY1IwqgvHP6PO9s+rIxKlfFQtqhl
 kR1KUdhNGtiI90sTpi4aeXVsOyG3572KV3dKeFe47ALU6xE5ZL5U2LGhgQkbjr44I3EhPWc/
 lJ/MgLOPkfIUgjRXt0ZcZEN6pAMPU95+u1N52hmqAOQZvyoyUOJFH1siBMAFRbhgWyv+YE2Y
 ZkAyVDL2WxAedQgD/YCCJ+16yXlGYGNAKlvp07SimS6vBEIXk/3h5Vq4Hwgg0Z8+FRGtYZyD
 KrhlU0uMP9QTB5WAUvxvGy8=
Message-ID: <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
Date:   Sat, 25 May 2019 19:15:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9aa6caf2-c9d0-8bbb-8f62-dc1becea841d@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OsI7yNMeaLGPvxeL8IkBRfyHTceO3Klj8FCw9hkQ4I7rUL9yL/F
 RJPh9+/5EtwE7ffSI5FO1+s1uBnTd4UEZnDiVMpEj8VSNjpnhLP23P3lfQbhIE+Cdgc8OFO
 EIfYrtVMDK8zrV3AiQ+gi9pVUAFbmv8rr06BhkEhjIg1lMrWd8xOBdZwslOrOmxlzaX6wcU
 YJ6KOS+AJ6udRXJtT0oPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x4Sa3UkP4Vk=:6znpkIFGTQ9ilOKStX+7kG
 4rOkMwtrKQCv+n+RkemxxCX5tszwkLQzAdfPXcdcSzXPOAq2bqoHuCIFE4x4uGKB/O75k6+dA
 F08vEkp/oLGAYWFv4+Rz1PB9v8192+qYNUdW8JAn7dULFNQPxznBnOdqiJJvUceOH2hfR4xJD
 s+OHAep5oV4/jTs58VvJuVCxvlBUrdIzoJ83iQw1p4AR8GAc7OWs7JfH+78q8tQUFjtTUihtN
 lrhnhqJoD6pJniD2AiM2Bj0BNbBCN0nItYu2ukW+wsUJlXTQgb4ZwzGynBg1yEtjdY4rXInm8
 JPj0uPi3c52JsjbH657advqZhydEkGX4edBeH2uzLr1ZVlzyZLTW6tXpvnZxGC1aKBEcN4EvN
 Sm1rpX6VV2vPYkwnizMIC7clk6jsX6EirrDWO4ItQTSPK3eU1kAUG8XKhbXkfppWo2Kxs33i2
 dJNmlFrQ//cBGIH+ExTHgEyfDSY0yZ0WCbFPeSJ6F81xEFuJtQTWuj9i1vrJQGA8y2780EP9/
 MzVtVisUxSLbp5ZqoqZ/9bJbMtIQt6ptus4GSbYjJ9qCO6VL9p3E4fCQkTIjmVzhmnKZBY4+U
 DlPJXBzvP+xOoZwFA4ptOHj8uLsIlEBponicFxhhy/q2YZwGcVlXPf1KW5+oOuiHnv2r1GSr7
 EEEFUGPNzmXjKl8UR1NSNQsQuf86DhJVV/MDSaS0Q/e3CcFipDtx6FwX6dJX7Gs2oge70fDh3
 dQgQEHwIH3Y1AEOk8Xg8u95QpATQSFDUrzebBC66oer+zkaXUWeMR8qXoHpag4o91XrvG1aLQ
 M5VsoCtm027GK3WifVdHTMX5rIa4/jMdK1xieMf7VCf+s2dgyVRFoHaDUl9oyN/wUu3OlanEB
 NNPXJOfFHuU+1FadeQYA/4F6oHxBwQvEZ/y+kFy0thWcLXsHMdXSlbxTN359AN/VIPaSHiK2w
 inGo6oOkkRmPHn67/8rMUfXTaD61gmQA/QWFt2Pbx6m6eMHGD/69F
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 25.05.19 16:13, John David Anglin wrote:
> On 2019-05-25 5:01 a.m., Carlo Pisani wrote:
>> on  kernel 5.1, from the git repository, compiled with SMP
>>
>> dmesg | grep altern
>> [    2.551002] alternatives: applied 156 out of 175 patches
>>
>> this patch has made my day!
>> It seems the solution for the problem!
>>
>> the card is still working after 10 hours of burn-in test!
>
>> --- a/arch/parisc/include/asm/cache.h
>> +++ b/arch/parisc/include/asm/cache.h
>> @@ -52,7 +52,6 @@ void parisc_setup_cache_timing(void);
>>
>>  #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
>>                         ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
>> -                       ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) \
>>                         : : "r" (addr) : "memory")
>>  #define asm_io_sync()  asm volatile("sync" \
>>                         ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
> The change isn't fully correct as the alternative should also have been =
removed from
> the asm_io_sync() define.
>
> If the change actually fixes controller, then there must be a problem wi=
th the test in
> arch/parisc/kernel/alternative.c that determines whether or not to patch=
 out fdc instruction
> on c3600.=C2=A0 See Helge's patch to fix alternative coding for PCX-U CP=
Us.=C2=A0 It would help to
> print boot_cpu_data.pdc.capabilities and boot_cpu_data.cpu_type on your =
machine.

I wonder as well. c3600 seems to have a PA-8600 CPUs (according to openpa.=
net) which is pcxw_
(according to  arch/parisc/kernel/hardware.c) and it should be fine to rep=
lace the fdc by nop
if the PDC_MODEL_IOPDIR_FDC capabilities bit is not set.
Carlo, can you run "cat /proc/cpuinfo" and paste the output here?

Helge
