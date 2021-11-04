Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76DA445B38
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 21:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbhKDUvc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 16:51:32 -0400
Received: from mout.gmx.net ([212.227.17.22]:33707 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232141AbhKDUva (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 16:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636058926;
        bh=oyDESVeAtLyJpDKhj2YIILzUJ7888Esa6PrpO07PY7c=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=B/T342f142HwjLsufSd08L0STNPMcxVFBIccgkvE8DoGq6G4Wuma0xeY01rzwOKtX
         tg2cpSzYAdLv/h7y2VCYxejiMjD7TJx0ISK++q/iAr5/7pczpCkF+yFYKA2pqSQHKC
         na4Xl2sCRGCiYsctFvlKW8L3/jjt8RRGtnXYoaTA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.157.73]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCbEp-1msOIX0HBr-009jS9; Thu, 04
 Nov 2021 21:48:46 +0100
Message-ID: <f8a7f1fa-dc97-224b-8726-25bb66653aa3@gmx.de>
Date:   Thu, 4 Nov 2021 21:48:17 +0100
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
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <a3568fd4-79be-798e-3078-60b187ddaea7@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:844mskGyGeGoVikYMVSeFKvkE+jtOZ36vdtkT/bcMnTrCTmiA79
 SFx65Sb+tcdgXPzXCzf4dVojvJHuXb2vx1JAtxt1s1IdKEHiiROss1nfn9QR4OVhvP+1Kmq
 MUQHHvahTTgibRzoR+4KVd70dhEz22ST49oi+/6biXKlivMQpmCiYICVd969KqINq7a06/I
 WNl8mdbe7LUg1oZ07gpdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IbWi0RuXf1I=:TuLto5bJvhRfNSa6m3xy5u
 nQ0V48NjcWB/9qbnhE3l/Gilf4ORvPAUFg140Le6rl6LaCxkf4nOoX0ISMN8XRWv0pQ6hXbOW
 DZtaupDnCecIJIratu3ZGHAKaBcvnRjgs6Do57QeWCgyvGMvhj+NGFold2IkGeU1d4/3GtJY8
 1Yph5wENfMu7azr0nDcESvJjudBarhuHL3CfDuo6wcdkctwJOa/2wkbu6nyreC7tCZdGe6/50
 2Rsj5fsOoFBxMb+4kJd0EbTmhEN4jDOjw7Mb6wdNjJsmpSjW9PsVAGzkmqCzg2Z43kqTY++XJ
 xtftBvPqaq6k9gNFp4tmzbNn/+7C15igZzRIW6xdWWIJYW+NmEe6Y2UzxfUvaYhCVpNRUUVbH
 6Urqt8uhfKwKWuiJMl5scLNz729q4cg//9/K/9Vy8ZKlmWyLxGj27oqPlS6TdwF4WoHQDBM3W
 wD69xlWJbkZYgdvnq7nAtlPrHLOli5Lo9rDofn4PPNkBudMlNz7L3RT+ivpjDnATWWHJxwv46
 wLQhSQ1JvRg9mNuN8MMpL6XS7zv4ZTiHmc2kw40jUnWXtAbfApv08Ual+ablsTWgFiSTrTsKH
 /MSSEKl0MYvuZtHJBBfEpbzjmaW3ZxLvX6zaQcxYOoZ7Td63MXOQQMY1DMf9I+7dAbk77blqu
 6VKBw0cdDQl10jdIui8tHIomsitQTtxiPAZNKOeHLvSawmWleg3ytyJqqgycAA66PGmUi+Es5
 WZipumhmLNpvZPoUDoMcF0XcdNmfTS89YTqdnV5iNpv2RjMlyZ1dwp0sKOLSacfHqtAv6jqpm
 tYnFoN9sHbcKELiw8ndgtryTgRtf3IPSJ+u/ZHhmrPp5KYc75npzPQMxzjGtiQtrEilUQsoYL
 K2Nz1RXJgWDTw47Wj4X94xr/Ec5uUrayxSYH1rWwMCTgjuQpqvMvXubFVG27lrgtCgl8shAUu
 A5H55LQlOvtOA9UmdIhgJNwUqgibSfANGp+nkea58mwHmpY+3i08M7Rlq/RFH7igxWybMOwYP
 hvOI4Pj3oX3eHmRR3o7qX9u++xwnfdeHkgS/8oBLkNW+soxqkr13EgjovrAwCUR2alLaV5xm/
 NyuGC64/eoRoFM=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Dave,

On 11/4/21 18:57, John David Anglin wrote:
> On 2021-11-03 5:08 p.m., Helge Deller wrote:
>> On 11/3/21 21:12, John David Anglin wrote:
>>> I think the real problem is that neither flush_kernel_vmap_range() or
>>> invalidate_kernel_vmap_range() flush the icache.=C2=A0 They only opera=
te
>>> on the data cache. flush_icache_range will flush both caches.
>> Yes.
>> But we write the new instructions to a congruently memory are (same
>> physical memory like the kernel code), then flush/invalidate the
>> D-Cache, and finally flush the I-cache of kernel code memory.
>> See last function call of __patch_text_multiple().
>>
>> So, logically I think it should work (and it does on PA2.x).
>
> I still believe it is incorrect to use invalidate_kernel_vmap_range() to=
 flush the writes in
> __patch_text_multiple() to memory.=C2=A0 Both the PA 1.1 and 2.0 archite=
cture documents state that
> it is implementation dependent whether pdc writes back dirty lines to me=
mory at priority 0.
> If the writes are not flushed to memory, the patch won't install.
>
>> Or do you mean to flush the I-Cache of both mappings?
>
> I reviewed the flush operations in __patch_text_multiple().=C2=A0 I beli=
eve the current code is more or
> less correct, but not optimal.=C2=A0 I believe the final call to flush_i=
cache_range() is unnecessary.=C2=A0 We
> can also eliminate one range flush in the calls to make sure we don't ha=
ve any aliases in the cache.
> See change attached below.
>
> The big problem with __patch_text_multiple() is can only patch code that=
 the patch code doesn't depend
> on.=C2=A0 This line in __patch_text_multiple() will cause a TLB fault on=
 the first execution after a new
> patch_map is setup. We do alternative patching to the TLB handler when A=
LT_COND_NO_SMP is true.

I believe the alternative code patching isn't critical.
It just patches in NOPs, so even if the newly patched NOPs aren't visible =
yet (when the TLB handler is
executed), it uses the old instructions which shouldn't harm anything. The=
y were executed before the
whole time.

I do agree, that patching other code paths (with non-NOPs) could be critia=
l.

By the way, to narrow down the problem, I do boot those tests here with th=
e "no-alternatives"
kernel parameter, which effectively disables the alternatives-patching.

> For example,
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .macro=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptl_lock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 spc,ptp,pte,tmp,tmp1,fault
> #ifdef CONFIG_TLB_PTLOCK
> 98:=C2=A0=C2=A0=C2=A0=C2=A0 cmpib,COND(=3D),n 0,\spc,2f
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_ptl=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \tmp
> 1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LDCW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0(\tmp),\tmp1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmpib,COND(=3D)=C2=A0=C2=A0 0=
,\tmp1,1b
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nop
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LDREG=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0(\ptp),\pte
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb,<,n=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \pte,_PAGE_PRESENT_BIT,3f
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \fault
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stw=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \spc,0(\tmp)
> 99:=C2=A0=C2=A0=C2=A0=C2=A0 ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_=
NOP)
> #endif
> 2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LDREG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0(\ptp),\pte
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb,>=3D,n=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \pte,_PAGE_PRESENT_BIT,\fault
> 3:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .endm
>
> If the region being patched spans a page boundary, we will get a TLB fau=
lt with partially patched TLB
> code.=C2=A0 I suspect something like this is the real issue with the fix=
map code.
>
> Maybe this could be avoided by patching in a "b,n 99f" instruction at 98=
b.=C2=A0 That would avoid patching
> in multiple nop instructions.

It's already being done that way. See alternative.c:
                /*
                 * Replace instruction with NOPs?
                 * For long distance insert a branch instruction instead.
                 */
                if (replacement =3D=3D INSN_NOP && len > 1)
                        replacement =3D 0xe8000002 + (len-2)*8; /* "b,n .+=
8" */

>>> On 2021-10-31 5:14 p.m., Helge Deller wrote:
>>>> On PA1.x machines it's not sufficient to just flush the data and
>>>> instruction caches when we have written new instruction codes into th=
e
>>>> parallel mapped memory segment, but we really need to invalidate (pur=
ge)
>>>> the cache too. Otherwise the processor will still execute the old
>>>> instructions which are still in the data/instruction cache.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> Fixes: 4e87ace902cf ("parisc: add support for patching multiple words=
")
>>>> Cc: stable@vger.kernel.org # v5.3+
>>>>
>>>> diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
>>>> index 80a0ab372802..8cbb7e1d5a2b 100644
>>>> --- a/arch/parisc/kernel/patch.c
>>>> +++ b/arch/parisc/kernel/patch.c
>>>> @@ -81,7 +81,7 @@ void __kprobes __patch_text_multiple(void *addr, u3=
2 *insn, unsigned int len)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * We're crossing a page boundary, so
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * need to remap
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
lush_kernel_vmap_range((void *)fixmap,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
nvalidate_kernel_vmap_range((void *)fixmap,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (p-fixmap) * sizeof(*p));
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (mapped)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch_unmap(FIX_TEXT_POKE0, &flags=
);
>>>> @@ -90,9 +90,10 @@ void __kprobes __patch_text_multiple(void *addr, u=
32 *insn, unsigned int len)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>
>>>> -=C2=A0=C2=A0=C2=A0 flush_kernel_vmap_range((void *)fixmap, (p-fixmap=
) * sizeof(*p));
>>>> +=C2=A0=C2=A0=C2=A0 invalidate_kernel_vmap_range((void *)fixmap, (p-f=
ixmap) * sizeof(*p));
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mapped)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch_un=
map(FIX_TEXT_POKE0, &flags);
>>>> +=C2=A0=C2=A0=C2=A0 invalidate_kernel_vmap_range((void *)start, end -=
 start);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_icache_range(start, end);
>>
>
> ---
> diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
> index 80a0ab372802..799795bc4210 100644
> --- a/arch/parisc/kernel/patch.c
> +++ b/arch/parisc/kernel/patch.c
> @@ -67,8 +67,8 @@ void __kprobes __patch_text_multiple(void *addr, u32 *=
insn, unsigned int len)
> =C2=A0=C2=A0=C2=A0=C2=A0 int mapped;
>
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Make sure we don't have any aliases in cache=
 */
> -=C2=A0=C2=A0=C2=A0 flush_kernel_vmap_range(addr, len);
> =C2=A0=C2=A0=C2=A0=C2=A0 flush_icache_range(start, end);
> +=C2=A0=C2=A0=C2=A0 flush_tlb_kernel_range(start, end);
>
> =C2=A0=C2=A0=C2=A0=C2=A0 p =3D fixmap =3D patch_map(addr, FIX_TEXT_POKE0=
, &flags, &mapped);
>
> @@ -93,7 +93,6 @@ void __kprobes __patch_text_multiple(void *addr, u32 *=
insn, unsigned int len)
> =C2=A0=C2=A0=C2=A0=C2=A0 flush_kernel_vmap_range((void *)fixmap, (p-fixm=
ap) * sizeof(*p));
> =C2=A0=C2=A0=C2=A0=C2=A0 if (mapped)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch_unmap(FIX_TEXT_PO=
KE0, &flags);
> -=C2=A0=C2=A0=C2=A0 flush_icache_range(start, end);
> =C2=A0}
>
> =C2=A0void __kprobes __patch_text(void *addr, u32 insn)

Here is the syslog with your patch on the 715/64:
...
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 148832K/163840K available (8452K kernel code, 1461K rwdata, 2379K =
rodata, 696K init, 444K bss, 15008K reserved, 0K cma-reserved)
ftrace: allocating 26912 entries in 53 pages
Backtrace:
 [<1097d588>] __patch_text+0x20/0x30
 [<101c5128>] ftrace_make_nop+0x3c/0x68
 [<102c98a8>] ftrace_process_locs.isra.0+0x208/0x2b0
 [<10113ba0>] ftrace_init+0xa8/0x154
 [<10101284>] start_kernel+0x3d0/0x708
 [<10105244>] start_parisc+0xb8/0xec

Bad Address (null pointer deref?): Code=3D15 (Data TLB miss fault) at addr=
 0effe310
CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-32bit+ #1017
Hardware name: 9000/715

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011000000001100001110 Not tainted
r00-03  000c030e 10c7cda8 1097d474 10c67340
r04-07  10100314 00000000 10c672dc 10c7d328
r08-11  00000000 00000000 10cbe5a8 00000000
r12-15  10c75da8 10b2f800 10d7d5a8 00000001
r16-19  00000000 00000002 00000000 08000240
r20-23  10c67000 00000200 10100500 00000020
r24-27  0efff000 0efff000 0effe310 10b915a8
r28-31  0effe310 00000000 10c673c0 10279a68
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1097d4e4 1097d480
 IIR: 0f9312a8    ISR: 00000000  IOR: 0effe310
 CPU:        0   CR30: 10c67000 CR31: f00effff
 ORIG_R28: 00000000
 IAOQ[0]: __patch_text_multiple+0xdc/0x12c
 IAOQ[1]: __patch_text_multiple+0x78/0x12c
 RP(r2): __patch_text_multiple+0x6c/0x12c
Backtrace:
 [<1097d588>] __patch_text+0x20/0x30
 [<101c5128>] ftrace_make_nop+0x3c/0x68
 [<102c98a8>] ftrace_process_locs.isra.0+0x208/0x2b0
 [<10113ba0>] ftrace_init+0xa8/0x154
 [<10101284>] start_kernel+0x3d0/0x708
 [<10105244>] start_parisc+0xb8/0xec
Kernel panic - not syncing: Bad Address (null pointer deref?)

Helge
