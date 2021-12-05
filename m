Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1DCC468D03
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Dec 2021 20:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237920AbhLEThU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Dec 2021 14:37:20 -0500
Received: from mta-tor-001.bell.net ([209.71.212.28]:53000 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237544AbhLEThU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Dec 2021 14:37:20 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 619764870179EF17
X-CM-Envelope: MS4xfDGJ2ipt7h8BLDfuyxwYAb/Ug8CP/+heKo5t3wZidvwP6NQS+sWZLJurjoYQkJA7C/pkvhqADqWWHxpVjG5+m0+NMbLaC1H3LIIRQHVeVhCAq3GlJysy
 aLWYrM0dtkLiRZgbzyxzXk1i6BDQnrrOm4qIZOhEfyH4XmbjjDNkiUCSy/EUdXh8m3qavEuaFtiQfRTuTratvkjy8CYSP3rGi6sdXVm8tCFFhdeM84hqv6PY
 q7/8DM8HfpOsp9lmYZydCKvrfQBogOWu+028sQcVzGY=
X-CM-Analysis: v=2.4 cv=W7Vb6Tak c=1 sm=1 tr=0 ts=61ad141e
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=nb_b8gjwXp6GjvWyS3UA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 619764870179EF17; Sun, 5 Dec 2021 14:33:50 -0500
Message-ID: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
Date:   Sun, 5 Dec 2021 14:33:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Subject: Your System ate a SPARC! Gah! in map_pages()
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I'm seeing this on rp3440 fairly frequently.  Must have something to do with memory as it
doesn't seem to happen on my c8000.

Freeing initrd memory: 20980K
       _______________________________
      < Your System ate a SPARC! Gah! >
       -------------------------------
              \   ^__^
                  (__)\       )\/\
                   U  ||----w |
                      ||     ||
swapper/0 (pid 1): Protection id trap (code 7)
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.21+ #1
Hardware name: 9000/800/rp3440

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001101111111100001111 Not tainted
r00-03  000000ff0806ff0f 0000000040bf9180 0000000040ab40b8 000000004b618280
r04-07  0000000040b5c980 0000000000194000 0000000040f8c800 0000000040193000
r08-11  0000000040f90000 0000000000000800 0000000000200000 0000000000100000
r12-15  0000000000e00000 0000000000200000 0000000040b79180 0000000000000001
r16-19  0000000040bf9980 0000000040b79180 0000000000000001 0000000000000000
r20-23  0000000000000008 0000000000000323 0000000000193323 0000000000000323
r24-27  0000000000000001 0000000000000400 0000000040100000 0000000040b5c980
r28-31  0000000040f8fca0 000000004b618250 000000004b618390 0000000040f8e000
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004010765c 0000000040107660
  IIR: 43ffff40    ISR: 0000000000000000  IOR: 0000000000000000
  CPU:        0   CR30: 000000004b618000 CR31: ffffffffffffffff
  ORIG_R28: 000000004b618570
  IAOQ[0]: map_pages+0x2fc/0x378
  IAOQ[1]: map_pages+0x300/0x378
  RP(r2): free_initmem+0xf8/0x210
Backtrace:
  [<0000000040ab40b8>] free_initmem+0xf8/0x210
  [<0000000040ab3d28>] kernel_init+0xa0/0x338
  [<0000000040202020>] ret_from_kernel_thread+0x20/0x28

CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.21+ #1
Hardware name: 9000/800/rp3440
Backtrace:
  [<000000004020a3a0>] show_stack+0x70/0x90
  [<0000000040aadf98>] dump_stack_lvl+0xd8/0x128
  [<0000000040aae01c>] dump_stack+0x34/0x48
  [<000000004020a5e4>] die_if_kernel+0x204/0x430
  [<000000004020afd8>] handle_interruption+0x550/0xc78
  [<0000000040203080>] intr_check_sig+0x0/0x3c

    10574:       43 ff ff 40     ldb 1fa0(sr3,r31),r31

     4010765c:   bd 1c 3e 7d     cmpb,*<> ret0,r8,401075a0 <map_pages+0x240>
     40107660:   34 e7 20 00     ldo 1000(r7),r7

0000000040ab3fc0 <free_initmem>:
     40ab3fc0:   08 03 02 41     copy r3,r1
     40ab3fc4:   0f c2 12 c1     std rp,-10(sp)
     40ab3fc8:   08 1e 02 43     copy sp,r3
     40ab3fcc:   73 c1 01 68     std,ma r1,b0(sp)
     40ab3fd0:   2b 6e a0 00     addil L%9d000,dp,r1
     40ab3fd4:   08 01 02 5c     copy r1,ret0
     40ab3fd8:   2b 6e a0 00     addil L%9d000,dp,r1
     40ab3fdc:   70 66 00 50     std r6,28(r3)
     40ab3fe0:   50 26 09 00     ldd 480(r1),r6
     40ab3fe4:   70 65 00 60     std r5,30(r3)
     40ab3fe8:   2b 6e a0 00     addil L%9d000,dp,r1
     40ab3fec:   53 85 01 e0     ldd f0(ret0),r5
     40ab3ff0:   08 01 02 5c     copy r1,ret0
     40ab3ff4:   0c 6a 12 d0     std r10,8(r3)
     40ab3ff8:   34 1f 00 02     ldi 1,r31
     40ab3ffc:   2b 6e 10 00     addil L%1c800,dp,r1
     40ab4000:   70 69 00 20     std r9,10(r3)
     40ab4004:   34 0a 06 46     ldi 323,r10
     40ab4008:   08 06 02 5a     copy r6,r26
     40ab400c:   70 68 00 30     std r8,18(r3)
     40ab4010:   53 88 08 80     ldd 440(ret0),r8
     40ab4014:   08 0a 02 57     copy r10,r23
     40ab4018:   08 c8 04 18     sub r8,r6,r24
     40ab401c:   70 67 00 40     std r7,20(r3)
     40ab4020:   50 3c 03 90     ldd 1c8(r1),ret0
     40ab4024:   37 dd 3f a1     ldo -30(sp),ret1
     40ab4028:   20 e0 08 01     ldil L%-40000000,r7
     40ab402c:   70 64 00 70     std r4,38(r3)
     40ab4030:   08 e6 0a 19     add,l r6,r7,r25
     40ab4034:   08 1b 02 44     copy dp,r4
     40ab4038:   0f 9f 12 00     stb r31,0(ret0)
     40ab403c:   34 16 00 00     ldi 0,r22
     40ab4040:   00 00 14 a1     mfia r1
     40ab4044:   28 29 6f ed     addil L%-9ad000,r1,r1
     40ab4048:   34 21 06 40     ldo 320(r1),r1
     40ab404c:   e8 20 f0 00     bve,l (r1),rp
     40ab4050:   08 a6 04 09     sub r6,r5,r9
     40ab4054:   08 e5 0a 07     add,l r5,r7,r7
     40ab4058:   08 04 02 5b     copy r4,dp
     40ab405c:   08 05 02 5a     copy r5,r26
     40ab4060:   08 09 02 58     copy r9,r24
     40ab4064:   08 07 02 59     copy r7,r25
     40ab4068:   37 dd 3f a1     ldo -30(sp),ret1
     40ab406c:   08 1b 02 44     copy dp,r4
     40ab4070:   34 16 00 02     ldi 1,r22
     40ab4074:   00 00 14 a1     mfia r1
     40ab4078:   28 29 6f ed     addil L%-9ad000,r1,r1
     40ab407c:   34 21 05 d8     ldo 2ec(r1),r1
     40ab4080:   e8 20 f0 00     bve,l (r1),rp
     40ab4084:   34 17 06 4e     ldi 327,r23
     40ab4088:   34 16 00 02     ldi 1,r22
     40ab408c:   08 0a 02 57     copy r10,r23
     40ab4090:   08 04 02 5b     copy r4,dp
     40ab4094:   08 05 02 5a     copy r5,r26
     40ab4098:   08 09 02 58     copy r9,r24
     40ab409c:   08 07 02 59     copy r7,r25
     40ab40a0:   37 dd 3f a1     ldo -30(sp),ret1
     40ab40a4:   00 00 14 a1     mfia r1
     40ab40a8:   28 29 6f ed     addil L%-9ad000,r1,r1
     40ab40ac:   34 21 05 78     ldo 2bc(r1),r1
     40ab40b0:   e8 20 f0 00     bve,l (r1),rp
     40ab40b4:   08 1b 02 44     copy dp,r4
     40ab40b8:   08 04 02 5b     copy r4,dp

Looks like fault occurs in third call to map_pages():

void __ref free_initmem(void)
{
         unsigned long init_begin = (unsigned long)__init_begin;
         unsigned long init_end = (unsigned long)__init_end;
         unsigned long kernel_end  = (unsigned long)&_end;

         /* Remap kernel text and data, but do not touch init section yet. */
         kernel_set_to_readonly = true;
         map_pages(init_end, __pa(init_end), kernel_end - init_end,
                   PAGE_KERNEL, 0);

         /* The init text pages are marked R-X.  We have to
          * flush the icache and mark them RW-
          *
          * This is tricky, because map_pages is in the init section.
          * Do a dummy remap of the data section first (the data
          * section is already PAGE_KERNEL) to pull in the TLB entries
          * for map_kernel */
         map_pages(init_begin, __pa(init_begin), init_end - init_begin,
                   PAGE_KERNEL_RWX, 1);
         /* now remap at PAGE_KERNEL since the TLB is pre-primed to execute
          * map_pages */
         map_pages(init_begin, __pa(init_begin), init_end - init_begin,
                   PAGE_KERNEL, 1);

         /* force the kernel to see the new TLB entries */
         __flush_tlb_range(0, init_begin, kernel_end);

         /* finally dump all the instructions which were cached, since the
          * pages are no-longer executable */
         flush_icache_range(init_begin, init_end);

         free_initmem_default(POISON_FREE_INITMEM);

         /* set up a new led state on systems shipped LED State panel */
         pdc_chassis_send_status(PDC_CHASSIS_DIRECT_BCOMPLETE);
}

Dave

-- 
John David Anglin  dave.anglin@bell.net

