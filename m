Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51E414E79B9
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 18:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235276AbiCYRP5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 13:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233371AbiCYRPz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 13:15:55 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4C5E72AA
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 10:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648228420;
        bh=I8Kdm1zn7/P5iuXH8rX2tQk7+n4PgigfZMBLveQJns8=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=EKhhw8VrgT5jo2jx029d8lH8syu0eZMHec0QbasJAXlxgmD9nVN8p8Xnq+axpFGx5
         krNx7mfYguSyeJcBTRqj7UagNfSbvTEAimS31aERbESZXLZr/iiH/QFXHTMcyeVwYT
         amEm7aKsxTLIYk7fIxGQbhIzqWl1GCUzdAXF3Mc0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1o0EVY0zJA-00fxmV; Fri, 25
 Mar 2022 18:13:40 +0100
Message-ID: <58e88fda-e9d0-2d69-0d8c-cc4b5e4da776@gmx.de>
Date:   Fri, 25 Mar 2022 18:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/12] parisc: Move store_cpu_topology() into __cpuinit
 section
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20220325143833.402631-1-deller@gmx.de>
 <20220325143833.402631-3-deller@gmx.de> <3161280.aeNJFYEL58@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <3161280.aeNJFYEL58@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H9ErLxXnLZ16NzhwPWiZpTbtvQnPu4G7JMOaazbnJXJLk//mQR0
 fktlx+MD10vMXW6qjCq8N2Shc1oDSk6oxtUJR2Z2ABGZCWl48Lxkz62rhdxyKznmYLDIufE
 wJFggXXP34pe7oMFM7EuspN8GS8WY9XFP3nfsTwlC1KG/8kMqr8K5TupaqqGe3mIdT5PMsE
 jC6+Qr94ZzE6jWSOcjBfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4LokGtS4ftY=:rc5LYPFNK+j5V7KWLM7WmJ
 g/PwLQZTAVASv1sgXlOUbVA3zJ1JHr/bGwHzl4h86lTkZzLwezcJK0bJprPLgvHJPjr/F6ivk
 8oBejUr7UcgnXOLYkpn0XkW6qsoBTx/K3QKc93yamzMBwkUoNQs4K2IxzdbX+9HjYseMRTAPX
 6UcCubdUf0AsJMH1Pz/2CITip7Wwuyora9g2tUj+Ir8xqYXy6QiDwtAdSqbBIg09dpcwe/Yh9
 V30iCU899Kft9S2AyYK5VIbDULfrG7sAGAcHOJiprYf7yPIVA5Spr2oawsMjD3bMxRVAiZglX
 3vGQSY3HvWa5c4fT2WBTS74su5hBv9IPKsXQi28polKCKTp543FZt/blECf+j/oDqa+DnSmHD
 iVRYbLP4RtXQK/UogzOv2boY8pC7lUpJ/G5nnQHmS2DGzKYOq6mBeduC7Uet9AIDss8oZ6rZU
 N1QPrmUPtCEwO6ADhs7xsGO/Pfc8L0pr5loWwZL/6SZKSiQLy4lFUuEO2gHmXHJcIaKMMGx7X
 6HSTTNiSO2Kg+9bDGlcMND2zzksoWxlM2QLQGktIV6gLAC+ZFWdie8MWUA72cW6VV8zYStHh1
 NXebIfmgFmUqdL29z1mdr+ohTsmFnzVg3BbfktDGNTaHGlapGwbTYOGFD35a8aGLaSuGdCJq8
 vc+yfj80a7eCFpuiSTUXA/iLfnsDAheoVx7tog252i1bqqI89PVAkZCOry1Zzi3pRASGihOlK
 iwc7pllU2aDuQVGnZ9ijp2/Qpl56gYuey1l7UmY+KsjO9wYfv3f3pNyWiTDEiH5Eo+yyJ6CQd
 moM6eF1uWZEnehdI8weZgg+ZYUsw6InRKVDO7BGe3L0pEvY9hIJXS0ULn0yYDNDcwdCqx4hJg
 9LaSGA9u4vh8XSUP7cExgOc+uqoGLjrCa9uqu9EXdfZW1acAR82qgmbsFKXncT1sTNxGY8B0i
 DUefZfd/5/SgE8MMpx/9BmeFMzld++13jMXZKB8a3H5lQIlm7jvA50rTL3IG8N3PGGxjpnOMV
 UqEr6Ks/FJu1jbakigD8ks9Mzpgv5xAXEOPor3Y8QgJlcZFyk3e6Vz8bDEgz52cxWKYBgFmmU
 UgdSczZobCPAEs=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/25/22 17:52, Rolf Eike Beer wrote:
> Am Freitag, 25. M=C3=A4rz 2022, 15:38:24 CET schrieb Helge Deller:
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>>  arch/parisc/kernel/topology.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topolog=
y.c
>> index 72d9aeb54fbe..dc766fb55491 100644
>> --- a/arch/parisc/kernel/topology.c
>> +++ b/arch/parisc/kernel/topology.c
>> @@ -16,17 +16,18 @@
>>  #include <linux/cpu.h>
>>
>>  #include <asm/topology.h>
>> +#include <asm/sections.h>
>>
>>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>>
>> -static int dualcores_found __initdata;
>> +static int dualcores_found;
>
> I wonder if that should not be something like __cpuinit_data.

Heh ... all other platforms got rid of __cpuinit and __cpuinit_data.
I just wanted to keep it on parisc in order to have small code in case of =
UP.
That said, introducing a __cpuinit_data section for this single variable d=
idn't made sense.

Helge
