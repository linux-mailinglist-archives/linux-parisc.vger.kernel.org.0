Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D735E950C
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 19:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiIYRvZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 13:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbiIYRvY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 13:51:24 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7FD1EEFA
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664128274;
        bh=Lnp3MRasoMYtdyT+aT4STQA4Hg1xnGyW+HGdsB5lhXM=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=bnJS+/81kz8SnJp+Xcrw7ksTlKHU+vUYOhXpbG4QbROX9Q3rxj41mkmIla+Ghh9Cw
         7J/TDi06vhQOSubLstWNI0r2lCrjlASTZ98z8ylzpWkyURkCHJChG+WO2tbNUnHd3z
         8DlRRbLQthj+AVftcaoAmRrPLmrST2tB9pCM3FEI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJqN-1ozDUH0ziN-00nMWs; Sun, 25
 Sep 2022 19:51:14 +0200
Message-ID: <92a8b235-7d04-9931-a153-440adbc8802a@gmx.de>
Date:   Sun, 25 Sep 2022 19:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on UP machines
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yy/7g0NzOi/igNi7@p100>
 <d195aae3-b76b-1365-6e53-28c6791c77e3@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <d195aae3-b76b-1365-6e53-28c6791c77e3@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PfdYFoa3ATzPJA6lXIUMY7JQ9p2l14SY5kXrQ0fx/f9ikpV7CV0
 jQLkmP0JoWVMRg2fkKK+9E5DBpbWel5j/eou0laLmHwICE1nmT/GiHFrgLPg0SP15WUYmVM
 IO8lakRxOIZrlDnUTfiQp80EishPcl5cOvk1rv9FvBXO2UY1F1H75FEFCcY5750PvNXBg2H
 rla4YCJqrPdqwreQI1qxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3MuovWY/pKQ=:eyFcFwP/8pVf6mYMdPdKg0
 deEr8nZK3pLuxq70RnhwiSxr+LQd+qF6lg+B60duNiI/5X/bEQi1RlhuBISqAnI3eTAg1OzBW
 JW36Rr3rWGVonoVakuEzgxVkRk3RnlKOGlHljVvIJS/fBqpFLo7BGhL2Cv+1N/RTMXmn3EFSh
 uuM/FeyEgDgdonyL7Q7ucdbRH74xn46SR5TmZr+G758tRTShCd7XNbyE/AUJLkJOkS3klx29T
 e0BJbUQHoBiguUfGL8h4Xv2CQNbOLwbtA+Kd9CSFpVJWBq2bwA9XntHat31jKLjP+Adxc59tc
 e31Z5EH5sZJ5jaSHCJmwFKtoys97Hc0bSZfHePhg9gp1sfJTTCGnKpGLNQRzhZqsHjuidx4ha
 O6XbZJHFaqO8Aebi8budVkKvPLjfpFKwJ0R+rRtYfaceGLr3FHyUw1RQx3YBHVm5HYaeblRab
 8rwm1n3FG94ELilzT75VWm3Pcq7SfAEiXZIAJ5R0Kaqpwqfhl9GAwoczNeR3V1hgRSxa+Bo/8
 09xuLCpUhQEGZFeSOkPwdLI5LtMXV0KvfR/82tbNDAdYW0Nw3yzLdf7gZXK2h5jshXTCKSOWI
 s0f5WM0dT1k6VvguJRPQXG3Unw+iDHd0qmBH43Tey2KbR3p4p0lsGHksXcJGnEwLIJmHcSFOG
 UB9CpB3THJMM1j7bnmsUUJpWF+pCx1n01jULom/aO216d1gwfpOrXfOTwxzh+VEAMZLb+9U8H
 0A0ANwYFsSS5hMTvvT6QHlpgo3IQE70+tb/k/xKGI9xx0CQ1DDDKV4ofgh4sxxBVdpPgfuU+K
 bFjgPM7uJYzy+jIGyIYBC594eOXT+zLv6HSnaZlR34OmOkesINhecJabvA3GbaorLPP8brFto
 eqh6lIK65X8/61vtszSA77bsENoSE7qHi0ujkPMmCjkhJvn+ld24aJpA80R8g4/eDESj3lB54
 7mK7uyFAWLzxnO9bYd9jfMpKE3CBIQqDkNMj4mdtQz4kFaPm6rSL0Mdu5hXkiRKTuj7/GbwM4
 YR1K3Oa684bhPELAyToIiTh4CWtkaDnr6Jr/o0v5AouXx6RDCugDQ9IEnu0OJsHJ/Zd1slOl4
 wGCAUNyw93V/PW6zH8rhkRBwIlKPeN8SvrlAT4r9Onb2zTbrDRqKxm/nbz3KLfbfTbvbdK2RA
 z5ozd3eNq8SVRGFiQ0GNzW5b18
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/25/22 16:33, John David Anglin wrote:
> I believe this change is wrong and will reduce performance.

Yes, could be. That's why intentionally marked it RFC.

> The TLB setup for a TMPALIAS flush is local to any given CPU.  So, we
> should only need a local TLB purge.

Can those function theoretially be preempted?
If so, could it be scheduled on another CPU where the TMPALIAS isn't flush=
ed?

> A local TLB purge doesn't require locking to serialize PxTLB broadcasts.=
=C2=A0 It is also=C2=A0 faster than
> a global TLB purges

True.

> Indeed, the case that might be wrong is the one that uses pdtlb.

Which do you have in mind here?

> It potentially needs serialization
> on SMP machines.=C2=A0 See comment in pgtable.h.

One goal of that patch was to drop the CONFIG_PA20 ifdef case,
because a 32-bit kernel could be compiled for PA8000 in which case
the "pdtlb,l" will burn the machine.
I'll send another patch which takes care of this without changing
the local purges of pdtlb on 64bit CPUs.

Helge
