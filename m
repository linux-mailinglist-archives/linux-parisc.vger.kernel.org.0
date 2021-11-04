Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA78445BA5
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 22:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhKDVay (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 17:30:54 -0400
Received: from mout.gmx.net ([212.227.17.21]:41259 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232204AbhKDVaw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 17:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636061285;
        bh=AUYmd1LogHNCy3J3EJiZsLvhOaUHiAxGEKT4so7c13M=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=TFVMCJrXT7Oge1IEbaSPn0tx0kNnqmobVWDjFa8yW+iGh9VZh0LoIlWLc2RRCTk20
         8fg1YEQsvj9O7wNaZsSWcu7gotEycifYJVsJ+cbE0U6ZeLGGYt9+6gTfVnbPExEtCQ
         Dj+jhjPjk+ws7QHEli0qi69csNjU1r5kg7AIVYg0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.157.73]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDysm-1mqU2D1oQO-009zv1; Thu, 04
 Nov 2021 22:28:05 +0100
Message-ID: <c963c0cd-d364-e873-3b00-ed631c6dc407@gmx.de>
Date:   Thu, 4 Nov 2021 22:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: Fix code/instruction patching on PA1.x machines
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Sven Schnelle <svens@stackframe.org>
References: <YX8HK7ZZZhjRQzcr@ls3530>
 <91b3d125-18ae-e10f-3000-1b17a43a156f@bell.net>
 <cf2c5fa8-5b98-50b7-00ef-0e86df918e8e@gmx.de>
 <a3568fd4-79be-798e-3078-60b187ddaea7@bell.net>
 <f8a7f1fa-dc97-224b-8726-25bb66653aa3@gmx.de>
 <be51b4df-35df-f0f0-1763-c4421d01bd1d@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <be51b4df-35df-f0f0-1763-c4421d01bd1d@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+9JMpHOvlvlfo13Hm3At7ckltAJxeP6FiygSMVLrOxAmoPzRaIG
 OERjC5lHCxngC/+hqh96ppjJhH4VR0xQio77uZNIR1R/Lf633c0NgrF7nGMfoXFdxdfvz8k
 femCfgPtFJrhN95KTK9NkCEbuVWzfN3CudMuMis0/0komy+ljhWQIqm1tE6q/79Zm240CXD
 A4YdNihU6eClzUXF2x30A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rPTyKMQC03Y=:/Dv5iEaz2JUq5kno62L8yH
 7bhO4muYg/+QGNh26LrT1iqKuGcW/kO21niu7ul6n7hCrYqafrVFoTDAoFdI4PxBuGptl6v6g
 JWtpPN8jmw8tph20ItRV2/S61sGDgdY9kTLcnq2LiDprSzj5HYgeyO+ihswP6k8FABE8PdTtr
 t7iw7wnUG/8KfVUmvpwn9gKKWQI2k+9Cf4OYV1MG1lxvMd6UPj10Debp1tQDRaLd4Y7OmRpz5
 hfMKWo9jxPbOeHmTTvFP2VpDHIFmUoJJyAdr5BDqitxpZN3fDfZ7sMYeD9wkMCVEvEMZhq1XT
 EGztlU8Rw7O46rZBzMit7svMZcdedW3KtAilwFaiXo4uWnNiCidk31kr10T1kmk+j7CgUYCzZ
 KIciFw1Y6psESyF2KUOvk5aJUfufXJo+A8B24afnayXq/Xwmudp8PYufAWlWAxicMhtTFOcBz
 lpYaysrCTUMzFzxBEr/16AfZ90wqXv+ffinCUZ0NHPZ5kP95Y7OgGjZgjF0FiT9B4AKqV6ck1
 cLgacieiu2ReiCiJOdzXKaMJdtbTlMG1BhowbEO5QCGrmNsxSoaRtaHxWlCHG5c3CdhPj/RBH
 mRB2XoZvKr4pLJeIqjedF9HytRlZOBPsZvFHUjfavAsnqHafTb/rdEqK0nkCJhsOT8/kXgbBH
 07jq9Q0EZfFR0c55hUkXTbt8rfqBIz6VQ1GSXRpg2sbNgeeySQHHUO7ES1Vo4cbuWPGi0HvWM
 suIkP3gLm1slLsq0LPo+v2wpsXID3+IjiZn+ttze/3RfgnyyXWzSNKoHGnalmo1X8MFsqvl/4
 S4pFIIAEBII4QWroOt22PdWQnbVdR3JHdM0W7xNUZgyHChPe07j9dl5GdYwarG2TmWjGJowOP
 oI+gJvSIXH+NIwBAmorbJEcfSXR0G2SFdbC0plvQ3UOvcO3M6oJ4p5H05TF924c5zbc3eB8KB
 WIkkPA6ntmmk6MwiKUjBydBBYUg1RXIIfhMcqUwqq0jJVq5DhuzUfup5UYntATrFEK9kebQgI
 Gml+x+nc9kxeObrLZCZs6jQp/DFWa4H5cz7m8JyCdDy73sb9NJhWQlDAAd6gKBFTeZeR78wuF
 2EDHGlDUk5ENvc=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Dave,

On 11/4/21 22:16, John David Anglin wrote:
> On 2021-11-04 4:48 p.m., Helge Deller wrote:
>> Here is the syslog with your patch on the 715/64:
>> ...
>> Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
>> mem auto-init: stack:off, heap alloc:off, heap free:off
>> Memory: 148832K/163840K available (8452K kernel code, 1461K rwdata, 237=
9K rodata, 696K init, 444K bss, 15008K reserved, 0K cma-reserved)
>> ftrace: allocating 26912 entries in 53 pages
>> Backtrace:
>> =C2=A0 [<1097d588>] __patch_text+0x20/0x30
>> =C2=A0 [<101c5128>] ftrace_make_nop+0x3c/0x68
>> =C2=A0 [<102c98a8>] ftrace_process_locs.isra.0+0x208/0x2b0
>> =C2=A0 [<10113ba0>] ftrace_init+0xa8/0x154
>> =C2=A0 [<10101284>] start_kernel+0x3d0/0x708
>> =C2=A0 [<10105244>] start_parisc+0xb8/0xec
>>
>> Bad Address (null pointer deref?): Code=3D15 (Data TLB miss fault) at a=
ddr 0effe310
>> CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-32bit+ #1017
>> Hardware name: 9000/715
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>> PSW: 00000000000011000000001100001110 Not tainted
>> r00-03=C2=A0 000c030e 10c7cda8 1097d474 10c67340
>> r04-07=C2=A0 10100314 00000000 10c672dc 10c7d328
>> r08-11=C2=A0 00000000 00000000 10cbe5a8 00000000
>> r12-15=C2=A0 10c75da8 10b2f800 10d7d5a8 00000001
>> r16-19=C2=A0 00000000 00000002 00000000 08000240
>> r20-23=C2=A0 10c67000 00000200 10100500 00000020
>> r24-27=C2=A0 0efff000 0efff000 0effe310 10b915a8
>> r28-31=C2=A0 0effe310 00000000 10c673c0 10279a68
>> sr00-03=C2=A0 00000000 00000000 00000000 00000000
>> sr04-07=C2=A0 00000000 00000000 00000000 00000000
>>
>> IASQ: 00000000 00000000 IAOQ: 1097d4e4 1097d480
>> =C2=A0 IIR: 0f9312a8=C2=A0=C2=A0=C2=A0 ISR: 00000000=C2=A0 IOR: 0effe31=
0
>> =C2=A0 CPU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 CR3=
0: 10c67000 CR31: f00effff
>> =C2=A0 ORIG_R28: 00000000
>> =C2=A0 IAOQ[0]: __patch_text_multiple+0xdc/0x12c
>> =C2=A0 IAOQ[1]: __patch_text_multiple+0x78/0x12c
>> =C2=A0 RP(r2): __patch_text_multiple+0x6c/0x12c
>> Backtrace:
>> =C2=A0 [<1097d588>] __patch_text+0x20/0x30
>> =C2=A0 [<101c5128>] ftrace_make_nop+0x3c/0x68
>> =C2=A0 [<102c98a8>] ftrace_process_locs.isra.0+0x208/0x2b0
>> =C2=A0 [<10113ba0>] ftrace_init+0xa8/0x154
>> =C2=A0 [<10101284>] start_kernel+0x3d0/0x708
>> =C2=A0 [<10105244>] start_parisc+0xb8/0xec
>> Kernel panic - not syncing: Bad Address (null pointer deref?)
> The faulting instruction is "stw,ma r19,4(ret0)".=C2=A0 r19 contains nop=
 instruction.=C2=A0 r28
> contains the address being patched.=C2=A0 Where does it (0x0effe310) poi=
nt in kernel?
>
> It seems likely to me that TLB handler is broken and that's the reason f=
or the bad address fault.
> But maybe there's a map problem.

Right, there is a map problem!
Please ignore this last backtrace I sent.
I missed to include my previous patch to fix the TLB issue, aka this patch=
:
 https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/c=
ommit/?h=3Dparisc-5.16-1&id=3D6e866a462867b60841202e900f10936a0478608c
So, this backtrace is bogus...

With my patch (and yours) applied now it comes further.
Maybe there is generic ftrace/kprobe problem in kernel v5.15 into which I =
run?
I'll continue testing on git head from Linus and report back soon...

Helge
