Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CB725823C
	for <lists+linux-parisc@lfdr.de>; Mon, 31 Aug 2020 22:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgHaUG7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 31 Aug 2020 16:06:59 -0400
Received: from mout.gmx.net ([212.227.15.18]:52581 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726939AbgHaUG6 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 31 Aug 2020 16:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1598904382;
        bh=HwhPLMJ5YyJzVuy/MOPGt3/1Qa1l+iDWiaSEOfJLOqc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=A8mnvkmu9CbHJ409gQ2Cy03PsO7+kCCuTrzXoO5iea8XvXgb4m9SVmpx+ye/ef5Tg
         Us+QZAepwn9KDPQUV/Fr0C2OvqNS9hO4jFkQCQdV4FeYyLtHgdz0QyUbla166TANAM
         86K9ynxnyZX6ChnU8qhe+VU9iAIGDh/mPi84IfdY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.252]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UZ6-1kDOIe0Juc-000fW9; Mon, 31
 Aug 2020 22:06:22 +0200
Subject: Re: [PATCH v5] parisc: Fix spinlock barriers
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>
References: <b38abd19-0a61-8968-b98d-9b8b2efb6747@bell.net>
 <11590248.O9o76ZdvQC@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <ed2b7cd4-7c65-e4cb-632b-45fc84ebd49d@gmx.de>
Date:   Mon, 31 Aug 2020 22:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <11590248.O9o76ZdvQC@daneel.sf-tec.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QOTTpfwbOWiq4HiOk9hHk9kHVZPiCB4IV"
X-Provags-ID: V03:K1:twfLiTXKPjOE+gx5Mc2X4s6NlE/wjaxiZWcHHbA7/1E+Fau9wqs
 dIBQifETRLDjeKUujdbeXHv8x1aGHLu33C5XdKWlwugrVF6Ah8KbOfWJcKeDv0Y7xWQO27I
 mRPINHo34FyyfWyj5m4BF8Q/8l4+KB2opQdKPoglnuBiYX0ETFX8I3nQ18bosbNueD4yM+P
 M0yhJXHHZQisk+RUjC0nw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ys8SDAmB2E=:OLm8nvedAmJlt/pzNWp2ul
 gsaVVn3eZDO4txJJXwQbk6car0tqStvRJ1zQiQqiBQhGzHbt7xCwKuc2Rqak9I9ojdRyiH/KC
 hCj5sHZiUMMPfv43Vcbm50bKlEjauge+qpkYqLDFgWyO/mLdFW1OZ4gyYsjdAF7whb9WXwujF
 4oQisWpHdTnYeOGWZAj8luOGQ8lbZRR6GvCjWrHNQiwGCQa96DmgqV/SyEyrRWJXoV3OIQttz
 dDeab++wARiLdFoqeit2ywUV9hgSyDdwlTpWIADIVfLDbhny9GpFtgj4tAilAj1Jk2/Ak+d95
 oHuQe+Xmp1I2Yb2ohd045fpB70ea4sk9/RMCEyO1hjNtF3LrKEwqqecY/F/NtaT4TCVul5S+Y
 fJbBz62iGfECbgfANzsa+tjmBEhROOsJsg9H7CBAL9kxtsy79Ug3vki3a7Xh1EvYlZkNcooLk
 UxB/LDeRIkUIGDXO2jV8lVZ2ao75bqeX5OxespXnZ6Y2xW0Y9bUxRAKeZovKvYEjCXrqKfSCj
 DDRaTRx69yoxo2SugoSbsSXCg/HAXyEhDBNqOCOkHajmgCPRHvR34AgWKq7cXApEgo7PkzWbL
 MrawedR7qj9bfIUfI4vGJ/prusdBFaVA0Nuox4kFR88qikqhckbJhnmKVR3qkiUvUjQiniTYR
 0oDM9MW5NVCjeaOwYrjEoA1KZFcLEXOP2xZd6xA5C/UlEanV3I1uFMuMH5PksLxi9+mL8Lbdz
 EV6lllcyYod0ZUmdnJxtPmNnjAOI5F5FIRwirdP+Qhl/pM6x3/sJgr53tIt40J1oxETd7ymjx
 5pNB6lTLKUZAOg9jgUo9YD0XNkF30in7JCUwgN1ANYn9jaAgV8Oy4JYDFDTJ3ucLRvicIORXc
 5a2H7IO8OWFo9N3L0LGnVALbjuvtWUzUOI31L7qSXbl5LbuqUtznZKV/HJ0z6Nbnuic+QaXYY
 NV8voYV8N5EIvlHDn1JuMDuE1ZYFg1Y2V3kZ8lz3ZYdiWyuS+DqCVw2wwl7Vg/YSgBcQUZtVG
 2juKBHwQzbYp+7ZnRLTJTgsoAZJUqcS+5iK0F0kxzQMR1AnbjW8XDOE4EFaBwcmmTNe3pAfwR
 jmU753CiTvRyaRWqI3wHTL4MD4k7BKQTA1ie6/NdhTxRwz3KOzPQQgHYSRWyP48x1rLLe2Jpo
 T4e6daMNc7zBSHeutKX2fG0hUj1VkIytrYXqBqRzBfBKSq92IcGskdOtg1dWGWuedCLYBZc2B
 P2Hh+gHAdVS1iILYs
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QOTTpfwbOWiq4HiOk9hHk9kHVZPiCB4IV
Content-Type: multipart/mixed; boundary="hBZBfRmiu83OSOBHry8gvqAnXTVgACXNI"

--hBZBfRmiu83OSOBHry8gvqAnXTVgACXNI
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Rolf,

On 31.08.20 18:21, Rolf Eike Beer wrote:
> These things are in 5.8.4 AFAICT, and the lockups are still there:

Thanks for testing!
=20
> [320616.602705] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [hppa=
2.0-unknown:29093]
> [320616.602705] Modules linked in: 8021q ipmi_poweroff ipmi_si ipmi_dev=
intf sata_via ipmi_msghandler cbc dm_zero dm_snapshot dm_mirror dm_region=
_hash dm_log dm_crypt dm_bufio pata_sil680 libata
> [320616.602705] CPU: 0 PID: 29093 Comm: hppa2.0-unknown Not tainted 5.8=
=2E4-gentoo-parisc64 #1
> [320616.602705] Hardware name: 9000/785/C8000
>...
> [320616.602705] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004=
02706d0 00000000402706d4
> [320616.602705]  IIR: 0ff0109c    ISR: 000000005836f8a0  IOR: 000000000=
0000001
> [320616.602705]  CPU:        0   CR30: 0000004083878000 CR31: fffffffff=
fffffff
> [320616.602705]  ORIG_R28: 0000000000000801
> [320616.602705]  IAOQ[0]: smp_call_function_many_cond+0x490/0x500
> [320616.602705]  IAOQ[1]: smp_call_function_many_cond+0x494/0x500
> [320616.602705]  RP(r2): smp_call_function_many_cond+0x468/0x500
> [320616.602705] Backtrace:
> [320616.602705]  [<0000000040270824>] on_each_cpu+0x5c/0x98
> [320616.602705]  [<0000000040186a0c>] flush_tlb_all+0x204/0x228
> [320616.602705]  [<00000000402ef1f8>] tlb_finish_mmu+0x1d8/0x210
> [320616.602705]  [<00000000402eb820>] exit_mmap+0x1d8/0x370
> [320616.602705]  [<00000000401b5ec0>] mmput+0xe8/0x260
> [320616.602705]  [<00000000401c1690>] do_exit+0x558/0x12e8
> [320616.602705]  [<00000000401c3f18>] do_group_exit+0x50/0x118
> [320616.602705]  [<00000000401c4000>] sys_exit_group+0x20/0x28
> [320616.602705]  [<0000000040192018>] syscall_exit+0x0/0x14

I agree. I have seen the same stall too.
I think we should try to analyze how the stall in smp_call_function_many_=
cond()
can happen. The trace seems always to point to do_exit().

I think those patches from Linus helped for the "old kind of stalls" whic=
h we have had in the last months/years:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc6fe44d96fc1536af5b11cd859686453d1b7bfd1 and=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D2a9127fcf2296674d58024f83981f40b128fffea
Those old stalls were something like this and didn't pointed to do_exit()=
:

[111395.307021] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[111395.311001] rcu:    3-...0: (1 GPs behind) idle=3D04e/1/0x40000000000=
00000 softirq=3D13650053/13650054 fqs=3D2625
[111395.311001]         (detected by 0, t=3D5252 jiffies, g=3D25258025, q=
=3D1240)
[111395.311001] Task dump for CPU 3:
[111395.311001] init            R  running task        0     1      0 0x0=
0000016
[111395.311001] Backtrace:
[111395.311001]  [<0000000040416110>] hrtimer_try_to_cancel+0x13c/0x1f8
[111395.311001]  [<0000000040e65a18>] schedule_hrtimeout_range_clock+0x10=
c/0x1b8
[111395.311001]  [<0000000040e65af4>] schedule_hrtimeout_range+0x30/0x60
[111395.311001]  [<0000000040e5ebbc>] _cond_resched+0x40/0xb8
[111395.311001]  [<00000000403617a4>] get_signal+0x348/0xf00
[111395.311001]  [<000000004031cec0>] do_signal+0x54/0x230
[111395.311001]  [<000000004031d0f8>] do_notify_resume+0x5c/0x164
[111395.311001]  [<0000000040310110>] syscall_do_signal+0x54/0xa0
[111395.311001]  [<000000004030f074>] intr_return+0x0/0xc
[111395.311001]
[111458.330562] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[111458.330562] rcu:    3-...0: (1 GPs behind) idle=3D04e/1/0x40000000000=
00000 softirq=3D13650053/13650054 fqs=3D4653
[111458.330562]         (detected by 0, t=3D21007 jiffies, g=3D25258025, =
q=3D1361)
[111458.330562] Task dump for CPU 3:
[111458.330562] init            R  running task        0     1      0 0x0=
0000016
=2E..

Helge


--hBZBfRmiu83OSOBHry8gvqAnXTVgACXNI--

--QOTTpfwbOWiq4HiOk9hHk9kHVZPiCB4IV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS86RI+GtKfB8BJu973ErUQojoPXwUCX01YOgAKCRD3ErUQojoP
XxM8AQD5XR/BOfayKbVM9q7XPe56sb6Ri/jzCXI7w6e1iisQmQD/ZHySFZSZTlb/
JBqnUbm0LjbdYP4nY+KBzeYOlkYELw4=
=wsJt
-----END PGP SIGNATURE-----

--QOTTpfwbOWiq4HiOk9hHk9kHVZPiCB4IV--
