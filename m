Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAC04862F8
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Jan 2022 11:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237996AbiAFKeH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 6 Jan 2022 05:34:07 -0500
Received: from mout.gmx.net ([212.227.15.15]:39365 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237059AbiAFKeG (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 6 Jan 2022 05:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641465212;
        bh=kyeIeZ0HdgzuCyOsYmaeqH6yQLfMFs6QcXaYdAQ9WIc=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=hyk7oICuLFE/lAGI+wphVzOSRGb8dJSWegoLzEw2GEAnokiJ7RTzjM9c3fouefa/t
         qDpGxs9vma84HpYTdcwqPHevBH3IFBBWTzea5DRmvP1rM6AGzXfDY7gY8ol4FJcyWy
         gTYGxmzTgNdkv/PYM8VNQKuT7QJi/ZEvrOg6YaE0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.152.191]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmDIo-1mev1Q2vqq-00i8lR; Thu, 06
 Jan 2022 11:33:32 +0100
Message-ID: <213a7020-c7d5-b9c2-0e81-a16bb94d2361@gmx.de>
Date:   Thu, 6 Jan 2022 11:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] parisc: Provide a trivial PDC-based io_module for
 kgdb
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
References: <20220105214552.590606-1-deller@gmx.de>
 <20220105214552.590606-2-deller@gmx.de> <1881841.PYKUYFuaPT@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <1881841.PYKUYFuaPT@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bXIlGk2hai9m2Tqq4/z9hFILlQqmY06KNicc2UjUkdcrpaH1jPT
 vBaE68OP9bJjeUaZr+262nZXOUHpecw3ih6Z89N/ytatIwrvRYFSPR3hrzaNpKj+TgSvZez
 X1mFbCD9l/gKWowhkxPf8uawz9k76DKgNB6HUZHZpOrQDMOtFdefTaDAocOKua6NDhdA2pW
 VS4UYCZbrd1REz2xYukxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ccOVf94sT18=:bWbvG3bMEG+GnqVNsyQTsW
 itVOX1OqG5+aeSuQq4yau7FjUSfSpvNTHNEmi8v9kScYwTNy64vNFZH/rZj1OQzCe+K0cA/uW
 N2bWnaiO32awAvbQgHVE0kQtSBWnbpvsn7MtUp2ncR6Li3/f6INu+3pwoi5ISXx198/5Vk66b
 kV3Y7VcfhXjjoTJ85RfKPDqwbNpoTA2IKgQxbMjHI9Y1y4Kn1k7l3FE0t17EAAZEI9zssWwD8
 bSqosLz/5EpyaTh3lJ/Aq8pHMXN8fI9XsuNPQz3OrthCltdtne3uaP0vtiHcJdQdQKT9/YrXg
 3hgHO36XGovnNix0KIZeiyxQmATz4s2r2s3n73K1dKgA+rUEyhd/0xB6wpmA2Gy1wkVGPT2l3
 JKoZYU6bdiZ/3AX1eXnJTiT0cRdcP1HlCNhfFNUEIQmqUkMfp8d8DJQc59jCkci8jaCuBYU6P
 RP9kMJ2R8bFf374fTjRlfPyM8gltDLD8EKt51pNDP6Cl0XPs8RYZScIjw1Ihthxe3uIl7Omx9
 7WTY7s184sLBcbg6UsXEDgooK1XSj7TqAab0w6c5IasVxxC7vpK3mfxx4KkezOzFZPtXvudPI
 arQosObcVOdG7Q54fcMm58r+NMLv2920ZzMZGIEd/THJtWKFShbPwthIrc8N6qr2GeUNkgfIb
 kM/pMWs6CSZXxUmUM7nmM8qJAZjpLQI7o/Dgg4JA0Xr83gTHQFgZR22BhshACUGYTBIoTr4qF
 PrHw5nKZMNKpP7jM5TV5fktMrrTUry0RmYozycC+mq9K5xHxYRHEvnHAxrpq4c+ggQDpKAciy
 gSIm9lPMVF4aIYbl/AQu/tLCzMA/eiyIwbIOLaUmYf6tg+1PPkq4n9s5ZFkACENzoKt1ENisz
 JnNzj/XtogCv4MuRyzAFzHoCGQfm5NPQKxVsjRc3mjtEO+0GFyZ4Hjr0wNT5C+czn4oAhKT8W
 cu4ziubScyY93atWr4uCGww+e/i5y3NVE3ZHj5bfyW66xo0mm/JJLRKv/h3dDwJsRGWvomwsB
 JJ9Nt36Tm2XxtSLa+/BCCKiZ2QkjbT6z6wFVsRXw3kvNm2Qy6entulY0FEs26xQd3P4Oszeo6
 fjqEialjZ4T+Hk=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/6/22 11:04, Rolf Eike Beer wrote:
> Am Mittwoch, 5. Januar 2022, 22:45:52 CET schrieb Helge Deller:
>> Add a simple keyboard driver for usage of PDC I/O functions
>> with kgdb. This driver makes it possible to use KGDB with QEMU.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>>  arch/parisc/kernel/toc.c | 27 +++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/parisc/kernel/toc.c b/arch/parisc/kernel/toc.c
>> index 18327611cf8f..dfe7cccc086f 100644
>> --- a/arch/parisc/kernel/toc.c
>> +++ b/arch/parisc/kernel/toc.c
>> @@ -109,3 +109,30 @@ static __init int setup_toc(void)
>>  	return 0;
>>  }
>>  early_initcall(setup_toc);
>> +
>> +
>
> double newline
>
>> +#ifdef CONFIG_KGDB_KDB
>> +/* read a character, return -1 if no char can be polled. */
>> +static int kgdbpdc_read_char(void)
>> +{
>> +	return pdc_iodc_getc();
>> +}
>> +
>> +static void kgdbpdc_write_char(u8 chr)
>> +{
>> +	/* no need to print char. kdb will do it. */
>
> kgdb?

Thanks, I fixed this and moved the driver to kgdb.c...

Helge
