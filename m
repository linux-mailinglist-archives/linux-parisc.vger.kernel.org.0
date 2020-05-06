Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E032C1C72BD
	for <lists+linux-parisc@lfdr.de>; Wed,  6 May 2020 16:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbgEFOZh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 6 May 2020 10:25:37 -0400
Received: from mout.gmx.net ([212.227.15.18]:41303 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727084AbgEFOZg (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 6 May 2020 10:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1588775126;
        bh=t4EiB2kApjxChXtA/NbfocZWkYag6A4koOo2jeiU0wE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ayeyzJnaMkMunQFiWok9H8edEDbw8k81uZfYu6KqCXrpPAPcg+adyJNJpblOscNdU
         r+tOQiaZVeuytTD065VCVgFnMAkAw7sdN2rSZtAe0yQLbAYapFx9eWyQekuP88W3WI
         1S0MWbhGuSrrfJrTAgvQIP9NFRXeMuD6JjPe3w0w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.148.83]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mFi-1j93us3EFg-0138mG; Wed, 06
 May 2020 16:25:26 +0200
Subject: Re: is there a memleak in function pdcs_register_pathentries
To:     =?UTF-8?B?5Lq/5LiA?= <teroincn@gmail.com>,
        James.Bottomley@hansenpartnership.com
Cc:     linux-parisc@vger.kernel.org
References: <CANTwqXDmktrv=wTFdg7+2+eLqRGbmaQ6qHvOrUXa=CiLjcX1yA@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <263ecfb1-c9b3-dc34-166d-77d6c7e75069@gmx.de>
Date:   Wed, 6 May 2020 16:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANTwqXDmktrv=wTFdg7+2+eLqRGbmaQ6qHvOrUXa=CiLjcX1yA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HlGHtwXpV5HnszgUt8yiGlYKLk15WcEbUPoEWpxTPZ9NNY7V2tG
 byRfWsGkdMFammyTF1QpU79gQpBXWdVOrBZ+Klxd1dw1fNE8sYnXtCZTuDQms1wn4Ka0SIW
 DQD/8Js7bcczzSIufqzrCrX1Cr3Dj2VPCzCNNo2LeeCwfPieDzaQF9e2m6RfacAkP+Tou3u
 Vh4LtP5mMZRReE+unjyRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f77CQEgzyOY=:ZfUMluovYdcOUR4PuXYZDZ
 afXDIP09Bll8xsw3/8qXenIvBKn0Ms3L1JdXxI9W+u7WD0FzUMEr8haXOe9Uw0PYAeLSeTQCB
 F+bXBTKGXDdeJCEnNu1fA5WndPfIEB/Q/slfLv0P66Lj9SNY2UW8LHlq577h7B9c1uYYiDHIs
 1qdIPeFH5kJGNXqVaa9MCf7paVRQZ8N+riYSO5k7OwdIdgSuZ066GWWd7Qm8nmg3XQeL3JQ7Z
 lCAwniMo8PWnXtVxw1m0SSJbefVGSUbS9URWS/wDRbnUP7GPAN+yyyhXxEPCe3a00cYx6U5Jc
 oawSXyjlhaJbFK9U2KkQcR09kssMlTsE2GYcobibWcYFgb1FDtNreyd3ChQbdpGx/QjCzndd5
 pgl6/yHwhPFNH8kwtZmGRVhPLO1ZZLOTF5S2OrazkBZaO2nbbC4KUYNhr1j3WAAT4EC4gSLKt
 ExR9zHtQGFIDE//v/vn4QP2UykQp4YXIhEz8f6ixvpEpu5WY8l3bmhKkAJ8dHUQG9WHOLmvVo
 VlyarpdCh7Iiy20fsT/NReulB/9d7zBeskhNFJdjV7wn+lo3U0J2FebP8QeRaHTnGVAR2zSEc
 Zv9kCspAic23Dz0k0pe5Vzo+anxxlVRnOMR0dn2uAKAqCPbdtdMt9dNCxrpcubFXK9rihI3ZQ
 ZwOL7kbXHxMZdSXHJ3eBMm4l0bf/rmc1kbEo8SdQEsAL5BmQpxgbgl1vjJ8g5xHcp++SNfg++
 JIVBCbBe89uzQ3OWFnGdD8FCmyjaDgvhwYCfM2UsL6UddchA8YbJ6vY3dH0dGQm8pXZuE6xtw
 +hevEIDU7rHJchmn1c3IO0A+7/nQLrHMjFqkzZ++zpyXWuWsLpEIBoGVnXbE4n8J13TfN/jMT
 x1ILiGP46dLZzE0sp/+jDN1hI3QJCrEySmswJydmCkhj2QceRNotTjlZh6Cdf6QzmkbxODud3
 GGh7Z59eQVRJA7ycnLHVYxbxY3m1ldwizKfZ0HDjvNuBrxBRQccyN8HEqCf+IizWzMxfPpzhf
 L/Wd8TMc4W15+PJzEbSQAfP8xmKFj73127JUHU/S2/edQaXWy7Vh0vKRpE186tezkMLksNqHe
 3OnYDAxvQfnTppUsUjg3KTXnpdS34PGnVUKaEA3WUTCNJ49ykuWrrg77TkyeYDAM5JNJ4aNfd
 tipRHAFWCtHkeoyhQf7AFJpTf1sFXe5XdUUMGy8uSjF8ig0Vr5JXNUgS1olxSIvrZbZV5SrEg
 O1el+dWU+ocP+R9Cg
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello Lin Yi,

On 06.05.20 15:45, =E4=BA=BF=E4=B8=80 wrote:
> I notice that most of the usage of kobject_init_and_add in drivers are
> wrong, and now some drivers code has maken it right,
> please see commit dfb5394f804e (https://lkml.org/lkml/2020/4/11/282).
>
> function pdcs_register_pathentries() in drivers/parisc/pdc_stable.c may
> have the similar issue and leak kobject.
> if kobject_init_and_add() failed, the entry->kobj  may already
> increased it's refcnt and allocated memory to store it's name,
> so a kobject_put is need before return.

Yes, you are correct. It's a possible leak.
Can you send a patch so I can apply it?

Helge
