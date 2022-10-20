Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A86C606970
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Oct 2022 22:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiJTUXK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Oct 2022 16:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiJTUXH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Oct 2022 16:23:07 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C531A851F
        for <linux-parisc@vger.kernel.org>; Thu, 20 Oct 2022 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666297378;
        bh=VFSLlbicFu/Ttq3azahpzIgs3nak94ZWdSYLEJA8l1Q=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=bOC3StAUXqTQ+9ifzjeYYeiSHG4pkQc/Mqw1z00aUA9HKSJm30impuq05FdSe2F7U
         PMEKfkNMnsxW++iP2lid9FW3Bs/HdR0kdUOUjMMw1B8z50VwIDwCoD7vM7jmE45ZGk
         RQvaCXd9NxFwoE5uqciXRO+kGYr21YINsgDuKomo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.193]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDJd-1pScJx0R1L-00qfGG; Thu, 20
 Oct 2022 22:22:58 +0200
Message-ID: <fe983997-22c9-a58b-136c-15e2303350d8@gmx.de>
Date:   Thu, 20 Oct 2022 22:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: the patch "Convert PDC console to an early console" breaks the^M
 console
Content-Language: en-US
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
References: <1MhlGq-1pGSQJ2Koq-00dm3N@mail.gmx.net>
 <alpine.LRH.2.21.2210200917320.31339@file01.intranet.prod.int.rdu2.redhat.com>
 <430864f0-da89-cc2b-e357-d7aaf41f31fa@gmx.de>
 <4011ff49-294a-aa08-e087-d60995649e00@gmx.de>
 <alpine.LRH.2.21.2210201552400.9506@file01.intranet.prod.int.rdu2.redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <alpine.LRH.2.21.2210201552400.9506@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mn7DvB/2lceEot2+c57ZHLopCD5dDPMt3GgH2CaxPNFgw4dezPP
 s8NPArFxT7e4A4jrKcr5QX/l0BSSOiPKWymYThbwdfieJpoUrfVgd2yMdgY2GA2PRxrvX6P
 YQCQU/rn8CrUY8LpNV7M/BkJQe1wBNsieQNqjH4fraxqXT7o76z0NYXgFR+LZ1CvG+gJbZ1
 CDTLWsnYfMzjjisj3/eWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LM88v5qOHlg=:So5/Lrur/Vve/pz9y1dxJf
 g4Sez0Di9rnfiL+ZaXniBu38puA7/85+KB/7feRA2kbZbtCedbimZHYFlKNqrzDo5hNzDtIYG
 +LChM+fE3FooHVKtHO9p653l1KGAf5V0t7d55TAaOfWrD+EaLulOpKr0mdBMyXXNAusdxSFHj
 UImF3EFzpQY2K4O/y7B4sDjhtvSdBhCFEzDGqcwH8oESJgfm9zmegnCD1bmpVSjNAAONhFkBb
 PKlkQAZ85WQ93ZQZuOdXeOewU5dUksEWIzkFaYUwLiij5XkfODY6RqOMFysCO1M6gVchePYpV
 +T9n7Wjp9cCa+W4/+Kt6nUmeQh+6qHTc4QHXQt/Db+hnEcOnHPU+Cafp1aQuxzdMPcmpZuuT/
 yMybzCUGqSf0xZDm5DdXvUkUnid31dKUBGQtPsD8d+WyKgzT0nQw4eZxpP1KqEGCSPUsmENM3
 BcZmhZBNNx0uej7KMc2FZg3vPE5MWvq+6k7ZWe9PQQq97wZkfycSvCgLylJvy/b2HPmggIUl2
 x6Rq8OIwGmnw4tvWDSEif3/eJ3fshhbOoj76jO6CGn0B5bmiZLpP5YbPuIH88xL4DIbc6XZ4c
 kYUdEUOii0mr1tg3CENT+G9LK/2C79Y2CEGsBpFBfDW1wq6vJnWpK/3/lr+S5tNcQkbf9c6dr
 p8K3JrrtLvcpwDXxjpcEvJ2wi7Q2wsJqyCBDDFe13tF6TaagpQyYdMrVHsjlYTB69/o3OpmIT
 hvCBk70NJtUUibe81aCv7uiGEPCg6LfIVBlN+rvh73ZabklVsX8eGvk2FwABeiB/WCj9CPSry
 GUaMblRT+757iD2a2tycdX5d1UXSWn84D3nOnLmnwBk19Zm3WE8TDuagaQpo7tgaSUQdmjq38
 JDZZwsvwIb4BrpKW9g6+HRDL+o7i5hwaN3DoYR0Fp6FyebEaXTwcou+JxBE7P/80Tgd5m5jfV
 R0CPwXgralsNyfMrvINpca6Mk9PWM03wVG0PXSn8Q3Fk/Pg1vvybQDUWTTfsPoap9tQ+z0UKR
 gttXdzeC7mtKQDnSjL75cZ0qticcWAfsGMycoVFaWf1U7dzQvsU4bguIXwGkZ5+5rZC4guNqI
 jhbkn0OneOKCbPhvANUyJrWAU4dEzh5a4AaGD02UzpC6qe1ubV63Q/jij5ihPxJdf7FCeJ5hI
 w9ORhdlWn+hwVQLjhQj/T/WJ5cBiRL++VxdN2AbLuDlxRsU1vkPH1j1DD/TdzFxRR0UKU7Qej
 okb8w1d07K9J7IssD/xWGcyKDdPcOQKTRAORbHhoQ1CPXCIUBPZyhM216GOWOBSy1ZCycX89Z
 YGU87GT0GCEynkjdaLXLd9i9eEpXQQ9jblpUTBiFrUDODND/gN897LmZFGur5LoIfayELlQ0b
 +rJST1gn4Kf7D9gErw4LlJzad3ip01zxN2XvHIY419LggdeCdM1jAupmeRst9V2dGWL2hNB7l
 9+Ecd86wOyYngS0LHZVFIbin8Vgnz6tTzVIpR+wXhnz1w4xA/noobAuFrGYqDWGedB9dRvAnd
 zta+kN1+6tMbrV7Yu1sVNFBmqqoTJdPULjEElYNfvDuLB
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/20/22 21:57, Mikulas Patocka wrote:
>
>
> On Thu, 20 Oct 2022, Helge Deller wrote:
>
>> On 10/20/22 20:01, Helge Deller wrote:
>>> On 10/20/22 15:26, Mikulas Patocka wrote:
>>>> On Thu, 20 Oct 2022, Helge Deller wrote:
>>>>
>>>>> Your serial ports don't seem to be detected and thus missing...?!
>>>>
>>>> It seems to be so. Does it work on your C8000? - if it does, send me =
your
>>>> config and I'll find the difference.
>>
>> Works for me on c8k with serial console (parameter console=3DttyS0):
>> config attached.
>
> Thanks. CONFIG_GSC=3Dy fixed it for me.

Good.

> Maybe you should update the help text for CONFIG_GSC. It says that it is
> "not found in B1000, C3000, J5000, A500, L1000, N4000 and upwards" - so =
I
> turned it off when making my config.

The help text is actually correct.
Your C8000 does not has a GSC bus, so why does CONFIG_GSC=3Dn disables you=
r serial ports?
Needs checking..

Helge


