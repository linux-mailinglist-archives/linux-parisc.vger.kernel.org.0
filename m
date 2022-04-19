Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51D4F507BED
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Apr 2022 23:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356416AbiDSVch (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Apr 2022 17:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346877AbiDSVcf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Apr 2022 17:32:35 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 13BFB2BF2
        for <linux-parisc@vger.kernel.org>; Tue, 19 Apr 2022 14:29:50 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 625E36C0001A06EC
X-CM-Envelope: MS4xfORFlY7SCYdZkdBJ5hJgmCB+vHuF12EhocotFWjx8/3M4diHPaPVKuMxpmx3EBIRsV4B/m0MYVwfkfEu1ZPQ8BFQHGofloVorOU1PmtZqTkHuq47FiH8
 u6hcncDvlI6QCpEPriX3fNK6/FjQoryuefOCLFtPOYEzAW/Uwlga8pRghs/E0RVx3Ozeg8+jxDcimLN+7cXkHADyB2gGYiE4c8VeDTR0727304FwUXwLubyU
 ApiSnOnFFAHo/iw6zOXk8KWNyvKgdiCMyXQdm6a8sIuaC1Kcqkjeb56c3Q9ezCS9
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=625f29c4
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=7mOBRU54AAAA:8 a=FBHGMhGWAAAA:8 a=VwQbUJbxAAAA:8
 a=76KX60c3PxLY-ahuXUUA:9 a=QEXdDO2ut3YA:10 a=wa9RWnbW_A1YIeRBVszw:22
 a=9gvnlMMaQFpL9xblJ6ne:22 a=AjGcO6oz07-iQ99wixmX:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 625E36C0001A06EC; Tue, 19 Apr 2022 17:29:40 -0400
Message-ID: <7a25a890-461b-0ba4-0b77-57d639de0007@bell.net>
Date:   Tue, 19 Apr 2022 17:29:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
To:     Sam James <sam@gentoo.org>
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
 <94439119-D2B6-4961-B61D-95784E09798D@gentoo.org>
 <cb19a0a0-69b2-ab14-7767-a0cd7bd671b0@bell.net>
 <383d6dfa-bef1-e56f-8f82-dfc0682cdacc@bell.net>
 <93BE3A28-6EBE-4DC4-92BE-867E7ACB255B@gentoo.org>
 <FD03A5C5-9B87-4117-9FFF-545E31668AD0@gentoo.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <FD03A5C5-9B87-4117-9FFF-545E31668AD0@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-04-19 3:52 p.m., Sam James wrote:
>
>> On 13 Apr 2022, at 00:45, Sam James <sam@gentoo.org> wrote:
>>
>>
>>
>>> On 12 Apr 2022, at 14:20, John David Anglin <dave.anglin@bell.net> wrote:
>>>
>>> On 2022-04-12 8:27 a.m., John David Anglin wrote:
>>>> On 2022-04-12 1:18 a.m., Sam James wrote:
>>>>>>> Mar 22 04:19:55 muta.hppa.dev.gentoo.org kernel: INEQUIVALENT ALIASES 0x411ee000 and 0x428c9000 in file bash
>>>>>>> ```
>>>>>> It seems all these messages result from a single call to flush_dcache_page. Note the sequential behavior of old_addr
>>>>>> and addr, and message times.
>>>>> FWIW, from Helge's config on 5.10.108 (config changes on my end: just disabling unneeded devices to speed up build), I have the same
>>>>> horrible wall:
>>>> This change might help:
>>>> https://lore.kernel.org/linux-parisc/YlNw8jzP9OQRKvlV@mx3210.localdomain/T/#u
>>>>
>>>> It applies on top of Helge's current for-next tree which is based on 5.18.0-rc1+.
>>>>
>>>> The messages will no longer appear with this patch on c8000/rp34xx. However, the loop corruption
>>>> might still occur. If that happens, I think the stall detector will trigger, or maybe some other crash.
>>>>
>>>> The loop is changed to flush all mount points on machines with PA8800 or PA8900 processors as I
>>>> believe these CPUs don't support equivalent aliases.
>>> Thousands of messages aren't useful. I would suggest adding a BUG_ON statement in the loop that
>>> triggers on the first message. That might help find the circumstances that cause the problem.
>>>
>> Your change *seems* to have prevented the "bad wall"! But now we get some silent runtime corruption
>> and binaries crashing (5.18.0_rc2 + for-next + your patch).
>>
>> So this seems like a good improvement given those crashes happened previously too, although maybe
>> less often.
>>
>> Not sure how to get more debugging info yet, there is nothing helpful in dmesg (no messages at all when
>> it happens). Suggestions (given it is not hitting that loop)?
> Spoke slightly too soon: processes dying / corruption happened with v1, and we maybe got a bit longer out of v2,
> but then issues started again (processes dying, nothing in dmesg).
>
> Once the "bad state" happens, the system is generally unreliable. I tried to upgrade man-db and then I got
> a gcc ICE:
> ```
> /bin/sh ../../libtool  --tag=CC   --mode=compile hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../..  -DDEFAULT_TEXT_DOMAIN=\"man-db-gnulib\"   -Wno-cast-qual -Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef -Wno-unused-function -Wno-unused-parameter -Wno-float-conversion -Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion -Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=2.0 -Wall -c -o glthread/libgnu_la-threadlib.lo `test -f 'glthread/threadlib.c' || echo './'`glthread/threadlib.c
> /bin/sh ../../libtool  --tag=CC   --mode=compile hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../..  -DDEFAULT_TEXT_DOMAIN=\"man-db-gnulib\"   -Wno-cast-qual -Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef -Wno-unused-function -Wno-unused-parameter -Wno-float-conversion -Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion -Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=2.0 -Wall -c -o libgnu_la-timespec.lo `test -f 'timespec.c' || echo './'`timespec.c
> during RTL pass: reload
> In file included from regex.c:74:
> regcomp.c: In function ‘parse_expression’:
> regcomp.c:2421:1: internal compiler error: Segmentation fault
>   2421 | }
>        | ^
> libtool: compile:  hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../.. -DDEFAULT_TEXT_DOMAIN=\"man-db-gnulib\" -Wno-cast-qual -Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef -Wno-unused-function -Wno-unused-parameter -Wno-float-conversion -Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion -Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=2.0 -Wall -c glthread/threadlib.c  -fPIC -DPIC -o glthread/.libs/libgnu_la-threadlib.o
> libtool: compile:  hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../.. -DDEFAULT_TEXT_DOMAIN=\"man-db-gnulib\" -Wno-cast-qual -Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef -Wno-unused-function -Wno-unused-parameter -Wno-float-conversion -Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion -Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=2.0 -Wall -c timespec.c  -fPIC -DPIC -o .libs/libgnu_la-timespec.o
> /bin/sh ../../libtool  --tag=CC   --mode=compile hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../..  -DDEFAULT_TEXT_DOMAIN=\"man-db-gnulib\"   -Wno-cast-qual -Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef -Wno-unused-function -Wno-unused-parameter -Wno-float-conversion -Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion -Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=2.0 -Wall -c -o libgnu_la-unistd.lo `test -f 'unistd.c' || echo './'`unistd.c
> /bin/sh ../../libtool  --tag=CC   --mode=compile hppa2.0-unknown-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../..  -DDEFAULT_TEXT_DOMAIN=\"man-db-gnulib\"   -Wno-cast-qual -Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef -Wno-unused-function -Wno-unused-parameter -Wno-float-conversion -Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion -Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -march=2.0 -Wall -c -o libgnu_la-dup-safer.lo `test -f 'dup-safer.c' || echo './'`dup-safer.c
> 0xf61f7313 __libc_start_call_main
>          ../sysdeps/nptl/libc_start_call_main.h:58
> 0xf61f746f __libc_start_main_impl
>          /var/tmp/portage/sys-libs/glibc-2.34-r11/work/glibc-2.34/csu/libc-start.c:409
> Please submit a full bug report,
> with preprocessed source if appropriate.
> Please include the complete backtrace with any bug report.
> See <https://bugs.gentoo.org/> for instructions.
> make[4]: *** [Makefile:3664: libgnu_la-regex.lo] Error 1
> make[4]: *** Waiting for unfinished jobs....
> ```
>
> (I don't anticipate this being a genuine ICE, as it only happens when the system becomes "tainted", and is not reproducible after reboots during normal activity.)
Yes, these compiler failures are almost never reproducible.  It's only guess work on my part
that these faults are a result of problems with cache flushing.  We know that the PDC call to
determine cache characteristics indicates that the alias boundary on PA8800/PA8900 is larger
than 16 MB.  Flushing via the user mapping avoids the using the tmpalias flushes and the
question as to what the true alias boundary is on PA8800/PA8900.  It might be that using
64 MB works fine on PA8800/PA8900.  I haven't tested this alternative to any great extent.

There are a couple of issues that aren't addressed by change:
1) The patch does not changed the SMBLBA.  It remains at 4 MB.  This could be a problem
for shared mappings.

2) The flush in copy_user_page remains a tmpalias flush since there is no easy way to access
the context (vma/mm) for the flush.

3) In the following flushes,

#define copy_to_user_page(vma, page, vaddr, dst, src, len) \
do { \
         flush_cache_page(vma, vaddr, page_to_pfn(page)); \
         memcpy(dst, src, len); \
         flush_kernel_dcache_range_asm((unsigned long)dst, (unsigned long)dst + l
en); \
} while (0)

#define copy_from_user_page(vma, page, vaddr, dst, src, len) \
do { \
         flush_cache_page(vma, vaddr, page_to_pfn(page)); \
         memcpy(dst, src, len); \
} while (0)

I sometimes see the following fault,

BUG: nullifying cache flush/purge instruction
CPU: 2 PID: 866 Comm: systemd-journal Not tainted 5.18.0-rc1+ #1
Hardware name: 9000/800/rp3440

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000010000001111 Not tainted
r00-03  000000000804040f 0000000040d66000 0000000040208758 000000007f9c0690
r04-07  0000000040be2680 00000000f7dee000 000000004eea5238 00000000000006be
r08-11  00000000000d7c00 000000003f77d000 00000000f7def000 00000000602a4000
r12-15  0000000058110dd0 0000000040c86680 0000000040c20e80 0000000040c20e80
r16-19  0000000040c20e80 0000000040c34680 0000000040c20e80 000000000800000f
r20-23  ffffffffc0000000 0000000000000800 00000000f7def000 0000000000000080
r24-27  00000000000202a4 00000000f7def000 00000000f7dee000 0000000040be2680
r28-31  0000000040baa9a0 000000007f9c0710 000000007f9c0740 000000002be2f000
sr00-03  00000000000d7c00 00000000013a5400 0000000000000000 00000000013a5400
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040200758 000000004020075c
  IIR: 0757d2a0    ISR: 00000000013a5400  IOR: 00000000f7dee000
  CPU:        2   CR30: 000000004c510ec0 CR31: ffffffffffffffff
  ORIG_R28: 000000000000a206
  IAOQ[0]: flush_user_dcache_range_asm+0x20/0x78
  IAOQ[1]: flush_user_dcache_range_asm+0x24/0x78
  RP(r2): flush_user_cache_page+0xb0/0x1e8
Backtrace:
  [<0000000040208758>] flush_user_cache_page+0xb0/0x1e8
  [<000000004020a130>] flush_cache_page+0x120/0x1f0
  [<0000000040442b54>] __access_remote_vm+0x49c/0x568
  [<0000000040442d3c>] access_remote_vm+0x2c/0x40
  [<00000000405a2afc>] get_mm_cmdline+0x244/0x490
  [<00000000405a5314>] proc_pid_cmdline_read+0xcc/0x200
  [<00000000404bd510>] vfs_read+0x88/0x1e0
  [<00000000404bdad8>] ksys_read+0xa0/0x188
  [<00000000404bdbec>] sys_read+0x2c/0x40
  [<0000000040203e30>] syscall_exit+0x0/0x10

when the flush is done using the vma.  It appears that the pte_val is sometimes garbage.  I haven't
seen this in any other flushes.

Dave

-- 
John David Anglin  dave.anglin@bell.net

