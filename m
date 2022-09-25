Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9665E95DA
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 22:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbiIYUWC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 16:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiIYUWA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 16:22:00 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B0126ACF
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 13:21:59 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.58.43]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 631786390818FB6D
X-CM-Envelope: MS4xfHgnli6oUV3GArMxm+a24vWSS7QZjp+T7++rgfmOKU08yLFwCZHryRW0sz4Co61MgTZmXPiypW/eYTH9ldC4DFjv5pCR95dPcLjUexFOstUKyTyeXrSj
 asHzjRIRA9+UCvBojvGdHCtnp0FkqLHLGQAgowM8XKF1pMj3/nfPZJDtQHZ9HvYAxHhVBUiVsZpUIhHy3Pi4zen7cJWzRtZxvfCJ80wBvAS6t38vuQdIUES/
 pJY4kbX3D4lFH5Mtv5LuUP73nIYIFXGBdnhi82oGbUlepOUi+Joz1rixyq/z7/P+C068InouPKPnMi1itpG5+cSSub+vXkD6XCU6tZ4AoAI=
X-CM-Analysis: v=2.4 cv=BKfQEHcG c=1 sm=1 tr=0 ts=6330b864
 a=oiJDitmlNOPgVxj52MZyFw==:117 a=oiJDitmlNOPgVxj52MZyFw==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=JVapIGqFqlk_FS_Y0GkA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.58.43) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 631786390818FB6D; Sun, 25 Sep 2022 16:21:56 -0400
Message-ID: <f80a157d-1a04-f7b2-8218-1052ecdef0b2@bell.net>
Date:   Sun, 25 Sep 2022 16:21:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on UP machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yy/7g0NzOi/igNi7@p100>
 <d195aae3-b76b-1365-6e53-28c6791c77e3@bell.net>
 <92a8b235-7d04-9931-a153-440adbc8802a@gmx.de>
 <bffa9fac-a6f6-fc7e-0e66-5df215aef2ba@bell.net>
 <e2ffc031-0e62-8e2b-82eb-aac0460a453c@bell.net>
 <114efb2d-7f09-6a80-43d7-2a132146774f@gmx.de>
 <67ff767d-5db9-384b-f144-1cd34d9f4f86@bell.net>
 <4ab6bb84-f3ca-8900-237b-40c296d09b7b@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <4ab6bb84-f3ca-8900-237b-40c296d09b7b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-09-25 4:00 p.m., Helge Deller wrote:
>> It only supports the PA 1.1 instruction set.  PA8x00 CPUs always
>> support the PA 2.0 instruction set even when running in 32-bit mode.
> The 32-bit kernel is built with the 32-bit compiler.
> As far as I understand arch/parisc/Makefile, choosing the CPU type
> just enables *tuning* for the selected CPU. See Makefile:
>
> # select which processor to optimise for
> cflags-$(CONFIG_PA7000)         += -march=1.1 -mschedule=7100
> cflags-$(CONFIG_PA7200)         += -march=1.1 -mschedule=7200
> cflags-$(CONFIG_PA7100LC)       += -march=1.1 -mschedule=7100LC
> cflags-$(CONFIG_PA7300LC)       += -march=1.1 -mschedule=7300
> cflags-$(CONFIG_PA8X00)         += -march=2.0 -mschedule=8000
>
> The only assembler instructions which break qemu are our manually
> added ones: "pdtlb,l" and "ldd" (for flushing - see my first patch).
> The two patches I sent today allows to boot such a kernel, and
> they still keep the PA2.0 support when run on PA2.0 machines.
I think that patch is fine.  Probably the same needs to be done the use of "pdtlb,l"
instruction in the tmpalias flushes.

We used to have locking to serialize the TLB purges in the tmpalias flushes when
we used the pdtlb flush.

It's true the 32-bit compiler doesn't generate much that's not PA 1.1 compatible when
-march=2.0 is specified.  At on time, there was some push to allow 64-bit register use
in the 32-bit runtime.  Some hpux systems preserve the full 64-bits in context switches, etc.
So, one can get away with using 64-bit operations as long as one doesn't try to perserve
values across calls.

I believe "ldd" for prefetch works both in 32 and 64-bit PA 2.0 environments.

Dave

-- 
John David Anglin  dave.anglin@bell.net

