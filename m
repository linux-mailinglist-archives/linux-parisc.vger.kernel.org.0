Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A3D7716AF
	for <lists+linux-parisc@lfdr.de>; Sun,  6 Aug 2023 21:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjHFTyz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 6 Aug 2023 15:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjHFTyy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 6 Aug 2023 15:54:54 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B1F171B
        for <linux-parisc@vger.kernel.org>; Sun,  6 Aug 2023 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691351685; x=1691956485; i=deller@gmx.de;
 bh=lUvH2LbMCNgrzm+0ebm32PfpBI/cFRpXBR8WL8Jb6Tw=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=PLzb7kaDQPt5S/xOziQ64TW+y7cR86bCyQB48Ifi/BHaulJOrcr2ngsp8EHdU6jF3Ux41xm
 pHvcAfS0fAxciUpscfe2N/9k99/pt0UcfhSe5vHniEP+Q1SU/22C1d9tVSs4CqWa6mRu+RZZU
 fU18ZcZ38xaLB8fTvdoi7Eh1qNZo02L+0VMsHwAQXUv1udugnZ50AznYqysG6Vbu+sRyIA5ET
 kM48anQlJCPh4Kf1PEmBI1elK2y041tdVcNTrJtLp5ioQHJO3qoLSoLAdUsWhWL2Oj2QONaPu
 oosTJzkI6BN4AtGmLjtnnt8V6aOABX+bpWT5FQxIKjMcGI+9GC6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.250]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNcG-1ptP1A3erY-00ZOtn; Sun, 06
 Aug 2023 21:54:44 +0200
Message-ID: <f361955c-bcea-a424-b3d5-927910ab5f1d@gmx.de>
Date:   Sun, 6 Aug 2023 21:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Regression with kernel 6.4 "swapper: page allocation failure:
 order:0, mode:0x100(__GFP_ZERO)
Content-Language: en-US
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        Mike Rapoport <rppt@kernel.org>, linux-parisc@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>
References: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
 <ZMooZAKcm8OtKIfx@kernel.org> <1691003952@msgid.manchmal.in-ulm.de>
 <1691349294@msgid.manchmal.in-ulm.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <1691349294@msgid.manchmal.in-ulm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DylT5RA0qccWQZkqxdIou5zO+3mjK8RNJAETFzbhm40VIsF0b06
 rHSmmixDV0uFO68Xm5gdIK0Mo5ePP7SPjXnAwSHcl2cu32lUb0pqRDGWFAsNGKGED4x1sJO
 +FUl7ZOCvPD1Zn+94LJPPowT9qYbpBBUZnJyeaeA6zbhfsJo09stYr6UxrnrOA61wnbY51J
 rma3aSiM3BhyFf5+IvBuw==
UI-OutboundReport: notjunk:1;M01:P0:0h8BKx4cZCg=;KJcoabT0ljy0e0Qx7ZmCPDJb3Br
 ZP7dx1/0508VPnaFcIuat+1qwBXJhRoRecof4yrT6jzvo8Pyg81x/uswIJy293Pqe7754irvL
 dsS0/LLaCRP3/Zwhe2yxzhHVpwRvZM4j5JTAQlHlzpd5ZDRz+mPYOORDywMwhrVMEwAOqi1Dz
 nA6xx++rJpepbG0wW24cQC7KcxQXSXsYZm2+5SXTZ82NxAaC2/nQ84vY46yXI2oxE6HgE4/aa
 zBgwX/LfKlks8F6Q0GmZu/+iJogXQMi8DB+Lkjfw5xy9PWQRVRCrQGKeL48fxEweDsT8SvD0x
 o/s20lDeWE6SJU2eH9KJhUfSE6+U+gAVZ4JjX8Dlp88EwToW1Agm3cv+xJxf+hQ2ia32fa6IC
 UXL7vAnDyED/NbtVgSxL/u+PaLgfh1m+62OPup+lh/P/IgpI+hNOGKSInDNYRGJ8R52gUUIDz
 lk6++4Qq6mku6yH0+mHUf5FQZxNitXl3kHi6/AtWiN2dFAYvBkIWuSt3eN8B3x+ZEm1NLenUG
 tCPpJCHgfHtuv+PMHmkBcxHB0oCV7Z8JdCqtpK5lU0gdJ31Uau6kGcvC6HswtDxnWNXx40MZ6
 RNU0shoNbwvOH5WrDpn/gfkADTE52xPZqDVvwXN12B+UKS7QztEF4mGh2zRiXPxdL2VlZB7HG
 TVrANgCFggVdmV9AVJos2bfET2OkQWoWPGeSOnIAyIrfCN4GHhDmh/SM1kB0Cw41SBD2eCNak
 5H8/Lk9WSyqqB6llHnSFMYdLz4GrkZVt8dMokx2LBf9yYxkQnIiLUFQS8UaQ3FyiZyXBE6lX1
 qnvWGdlZ9YI8vpih3kxDZDV+JiM/bS2Pl+keVO7rB/U6+Dds9perGEB8iENwK+P58Kc9ZuCFE
 cS0lsAPpTHAB9jg1ax4wdXwbv8XHkk0V7B35rjwPkknCdkWCAVJ+mr6vuyZrRO3UinPpTACz5
 gJoCmcNdxrCYu+fyN4XiTRs4l74=
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/6/23 21:21, Christoph Biedl wrote:
> Christoph Biedl wrote...
>
>> Mike Rapoport wrote...
>>
>>> Can you check if the patch helps:
>>>
>>> diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
>>> index cc15d737fda6..ae3493dae9dc 100644
>> (...)
>>
>> Yes, everything's fine now. Applied on top of v6.5-rc4, there
>> were some offsets.
>
> Now confirmed on top of 6.4.8 as well.
>
> However, there's now an issue when reconfiguring the locales package in
> Debian:
>
>      Setting up locales (2.37-7) ...
>      Generating locales (this might take a while)...
>        C.UTF-8...cannot map archive header: Invalid argument
>       done
>
> Using 6.3.13, everything is fine.
>
> There a Debian bug report #552233 from very old ages about this, the
> solution suggests this is related to memory management so it might apply
> here, too.

I'm afraid that my patch:
commit 32832a407a7178eec3215fad9b1a3298c14b0d69
Author: Helge Deller <deller@gmx.de>
Date:   Fri Jul 21 17:24:31 2023 +0200

     io_uring: Fix io_uring mmap() by using architecture-provided get_unma=
pped_area()

might be the culprit...

Helge
