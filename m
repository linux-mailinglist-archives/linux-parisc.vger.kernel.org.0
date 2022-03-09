Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E7A4D389D
	for <lists+linux-parisc@lfdr.de>; Wed,  9 Mar 2022 19:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbiCISVF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Mar 2022 13:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiCISVE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Mar 2022 13:21:04 -0500
Received: from cmx-torrgo001.bell.net (mta-tor-002.bell.net [209.71.212.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F2E5639A
        for <linux-parisc@vger.kernel.org>; Wed,  9 Mar 2022 10:20:04 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 62280491000EB1C6
X-CM-Envelope: MS4xfCr+qJtubSRidTLyzgf0r0eGV0Jl6b8yVI6izs9Af/p7CSLv8l81urwSECijJNL7/HCqzd0iZDK0XyRYKuH2jJJeMcLeOEFOSca62soRt8b97drqNMeV
 OXS5cORraT91HQxifeT5NgAG5TR2LHCDpnes6caLuyL/xJD85We758miIIA/z5PSVU2FeEEMsVcbM91V4d1F/2oWxDTD1vO779boMYFIro/QVtDvP2PDH+VP
 HmqQsobFDK4VEQO/hfG412f/NTyiixVEslP2jZ94jOA=
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=6228efcb
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=JMq-J-73gsJ-WyNDAaAA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 62280491000EB1C6; Wed, 9 Mar 2022 13:19:55 -0500
Message-ID: <5ef70cab-60fe-7243-c200-f54237c8efa5@bell.net>
Date:   Wed, 9 Mar 2022 13:19:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: support for DEBUG_VM_PGTABLE
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <2621439.mvXUDI8C0e@eto.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <2621439.mvXUDI8C0e@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-03-09 9:56 a.m., Rolf Eike Beer wrote:
> Some recent patches made me aware of DEBUG_VM_PGTABLE. Has anyone tried to get
> this working on hppa? Given the constant problems with caches and memory it
> may help find some subtle bugs in the code.
I haven't tried DEBUG_VM_PGTABLE but I think our cache problems stem from this code in entry.S:

         /*
          * Non access misses can be caused by fdc,fic,pdc,lpa,probe and
          * probei instructions. We don't want to fault for these
          * instructions (not only does it not make sense, it can cause
          * deadlocks, since some flushes are done with the mmap
          * semaphore held). If the translation doesn't exist, we can't
          * insert a translation, so have to emulate the side effects
          * of the instruction. Since we don't insert a translation
          * we can get a lot of faults during a flush loop, so it makes
          * sense to try to do it here with minimum overhead. We only
          * emulate fdc,fic,pdc,probew,prober instructions whose base
          * and index registers are not shadowed. We defer everything
          * else to the "slow" path.
          */

         mfctl           %cr19,%r9 /* Get iir */

         /* PA 2.0 Arch Ref. Book pg 382 has a good description of the insn bits.
            Checks for fdc,fdce,pdc,"fic,4f",prober,probeir,probew, probeiw */

         /* Checks for fdc,fdce,pdc,"fic,4f" only */
         ldi             0x280,%r16
         and             %r9,%r16,%r17
         cmpb,<>,n       %r16,%r17,nadtlb_probe_check
         bb,>=,n         %r9,26,nadtlb_nullify  /* m bit not set, just nullify */
         ...

What the code is doing is nullifying cache flush/purge instructions when we take a non-access data
TLB fault.  When this happens, the cache line is not invalidated.

We get these faults then the _PAGE_PRESENT_BIT is not set in the PTE.  For example, the bit won't be
set for text that hasn't been loaded from disk.

This occurs quite frequently.  For example, with nullification disabled,

Kernel Fault: Code=17 (Non-access DTLB miss fault) at addr 00000000001d7000
CPU: 0 PID: 1 Comm: init Not tainted 5.16.12+ #3
Hardware name: 9000/800/rp3440

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000010000001111 Not tainted
r00-03  000000000804040f 0000000040cd3000 0000000040208974 000000004b615060
r04-07  0000000040b5e860 00000000001d7000 00000000001dd000 000000004bcd7f78
r08-11  000000004bcd7f88 000000004b614d80 00000000001dd000 000000004bcd7ae8
r12-15  0000000000000000 000000004b614ba0 000000004df79a38 000000004bcd7a40
r16-19  00000000001d7000 000000004bcd7f38 000000004b614bd8 0000000000094c00
r20-23  0000000000000000 0000000000000800 00000000001d8000 0000000000000080
r24-27  00000000001d7000 00000000001dd000 00000000001d7000 0000000040b5e860
r28-31  0000000040b27500 000000004b6150d0 000000004b615100 0000000000094c00
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000094c00
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004020074c 0000000040200750
  IIR: 0757d2a0    ISR: 0000000000094c00  IOR: 00000000001d7000
  CPU:        0   CR30: 000000004b598af0 CR31: ffffffffffffffff
  ORIG_R28: 000000004b843678
  IAOQ[0]: flush_user_dcache_range_asm+0x20/0x78
  IAOQ[1]: flush_user_dcache_range_asm+0x24/0x78
  RP(r2): flush_user_cache_tlb.isra.0+0x5c/0xe0
Backtrace:
  [<0000000040208974>] flush_user_cache_tlb.isra.0+0x5c/0xe0
  [<0000000040209288>] flush_cache_range+0x128/0x148
  [<000000004041c880>] unmap_page_range+0xb8/0xc08
  [<000000004041d438>] unmap_single_vma+0x68/0x130
  [<000000004041d940>] unmap_vmas+0x70/0xb0
  [<0000000040427e20>] unmap_region+0x108/0x1b0
  [<000000004042ab9c>] __do_munmap+0x264/0x5e8
  [<000000004042afd0>] __vm_munmap+0xb0/0x138
  [<000000004042b084>] vm_munmap+0x2c/0x40
  [<0000000040552410>] elf_map+0xd8/0x198
  [<0000000040554c48>] load_elf_binary+0xb40/0x14c0
  [<00000000404a499c>] exec_binprm+0x23c/0x630
  [<00000000404a4fdc>] bprm_execve+0x24c/0x360
  [<00000000404a7468>] kernel_execve+0x1f0/0x2b8
  [<0000000040a990e4>] run_init_process+0x164/0x198
  [<0000000040ab4664>] kernel_init+0x184/0x340
  [<0000000040202020>] ret_from_kernel_thread+0x20/0x28

flush_user_cache_tlb() uses flush_user_dcache_range_asm() and flush_user_icache_range_asm().
These flush routines use the normal PTE entries setup to control user access.

I believe the easiest fix is to use the tmp alias flush routines (flush_cache_pages).  They set up a
special PTE for the flush.  As long as we have a PTE, it corresponds to a physical page.  The cache
lines can be invalidated even when data hasn't been loaded from storage.

Dave

-- 
John David Anglin  dave.anglin@bell.net

