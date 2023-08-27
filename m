Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADBCF789FDE
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Aug 2023 17:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjH0PJ4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Aug 2023 11:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjH0PJr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Aug 2023 11:09:47 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4D5C1
        for <linux-parisc@vger.kernel.org>; Sun, 27 Aug 2023 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1693148981; x=1693753781; i=deller@gmx.de;
 bh=sAaMRQTO0jr8v6/5odYPji6VMNlAh7tsfm/HTSb8ZXQ=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=GvZoHXv1F+d07agyGo5wgHlCDR7iHxU3mPzEEkmy6eNVyYSEyR2HJBZwQBer4PA6oDfb1TW
 VjQhfbJC/zF6mqJoMDrL5uDsDzGqCbQUsTQbprDYAFGfnrFa+tiNG7j8jIbgoYwUOflK+hFJA
 Ll373JVR03DXmNOOfhh4enOAzPlC9+w9AEMw6dKh8JNun89w90w302Bc80B3Ba/93KNQfpDDt
 p6R2+fthjqXgg5j2GaXLvoZgbTn2iixVU2C9MKr0VFb5h1YnBdc9rcxDtu/CHlZMdKUxVYQCW
 Ni2MLdHGQGI7yIDMNBTgt9zeBE5qtd3vXSmFknuVKZGr3WflGjmw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.139]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJlc-1ptTuq3W56-00jKDt; Sun, 27
 Aug 2023 17:09:40 +0200
Message-ID: <c36e52b0-fe79-5c50-cb58-450a04e64698@gmx.de>
Date:   Sun, 27 Aug 2023 17:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Content-Language: en-US
To:     Vidra.Jonas@seznam.cz, linux-parisc@vger.kernel.org
References: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+VUTTHnWpsfE3XscDMd3qzGsgYgPwIV7nzg+IFrS5inQ4XIQulz
 rL6zVY0bUofl9c3u8QAvE7KDSFC5PC3fhDC/0FD+0IJQSbKA6vJKWb74WOJn3gP4v7Omg/6
 qNUfGGR4ItQ1n0uqvsSyhmKUrPipI0uYZKWZD1Avckg9o7tjppWE3BsIr8j/ft8/Y8g7s0L
 cElhcrHA2exEFqmyy8lsA==
UI-OutboundReport: notjunk:1;M01:P0:tj0GhLlFuH4=;Ula1GuKRqEkpGZ2DSnAnKCJRJiL
 mmQiCcVHySV5NX8m6ieKMX/bZKRMc4TY9IrjgMh+Wcx0RFEpUWIgpNbeNuGEIinxwe5AypnU0
 EFy9+6zseq+v1SAJL5sU1wXTa/UwrO3Ve0iZB0WrMvIktomKjP/lmP0Aym/44Y7dXulHG+bAW
 5xi8FnGMEj2jNILIKhy0KQBFDA/u6QZ5cBLZdIWac8skHi1Cn9et/lHZeQgMHdFWUcHMiAtFh
 EKejoXT/00w7DRUCrOHsJIIMxgXz7V3t2NXwzPibHYCwa2GNVzdypE+oKoaMTtNGsqA94c5Ku
 gAM/4GzvoO/yKMAhP9Td8/8eu7+aOCYpXD5SYPZTNjnJC2yIxbQRc5j/xVZZwg+8/qSnt32ep
 gT+Zv6201JsO7lSHunv00xyf2QmhHJ7e4UK/JmIbjs4UwXIMMJ43QNdARaTheL7vA1oak8U2p
 /n2w41n9mJAjY3MSOTnlq/y7xhnaFFD6Tik/9g6DIG9XiV++9PobPKMyPLzfQB1Xi+VGNAy+s
 eLzB/TUsyKBIPuKQh9Fwkcs3gTyk+WabayLv4JA6T8cMIJ9DI85MsLED9jzCvOUvg3wHpptFN
 2rDKqs1lPeyfPd4ryQ6LiHVXUfnRyUsCQX08Wf5wYKm4JVH7NPXSMUn79VIjt7jFAqSpgUqkG
 WkXyPNUqHVluCiqjO/uqRJXR4Z0sSdWs9EDvGFM2l9qBWTuO8WbESbj5EM00dBFtvUCKLM5IJ
 F8QIgsUvkHYK/kXv2FDX6PgiP3HFPidCvQt2/mcouBx5VdHYx8MSXYjs+jvsKSGHcGmjBDDUK
 6QVSq1Zk+zW0JQ9nvLEhVqFK+iMC9vq5Rp4SvD4owQBswMrLR5ZDXoZB4xZNSE4hWGdiovU13
 d/UyjnBpDnNy2fNBn/tIh0Bj3PCJz2xwc6YeKsBaec2ur7fQY7ZjCzKAgbq+aARlyAJBnfwso
 /FTmCA==
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello Vidra,

On 8/27/23 13:25, Vidra.Jonas@seznam.cz wrote:
> on my C8000 workstation, I'm getting libuv aborts connected to io_uring
> usage. I'm not sure whether this is a libuv bug or a kernel one, but
> since libuv is pretty well tested on other archs, it's probably a
> PA-RISC issue.

I'd assume it's a problem in libuv.
I'm not saying libuv is doing stuff wrong, but probably not the way
it needs to be to fulfill cache requirements on parisc.

> I've encountered the problem in kernel versions 6.1.41
> and 6.1.46. 6.1.4 seemed fine, but I updated other system packages in
> the meantime, so I can't be sure.

Maybe you could try kernel git head (or 6.4.stable) too?
Those have some more io_uring and parisc patches...

> The issue is that a call to
> `io_uring_enter(fd, 2, 2, IORING_ENTER_GETEVENTS)`
> returns 0, and libuv reacts to that by aborting, probably on this line:
> https://github.com/libuv/libuv/blob/65dc822d6c20a9130fa100c7b46d751f8cf4=
d233/src/unix/linux.c#L1252
> (I'm saying probably, because gdb seems to be buggy on my machine and I
> don't really trust its output, so I rely on strace instead, but that
> doesn't support backtraces on the PA-RISC.)

I have not yet looked into this problem, but if the io_uring
syscalls return 0, it's often an issue that the kernel doesn't
see the same memory (due to cache aliasing) as the userspace.
The memory regions allocated with mmap() need to be done by the
kernel. The  https://github.com/axboe/liburing library should
do it right, but it seems libuv does everything itself.

> Since min_complete is 2 here and IORING_SETUP_IOPOLL was not specified
> during setup (the only flags that can be passed to io_uring_setup are 0
> and IORING_SETUP_SQPOLL), the call should (if I understand the docs
> correctly) block instead of returning.
>
> The bug manifests as aborts in CMake when compiling KDE packages, as any
> call of `cmake -E cmake_autogen ...` fails.
>
> Is this a known issue? I've seen a number of io_uring patches on the ML,
> but none seem relevant.

The best thing would be to have a small reproducer.
Do you think you can come up with something?

Helge
