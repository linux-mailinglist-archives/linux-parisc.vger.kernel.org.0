Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1C4852A225
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 14:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236093AbiEQMzH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 08:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346569AbiEQMzF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 08:55:05 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A161D21834
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652792093;
        bh=LfJk1TJmh7HFYKT7+vpf7AH40SbrSN8EKpz9WGZjA+I=;
        h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
        b=Hapghfi95rIRy3Ygsbj8VjSKMrGz0FXn0ksrfhcMD9HTftLWzFDrjhlG8k380zWsc
         1P65LhIoXwphdEPZ/5e/imgRaThbPLAmtN6/kKLKKEb2HFzYFQJ337mHW/YzmtXxD5
         V8Zb5E/98OUB88+6zPVol0o+SXlYPDWbwd8lULgs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1nav0Y3n4c-00thhk; Tue, 17
 May 2022 14:54:52 +0200
Message-ID: <8b5c308a-f3ea-e07f-053a-ad086ce75c43@gmx.de>
Date:   Tue, 17 May 2022 14:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] parisc: Prevent using same register as soure and target
 in extru/shr
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <YoOZy3A3R0i0DUWB@p100>
In-Reply-To: <YoOZy3A3R0i0DUWB@p100>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d/JHZIe85sGZE6Q3SluVRh6k91zpcPLcK9ulCuM8ika7sUK3xJu
 XIiIqAejz8/uBlr9y8r0l0tdDR+FSoMvtjVDycYYQ0MWlZCr5icnRwbVK8uzLz4Fwd2db3O
 tzyrWec16UyfqxbmeHDbaEjhZi/aTWURuf8adZ5K4wDnST8aQiVgHdOC2iI700tGuAZ2IDS
 6k7RZ3ok+UR7kt4KSz/Pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z/3x90Gzy/Q=:/sY69OZdDjKYsG/GuCmxsh
 x8VDxaT9mvC0lrcZhtRuUXJ3cafxogrO2pZqK7CJTJu4iYTCINDZGVMJjwFPf+nfrl8iEiMVS
 OE50M0fw+5vw6V/A9PPynXWsOu7me+G6fnSdz6Z+ZV0d3vYDk35lI9V23ZXJlfzo1Vn4TKqir
 aHTd9wz+U8BSa7RsmRHjeP7b0Ic28oi0RpYUeAXZ5DiTdGtp2gEfomgAjZRg/af0VTBFTtmLx
 vP/1oTdnPB98rfOPbiY+NoaJp17CnslkyfuJS96hSd3+FIHs4sNX0N/u8xL8VaOjPzuEsE3bp
 UIZEzB8icLLgZQFhZ+LCoJitLs8eDxo6xiKzdHXnwbk5f2tGAzJCIS5GhucBE0talITMkZqkY
 7caDxyJ/0J4DKsTNbvYkjEnz3ldnOgNlwtEf4PfIdVQcgp4k6DBZEW6R3Ex5JC2rXpWmFd61j
 D8AQrU/ksaz7kEnfDJoNc1FJ2RERZwcQAzLVtaBJB01TXCDs8yZzkVikfXOIfAgx+VYq/efVC
 MWx9bBbeJK9FYWsRMEbmX+qzRYzfxx9o1xRTLClLxCSYe++8qLBcPJsbjw6pkfpb8JoQz0WCe
 ZW1yltZ+toN8hrY2/HZ3b0avcwZbtv1RmTHPvi9WFGsgcUVxkApyI4zJpNHGxJGiTHPUhsDTF
 gRWnkjwB/0J0m6qjhwXMoXkguWxMeurmvzf74CvrgWosDg0jpiKkvIbuqbmMmkWmMBnuiKmL9
 kRCjH30CL4+eWVw0Fz2AC2mbngxxrLOj0aLh93In0N4BU0+CQPi4zFW5KHVUZIp/GHfM3hAjC
 s8ZXzJOlhRrxQF7uXgnQxzMLlFiyjogBj3y3UeJ7/fUxOYkP/S6cZle1AHgny9umdn5d4zoqR
 85mnvvCXhCgqUmv77iaXNpKzHX9r1jedPOgcx3ZdrVyOBW5jJERTy8Exo/ZKivf1wfcLBpIOz
 QgSXF+Tky7yahXGygdXmQQHmoD5EElzJ/cYzXYFXWzLqPcLwc9sVnVDureKuLH7rmPJRQJaXx
 fRn5jAlm0juHDDJylXd1O/IvFWf30s1MKzdYqaXEI20QiJmmg3ovwzs7SE3NBXtl9ILfzT31l
 3TXx/9WCNODMXKWHp59zyvkpgSJsOd6GotpKxZNLzqPOwiONl/kibQyGg==
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/17/22 14:49, Helge Deller wrote:
> In 2004 Randolph added the shr() assembly macro and noted that the
> source and target register could not be the same.
>
> I did not find any confindence in the docs for this restriction. Maybe
> it's related that on PA2.0 the upper bits may be clobbered?

Looking at the generated kernel code from C-files, I'll find all over usag=
es of
	extru source, x,y,  target
where source and target are the same register.
So, at least for 32-bit this restriction can't be true.

Any ideas why this restriction could have been added to the comments?

Helge


> Anyway, add a compile-time check for it now.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/as=
m/assembly.h
> index ea0cb318b13d..ca1a12ae5ee7 100644
> --- a/arch/parisc/include/asm/assembly.h
> +++ b/arch/parisc/include/asm/assembly.h
> @@ -146,6 +146,9 @@
>  	/* Shift Right - note the r and t can NOT be the same! */
>  	.macro shr r, sa, t
>  	extru \r, 31-(\sa), 32-(\sa), \t
> +.ifc \r,\t
> +        .error "Can not used the same register (\r) in shr/extru as sou=
rce and target register."
> +.endif
>  	.endm
>
>  	/* pa20w version of shift right */

