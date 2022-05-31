Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3BBE539558
	for <lists+linux-parisc@lfdr.de>; Tue, 31 May 2022 19:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbiEaRRl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 May 2022 13:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346487AbiEaRRl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 May 2022 13:17:41 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7812CC90
        for <linux-parisc@vger.kernel.org>; Tue, 31 May 2022 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1654017443;
        bh=m3St2I8MTBVdqnWsRffv6TkzHlrytzjvGVk3ulY1dyo=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=AFGwqE8+gGSn6PEREYleZJf2RvYrCIcuD+Qyd7B/TwET47JIwMGh+5wvpE1a224oc
         R5+eFR7cigJGNVLa8B7YuIBmeM8xdPINV86E7ob5eFDy60xg9IDhJ1zPNDCh5lBtVa
         bca8z2I3WZFMcW9pn0WQuoUO51DO+cCE7zivYJGk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.178.167]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fii-1npa9r0LdY-0122PG; Tue, 31
 May 2022 19:17:23 +0200
Message-ID: <3b471bfa-595f-cf1c-6d61-8edcd7c39ffe@gmx.de>
Date:   Tue, 31 May 2022 19:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: non-booting kernel caused by "parisc: Switch from
 GENERIC_CPU_DEVICES to GENERIC_ARCH_TOPOLOGY"
Content-Language: en-US
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
References: <alpine.LRH.2.02.2205310542460.5691@file01.intranet.prod.int.rdu2.redhat.com>
 <4dcb485a-d0ae-9c49-5bd2-43327e930ee5@gmx.de>
 <alpine.LRH.2.02.2205310832260.16547@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2205311035450.1173@file01.intranet.prod.int.rdu2.redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <alpine.LRH.2.02.2205311035450.1173@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2HwQTZqjjJpo+m1sUh1P6P8jRogUIgiyA4YT8d4Vk+Wiqmg0KR/
 sDZrayUMkoknH32PYilwul/V8oGcxh/jhu/v/E/oSPCp9w8Yld86fB6MwcbYvoqmpMJxvbV
 yvWHuVQ2rPU194XGgCCbm5syIPw9hg7JuOcRh0M4kPnw7xoaLJ4p9CHEHpFZD2VU6u3Zvf+
 MVvDm6h6P5FD7wTcLauDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7rV/+4OaibU=:xRrcSaMK59w+k4WIpu217b
 Kf9Rqq59A6oZR7Kyh9/vQvAfHY951zk0ppB/qqfEdcInf2dFEz/8e3UnUwlj70oSBQLJGQSFC
 /Kqwzc5HgQAfH+5KRF/c5FVEdCT6+QjycAK3kKdEibEL+nrpRxRNXKU7gVKwqoQMaV5S53nVs
 g6fCIJn1Ws9uAFL7cIGgPXTSARGCxjjZvHaPKCRrDeml28pYOH4jIv+DrZZ3t5RiLii8YuRcs
 uItywhZstR08cbqwmZSd5C1RNdgzVXxdra4Lm+pOTcqeIHD5CdyLweGJLcmWgi0SQoYgld2Qb
 ASRwUKKwBJbxwRc0l8cOgvHinezGW3dHJPEIDHO1Bt9iz2eQVlgosZW7jHH+ksNdml69FE55w
 RPOWl8+P6rXSlnIRj0eQq1NPO+FpqIh7CFMeBX05gI2AZubnm81xuercg/Amt1jbHWUojTrV8
 cBSlDE4VhpEQ0Tw38hXDvUNBG1lBo+t5q5UNJ3XbBy4Cvj6lvoixERK0vaQMvJb7BU4VigaaD
 Ec+j7G0ChxpoDkQMkP2oHAjuCZhQNWJjjwbFOyKBhvORq6q10heWcuKGksWfFyIfgg2v5MBzr
 tPU8AwIjNSOuaiDDmYM37ePNf23T12jiNtv5S+FTsO597rMrs9f9FGFTqibvDG95bibKd+PY4
 NzjEcvMzZOtE8gP7pipfv6NrA0k11kgvuQveqZvn+GcwEQD6fF58dKG5bJaOYlJrIblk4xnhg
 qbHmwRq2nUeCyD17thqvoFOAsUWXo69PYoTE4VxXvKgv+2BFqoFo17L8JMbttSDjeNjAjyBRs
 rdT6mjYDhxkVrnVvHFDDBeD5WqdHej0FRkBLr25nnRlGqs2PbtXmiq81HZJJ2SSdJGAFmHWlB
 OUS33XazmtuZdm20siCBSvwbC1xfeQzWnOI1W0gOnC0PhkzG8lGAS3v+m0uldEWMhCiP/oZW+
 x4WyrouvkoMtqT+1rLz8VeK4Z+sUo4HGitj9QoqDPGh8dZuAu0COalxkX5iLyEBcXVkuGFTEN
 WYH4hNEycWuVlMCUJWKM3BhsPHzIudCFuEHNAXPO9vN/cCH6LLbYOlxqTZxlEUYsR9rqkWch5
 qNDaom31wG/AlJdRg8IlbVgOf9vEXEyRp4SSX5D5ZKbb5dkBf9jNYwR6w==
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/31/22 16:44, Mikulas Patocka wrote:
>
>
> On Tue, 31 May 2022, Mikulas Patocka wrote:
>
>>> So, right now I'm somehow lost how I can help.
>>
>> If you don't know what causes it, I can try to add some debug printks i=
nto
>> the kernel and analyze it when I have time.
>>
>>> You could you send me your .config, then I'll check locally.
>>> Please also try a "make oldconfig" with your .config so that the optio=
ns don't have any leftovers.
>>
>> I uploaded my config here:
>> https://people.redhat.com/~mpatocka/testcases/parisc-config-5.18.txt
>
> CONFIG_SCHED_MC is causing it. It's on in my config, off in your config.
> If I turn it off, the crash goes away.
>
> The crash happens in "sd_init":
>
> sd_span =3D sched_domain_span(sd);	sets sd_span to an empty cpumask.
> sd_id =3D cpumask_first(sd_span);		sets sd_id to 4 (it is out of
> 					range because CONFIG_NR_CPUS=3D4)
> sd->shared =3D *per_cpu_ptr(sdd->sds, sd_id);  sets sd->shared to NULL
> atomic_inc(&sd->shared->ref);		crashes without printing anything

Nice finding! Thanks.

I'm tempted to drop the CONFIG_SCHED_MC option completely from parisc...

Helge
