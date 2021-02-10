Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8AEF316C92
	for <lists+linux-parisc@lfdr.de>; Wed, 10 Feb 2021 18:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhBJR02 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 10 Feb 2021 12:26:28 -0500
Received: from mout.gmx.net ([212.227.17.22]:56051 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232286AbhBJR0U (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Feb 2021 12:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1612977844;
        bh=N3ZAtTMgpuPPhNgPHYBvNgI9FN8zcpNfUuD3nqhFBzA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=kMqcdKjgdFr0qRNn7h53NbV+g5fkq09e5Pg4i8kk71qmLaFFnkfwZJFOfmI5z0Qvn
         OJOKikbC8tBdB7b5OHY6KJffXzUtpx/7BvPeOVozPLZN3/iMpu1S3AHbExL3bCA8/+
         WiDocP46G5T6Sia0Gg/5qrbCkh1SDg4YguKFibjE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.119]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79yG-1lxc7D4A3w-017VPa; Wed, 10
 Feb 2021 18:24:04 +0100
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
References: <2786b971-254a-ae07-ea24-38e57bd29892@bell.net>
 <d4751664-6627-920e-9c44-7f9b7e287431@bell.net>
 <6fb36e0e-62f5-68c7-92ec-c6dd16841813@bell.net>
 <44ee7e09-90e7-0766-f0e4-bde2d3cdc2ec@bell.net>
 <5100eb80-975f-d77d-846a-5aabc25d0f95@bell.net>
 <e023991b-ba2e-f6da-94fb-0988ad70e717@bell.net>
 <9b9c6446-365f-9ca6-b89f-c330fca11952@bell.net>
 <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box>
 <20210210145218.GA50561@roeck-us.net>
From:   Helge Deller <deller@gmx.de>
Message-ID: <c7996434-198a-2a57-ac58-18ab6e1faf10@gmx.de>
Date:   Wed, 10 Feb 2021 18:23:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210145218.GA50561@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0UdeVnodB4Nzy8gycI4DGjGSXNhO+Mtmg8qZ6Ovj8tUazHbAfqy
 Ittb2H81Ix+uJTuA6F03WLlMUU4hA1U8CsVayYO2haUxIPW/ps9v6dGBWGn4IXzMKZ6bLAg
 fJKZabtoQyJqOF7YLR75v0VsRbIf1txZHeFt7Qs91N9wxKMTwdrtq5j4lu31Tj9sizaOPg7
 tXaq14q77zodOjdua8tWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SVHl1pmhcGU=:QH+zNAVzkftd959viZH27v
 Mp9zZOFU50jnNwEeHFrrV02es3mOvyr1kB6C736VNUIIdXcdFgCZg4k37Zq3kUW15v3+6u1jG
 YhGwTi1JJeZr7IVaOcX8ZkdFBzxBvgyY483M9XWr/qKG9ESn2YBLcej2vAbird+7xUXCw7sv7
 x00eJiYoxx+odXaY2WlhKiI/dH5MBbhSABFY8HgVgHenzGJbASupi3IsLmWYS8VoKG8lwEuiO
 19+XY3nQuC8cUyA+FCz+ZSPOaT2IWBVkYgh22/Tj9Kj7AT/aN5bvOEbN9zhX8tvbDhYnb2Dft
 kWkSiPjkHHftrO1Emdi0LH2nkaGHl9v6uinVljW82cyPQzmsbuqgeOaX2V92nEvZmSzGa8OAT
 oeORsNLibn9kBMy//jMmtRK8JIoU+MYAXbv2CkAWRQa3ep91ljySX/Tl9Uek4ZMy88WgvH0l6
 ivoTO32D+R48l1U8sc81WN7XponuyoauQiDy9iTt361uNYrT/e8SxH3X0gXQBb49jt5jU8PGt
 +KItgiwOM+vuKR8TeNMKERDm1ettRlBMuEL/kRDMn6ks4iS2Hz4WS+x2oCd8kvvY1CQ9iOib9
 G05mSR7QnHW5KJKsD2ipZ+o7VfOKEEp7FTxEEOSLO4L//XJYAKqLL4THdN9snn64BmVLfBMrc
 wWB+qQd87I5N4DNIgJNCt8BVaGx3q+4ZMiRFC2QhLW29bxZOzy9LX/zPMvCD+puV0j1GwgwWz
 wRa4d9EHKSnX/VjSYYlpQzUgONZr09wepDzQFmwUuAJMywcCzTZ/VPXZnqi1u+xOh+3DM+ELQ
 YJkPLq0zclr/7qXfVvZT9VM+yWKX1uG5FNfE1pOw3T5BGvuZm+Xtif9Fe6J50bdDIah600Uay
 UXc+WTNIAA+9UbL5awww==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/10/21 3:52 PM, Guenter Roeck wrote:
> On Wed, Jan 27, 2021 at 10:18:51PM +0100, Helge Deller wrote:
>> On parisc a spinlock is stored in the next page behind the pgd which
>> protects against parallel accesses to the pgd. That's why one additiona=
l
>> page (PGD_ALLOC_ORDER) is allocated for the pgd.
>>
>> Matthew Wilcox suggested that we instead should use a pointer in the
>> struct page table for this spinlock and noted, that the comments for th=
e
>> PGD_ORDER and PMD_ORDER defines were wrong.
>>
>> Both suggestions are addressed in this patch. The pgd spinlock
>> (parisc_pgd_lock) is stored in the struct page table. In
>> switch_mm_irqs_off() the physical address of this lock is loaded into
>> cr28 (tr4) and the pgd into cr25, so that the fault handlers can
>> directly access the lock.
>>
>> The currently implemened Hybrid L2/L3 page table scheme (where the pmd
>> is adjacent to the pgd) is dropped now too.
>>
>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>
> This patch results in:
>
> BUG: spinlock recursion on CPU#0, swapper/0/1
>   lock: 0x12226d14, .magic: dead4ead, .owner: swapper/0/1, .owner_cpu: 0
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc7-next-20210209-32bit=
 #1
> Hardware name: 9000/778/B160L
> Backtrace:
>   [<1019f9bc>] show_stack+0x34/0x48
>   [<10a65278>] dump_stack+0x94/0x114
>   [<10219f4c>] spin_dump+0x8c/0xb8
>   [<1021a0b4>] do_raw_spin_lock+0xdc/0x108
>   [<10a7367c>] _raw_spin_lock_irqsave+0x30/0x48
>   [<102bf41c>] handle_mm_fault+0x5e8/0xdb0
>   [<102b813c>] __get_user_pages.part.0+0x1b0/0x3d4
>   [<102b8900>] __get_user_pages_remote+0x134/0x34c
>   [<102b8b80>] get_user_pages_remote+0x68/0x90
>   [<102fccb0>] get_arg_page+0x94/0xd8
>   [<102fdd84>] copy_string_kernel+0xc4/0x234
>   [<102fe70c>] kernel_execve+0xcc/0x1a4
>   [<10a58d94>] run_init_process+0xbc/0xe0
>   [<10a70d50>] kernel_init+0x98/0x13c
>   [<1019a01c>] ret_from_kernel_thread+0x1c/0x24
>
> when trying to boot parisc/hppa images in qemu. Reverting this patch fix=
es
> the problem.

True, I can reproduce the problem.
With CONFIG_DEBUG_SPINLOCK=3Dy you get the backtrace above.
With  CONFIG_DEBUG_SPINLOCK=3Dn it just hangs.
Happenes with 32-bit kernel with SMP kernel, even if only one virtual CPU =
is started.

By the way, the latest version of this patch is in my for-next tree, here:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dfor-next&id=3D4add5f175b1e4e71c06493f9a2c52490d2ea4365
Problem happens with it too.

Helge
