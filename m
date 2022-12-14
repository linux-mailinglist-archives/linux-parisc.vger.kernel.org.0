Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0532764D1C8
	for <lists+linux-parisc@lfdr.de>; Wed, 14 Dec 2022 22:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiLNV1v (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 14 Dec 2022 16:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiLNV1C (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 14 Dec 2022 16:27:02 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E061F603
        for <linux-parisc@vger.kernel.org>; Wed, 14 Dec 2022 13:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671053211; bh=+1vREi2cTTLjGhDT0aXzX3c/M+Av9dJIs8zvICARv7c=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=TmmPnt7ULYlxLuniDg/a3QTxPzAjdOrdcvRrDmAMT5QzcPeqDOPsG58gFaZRG5WnA
         qrYjKwB1lzAhFSHUmpKBoksCeNYaZnfMwnUAhTEANjt1ilPSGuAnmcf3EIuzgq8vG7
         +T7NGWEz5FJtSGY2DzlGx83di2z20DiRV52fBmU+c4Uen4TTmt4dB1pVf0nJgYiSX4
         1kOMRCMlT/a1wg6a8vXxAH7MFTBO6GpSr/Y025IbeK0tB0dLxXiiKm4pVken1Xpuon
         +RsI4IHi0DHQdd5fOdvaOxFpbUPw0tqIeEoEyJeP2dKnAf4HTNSreksd2I/Iezw5Gm
         ou9MVet63yHFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.146.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KTy-1owO7t0kwU-010JVH; Wed, 14
 Dec 2022 22:26:51 +0100
Message-ID: <e96fefdb-2fb9-9a85-fc19-2bd6c5bb896c@gmx.de>
Date:   Wed, 14 Dec 2022 22:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [linux-next:master] BUILD REGRESSION
 663397d1b469ff57f216d499b74a0b0183a508b8
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-parisc@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>
References: <6399f97f.8g32TjfFuyg/ourC%lkp@intel.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <6399f97f.8g32TjfFuyg/ourC%lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8BModHyLun48omRS9t8Zozd9OS7qSx6urdcGas1PaIu3GZ9pF1b
 XYnraegHQM6LmD5haAyRJ36KmTEGjaTAnxMFueOwUuduHmA/qH/JNwiK+z64jCvOiNQ2H7B
 Xw/YXRiwZL/lF0ET6e2UCRaQjw6vADxT/RS6aAQmm5R45fQ83rBYXWB2svcvsKVkAGwV/WI
 jzo2HEmebw8B0WIOg8k1A==
UI-OutboundReport: notjunk:1;M01:P0:/0RawHzgz94=;Tm7M3qfy+U3t2OwDaED/vVVGil/
 0wDr2PVJnh0g/kv+IsvzyHGOKR+QCv9ow2I9InvputyQ7cryuIndY//IG5T5aYRZTKtmPzj66
 nC/zQaeKTkY/uNrdTPZ5Er3SDChCQDhrCz0y/tGzlaPFxXnSDuyk+so8mzLYc8vz9+7klMLo0
 a3NAdfrwB3Vc8OATegHPmVP5uech7nKVUGTpMoucYBP5E9yNCVS25ywRsQiRYZ2VnLHotBTmc
 wXAO3lRWBCPX5IkGQLQCKxFzdBvxOCvrBtVycn3HS4J3O39BCGAidAkN1GfI8O3ltBqBqUUhr
 /V5dH9/Hbfe361TAUOn1rhbMeq300UgclXKCNATN8ETEVtMSFyf23sObFF9iSjcF0wjL2KPB3
 b2lfQNqaozPowhAdHblGU0QadIVqrC8kehrNas94rXG7jfEtIEk8xVFI8NZWlu6ybF+OgYcqT
 ziadJUly5L2XPSe2o8OkYo5VToJwYLbL7P89GApYJJ+U7FtOUYdapDRfiQe+3hwG7M+YX6t/v
 LBuDkt+YFQTKt99kmjHOMAasiiJ2xzoY4TcVuvEMnqrxxi31vtFRvzow5IhJ7CL+VqoSJZtY/
 P5eLnA+jc+djmbIJJMlOgEf7YKPP+H19musJGodkkwDKs8QncXlQa6YrWKaaSnaIltitdBdaJ
 pYHhuBNnm8Kkv5xvwOBAnJmdhR3Br4wpbbmSzFc9pKqT9G30ZRROLa4Ctap16vOQ3/zcuGCP9
 aU5Ye4m7wz/iirG/tQBnvTB0OgVGcQQJ9VVgXi/xvJCDZaqThEWNfg09XaXqeahpSAfWwbA/C
 yhqVbywRx66A56fXgqMJwhm1MYFAQElrzK5G+paY/LzyTZx5UEaqHR7Zrw0nd6IoHzndjpZjz
 EO1nJOp159aYbpqGRwYrzvMl9hKZi1l79SdGE6GtO3uw4OV2c1u9kF/hDKSE0JSrH7QKBenCa
 j2b+IQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/14/22 17:27, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git master
> branch HEAD: 663397d1b469ff57f216d499b74a0b0183a508b8  Add linux-next sp=
ecific files for 20221214
>
> Error/Warning reports:
> ..
> https://lore.kernel.org/oe-kbuild-all/202212141410.IlFkWqph-lkp@intel.co=
m
> ..
> arch/parisc/include/asm/pgtable.h:169:32: warning: "PMD_SHIFT" is not de=
fined, evaluates to 0 [-Wundef]
...

FYI, I just pushed a patch to the parisc git tree which should fix this.

Helge

