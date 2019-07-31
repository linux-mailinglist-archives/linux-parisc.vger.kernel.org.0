Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A747CD01
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 21:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfGaTki (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 15:40:38 -0400
Received: from mout.gmx.net ([212.227.15.18]:57173 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726865AbfGaTki (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564602031;
        bh=KYZVcGpkIJsB6ohouwVGyxQZdepQwBDGOX+s3ObYRjc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=T3YRGXlg5y4ADK3ux+vh7aKGXxo9JY3K5uepdZiA/jjXf41um9umOjmO9745oKZyv
         Tut+YirGPL8VpoSqu233+hZUDtQS5b+vgtReXggGJpoqV7Aw9Qu5y8kEHYsXB/QXPZ
         RSOTd5+grYPZMP5o686SW97F+1fZiofVI8dD3mSM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.24]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M9JYE-1i5VdR18wA-00ChYa; Wed, 31
 Jul 2019 21:40:31 +0200
Subject: Re: [PATCH] parisc: strip debug information when building compressed
 images
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20190731171923.24155-1-svens@stackframe.org>
 <20190731192835.GA14352@ls3530.fritz.box>
 <1564601859.3319.43.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <366ad43f-c9a6-1291-5cca-014172f0fd62@gmx.de>
Date:   Wed, 31 Jul 2019 21:40:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564601859.3319.43.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v+8UggD/ARb3YwDnJuH6fDXw8xbwdJ08ZibnuLjVa81fEUuwyE/
 YJ+inKRYCN2Hfd4emvXBAQ+X9AcwN8S0b9TiG2VxmNgXukjvHorxOQXEP3WeyTMat+uIE9A
 ooVO3a4I/OYszxs/y7U0VrGtqgEfVEb6bNwufMX+ubr0hmMiL5xmBqLoF7c92rkONC1p4fX
 4jHUgy2hzfsjAAxxtKRng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AgCHofrb8Ho=:Jc45YdTSWPquT+J8fz9X43
 W+dlMN7Hsyy/I2if+FxyEUu9CaGIeYTEIEVbz0PYb4GBf7LgCs/WOudh7qLnqMK8/hNcSHyGZ
 GLqvKWAezhJ9Ma2CneBbfaZr6sxip44jxnLYBd1d5+CkVsrrzI9Vo5upKzW+ZQaTu1bt5WXUa
 PPgBiVos0O7HsfFHY2shPRFKbnmzA5HiP/keU1TWVCZm8Gru4oKNlDhg59OFX4FuxX7yPJ3W5
 is6YfDUxuxZmUXAuFHqhOG/4+oaIE4GkJd4pqgnZqpwTUAgY1Bl/G9eqTlannaSi6GGkPYZvF
 Uoh9YcKpUijJF0SCx1+KuPOoBymI2EnT+8eLDOoWszV7HYzBXyszp6ZMaO3osHNMls49HYjTj
 SpCjME2gi5RZ0ELjKOX07j8S9u1WAk+ytnVceuPl9rVo7YUIFUbxTRQwjMel0isKMJaw45mjh
 L9szONqKKDh+ZA4plxsPPyi+lJU07CzECvQgW0+waiP3gy1JJjuo/a9UXflqS5IBZHpA2usSD
 NYTLVqBb4V0eg/zPE6w9TFS88uhusBzbW+B6zbujPsB8V0RQ/1167KaGlYf62WMgwktiINVth
 Dubo5be/5TioTQRIyvbiC4xE9jumUAIqGcf6i/tBgAd9ZBFFqDeatd0cLLoZrRuxiPM4m7tJD
 WZzjUgqyznDxtwI0tCVAEJK8b8ClaHyx7TUw3F8oKfEmG+4x3K5Wqz+x6WA6JFc2jtkurDmWD
 oCubm7t3175m0TcY8MYdmrIvoJXiofT5s+ZFuwFnOeUsdtKGwoBU+k02jLON2XfUJg4Samlj1
 Qvx1HyooxpG9egRtnU0/TN7VWeGG+hEJn0F7cHnQR0pgUb8NMDXw4iheHuXkeYM7axVlMqM2I
 2Jt3OtnThpHJpnFXlPizy5qyj8PtMkkkpX4Va2xEc82GKaOiNCTpuOlbJENSQHgTtrwp3eFga
 +L+ilNtBAwphZce4nwMdRkvstNcqhJOigyRaJOBBfKRk/A2cSdDg/4ePepaZAxHsodVqV7CWX
 X9wm7wALdyg6nMwl22ZhkF9x9KsOc2t4OIs49oT/9HqpC07E09S2nJGcs2bU+aRb7EuU2bgTK
 e3lL/KhLo+NiiI=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 31.07.19 21:37, James Bottomley wrote:
> On Wed, 2019-07-31 at 21:28 +0200, Helge Deller wrote:
>> * Sven Schnelle <svens@stackframe.org>:
>>> When compiling the kernel with debug information i got the
>>> following error:
>>>
>>> hppa-linux-gnu-ld: section .text LMA
>>> [0000000000e78000,0000000000e7b41f] overlaps section
>>> .rodata.compressed LMA [00000000000e0078,00000000015ad43d]
>>> make[3]: *** [/home/svens/parisc-
>>> linux/src/arch/parisc/boot/compressed/Makefile:28:
>>> arch/parisc/boot/compressed/vmlinux] Error 1
>>> make[2]: *** [/home/svens/parisc-
>>> linux/src/arch/parisc/boot/Makefile:17:
>>> arch/parisc/boot/compressed/vmlinux] Error 2
>>> make[2]: Target 'arch/parisc/boot/bzImage' not remade because of
>>> errors.
>>>
>>> While this might also be fixed by adjusting the linker script, i
>>> think we
>>> should strip the debug information when generating the compressed
>>> image. This
>>> reduces the size of vmlinuz/lifimage from ~69MB to 6.6MB when full
>>> debug
>>> information is enabled.
>>
>> I think keeping debug info is good.
>> Can you test this patch instead?
>> It converts a 141MB vmlinux boot file (with debug info) to a 32M
>> vmlinuz for me.
>>
>> Ideally I would prefer something like
>>    . =3D MIN_OR_HIGHER_THAN_CURRENT_ADDR((SZ_end - SZparisc_kernel_star=
t
>> + KERNEL_BINARY_TEXT_START));
>> to avoid the ifdef, but I'm missing the linker script expert
>> knowledge...
>>
>> Helge
>>
>> ------------------------
>> [PATCH] parisc: Allow building a compressed vmlinuz with
>> CONFIG_DEBUG_INFO enabled.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S
>> b/arch/parisc/boot/compressed/vmlinux.lds.S
>> index bfd7872739a3..dac000ec3861 100644
>> --- a/arch/parisc/boot/compressed/vmlinux.lds.S
>> +++ b/arch/parisc/boot/compressed/vmlinux.lds.S
>> @@ -49,7 +49,10 @@ SECTIONS
>>   	}
>>
>>   	/* bootloader code and data starts behind area of extracted
>> kernel */
>> +#if !defined(CONFIG_DEBUG_INFO)
>> +	/* ensure at least max address when compiled without debug
>> info: */
>>   	. =3D (SZ_end - SZparisc_kernel_start +
>> KERNEL_BINARY_TEXT_START);
>> +#endif
>
> This would cause the kernel to be built in a single section

Yes.

> for the
> !defined(CONFIG_DEBUG_INFO) case, meaning we'd always blow through the
> 0x00100000-end text hole we need to leave for the compressed kernel to
> decompress into.

The debug info occupied the memory (and more) in the 0x00100000-end text a=
rea,
so we have the room to decompress to.
But the second patch I just sent is better anyway.

Helge
