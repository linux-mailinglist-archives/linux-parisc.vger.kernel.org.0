Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBE8744E59
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jul 2023 17:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjGBPf6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jul 2023 11:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjGBPf5 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jul 2023 11:35:57 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E14E76
        for <linux-parisc@vger.kernel.org>; Sun,  2 Jul 2023 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688312124; x=1688916924; i=deller@gmx.de;
 bh=WfkD2Weqeg7YPviseF0CuiJIZmuO98xiClivLVtmDmw=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=J2ldGfhHQiGAJhw+5saNyMmSnJueUd3arAllufeV4rPEV8+lxC02s7Iu7PPnn8Jf4ZKqKjY
 vQPJrqYU1Nbsm1zeytgMo5w2pF/lSOWCh/EKFY69w5g937bnGsJxYNWpQT01EPsRNDEEHSddK
 TbSSh3JyT7t4v9Nc981VyScktP1E/NnaKKYL95cDIItqi1g9+aFRKNpQVZfxvJs6SV7ceYO7q
 EZX4WUr9yt0lOE3v3o2xHJz5hCP8ftoxy9hSVrhMIcReYy3Vwv1gi9LzL4uhaAZ9FqSTUX3kb
 RK5hyJy2Zeq3UQQHRORpkUm2Uocw94Mv2bo+Twzm/DjqGfW9DBVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.131]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1q3Fi206Ne-00vzlj; Sun, 02
 Jul 2023 17:35:24 +0200
Message-ID: <06122964-8d21-4ad1-1d71-93886d078fb6@gmx.de>
Date:   Sun, 2 Jul 2023 17:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [GIT PULL] parisc architecture fixes & updates for v6.5-rc1
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <ZKGOzzDGM1925iYg@p100> <2687291.mvXUDI8C0e@eto.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <2687291.mvXUDI8C0e@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FhoYR8slHNx0248/Pyqw77ELucAzkIRMeW4XQCt5Yk7pMNsFJzn
 U/HSfgG/SJe0MNGNxOepyNRytpAY/6nVwJn6ImGu7zUoh7HXwmDZvxmCjKe4gVnXhfidIS3
 wWqVi9idTOXIuRDvO4iejksMjiLNf0Z3vECjPvQwHzaOBwH5QjXE19m7t5Mvt85R+q6+i2L
 GOcbWDsM9H4aL8EsLPqrA==
UI-OutboundReport: notjunk:1;M01:P0:kckoKKVW1BI=;VYUJFIrvkn0d8NkgX9qXFOwJ2ML
 1kNMT7mUyRVoufOauCr3Sva9tgtrnftKsb2oqwlWEdgN4X/VqD5f3JJMaZ3PrY9mjX6LD9YDr
 QdHOGwEXCe1an/b7udF/GSrQHZIa67/b8rlDrFT0g7maSFg8zdEmsG+jwM2bLk00s5KYGKjod
 UAlwv9q5lu729c/Q/uVBFKWfP25Wyoxc8iAjiRv7n9dLExiUxNzzJVvBBuUvTraInnS/Iaib2
 6OqANOjjCcRX1wvfhP0g7J6woisHHTdt43iTT+DWu/R+ZTglzo7W5JzN5Qvso19SywU67w00D
 13jBtpJnP9LqFTDvvT3n/jwnSoUv5ZV/lzUGBW6QQ3UB05lAPVoR+PKluXRSER6jXfy2qgBYj
 EaknkF0BXo3yVxZ7wAP4UmFuZ+e1lbR3JyNW+ew86L6yaQLQyh05d4yhcnuZXsirQXzn8vw8r
 chk4rkYGswYNVOF3bFyRppeihQNEanTkeclrvTC+1ItNoqXklsFvT0JsITVHoIcAz5s6BMhzO
 5SBAFVYkBz5LsN+Ikbch5hq7D+i4WLMwEqjxtNJ6oFM6D1fIJ5C1pC2hr8cV8nyPO7zf6VPmG
 cEMT9Aq2nGbJ1EML3H4XRq/QjkehQC++shHzGqZFYHohV39wdHsy7CFCUyWOO3SUm+ds6k17G
 y1tp5P/s7o+vON0lbcI3k+9ByE9Xb6BsMfMNQCtzRF5wl9SF9qWLBhPWzdHz2ay5MuIPTVNzn
 o9Amn+2p+HViOymJvOjIXlflkRDVoliQZcv99nG89YcugdVY0FBmpydbzNliUzo5S/EwzQ9ah
 j3gX72JYoMyx8KsPbEUq1XYVo6R2wlpkMox79GBujN2y421DI+BKSepR4/Hok2yd06j46HsF6
 ceIHcA5cmYzMvfAXqNmiLzz09WthXTWVylZ2JP8VX2IC5jYHoS2uv6jXnvvv2IwlHolPuhhqe
 xqEkzA==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 7/2/23 17:10, Rolf Eike Beer wrote:
>>        parisc: Default to 8 CPUs for 64-bit kernel
>
> I wonder which machine that is, given that most of us are using C8000 or
> rp3440 that only support 2x2 CPUs, or even older cruft.

As I wrote in the changelog:
I've now seen a 6-way SMP rp4440 machine, so increase minimum
number of CPUs to 8 for 64-bit kernels.

I do have access to it.

Helge
