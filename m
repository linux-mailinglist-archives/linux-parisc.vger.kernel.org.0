Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD90E7A3160
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Sep 2023 18:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjIPQTN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Sep 2023 12:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239400AbjIPQTH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Sep 2023 12:19:07 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467ADCEA
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1694881127; x=1695485927; i=deller@gmx.de;
 bh=WbUxVaVIXZUYBPVha2q+RbmaT7HSvptdbjzXB8/M/yU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=hMIJ+b6UTufKtzu2289qjxzAr8FICcy6+Kr1dsH3IDfCH6tg7/4Pb1zTDGEDXvMZfn7Yh1RDLM3
 NOI/DT9rWYe7K4AK8Gnrje1Zt4tOo6+JSHTkpUF/pg5vWI8zWvQn6C4Kw99QhCzYs7pPvO8ebsTwd
 VZ5He34VqXjnMSb6rbWS7Trx3ChiwG+CfoX1Rz2fYoQ8BuYftu+f7VWjilNw8dbd3nsZPTgKEmADB
 qdVjVcOaP1xnvyn5QFBO3uLT3R7X4Vast5Djyqsr3McqP5IDn/Yzru8Qk9WTGL8L0Apk8k8Y4YJ46
 twLukDuhVv6n2GWlEgsArPlz9l3QVBNxB4jQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.154.45]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKFu-1qqvvJ12Xa-009RLf; Sat, 16
 Sep 2023 18:18:47 +0200
Message-ID: <953ee56d-173a-aaf2-c7fc-34386f285340@gmx.de>
Date:   Sat, 16 Sep 2023 18:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/hppa: lock both words of function descriptor
Content-Language: en-US
To:     Mikulas Patocka <mpatocka@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     qemu-devel@nongnu.org, linux-parisc@vger.kernel.org
References: <87bd9251-5d6a-11f5-9a28-78224a776742@redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <87bd9251-5d6a-11f5-9a28-78224a776742@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YXfWb/Q2jm3kgiZ9dRCZzX35SfiAELOB9gJbfh5g2mbrCUztQq1
 HZx/vuybtR7LJ+g2XxJLI5pAsyNaX8jHta6gJOZsxn5VIW0KVe6YLWiYNdRve/CriBYQOjK
 7OOwrwLNI+KRKfe0ltmwBdEK2jrVfe2v7T9jDhAnUp7ff3d1CYUGE6Kec8126/jgFLWdg63
 jV0jpB8+zC+wikspd9+RQ==
UI-OutboundReport: notjunk:1;M01:P0:XB7k10EdilA=;+pGuLHym4plew3GP1gOrktjrWqt
 KY7VGva2av1SdGK8vHY7rtWjAEFuCIRd+sMi1Bl752ygHAv4BvgcbpiGZwttjIR4eTubB11ve
 Ce8vUWKVptW+lMGEIgQgV1/OOHoBnx6FP9gF5d/pnEri1qvV0qDNbB+crXAr9P92vvInC5Go0
 w37cR7eJsrvvIOLz21vB05KI3APmWK5bdHvr5/UTaQ1eWC+6E675CKMg8eV5uVqIBjiiGskax
 p5u4APo4ScIBfNHxKwVrOJ9SIMDb7trxqhllOIn2iHlFrIwyiajl0dEs9TWJSNnOSMK2htqJh
 VisBtsbRgZB87AYpDqWa9b8usvk9h599eI2o0wT69JDCO7+HFSZ7g8cF6z0Bixe32QWtlwLbj
 nBFd8xUUYROLvTRKlW2VqU0tn25RXtNet55dqk9KvZLsMHtmnxBY0xjJZf6Hf2u4AUXOfawjK
 ZEeRIOZSKheJtQke+WJrTaw7bG3zepKQeaWQtNlUYbOspRbAIgaO/vOim4IVq7mW7Z49/jj+d
 gDewe0A4L5I3cYhW5qtQTRp5Uey+d3WwKoMoBBCJ45HFpIubnRAGDn0lmQ7rZCzQYjpX+webx
 Kvjra1olUqzkIGwyL4bM5PoOKPGUo9MxVqoVTZMrDpZQSRa5cZq6PY4CcM7alQbbVi21h1J2s
 TW13StAPgXEX76w7zgiobGO5OfE4ndtyeuQLauhv7qBTXZzDveJs/5R5IHyc117rft0I0XtJc
 wyEp+rKHigP4kGCWwyKs1wuxIEttD2W7YPAFpujf+ClOE3xgVGx8pg9VsKVh9lXCcEospAoES
 Bb9jwkWJllejIXEfqNr5h3XX4BNI7ltuAMLPxWKp+rjYBw2rZmwkCVYC6a7fCM+y/E5uTNOSD
 x01RkLi9yPwcfCSEDX9UQa049QK1dmwkco1/mTneHwzJ0G+RpwguhnpfIxd2Q1QESvB+MpvQ/
 p8KibQ==
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/16/23 15:52, Mikulas Patocka wrote:
> The code in setup_rt_frame reads two words at haddr, but locks only one.
> This patch fixes it to lock both.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>
> ---
>   linux-user/hppa/signal.c |    5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> Index: qemu/linux-user/hppa/signal.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu.orig/linux-user/hppa/signal.c
> +++ qemu/linux-user/hppa/signal.c
> @@ -149,12 +149,11 @@ void setup_rt_frame(int sig, struct targ
>           target_ulong *fdesc, dest;
>
>           haddr &=3D -4;
> -        if (!lock_user_struct(VERIFY_READ, fdesc, haddr, 1)) {
> +        if (!(fdesc =3D lock_user(VERIFY_READ, haddr, 2 * sizeof(target=
_ulong), 1)))
>               goto give_sigsegv;
> -        }

Patch is Ok, but I think the qemu coding style is to keep the { } braces, =
even
if they are unnecessary (as in this case).

Acked-by: Helge Deller <deller@gmx.de>

>           __get_user(dest, fdesc);
>           __get_user(env->gr[19], fdesc + 1);
> -        unlock_user_struct(fdesc, haddr, 1);
> +        unlock_user(fdesc, haddr, 0);
>           haddr =3D dest;
>       }
>       env->iaoq_f =3D haddr;
>

