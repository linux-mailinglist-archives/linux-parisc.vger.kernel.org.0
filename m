Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D852A920E
	for <lists+linux-parisc@lfdr.de>; Fri,  6 Nov 2020 10:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgKFJDv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 6 Nov 2020 04:03:51 -0500
Received: from mout.gmx.net ([212.227.17.20]:38513 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbgKFJDu (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 6 Nov 2020 04:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604653387;
        bh=f6e3ggzvjWRn/1qJjVSQ/HRVEn7cT5tEPCtr6AdSQdE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=kH7SUMxXalblBCont7ZI8izxZGLBrH0txc4aorW7jpicKGDTnSIx/jB7Rx26LBsn0
         mkQhyJJ2aA6yRZc8psS3/IHX6bKIQ6+7NwjhR+HavjQZ4uxI9s00ZM1FwJGIm018/U
         F8UbIC9bJQaDGK7fNsvqU6uR+2FM8L8BnymRIPuA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.154.21]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYux-1kM3MG1hTX-00u1k4; Fri, 06
 Nov 2020 10:03:07 +0100
Subject: Re: [PATCH] parisc: ftrace: get_kprobe() must be called with preempt
 disabled
To:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20201103074244.GA5615@ls3530.fritz.box>
 <20201106111758.8b4d6d0197acec6ca4be9a2c@kernel.org>
 <20201105214346.2d142cfc@oasis.local.home>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <4859f6fe-4c96-a415-3193-e5ac888c6702@gmx.de>
Date:   Fri, 6 Nov 2020 10:03:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201105214346.2d142cfc@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+UVHm3tg+rriaNEgPL8i0Ml5t7hRQSRs5XR4FOYukqYl3ucEKKc
 OgsFEJRpMvCZiY89yo2OMP4q1kuYat1vFggSDZvBUdMzqhGaf6srC/FUvocR/+Qa8IXymk3
 jbdyMVWW95Of/ag5MoQIGT+rgbrIlOgcwE36Hjh1CCe0tu7sW7JLeurcRZEqJAhrMAYRTxq
 4OyRPLxCTDxFrgCLoF3zg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mnJD+HuXHwg=:fG2a9sUvpClBK05CtQW6J6
 gL5aXIlGBz2zV6AJNJ+DavapBFF1zDzgjBrvv+CET6Hwhxi3Fn0ooe1lqzSCTeST3lXW3IS0i
 vC82Aggw8pAYASowQ9tkUbofuRpxs1VpiReF77hiKcOOwCiVRduxjf0E0yCmkTO1rbdl0wWYc
 y5LARkhs4b3FtY+u9jI3VsmLKXe2nGmq+ZpZlqP5yqeZLhyqXhrjFeTzyiplXRHAOzF2VkQH9
 KeX43D6UDGlIj8Pkb8MJWBNLM6I7ssEN71jqr1sjHcZnL0kOYPp6M/u3J7EoxudMcFWiUSEqt
 fYA3NRdQpJ7J5elMfrL+/3Od3+sg9/vcCBnK7wmyQHaHu0HT96uA0RUTBzPliP11t54WBYDqx
 ROgNUy2MGEEX8qJ5NHiGJyReQcUEYSsHZH/sfVBeA/3axan9Idz8RCItYBUjyLGYdBypvyAUX
 d/9q+POOi3oxHnRI2ALjUTz3zp+skKXW7/1rrUyykoL5qcBA40/uZfqVajycpBdcA4kJvGvOa
 SFj5ft/QD/T9e2LAwYWHy0cgzagQob0iYIHkWQy4Fr+ajpcFR4ER522MsqKlJyjU3t5EtXgFC
 q4SUfJSwhDBAhbCoicRN1aF6qAErF7jOB9AzMS3EevvoxYD2BqgZeL4EqSOZyF7u9UAHExQRy
 P4Ucv0ddWvqEjiIkWlr1cjI9advoaXbSzYM9r6SgUKP8GvRtYt0wRA5N3Q26aHl8rLVCqpJw6
 2JE29WdIQQ0Z3L2TMJeeBr37HzlfSOYQvQcpB2yOUhQW6OzXRTTQGP0jdcqiWszsr4sDbxwBm
 m4R3LfH8bCDNSn9HJgBPVLhweIKsnW9I1MeW7pKEpvtvm/xYLLupXQrBcO6jwTGaCJLWNG0Kk
 8+HF5OF1PcjF7iWwB2Ww==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/6/20 3:43 AM, Steven Rostedt wrote:
> On Fri, 6 Nov 2020 11:17:58 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
>> On Tue, 3 Nov 2020 08:42:44 +0100
>> Helge Deller <deller@gmx.de> wrote:
>>
>>> As noticed by Masami Hiramatsu, get_kprobe() must be called with preem=
pt
>>> disabled.
>>
>> Doesn't parisc ftrace implementation preempt off? Then it is required.
>>
>> Steve, can we expect that op->func() is called under preempt off always
>> on any arch or is it arch dependent?
>>
>
> Currently all kprobe function callbacks are called with preempt
> disabled, because it doesn't have the RECURSIVE_SAFE flag set. And for
> callbacks without that set, it goes through a helper function that
> disables preemption. My current patch set (which is not upstreamed yet)
> is changing that, and I just posted a new patch series that does the
> preempt disable before the get_kprobe() function for parsic and other
> archs, to handle the new code.

Seems good. Thanks!

> Thus, parsic is currently OK (without my new patch set, it's called
> with preemption disabled).

Ok.

Helge
