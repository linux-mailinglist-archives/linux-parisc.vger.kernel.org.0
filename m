Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADA84040A0
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Sep 2021 23:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbhIHVoX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Sep 2021 17:44:23 -0400
Received: from mout.gmx.net ([212.227.17.21]:36297 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235213AbhIHVoX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Sep 2021 17:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631137355;
        bh=t2WU7PBOv60/Lx+3gcU0Nt3bk/htlhFavDBCMiNy7uM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=M9k2NSnnhVL3q408/S6beRIk+HlF3/gHWeLMsC2/TXmVag9gOTkj9DERYRkOTkl9t
         Qd8elIiT90G9eCFsdSWt2sbx/6KM6KPZIjj0mw8+i0vw0ctDT41LMi4eWM0Q6sAci+
         scBBEyGVF5/cNQD8pW8dHFN5YGeqiFg+WFklg2N8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.85.61] ([80.187.121.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGVx-1mZz1S0UvN-00PbYo; Wed, 08
 Sep 2021 23:42:35 +0200
Subject: Re: [PATCH 1/4] parisc: Drop strnlen_user() in favour of generic
 version
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Christoph Hellwig <hch@infradead.org>
References: <20210908204405.127665-1-deller@gmx.de>
 <CAK8P3a1-ajAFtO5zE396DBPUzssdas5o+adsEDtAK58X1ZAU7w@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <97d4c69c-59ff-8e28-0cfe-50908b999729@gmx.de>
Date:   Wed, 8 Sep 2021 23:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1-ajAFtO5zE396DBPUzssdas5o+adsEDtAK58X1ZAU7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kc2CGoZAMliIGoR3EMxQ0aQcGUkJodLuiIoi/iE2aADcglLVRX+
 UcT+v04fxn8GFV5pL3x9iULvLMp1IXaUmjN4JyHnEJ9t46aZK0vXmd3RNR1p6NfJH7pBTgJ
 FJmreRsFHAgYR/UOsGirOfjpi/khR7gyErHZkQVzOSNAVl07LA7rKHiov9EkFX7XQoRvj50
 tbx3JmypfaDqOUDZL4VZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aeLUQqu7zTw=:8uqeiNi+51q6nEXuf9S34z
 /ygAlMN4OGJORCoeEu2KGNKBrJ3ztkf5fp93vc2ocC4W1ETki1OwTeovAqcavhU2vin1zlAcM
 HcZwpbp4f86/wkqbMnff8uwvYFOwBBZz2XBgoGIDo18ZZ3GA+SfgltmCKr90tom396W2DbrNI
 hMJFcV4Xu+0cjidhKcpJV1dmpVqytN+rtIfyFRvOrVc14WQiq0UQXpsQN+rNbjwfFVKgZN/dK
 8Gxg0j4C88/p05zcH7d9yD/Vgbdf11uQNqK7N7/mBABC5U5A+asAb08sTgdb5sU+zh6dpf5IP
 PgG2ILStQjZZ7dBJYLvML+4xaTDDW14dgx6AWESKzvnnaA3hLudd08Dtdo/tiR1TKYj6RaKf9
 3bYgA0Z07YevBiH3peC2WqlzpPhZ3+6gprekB12cTATSrSLdoEv3MNytV9v7c2K6VopRaTSeT
 3ai1kPqZIe0DLYOn2Jh9OC9wn61S51Rn0b0g+hxoZi2za7VplJZM21OFDOTSGDoKkOb3+g3Pk
 CzX7EL5sZt0g14Wwr0yfwEUxAdmSoz0jc7rN1T3yvp49E6jijbw87L7PSz0BUvl5B+qr/RBxR
 sy5benxOw1mM7EKKiZVzBIWzOPyX6bYE48n+jNNjbsTcsRHKPEVktJm0AvjIOtn9wi0IbB3XE
 bO+dxm3S3DCiuZGp+oRuGwiCGiWTpzr+4fXPLXNo1vC2HaiG12cmUFIn97aGOMowI/DtCQCsk
 hGGSRNgYTkXrhkfa7sOzc0ev+f+D54J4yzC3MdJjOJ9YPBazg0IKki/tiJouVFroFLBwEvfmz
 zn3lsM+tpuDYYCkynrgq0VHISV5say829BRPQfa3SvhB5F0NnA96ovvmi519hSSblWBGsket7
 /dnvHZYhd/9ynxBSPlXDDgrME1WtaGQkKhAHwGRMS5QE+MoAiJPwiadeffgdlb5LqYC46jOU0
 2Bg+kdehyAX1sIpS9hzuT6gcGWSK7ufkJFEgOYT2OfKgTGuqPpggzQUw9dA3cE1+IQmZAjZWh
 4ZVidZq3N/E01r6Q+uMEu6x9ooI2H5ajl4TwYwQASRjRcIfrDCv/SjMZ9txuZU71qdoe8RxAY
 tsC63z4ivlq+8A=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/8/21 11:26 PM, Arnd Bergmann wrote:
> On Wed, Sep 8, 2021 at 10:44 PM Helge Deller <deller@gmx.de> wrote:
>>
>> As suggested by Arnd Bergmann, drop the parisc version of
>> strnlen_user() and switch to the generic version.
>
> The strnlen_user() removal looks good,
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Good.

>> user_addr_max() was wrong too, fix it by using TASK_SIZE.
>
> Not sure about this part though:
>
>>   /*
>>    * Complex access routines -- macros
>>    */
>> -#define user_addr_max() (~0UL)
>> +#define user_addr_max() (uaccess_kernel() ? ~0UL : TASK_SIZE)

I noticed that our user_addr_max() was actually wrong.
It's used in the generic strnlen_user() so fixing it seemed appropriate.

> We are getting very close to completely removing set_fs()/get_fs(),
> uaccess_kernel() and some related bits from the kernel, so I think
> it would be better to the other way here and finish off removing
> CONFIG_SET_FS from parisc.
>
> I think this will also simplify your asm/uaccess.h a lot, in particular
> since it has separate address spaces for __get_user() and
> __get_kernel_nofault(), and without set_fs() you can leave out
> the runtime conditional to switch between them.

That's a good idea and should probably be done.
Do you have some pointers where to start, e.g. initial commits from other =
arches ?

Helge
