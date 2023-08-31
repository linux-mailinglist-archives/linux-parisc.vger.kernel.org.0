Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A730478EEC1
	for <lists+linux-parisc@lfdr.de>; Thu, 31 Aug 2023 15:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345084AbjHaNio (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 31 Aug 2023 09:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242940AbjHaNin (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 31 Aug 2023 09:38:43 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF72FE49
        for <linux-parisc@vger.kernel.org>; Thu, 31 Aug 2023 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1693489098; x=1694093898; i=deller@gmx.de;
 bh=eaLVB/cN4PkvZAy59hrEMw7JfaiZFuht/HVe64qBsmU=;
 h=X-UI-Sender-Class:Date:Subject:To:References:Cc:From:In-Reply-To;
 b=Tuu0ud5jXv1iQdBOe+sRafjkXsOV9pdaA1bG5AMG1khbMT+L2UUniVo0l5ZpvM/8Cc+MeiF
 UC1FM3jN0ziH6FMrlYVMv2vYCOM4yX2XXXHamCgsoArZKX+4IOAVM3/Vl0jXzrIGrOUpDll8l
 Ml1L60y9S6lUVc/d/G7De2Z8AxS81rxOfO2i5JifV4yx7QMyPhMyWvD6sGk8ZHgf5rDpmjM+O
 D3FIg7CrRwUVCLo69ZV/pQq328Yohb344qYKHUhpJXvECzIxTZsv91H/BTOq7voz7pPGezGlw
 87h+2uc+tydLnnwaG2sA9/8eaSw0DkSbrDm+2Ro2m6phBlG7Iwdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1pYTqj2RyF-0153IB; Thu, 31
 Aug 2023 15:38:18 +0200
Message-ID: <cb912694-b1fe-dbb0-4d8c-d608f3526905@gmx.de>
Date:   Thu, 31 Aug 2023 15:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Content-Language: en-US
To:     Vidra.Jonas@seznam.cz, linux-parisc@vger.kernel.org
References: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
Cc:     Sam James <sam@gentoo.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8F1M1rwNwT7ZHjxx/46iZVcCQuI/4YTBZ5j+xlsw2l2vaBbbNiU
 zn+lvAD2FGdq0+0xEPB4aZuuTzRuxNMSbcc/3dd00U7MTVU8eIeO2xqY6p+gPNanwaKMDmC
 26X/ask7qFyFACxc9WNpfNSabIelTvGObQ38WVLWp5pCFuUS+7pUZCOEO5yX5uIhGDyn5mX
 7IIJTRbrotDUnBKP6XHxw==
UI-OutboundReport: notjunk:1;M01:P0:vU/WpedLHBk=;FM+1mi0wYxAsZ3BiHX0yH+Fflf1
 /l9COYj3Wc++tY31w4f89X9sQ425kxO/wB6ALSi25TiaqUhYtcyhRNXG4hgRN+ByMSaxM1dmq
 0uOOvJ5VC4o6EmI0IQ8jQ+kwb/Ggu4QuYQfV0Cr/lN/9+aci+ivzU3xanCGP7dAtmwGAgIOWJ
 rUOaaMgNyeKca0RQEECZF/fNYb9NzrAn46XHPzs9RKZ1hqrDzR+gkhvDyRTbcwtMbnAOwpN2E
 OnwQtAOdG25BHiSGOAmR9UFFeIvqBQUVapJk5pq4FMSGpVz8mRcBl0qLcgwMP4DcIOW2+iMhL
 7AzT+vurBWfn9b8mXUB2FqhgKSWFB+KwO/bS19jedBP/0GXgrk+RU4SDyXnpqeD3BXBWerSAW
 LDfRj0TQf7fGohdnSrObKRs81DM/gwYGW+oN3iJQmtIfJNbI23y6+HmJUdnOV/UH1DphLddZ5
 hk3RCrSFtdxP1Cv/5Hf2u3/9WiliFYQ/5+y43waTagManluUmdHJlK0A04vPccCyDPsGZlUd5
 MgB8ThLE8e5gVssJQVPfVVX6GPo/+3w+0RLu4ugqpbuje6ijPl+4C0fjfD7ThWktO2RXm60gf
 5jZ2BBP845gepkX1ZT3UTfFMEephA7DCcpIOs2cEsRblCOAq4AzywYpmY8nfVSuNrkZ9dGuNV
 3D/L4OxfldoW8OykIxh4By3kNSv3ZsAnPvH/Wlard8RzIH739Z/rxYtvJG3hs9Gddi1mFtgEI
 fL08a1pTkFTqS9bSdrY6fD4Y0gCq6hF86cRePcUV7+KD148VAZvp56SZNB680nL0QdPmwFj8V
 IHcdNXsJ4EENlyihjzQ0HVfqUV8pwX+TEgENz6YubLfXdMG7+0ra7kIqqor3v6IeAwrEuB0uJ
 J1NQHBpYUt6/dzFxtZpKM0TI3Lv9Sl/fu2URj/aU4i2KfkR5+12/rWmUY1zynGW8iSl+NH9sZ
 La8g4ASTBizC9sGVXwqU9Qob6ws=
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/27/23 13:25, Vidra.Jonas@seznam.cz wrote:
> Hello,
>
> on my C8000 workstation, I'm getting libuv aborts connected to io_uring
> usage. I'm not sure whether this is a libuv bug or a kernel one, but
> since libuv is pretty well tested on other archs, it's probably a
> PA-RISC issue. I've encountered the problem in kernel versions 6.1.41
> and 6.1.46. 6.1.4 seemed fine, but I updated other system packages in
> the meantime, so I can't be sure.
>
> The issue is that a call to
> `io_uring_enter(fd, 2, 2, IORING_ENTER_GETEVENTS)`
> returns 0, and libuv reacts to that by aborting, probably on this line:
> https://github.com/libuv/libuv/blob/65dc822d6c20a9130fa100c7b46d751f8cf4=
d233/src/unix/linux.c#L1252
> (I'm saying probably, because gdb seems to be buggy on my machine and I
> don't really trust its output, so I rely on strace instead, but that
> doesn't support backtraces on the PA-RISC.)
>
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

Just to sum up this mail thread:
The upcoming 6.1.51 stable kernel should have the relevant patches.
Kernel 6.4 and above should work out of the box.

Helge
