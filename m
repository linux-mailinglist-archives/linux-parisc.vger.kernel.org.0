Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009B45390A6
	for <lists+linux-parisc@lfdr.de>; Tue, 31 May 2022 14:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344255AbiEaMZE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 May 2022 08:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344254AbiEaMZD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 May 2022 08:25:03 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5508465406
        for <linux-parisc@vger.kernel.org>; Tue, 31 May 2022 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1653999892;
        bh=62eRyob0vYOyX9fnVHCWGfDDks7u8BEUEzuW70q3I6s=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=f8ZrrEL7zj6+pwlY/KQEC456k2X05JHfUnwtbI0za555rYMM+eVUdsDNc2CdAVItn
         Ma6izVy6lc004f4Va79MAU9sWW43YLtL428gGd4BlqwQe1Dbj+w8MdT0J7kYWNz3gY
         WY/95n1NCNjkQwadPxjv9USBO8w4JXSyJQV1nXBA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.178.167]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8ofO-1nhQiz30Gk-015sqK; Tue, 31
 May 2022 14:24:51 +0200
Message-ID: <4dcb485a-d0ae-9c49-5bd2-43327e930ee5@gmx.de>
Date:   Tue, 31 May 2022 14:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: non-booting kernel caused by "parisc: Switch from
 GENERIC_CPU_DEVICES to GENERIC_ARCH_TOPOLOGY"
Content-Language: en-US
To:     Mikulas Patocka <mpatocka@redhat.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
References: <alpine.LRH.2.02.2205310542460.5691@file01.intranet.prod.int.rdu2.redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <alpine.LRH.2.02.2205310542460.5691@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q3j2AqdumzSAWOW4tQdqSbjeYpZHPnzYBjqpyCd7hUk9furmlth
 FZ1uJvQ2KnyDuBM3SjJGkZYT/0a67LvQAj9/YQjcrbmIccLZDhtwr5e8UrZXCHB7xwi/q8h
 L/P1L5l7/1ZmFVxUJjQdcHIhW9s+e1TQcFM0FYHzjURSkZ+COH/l4rpz+Wx2w7rleLj1rWA
 HBg/MtMZ58DOSEbLMEH+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XhG6nPAKAcg=:DSbEiHZf3RCTvGkRJfx/z1
 luPQamV9SvFuaZOBDyStVXepHFxzp+4NRpTaOgqxFV1JzsW+sb7w+LoiC1JpUwdCwqAEVpc63
 DRTsic13puxmW5WzpuHBQ4hZfXXLCkr6TwNk6RbiaS6wLCnXnXnVK8gnchNq9m7Y7NYi6OgiP
 TwpPITnnK8hksqVSPxqxJrvQIXx2Hw4jBlrj0MIgbp7G/piyN/cbDHh6JoHeaU5N+PiSzCbIb
 M2YLpbTBWO30/WZ9nPPB7Y6ovTEoiVGETxJfM+NMiunUpZLh8jt5bIX5Gc/FEgCCEawtm8+Px
 wbToiFSQL6LJGtxb+n4NY89FFjyAXd2YFGjcB97HHsmsqgmnxF4N867Ew8NREZdEY6wf2B2pQ
 n4Rth+6r4Ss4m1mWD7GVg8HzZGcTlipl1WwDbtM7u8rsN8HdZo86kz2LS0+tybcs1A5MGv0dq
 H4bXAgEOZk44LI5KpScnpRkJfDbvzLgICNVGi/MD0YrGRSSMCuQ3Yx0dCgXszAkBq5N/fi870
 JPKYRf2QAPXc9JthyoJ8sjr68D1YGieAsYwYtDra0Ahq0UONqiJ2Abcu7yigH065schguZGdK
 xz5GeX+vIutZptQDeOKvk4+nSN34p4Xtrq32cEkA7Rj/0U/xSTTGWR8B2UAFysPhJ50VG4UuT
 +3/N31QHfpSm2EXiBklR4CWWyT/5NtenbHpB4MOXzt9oyA1m70/j2sfpj408FBxIG1QpA8Zwp
 ybSoQvVcFO1SSA3a65LZfQBb11OfU1MoBeLSbC9MiTEPPIPl9xXmhdQbO/H9DnKT0sMF1qj3n
 AuTfwBPzVlpipoSDWyT8qODINXXFj+WmOWCPwzykZVlFKEtYOBzeZpXWHkFFkUIldALKf6xmu
 TtyFL/+y190I8chFCWjXH6GeWmRZ3DY05jS4/aPiiHNJJNXImGKulsCf/kQ4Xlp9B+gOwbBlP
 qfvH5H9Y6qRYiW6IaEfu7ZNeeTzpSzzW+Vcmppcvw58PTfL68EeXjUPphNWzBRXQ21i35k4sn
 2J5vAeP3F+E7DqF8xZ1fIkmoVCaaavGrydbH6r5pzVBmTUbAMRVC0tBLWny6L7Z1g2BgDxCdx
 j/6qjreZC4YDV5KWd/HJj9s0e2Db1Mote4V8IumgWgWn3eBbadTZvU5hw==
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello Mikulas,

On 5/31/22 12:43, Mikulas Patocka wrote:
> The kernel 5.18 doesn't boot on my C8000 with two dual-core CPUs. It han=
gs
> at this point:
>
> [    0.000000] NR_IRQS: 80
> [    0.000002] sched_clock: 64 bits at 1000MHz, resolution 1ns, wraps ev=
ery 4398046511103ns
> [    0.107049] Console: colour dummy device 160x64
> [    0.166791] Calibrating delay loop... 1991.60 BogoMIPS (lpj=3D3317760=
)
> [    0.270079] pid_max: default: 32768 minimum: 301
> [    0.330158] random: get_random_bytes called from net_ns_init+0x118/0x=
4c8 with crng_init=3D0
> [    0.330394] Mount-cache hash table entries: 16384 (order: 5, 131072 b=
ytes, linear)
> [    0.536892] Mountpoint-cache hash table entries: 16384 (order: 5, 131=
072 bytes, linear)
> [    0.644729] cblist_init_generic: Setting adjustable number of callbac=
k queues.
> [    0.740083] cblist_init_generic: Setting shift to 2 and lim to 1.
> [    0.820179] TOC handler registered
> [    0.866852] rcu: Hierarchical SRCU implementation.
> [    0.930550] smp: Bringing up secondary CPUs ...
> [    0.990084] smp: Brought up 1 node, 1 CPU
>
> I bisected it and it is caused by the commit
> 62773112acc55d29727465d075fc61ed08a0a532 ("parisc: Switch from
> GENERIC_CPU_DEVICES to GENERIC_ARCH_TOPOLOGY")
>
> When I revert this patch on the kernel 5.18 (and resolve several
> conflcits), the kernel boots.

You are really sure that you test v5.18-final, right?
If not there were multiple hickups during the -rc phases of v5.18, and
bisecting through the -rc versions won't help much because we had multiple
issues which conflicted with each other and prevented a boot.

But those should have been resolved with my "for-5.18/parisc-3" push, whic=
h e.g.
partly re-enabled GENERIC_CPU_DEVICES:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3Df002488d80b557c7dc540457b176011449895fcb
Esp. this commit ("Re-enable GENERIC_CPU_DEVICES for !SMP") fixed it for n=
on-SMP:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D1955c4f879a130c7822f483cf593338ad747aed4

So, right now I'm somehow lost how I can help.
You could you send me your .config, then I'll check locally.
Please also try a "make oldconfig" with your .config so that the options d=
on't have any leftovers.

Helge
