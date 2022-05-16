Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F90452938A
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 00:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346601AbiEPWZf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 May 2022 18:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiEPWZd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 May 2022 18:25:33 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9F23CFDD
        for <linux-parisc@vger.kernel.org>; Mon, 16 May 2022 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652739874;
        bh=IW9R0GPPjRR5tCFGNpUk/WDUL4egcfD5WxGzL/LMJ9g=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=PLjzGFqxD6VW44KUVGtXKb9ewzQiBqI8GN5okKDkXVxJmLqMTfRx+IrC528hdbtOZ
         N3WQY2TvgaaUOZZ/oT9tvZ2P+rjDO3E2coWImxB927gmjU1BIOO6/eOeym0EmHiS8x
         OKW7J2YoUS/XRxMid3ktujKg/XM+iQ63P3lrVlVE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDJd-1nXeTF1BZX-00qlny; Tue, 17
 May 2022 00:24:34 +0200
Message-ID: <2df8c4f1-f93d-8ef0-3bfd-9249d43953fc@gmx.de>
Date:   Tue, 17 May 2022 00:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Content-Language: en-US
To:     Sam James <sam@gentoo.org>
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <5568470.DvuYhMxLoT@daneel.sf-tec.de>
 <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
 <0E5A13A5-8210-4E86-A8D1-4B056062BAF9@gentoo.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <0E5A13A5-8210-4E86-A8D1-4B056062BAF9@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Xh0AAtkX8ydT1EaZEXCFaoKolRUADFyXEp25ZBbDp3Eaw87giUb
 bRCQ5IZnUGtBFAX+zbHuo5ynRFguRX1/oRo37l6sDzsS599ZMub0bl6HYM6f7HuNKODACUF
 KNm1vlEduEbme2/N7jYJ83XTRrH/ddcVRXaYgOTRUucrVqY84Bxs4AcPHz9X/Znmrx7IULn
 KWnFYVo4sKwYM3LGr9jSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Umv956F0D94=:cZykHfh4TUDCI4jW/UyYaf
 /gY/+Kki9gjSoKVxSe+MR4KBvzqU5KkHAK6RsDH/PuaZViiGH8VUaWBsbCAx8tLz8lhQWNV3N
 aNc5SpCgI44nR+P77Myws03sAvl4jMBmy8ByFm6pAS8CGLt8TfF7E70alRqtStph82w56uPHQ
 UovrjCvC5IfoPCTMz9LF3oAtGUurimgeucuBDU9OxnNB8ZHYg3vaOWaVZy/0+w4iQNlkEKlR4
 IYaoQnnl86e4f116XkMEDjVKIh8LrqvqVOaBDCTrc9o4AtpFe2v+ic3ME1OgUapo5wukHY1Z+
 cDCk4PUkHMAReGZ8cz0xg+C2zhTEq+DDlWF7EaCo5arSNGT+xMD+yIMgB5o63ip8pn50MDjmQ
 8Rki7DN0Irp4zCYW5IZ4abF16mI0/bVGOjYtYyV7xXyee08tbapzmsG3yVlfuO3jOzlHGO48W
 ymVV1FdGUp99qyZsAA6QPrKNSLEbBLONQIqQGn+7o7AXSKAvIohUCjkFVeTyslc6o9xo95vq9
 ATK0Gz92YB9HCfUL5MMn9XJZ7s1QEI5OU2QaE8pZyU1ImRwOA6GieulputLiffcg68/BVLYe8
 LhvIuWdok0aNdZz5gQcm0CPC2wKqODY8OZ+J0FewhPX81OIE6bD2KupOOUFXfao+1a17Fm/BW
 T7LUKVTyANl5xLy9hlrktPGGp3NSj4L/OGT5fNDNHsiy16C3pxQx/T/R34ZvWW6GkRjfdmcfg
 rShBz377SZY7mS5BKNxC/QAbN/mwg73kCbE80KsRm/cp8m2JNdnmpa96aiQdve5EFMo8Rw/2f
 0GYzw6cORrtXmcW3i78fiuTyvzJGwUzpB0DHxPxBoc+Gmb3LXpI+ASrRJx4qPxIONjkftdjKh
 ayWXuR1XVNRBblYOoeKWJqhgLZuqzXC9HQzGMuZ6aUmfn4OLkSeoynByrcMFIthoQ8SSnnVcF
 aPty36GtC5CuvN/qEGV0K9yVMQ/qU3ghw1eEuoCFERHgcW575LtSK/yDNNLGEPadJgxovMxJt
 9sM1OqGNFSp77W26gZGmqhtR/zNydi1SvDtl+Tj7vxLPe1Q5P58yfUbuX3N/RlwBr+7w+7HfW
 98wlLX3UoCoilE=
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/17/22 00:09, Sam James wrote:
>> On 16 May 2022, at 22:49, Helge Deller <deller@gmx.de> wrote:
>>
>> [snip]
> Hi Helge,
>
>> FWIW, I've done some cleanups to this patch and committed it to my for-=
next tree.
>> In case it's split up, please use the revised version.
>>
>
> Should I be testing with for-next (which contains this patch) or for-nex=
t-next (which has some smaller bits)?

for-next is for v5.18.

for-next-next is planed to for v5.19

so, please use for-next, since we want to get 5.18 finally fixed.

Thanks!
Helge
