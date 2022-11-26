Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD89063983C
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Nov 2022 22:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiKZVA7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 26 Nov 2022 16:00:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiKZVA5 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Nov 2022 16:00:57 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A1EB844
        for <linux-parisc@vger.kernel.org>; Sat, 26 Nov 2022 13:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669496452; bh=+js8B2q6EsXUH8CgX+i191qIRCayrOe8TGNaMWOLc+E=;
        h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
        b=d3tGwWMxtabq29m8oQCY6X+e/3/XQCaHsYtC2XnZRA1NqEVM4cXGHrAaWEyfhWFaI
         LsdqnDK/Uo8lk2rBQOoutRxVx/hwOFrQ7xRRkNrUBWmnz67/GQ/d58q7xdepCGm45+
         6w9gES1BC1+bBygUabN+p8Rocy29zk7N5Rn7mXKFfhVXmfI4xh3QopXtHp4HIDeAIh
         iA5hopZJfq5WCE0UT+0Ls8Vb46AhwbRhfUUY5eZfq0Jwq/sFkYU/unq4Ty1vFLBtnf
         yxN+66Htp3reGGiHWsHybSBM3J2s+7c4BdefAo94++rziiV2iiukzlZUQWPw9k11bb
         tuufXnmQivv3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.155.181]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKZ3-1pJZql1jJ9-00Ln4m; Sat, 26
 Nov 2022 22:00:52 +0100
Message-ID: <655e7bde-f03c-3b96-dada-dc029f7d367e@gmx.de>
Date:   Sat, 26 Nov 2022 22:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] parisc: Fix kgdb keyboard input in pdc early console
 driver
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
References: <20221123152435.276718-1-deller@gmx.de>
 <20221123152435.276718-2-deller@gmx.de>
In-Reply-To: <20221123152435.276718-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ftkxdVVWJHH6kKyhfSS0xodLzXK3e78MJio7PGXJXeaCRFHKsbZ
 TMyfjbnKrvKEXmENfBGbrauaOuFMHuf8ZP1dtsmAWinoJCxxYS14iYjgiBRqW+EIIN+XnYz
 0gCSVkwokHoFxgfcURvAQOruYyAw1dfW7jnzoNIOqC4WPj9ZXPK+yCPoshRyG+kLHCbHm68
 MhhfDp2bI4wnWOMsbyrpA==
UI-OutboundReport: notjunk:1;M01:P0:JxzJ6oVTh7Q=;PHTfVRQ9NLnPPnwWQx42xYKU352
 VuJ9fHkPe0/JUuQlaoDTXUk/9mlwYdVALQGZewHny8IXx8A+uLzi26ORxE7ERUAxJELbphxa7
 eP+ZgkeQvumihB0p8HJ9NjIVpr9QlDCaiB5cQyHmmucF1FcUhIkXNgyjhxl+AAYuSPNaH2F95
 wARFJWJ2tqNBgyEfKQ+ss4nj9p0XvZjrTfl/avY+Qp+pIFYAUZc1gBVbbgctgymQY4V9+7IFA
 Hc4NdWG7+EGD+tVVM5wfGIMPwQUscjk74jQBrKUgCFjLXvgjRCKOLmFiR1MlfOrjKJvTdZT56
 CnbF1HmE6xK4Y3VY3SVTPXhL9KbwXkVeTwxRmcfl3t4Wpkvb2ONxmXKyfYAL8E0rx3wqHkWJc
 XPSv9cEZwdaJ9WmiitP4Z+IbDha2l3KDnW8B+VQf40UX2u+AIHGImu8LR1gY7jZKjdKNMPaVg
 dclbt/RL6X+EPlhsqq7fZeYbCr2g5wgtHlJQnxCqHLmDl/Y2PLTT127CKR3jWy5nKl9v4Okz1
 polwigaMiyQidVs4U064VvcjrvPeL4PBLZNcYb30+ykpw4qjC+gq7R9lFuoLElpkUiOuzjKMb
 pOyDFUbI7Ey0AQpODepAHWbQ01Ef7fYmyx7ASdRnxSeHOLxYgBVgigJyr0HyYekJk535NGbNH
 pWymzI+20e8Am96ev2AqVyGGynmLKfY1FrH4GnuG84vRc6R1po3v/zbKcfPDsqgxYpa+Iz8BK
 aNewFxu8ZBTG7GEvz20QjrDSu2CbWtFyTPaoAX+Ati9CBAlC87VG35KRd3jw9vqkZ40NAoggE
 TBMaTLp1P82sgCZLOkPm3+Vyqr2SdmTt1UdyjJIYsOhUsfXzPcjS1BnzJNd0YurRwS0UdDyeU
 Wp9sKj1SUyN+0tYpF0FFEQZ4FWHBRDdE1jzLk5ykwrfZAnXMSsweZuWa4Km5z9OUzdvjPT522
 GxVnV6lso7OczTuId783cdsW8mE=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/23/22 16:24, Helge Deller wrote:
> Commit 027c3d345e2a ("parisc: Convert PDC console to an early console")
> broke (physical) keyboard input for kgdb due to the spinlocks used in
> the PDC console function.
> Fix it by using using PDC calls which are not protected by spinlocks.
>
> Fixes: 027c3d345e2a ("parisc: Convert PDC console to an early console")
> Signed-off-by: Helge Deller <deller@gmx.de>

I dropped this series as it didn't fixed my problem:
The USB keyboard on my C3000 probably needs a USB reset when a HPMC
occurs to get it working again.

Helge


> ---
>   arch/parisc/kernel/pdc_cons.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons=
.c
> index 7d0989f523d0..bb498c6d51c2 100644
> --- a/arch/parisc/kernel/pdc_cons.c
> +++ b/arch/parisc/kernel/pdc_cons.c
> @@ -12,29 +12,19 @@
>   #include <asm/page.h>		/* for PAGE0 */
>   #include <asm/pdc.h>		/* for iodc_call() proto and friends */
>
> -static DEFINE_SPINLOCK(pdc_console_lock);
> -
>   static void pdc_console_write(struct console *co, const char *s, unsig=
ned count)
>   {
>   	int i =3D 0;
> -	unsigned long flags;
>
> -	spin_lock_irqsave(&pdc_console_lock, flags);
>   	do {
>   		i +=3D pdc_iodc_print(s + i, count - i);
>   	} while (i < count);
> -	spin_unlock_irqrestore(&pdc_console_lock, flags);
>   }
>
>   #ifdef CONFIG_KGDB
>   static int kgdb_pdc_read_char(void)
>   {
> -	int c;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&pdc_console_lock, flags);
> -	c =3D pdc_iodc_getc();
> -	spin_unlock_irqrestore(&pdc_console_lock, flags);
> +	int c =3D pdc_iodc_getc_unlocked();
>
>   	return (c <=3D 0) ? NO_POLL_CHAR : c;
>   }
> @@ -42,7 +32,7 @@ static int kgdb_pdc_read_char(void)
>   static void kgdb_pdc_write_char(u8 chr)
>   {
>   	if (PAGE0->mem_cons.cl_class !=3D CL_DUPLEX)
> -		pdc_console_write(NULL, &chr, 1);
> +		pdc_iodc_print_unlocked(&chr, 1);
>   }
>
>   static struct kgdb_io kgdb_pdc_io_ops =3D {
> --
> 2.38.1
>

