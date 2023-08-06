Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85F1C7716B4
	for <lists+linux-parisc@lfdr.de>; Sun,  6 Aug 2023 21:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjHFT7S (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 6 Aug 2023 15:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjHFT7R (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 6 Aug 2023 15:59:17 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97488171A
        for <linux-parisc@vger.kernel.org>; Sun,  6 Aug 2023 12:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691351948; x=1691956748; i=deller@gmx.de;
 bh=FmT0YulupjHQ2/Bqsncffmyyodn2xJijPFA9ROqRVpU=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=JCcj5pkQtFP4rUhYmmnBJJSOh4Qh/TY/nW45jbrp0ZgtnFAOaWxcc3LyvnYOTmeuAYDLBtF
 9xlvXS3Toe9Ra9TeN8402WY5k3LTvoFpDqgbNrJb8N9RHaVA7DIHgTDole8ALmTByZ/3OXnEf
 t/NHYyttSTlHpTJp+LjSb0CM/Yp7ERgYdhmV6vi7Kbz7ngcnaamScd4Tko65DxbJbB6K9i6v7
 O2XwjwsEAZrIQqo/7saeQrotzwQs727AkrUGtzknfu1btp21yg/0qtLqrvROrwFG+mGqjR9NJ
 KTnjZHgmnJg5ZFi+XI5Rgks/Z78GPmpa4xjMbfGoAjJOK4p5Px+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.250]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O6Y-1qOsok2ErG-003u33; Sun, 06
 Aug 2023 21:59:08 +0200
Message-ID: <b9a15934-ea29-ef54-a272-671859d2bc02@gmx.de>
Date:   Sun, 6 Aug 2023 21:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Regression with kernel 6.4 "swapper: page allocation failure:
 order:0, mode:0x100(__GFP_ZERO)
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        Mike Rapoport <rppt@kernel.org>, linux-parisc@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>
References: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
 <ZMooZAKcm8OtKIfx@kernel.org> <1691003952@msgid.manchmal.in-ulm.de>
 <1691349294@msgid.manchmal.in-ulm.de>
 <f361955c-bcea-a424-b3d5-927910ab5f1d@gmx.de>
In-Reply-To: <f361955c-bcea-a424-b3d5-927910ab5f1d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZiViuPDvUHYivMv2x+HIb5rAHlJLYSjyCq90/PDHVo/dmHSkyMV
 x8/Yd/IvK6laRT9ltBTVZijJRjhz27yrGLa8+NYt2c0PC4gj89k3jNhYwoUqCYOFByDDZ2j
 uDa/FC24zjEDXDYnTIV68YvqoNq/wHc5IvhDaAivkXYFITOyo8R3zIqk1zlZMV1AomfHdfK
 nah8oJf9OW7AiwAzv1DFA==
UI-OutboundReport: notjunk:1;M01:P0:cZWBOUwru2I=;FXFD2IEGbQxqceACFrKeKA+JFjr
 XkaCWNlILwrN/hXeIZ3Wa/uOlVxLBJbUeb7mOzE3smOCkp+cFCbH9kL3kP15QgvBRd/ku4rDA
 S31aAD+/6Nase/Eji5jfprTcxHuouT2sDXepgKuoqSlMaORBC0bVem8iHKqvlW8aYwy9rQ+xZ
 21mHLzHXWiGd/KdLiEawaUANnYa2a208MPYVMpaZlCpjNDQ7eBWK/7mbnP2KZu575jI5gVb8y
 b8VZeTz+5BxYZBGQnjV+758sm7hCRDa5RNgWthgB6N19yw7gYWPBDJew2xdsed8xFtYMyrUjl
 0obWH/jPKDKM2RYkP+APv01B3LlOwCy+HBWktJxIfY0EH7+/aOnGRdW7vfOisufGJCFLX2IPj
 NpypB2wS5fKa4606QvqgiqQyg7ibxxOlxo3h3Ygh2hH7U9jF5Otqf6A8AMIBOXSD8Uyg9otIj
 ZSIr8WkQ2ycA9OUYecFYeRfo4lfXFJe/HzgEZyMFhjBjDh/wzK8YbtBLbQ2EzoNGsG/hxg7I0
 03GNfHCfXgdJFMXAkxdFCIKvBHBA8sHFh6hiTBL16KDGU7DlT+rgIghEzf8VK5otPo1B8jki5
 vb4Gi1cRxC2LO641F29Vha3MpnZ7IOoxAXfS8C/HFgm63q7Bn0u4TQ8j8skDBEwFVErIwTDVN
 QnJbBui99MDuNRuot3gUuDf+Kcobv9ZmyMYRTm5Xy9lFqU/ai/MTZJGMMT/lKGx4g63m23C/I
 6bmEs03MC5BiiDA5fMavrsCxpdBZuN0Q739u5qeLt2MQocGmRlTwbKZB0e1LeIFd112nPM3Cf
 0wz7BHzHfbuO7EScLngqCfIyozKboimLn3/ux7yDRc4W2g7pEzNz3NDjTj8vXzsahJVpPh9z4
 3CPAEIeozIYSj6XZdtxyyc+AV6hfriOEwynIEb4a0GrI/3+3CQv5WYqzBAxLMNW0QQBLc9bTT
 RzUwLUN1zr6HSwbZn004wDXEDsA=
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/6/23 21:54, Helge Deller wrote:
> On 8/6/23 21:21, Christoph Biedl wrote:
>> Christoph Biedl wrote...
>>
>>> Mike Rapoport wrote...
>>>
>>>> Can you check if the patch helps:
>>>>
>>>> diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
>>>> index cc15d737fda6..ae3493dae9dc 100644
>>> (...)
>>>
>>> Yes, everything's fine now. Applied on top of v6.5-rc4, there
>>> were some offsets.
>>
>> Now confirmed on top of 6.4.8 as well.
>>
>> However, there's now an issue when reconfiguring the locales package in
>> Debian:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 Setting up locales (2.37-7) ...
>> =C2=A0=C2=A0=C2=A0=C2=A0 Generating locales (this might take a while)..=
.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 C.UTF-8...cannot map archive heade=
r: Invalid argument
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>
>> Using 6.3.13, everything is fine.
>>
>> There a Debian bug report #552233 from very old ages about this, the
>> solution suggests this is related to memory management so it might appl=
y
>> here, too.
>
> I'm afraid that my patch:
> commit 32832a407a7178eec3215fad9b1a3298c14b0d69
> Author: Helge Deller <deller@gmx.de>
> Date:=C2=A0=C2=A0 Fri Jul 21 17:24:31 2023 +0200
>
>  =C2=A0=C2=A0=C2=A0 io_uring: Fix io_uring mmap() by using architecture-=
provided get_unmapped_area()
>
> might be the culprit...

could you test this (copy&pasted) patch?
(it will break io_uring, but this is just a test)

diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_pari=
sc.c
index ca2d537e25b1..6c94e8da19b7 100644
=2D-- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -117,7 +117,7 @@ static unsigned long arch_get_unmapped_area_common(str=
uct file *filp,
         do_color_align =3D 0;
         if (filp || (flags & MAP_SHARED))
                 do_color_align =3D 1;
-       filp_pgoff =3D GET_FILP_PGOFF(filp, addr);
+       filp_pgoff =3D GET_FILP_PGOFF(filp, 0);

         if (flags & MAP_FIXED) {
                 /* Even MAP_FIXED mappings must reside within TASK_SIZE *=
/

