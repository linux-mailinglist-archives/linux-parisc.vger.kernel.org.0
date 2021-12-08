Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C367746D3BA
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Dec 2021 13:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhLHMzX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Dec 2021 07:55:23 -0500
Received: from mout.gmx.net ([212.227.17.21]:43033 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229751AbhLHMzX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Dec 2021 07:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638967904;
        bh=VrJvON7KG/7EDG0igZ7qoHgl92E5cR58xiKqWC0EaEk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=ZTXknAB7l/HXQ+vCctWZhZqkZtJB9n4uBzq87OuxnBCebnkDc9QSYjGq62c3EIqjW
         Cgk5G+b4v8Nxg0eZUBzk8zGJgmIfggDlUhZS4AknP+KDqpI7Y9dI5nPgn8YI42r8Ks
         6SE7j1/kKBnLb6iKJrOu+dgndFhKY3RMlJi9h+Ug=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.170]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UZG-1mvUO22rDO-000d9P; Wed, 08
 Dec 2021 13:51:44 +0100
Message-ID: <3b28b1a5-2a49-af75-bcf2-52eb114be348@gmx.de>
Date:   Wed, 8 Dec 2021 13:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: glibc tst-minsigstksz-5 failure
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     deller@kernel.org
References: <c58ea7e4-f0df-3840-478e-0c3459aa4318@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <c58ea7e4-f0df-3840-478e-0c3459aa4318@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yYeHaA52argW6HkeOQNCua5C8d1WYvA3ytmTlLkllu+fFDue5uM
 4EGD+wq6GYFJZfD1HX3NNvtz9PIFl2VCeb/Jln/wr6LVoI+v1UWa5iVV8K4uWIi7E+K1Kjy
 tZ2+rF5twOREX/twxmKa5smPEkafedR3u/uiG1sV0yaDOOHEoVDyRHqL5ZMjha0dm3AZ65C
 t2mEQLCMVxFzqz9I6lYEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vo1Xyy80VHI=:+D1z/q825WSrwOS6oFqrdv
 HRP58i0qzky/y7cYwW+EzLfAVzXZ1ld3ATzuICE7NOAoUYNp/EDbtOob3062r0+8d51SXKbAm
 l2/LBCL+Xxnqu8R885cin/OkRrXRTKF1VBZCkKGyZ1VGrc3sw8eL+M2ItRfvDbMgDITelJwq9
 ALPbS1G2h+TQjk3MrK+AI0Rc2uTV9tA9v6RItKYRun1n2xVYpEByCIAshk/sYVXVhaGsJcG2Z
 TO0sAS+6fTC601fOzvtyivlCwt5jfjuBExGRCQcwy6VfRlnHQfzfiq00WhW1PetqmgM5/S8hf
 NylD+dIa0ngQjejlKgNz9OhLUtw8FZC1nF5xcKiSumwDyGvMFF/OgzRGnErWhNnZhzMKckMMx
 y1EED/gwOF8x6iivWYNIjC+c89lhGmUPiX9RYz9PpLP+HkZrRGCuSI+Ub8a2TdxiGlszW4OUR
 OoqCBcMfjj+8+LETPU4H/bQ1meFZd0P0n6Q6z3KcnwqmV8Me/f/ST7dHXyGVI+blFt9YBi67H
 6zJ1Mo1oTDlgqqSVY8QqOVMcw5SU9iZK/Gy2dfzwhGxL1gwJJT7CERSx0XhLcrNPj2dTiRHlI
 45ZR3E0bDz6MYBcG+rN6FnLPs6O45RfzREDc80thKDJDNYucYHhmFsA47kaTCAgZLKu0MXE80
 HNFoFdNcpRLRg2PMUDU88rXjwcbHF9dC7DZZ4tAEWSSqXt7JC+rE9Y6a/AH1ciyc1Nygu4RPo
 v8UIqOUkhZ0h/BGnZhjeszyuBLkCpPohMuN0ebirk1qHJyDh1SlqAOHERveav0XIVkekVhBiW
 hb2suLMLE9RiPzqRQPojUvV5MVmBmgfgSEzuN2YkFlw2VtVlmcZeMmACeK0RA2WZqY8uhxK6k
 as+VY8L8l/xZr3pY6EOKbqSBp1M8ND+BrGGS9X+aS1MCWZNOZf0GvfZ50BJw2WbHKwysmPgNA
 v1BmUcrsVAqgtzdsFvXyXABVdi8O1Xp35PwWNaZ4cRzuOtgBxl2T28mmArwj5uRfK3z0iIDIE
 8w00wbx26Lt2I1+7f7URSiLh7YEv59E+/YP6QuFybrL8pfWAFkmcl2wEuZID3t5PyW13jLcNV
 SZngNQGfORZh6M=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/7/21 22:47, John David Anglin wrote:
> The glibc tst-minsigstksz-5 test fails with a protection id trap.
> tst-minsigstksz (pid 19958): Protection id trap (code 7) at 00000000f5b0=
0497
>
> The problem seems to be that the signal return trampoline is placed
> on the alternate stack but the alternate is not executable.  It is
> allocated by malloc.> ...
> Stacks are normally executable on hppa so the trampoline works.  But
> user code wouldn't normally make an alternate stack executable.
True, I think most people just forget that such architectures exist.

Anyway, the glibc testcase is interesting.
The pretty similar sigaltstack testcase from LTP does work:
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/sys=
calls/sigaltstack/sigaltstack01.c

Both use malloc() to allocate the memory, the only difference is the size =
allocated.
If you change the glibc testcase to:
=2D- size_t stack_buffer_size =3D 64 * 1024 * 1024;
++ size_t stack_buffer_size =3D SIGSTKSZ;
it allocates only 8kB instead of 64MB.

It seems glibc uses brk() in both cases, but when allocating 64MB it addit=
ionally adds a mmap() with READ/WRITE permissions only:
brk(0x606000)                           =3D 0x606000
mmap2(NULL, 67112960, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,=
 0) =3D 0xf303f000

This will then break - as you mentioned - the signal handling on parisc.

I see those options to fix it:
a) Fix the application to map the memory +x
b) Add some code to glibc to map the memory +x when sigaltstack is called.
c) Add some (parisc-only) code to kernel to set the permission.

I've looked into c), but that's not my favorite choice.

Helge
