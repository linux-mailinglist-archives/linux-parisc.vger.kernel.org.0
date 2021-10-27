Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B95A43D16E
	for <lists+linux-parisc@lfdr.de>; Wed, 27 Oct 2021 21:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhJ0TM0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 27 Oct 2021 15:12:26 -0400
Received: from mout.gmx.net ([212.227.17.22]:59699 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240552AbhJ0TM0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 27 Oct 2021 15:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635361799;
        bh=6yUAuwF4CBUqbXE6KzrCDY09fm3eoWVjrieq6I5JiPA=;
        h=X-UI-Sender-Class:Date:To:From:Subject;
        b=QNR9Z1zWrdALKoQnOwcbBCrncu2KMc9VhGQ0ye0G9+3T19DetXWcmKuQg8LwVtxLH
         Gax2DesRooxr5kuRxfBwvb9GDD42WSgaTlULfNEVOWGQ2Li2mTj/V76QycmN8JXVwo
         TQGN8/LZwTvRlkJ35YpHL8QozEFEWvlkQzA64MSs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.180.142]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1mkg3Z1fko-014k99; Wed, 27
 Oct 2021 21:09:59 +0200
Message-ID: <3b8410fd-f688-862f-3c3c-7ccf5d523075@gmx.de>
Date:   Wed, 27 Oct 2021 21:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
From:   Helge Deller <deller@gmx.de>
Subject: fixmap problem on PA11 hardware
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J+S+gf0UrRfD5kj3WJMHdmR87ZrzMIswE/cn/5zeHbosruqU3c5
 lHyLUyyL5XWx5p1bEsWDSODeQhh0dOqXgIZteTDBpxGg5ZNsZGBVyZn8QuO8n1Hhe2dg9JC
 eM1Sl9skZduUhq9OyJ7htEO3hjv7SC5rI3XHiiMTDAE8Tja9mo0HN5ObWkPCeqbDU3VJrMO
 aNoRj8uIZJJXe9NIGPGLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wvqn5Pvf27U=:5jIbfbsKzIifiQALd5KxI+
 Ue4yGH+AmOBs6A2qMTgBZw5/mEyoSKXstKuoGwJXaQJMnYyTOEI4ivsRa30SjhpqiLSqV/k0m
 8S7+C32UcMJqe0Q6mavuFDPfZvb+Z9Ud8Voh1jyXodxMMXPfb+qiq9sQGKGUbqDTuQWLuWUh7
 yu9A1/hhGeRgwA0MFVq0YlpIflSJAs5/gnSb1CmdM2OtXMXhwoERrJO06ROjISO8hV4IelTCE
 qFnU5lR3AK8Q3xI+pE1dxVS1UPcLs2xP/xY18OhfxqOBbKqL22uwuZXEi+YmqkpOi1peEt+BQ
 hUzpMcB24MWOm6ZN6yb8fYasHJTHS/ANnZFQEz6ByeH+gXVnq8RTn1z8Bj8LF/M6/GjJgaLPc
 OHblCxQKwQs/p9fFnajbUZVdAy012rrLts0u6ihGQwa2ToXdkpteXsuFKRJK/GakKRCLz3Z+t
 51kTcZTGD5FvNnbi7qWZWuSPYcniVosP3RJMOd1ponjo2Ip53iT11vm85YCmfGlgu2mD14keH
 mBkzmEjuMw+GNnAs7EKNuPk6rC0YflOMioHMSzLkLkul7ygTk6yZhWjfS6XnBursZMFGxG6sS
 7PkyIZevlo49L8VYo2Ia9W/sXcCZPnZAjiyhCvHbiRI/8yYRTdN24Trr0vTH6ggUQdnqyRg5I
 tZ4YV9nTvkCWShQkbsHuEcr63RBmUgtmlhw26Mkw8yiardivEZMiIDXVx4PsOZM3Q4HejkedP
 yZwMpulmDGh97ECe/MTDCLYW97qYNvnRSI64U7jOi0DQe21sZ33bgMVgEZYKe/3OwOK3R4ucg
 WPNwWDHXFhRVLUPQHcWawtDXVoQxzgymU5S9nlvPdotPJJDQnuKmHA2D84eXLtgmu1KNc5u4h
 wFEL4WNY5MlEhh8dQkykX7SNx+NM2Vc+rEMZhR2e6MuE/teyhzDqZ0ZN5A1sZRH7UJYToJ9NM
 zIO81S0Gjx5/dTzxY8fmJK4ZonYNgJl+utmDoqjTw1krtmBis0DOQOIC3yn8PEvB6K9hETX8s
 O2HBwTj5hJj0d1i0A+hV/bCqp5gM6g+Od459zoPg9MwBJQoSKBrS+vTbBV274mNTkvNqnGupI
 rsc6f67gKo7zBU=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When booting the same binary 32-bit kernel (via network),
it boots sucessfully on PA7300 and above CPUs, while it
fails with DTLB fault (trap #15) on my PA7100LC (PA11) machine.

I've narrowed the problem down to the fixmap implementation.
Here is the relevant part of the boot log (with some debug info included):

Decompressing Linux... done.
Booting the kernel.
Linux version 5.15.0-rc6-32bit+ (deller@p100) (hppa-linux-gnu-gcc (GCC) 10=
.2.1 20200826 (Red Hat Cross 10.2.1-3), GNU ld version 2.34-2.fc33) #836 P=
REEMPT Wed Oct 27 20:01:14 CEST 2021
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
...
TOC handler registered
rcu: Hierarchical SRCU implementation.
patch_multiple 101856d8  len =3D 4
set_fixmap  phys =3D 0x185000   virt =3D 0xeffe000    parisc_tlb_flush_thr=
eshold =3D 0xffffffff  FIXMAP_START =3D 0xeffe000
patch_multiple map at 0effe6d8
TRAP 15  0xeffe6d8
Backtrace:
 [<107bff04>] patch_text+0x28/0x40
 [<107c0358>] arch_arm_kprobe+0x20/0x30
 [<1022be4c>] arm_kprobe+0x4c/0x7c
 [<1022e1c0>] register_kprobe.part.0+0x150/0x16c
 [<1022e228>] register_kprobe+0x4c/0x60
 [<1010858c>] 0x1010858c
 [<1010f178>] 0x1010f178
 [<1017711c>] do_one_initcall+0x80/0x1ac
 [<10103378>] 0x10103378
 [<107b98e4>] kernel_init+0x2c/0x154
 [<1017401c>] ret_from_kernel_thread+0x1c/0x24


This is a log from the PA7300LC CPU:

rcu: Hierarchical SRCU implementation.
patch_multiple 101856d8  len =3D 4
set_fixmap  phys =3D 0x185000   virt =3D 0xeffe000    parisc_tlb_flush_thr=
eshold =3D 0xffffffff  FIXMAP_START =3D 0xeffe000
patch_multiple map at 0effe6d8
Kprobe smoke test: started
patch_multiple 1021e800  len =3D 4
set_fixmap  phys =3D 0x21e000   virt =3D 0xeffe000    parisc_tlb_flush_thr=
eshold =3D 0xffffffff  FIXMAP_START =3D 0xeffe000
patch_multiple map at 0effe800
...

Again, this is exactly the same kernel booted on different machines.

The only explanation I have for this is, that I believe the dtlb
fault handler includes some assembler statements which are executed
differently on PA7100 vs. PA7300 (and higher) CPUs.

In the archives I found this old thread, which might be related:
https://www.spinics.net/lists/linux-parisc/msg09391.html

Anyway, here is the assembly:

10175738 <dtlb_miss_11>:
10175738:       23 3f a0 14     ldil L%abf000,r25
1017573c:       37 39 00 00     ldo 0(r25),r25
10175740:       0b 00 22 40     or,=3D r0,r24,r0
10175744:       03 20 08 b9     mfctl tr1,r25
10175748:       00 00 e4 a1     mfsp sr7,r1
1017574c:       0b 00 32 40     or,<> r0,r24,r0
10175750:       08 18 02 41     copy r24,r1
10175754:       08 20 22 40     or,=3D r0,r1,r0
10175758:       8b 01 31 72     cmpb,<>,n r1,r24,10176018 <dtlb_fault>
1017575c:       d1 01 19 36     extrw,u r8,9,10,r1
10175760:       d7 20 0c 14     depw r0,31,12,r25
10175764:       08 00 02 50     copy r0,r16
10175768:       0f 21 20 99     ldw,s r1(r25),r25
1017576c:       c7 f9 c0 e2     bb,>=3D,n r25,1f,101757e4 <dtlb_check_alia=
s_11>
10175770:       d7 20 0c 1c     depw r0,31,4,r25
10175774:       08 19 02 49     copy r25,r9
10175778:       d7 29 09 08     depw,z r9,23,24,r25
1017577c:       d1 01 1a 76     extrw,u r8,19,10,r1
10175780:       d7 20 0c 14     depw r0,31,12,r25
10175784:       0b 21 06 99     shladd r1,2,r25,r25
10175788:       0f 20 10 90     ldw 0(r25),r16
1017578c:       c6 d0 c0 a2     bb,>=3D,n r16,16,101757e4 <dtlb_check_alia=
s_11>
10175790:       34 09 02 00     ldi 100,r9
10175794:       0a 09 02 41     or r9,r16,r1
10175798:       0a 09 32 00     and,<> r9,r16,r0
1017579c:       0f 21 12 80     stw r1,0(r25)
101757a0:       d6 38 08 31     depw,z r24,30,15,r17
101757a4:       d6 30 0e f9     depw r16,8,7,r17
101757a8:       d2 00 3b 1f     extrw,u,=3D r16,24,1,r0
101757ac:       d6 22 1e 7f     depwi 1,12,1,r17
101757b0:       d2 00 3a 9f     extrw,u,=3D r16,20,1,r0
101757b4:       d6 2e 1e 9d     depwi 7,11,3,r17
101757b8:       d2 00 3b 9f     extrw,u,=3D r16,28,1,r0
101757bc:       d6 20 1e 9e     depwi 0,11,2,r17
101757c0:       d6 00 1c 14     depwi 0,31,12,r16
101757c4:       d2 10 1b 07     extrw,u r16,24,25,r16
101757c8:       00 00 44 a9     mfsp sr1,r9
101757cc:       00 18 58 20     mtsp r24,sr1
101757d0:       05 10 50 40     idtlba r16,(sr1,r8)
101757d4:       05 11 50 00     idtlbp r17,(sr1,r8)
101757d8:       00 09 58 20     mtsp r9,sr1
101757dc:       00 00 0c a0     rfi,r
101757e0:       08 00 02 40     nop

101757e4 <dtlb_check_alias_11>:
101757e4:       8f 00 30 5a     cmpib,<>,n 0,r24,10176018 <dtlb_fault>
101757e8:       20 20 01 e0     ldil L%f000000,r1
101757ec:       08 08 02 49     copy r8,r9
101757f0:       d5 20 1c 09     depwi 0,31,23,r9
101757f4:       89 21 30 3a     cmpb,<>,n r1,r9,10176018 <dtlb_fault>
101757f8:       02 60 08 a1     mfctl iir,r1
101757fc:       d0 21 18 ba     extrw,u r1,5,6,r1
10175800:       34 11 00 86     ldi 43,r17
10175804:       90 20 20 02     cmpiclr,=3D 1,r1,r0
10175808:       34 11 00 46     ldi 23,r17
1017580c:       d6 31 0a f9     depw,z r17,8,7,r17
10175810:       d1 00 39 3f     extrw,u,=3D r8,9,1,r0
10175814:       08 17 12 50     or,tr r23,r0,r16
10175818:       08 1a 02 50     copy r26,r16
1017581c:       05 10 10 40     idtlba r16,(r8)
10175820:       05 11 10 00     idtlbp r17,(r8)
10175824:       00 00 0c a0     rfi,r
10175828:       08 00 02 40     nop

Any idea what's going wrong or any suggestion I can try?
Btw, I did tested older kernels too, but they all showed the same problem.

Helge
