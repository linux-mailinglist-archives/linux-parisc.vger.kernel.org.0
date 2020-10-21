Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D062951F2
	for <lists+linux-parisc@lfdr.de>; Wed, 21 Oct 2020 20:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503438AbgJUSCu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 21 Oct 2020 14:02:50 -0400
Received: from mout.gmx.net ([212.227.17.21]:51859 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438301AbgJUSCt (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Oct 2020 14:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603303361;
        bh=sVc5kPFznr3Uuwpf4+cm++PELHG+N4aMW9lvlaI2YO0=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=OQQ1nu6q7trwgqQcoSm0yLAmHmiBkKm/V8EGYjPpKnSGCOH3zEclW0C4c7AZ50CD0
         5KY9fYHIC21o+tRYZj9evdZkv9luajjY1Pani1KrDZmUDkw5KgMerRhDkqO0aOf0Yn
         rSHLzsI+jmHOWocmdcaWnfVm9IGVsXqDoJWrpang=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.237]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dwj-1kJU2P48zl-015YiK; Wed, 21
 Oct 2020 20:02:41 +0200
Subject: Re: Kernel 5.8 and 5.9 fail to boot on C8000
To:     John David Anglin <dave.anglin@bell.net>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
 <37ee0636688c782a59e8b50eae5c41b96926e7ab.camel@HansenPartnership.com>
 <bbdfecf6-b13f-561f-82f6-1f5e594e02b2@gmx.de>
 <35dc2238-cf23-15a5-b214-533133e6bd9c@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <877e003e-a610-65d3-c3c6-8379915dbce1@gmx.de>
Date:   Wed, 21 Oct 2020 20:02:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <35dc2238-cf23-15a5-b214-533133e6bd9c@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NE9Uz4jL2/TYB2cQRobHyL58aLHrwdrrW93PHj9r+xsrPZiSqde
 /PgszibDH3TVj2IduMUHn43zaGJYoi9yL3uxuQzDxyh0DVtyuTd85kYBnpJv3IKH6scRRHw
 PMASsNYcNEnSm9eaCpNQyAMSpIhFGO8PiAMmVU90HqGzcIZrWNlqNPHVV7s113tuaZUAgof
 eIxwvaA4o1YqIl+KykDLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YCoTxjNW1Po=:zTHPI7F6CgzAaH+GyrSlvg
 87QjDflwxJhRsuuAHb3fuJc6vVJQAOgVkgLiy7shVwB+z8Fy0lMuNqSSZn1cvnk31y1hgtjXI
 EwYTYlWSduMOjRYjXEZq1cEBRNg3XwTH6JXh3dDEWQblhRfB/KtRvUqQOq5COPYnP/g/IRcQE
 s0hryo6MVWBaSc/WKa1sQYfkI8sRJgDmDTbvTQJkgW/weHv3Ntr5bt9Bc0GcbuzVoNG2kMbuI
 ixfufl+aUbkYruFDxSGOtKKJLRt/oaVtodRQ8eliDVgo8woveBcM8usEjCa+K7IHT6xc5KJ78
 rjVy8FzcNd8tHaEEFtJsc5CfX9ioamVzfDr2lxppuElNTia5XJEkDQOPkf0L9juFf1PqF0T7y
 QqBF+YRR1Uh1IVCCRXhgAnpZ3USl8epXJJogKQNsY3TrukFA1CWDpdWFNueURx0RzPXGZ0CKV
 S/EijQ5kWQnQ6OH147mdjkpZhATiBONmeMTdISyUI7AQ/0+uteu5sd+Fbec1BJFPIDU/VOa37
 IvEXvOO7UNMZ2aASWESz6rF5X128N8vWGCAjDz/y2wFMx1W669rtZPINyT4zzqdDgW2ZC6ZHM
 focQ7mc20ZVS0tb1mlXtViFTFIzNbe6dQ0Juv/9//UHKHa0clP5zSbj30Av0iOxJfFZyk49oF
 pLRwCAhdPvCsp6mjPj6ipqNdNqRt9L3qZ+RX7dpYxBPrnymJEllA7UANu9PQ+Kei+4oI7OH9Q
 TV7oLL0+itbc8xfdXyA4sQq1TXOnvV8TNnbvhVH+mSdFvjStggVMVGdEBufA7ZJ5mO2g0ZJ2N
 tYlgBz6IYGR3TFAVzpuOt/2s0x42YhwuQu1PCytsOJT/OYgVTVId+rcQUdlBUXj01U5cpSUOg
 itHerMxie3BlTuhlk5Aw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/21/20 7:12 PM, John David Anglin wrote:
> On 2020-10-21 12:10 p.m., Helge Deller wrote:
>> Any idea what I could test?
> Try kernel a build with gcc-9 or earlier.=C2=A0 It appears there are pro=
blem(s) with gcc-10.=C2=A0 I'm getting all kinds
> of random issues building glibc.
> https://buildd.debian.org/status/logs.php?pkg=3Dglibc&ver=3D2.31-4&arch=
=3Dhppa

Thanks for this hint!
Actually, I do build my kernels with a gcc-9.2.1 cross-compiler, so
in this case that's not the reason.

Regarding the memory allocation issues, it's being discussed upstream:
https://lore.kernel.org/lkml/CAHk-=3Dwg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9j=
dVwHo0+A@mail.gmail.com/

Helge
