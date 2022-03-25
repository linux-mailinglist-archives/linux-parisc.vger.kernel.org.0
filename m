Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B79D4E79BD
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 18:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241150AbiCYRR1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 13:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiCYRR0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 13:17:26 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D87EE7F5C
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 10:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648228519;
        bh=svmZmeUlixhxRRv6ZnUCU0xb9XA0qG2opCZ2mzMqW0g=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=buYRgxYYa+yEbbXFVfF/e3j9sHF2n1lZvHJi8eCWAoR899Bv9l5XfYWQ4zLj9kZ76
         qFEHpo771cpGP5yLZECXtElpBadMzyNbbShv49Ejg5G00J6FP01chtClKaj5S6B2tI
         7eYF6rj5FHY+SWHwfXh8lfFcLaC2NCJ6eLvjcmSk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QwW-1oF0iH037e-011UYb; Fri, 25
 Mar 2022 18:15:19 +0100
Message-ID: <47027c95-6351-6f3c-7cf6-3afc85727de7@gmx.de>
Date:   Fri, 25 Mar 2022 18:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 04/12] parisc: Move start_cpu_itimer() into __cpuinit
 section
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20220325143833.402631-1-deller@gmx.de>
 <20220325143833.402631-4-deller@gmx.de>
 <10053922.nUPlyArG6x@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <10053922.nUPlyArG6x@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QSjp53/Nt7tO7yyNTvRAYv7kUYirBMmQBpinOi5nd/kvoVD6ynW
 ccnLw3JR/bt1JpUFnjeAVUSImwodKcFABTAVRGuRmvOoKTpy+hlUoqMVeGuF8+CZ3UQp31q
 8+bYldKa8z8UZr3wPmRVL4zhW92nO73uoBwAsKYz2X3CYd/PLyRa1Uav/lBC8TIxx9BWLpw
 KDH/KG8++XXFOAI4oALCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H3yo3STRm2M=:BV39qizhG+zOpi74lW/cXS
 xzVzeAY/c+ARs5JbLNYSMyq5G+ZZRhehdK4PDpmHonb0hvwghsilXtnofGdLaOM8eRYZ1INFb
 REya+n/7yTYJ/zU5VpgSxUgMb06hYwS1ntH7Dut6snXhFjXUURue40jzPratyB+oSa1pYjrt8
 KIcYkjPDg5latZZ3esxYjF+btS5amFt6F3Ft79U/LoSUbNa/0yAdqCG6obWrCqgadx/IiRUAM
 ry+XaNjZsNkhRi8hGhrsUXrjpMcG+tte6AodATpvOtvyKck2nCWP9l344lSP91G+m9+wHx/kx
 u+pdUCssobCGZe8eCW3aSWz9FrIVgTFEcjM+2GgrslF5LwmD+DcopvyJXeHfbZO4OgQ1BP3ki
 zWbhB776zHuAddMk3ShM9XzgJdY42S3QyBfn8sN8IagQlLXndfIJbpb5n4i/WdGJsS6t2AgIu
 pwOBGC7FQHbZL+B6RSNSko8OduoxFo+8u8Z2nMLCpLMrFk8aBe/5lfcjzLtfXsjTosrj7NW3p
 7cdnH8Fq5MRERTpPtCxFtAMCmvLKutxN/IUV++lh23o5TTqjajlfMwud2m0CCjI6e7cylOOXv
 XLAXXAkrSork0eFasLJODBNCMtey6ThowKZwwOxcH5M7edqtVFOKQu90wNXMr2UvbUM5fLaDv
 oAOuLYc1yDfjrppiruoniKGlmXp0NiLBk8lRwJeOOv7bu+AfaRGH5Eb2dcMA7kD9vxRSpu+hY
 AxABB/PoALOXSqhMnBQaoCEAHaBlzvYaVMRy0xqSJAW2d0KJFSM2LBi0jkDz7HCv7qvPf+RI+
 VbWAJL/25iWKKnlVVusQMIZ+JsBYBzzdIkLapKcfpUD9QctpTj10P506p/xJtRfWb+qAFjx1P
 4f1vLzAWP1oXUzS9mmnL9P7QPqoOM6NXQU8MYP5ayko9kXKFV+fWvzD47T4MLNzJ+gI/n+ps6
 H0TTFRNr1lEI2cPdWrp8junQwHdVgKFi+Un3lZvHeBzHxRbQ+l5G9jF3v5DSjArOMZtJhOROa
 uRQ/XBAd4DTLbiAZS2ZrIdzD4BGSueF5WhPcO5aSz8z/+5VTcKv8aGX1uRcQHwi5CNaPtN4k1
 qhIdzP9okWbNL0=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/25/22 17:53, Rolf Eike Beer wrote:
> Am Freitag, 25. M=C3=A4rz 2022, 15:38:25 CET schrieb Helge Deller:
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>>  arch/parisc/kernel/time.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
>> index 061119a56fbe..4101392bf74d 100644
>> --- a/arch/parisc/kernel/time.c
>> +++ b/arch/parisc/kernel/time.c
>> @@ -150,7 +150,7 @@ static struct clocksource clocksource_cr16 =3D {
>>  	.flags			=3D CLOCK_SOURCE_IS_CONTINUOUS,
>>  };
>>
>> -void __init start_cpu_itimer(void)
>> +void __cpuinit start_cpu_itimer(void)
>>  {
>>  	unsigned int cpu =3D smp_processor_id();
>>  	unsigned long next_tick =3D mfctl(16) + clocktick;
>
> I would have squashed this and 5, 7, and 8 together. None of these patch=
es
> adds any sensible description and all do the same.

Yes, maybe I'll do that. Keeping them seperate makes handling easier for m=
e.

Helge
