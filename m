Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1753F4E7FF6
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Mar 2022 09:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbiCZIOF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 26 Mar 2022 04:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiCZIOE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Mar 2022 04:14:04 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Mar 2022 01:12:25 PDT
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBF622C8C3
        for <linux-parisc@vger.kernel.org>; Sat, 26 Mar 2022 01:12:25 -0700 (PDT)
X-KPN-MessageId: 4f26d9ec-acdc-11ec-9565-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 4f26d9ec-acdc-11ec-9565-00505699b430;
        Sat, 26 Mar 2022 09:11:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:mime-version:message-id:subject:to:from:date;
        bh=8fkADD8tfnckdtltzBFFFSDD40KBea2PyGGqaZWL1VA=;
        b=o/03sx11XWO5RBgv6emxRgdShGxQZbQpI8rxw7r97aZlO7Efp7TyaKR03rwnCfr8qt5w+bvqJtjJk
         30MlM5E/FniVS+JY+PXHzAvQYh89OHXtS5VMUZR80No270WZvK3C+1zqKLUNmPEqXvmhqkYXY2NDWM
         sUGG4x6c2TSr+CMuZ6v7cD6zKUe4SJGIOsxAlD9SD2SnrD/76/3SZBwHWN3LHJNTDYGai+WrdYxXLL
         p+xIEripmgY1hwxzX42hs1fb/DAm5S7UNx9rGKo4duJnI0DifD/vuJYo4GIEapV2LscGVn0OCfjio8
         MYXh0pQW6DtTveMp16iLpPnyyet2MKA==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|FspQ322qv4c/STTUkyYKf8b+zlyQCyssrstod+PXxUjxN8oYysUPKGF4imuzzBt
 9SipIMoS6Rs+NLcog4mWcKA==
X-Originating-IP: 212.238.182.54
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 51ecbb3b-acdc-11ec-b2a4-005056998788;
        Sat, 26 Mar 2022 09:11:21 +0100 (CET)
Date:   Sat, 26 Mar 2022 09:11:20 +0100
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 2/2] parisc: Delay until next timer irq in
 __cpu_disable()
Message-ID: <20220326091120.7075f742@wim.jer>
In-Reply-To: <20220325164040.502188-2-deller@gmx.de>
References: <20220325164040.502188-1-deller@gmx.de>
        <20220325164040.502188-2-deller@gmx.de>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 25 Mar 2022 17:40:40 +0100
Helge Deller <deller@gmx.de> wrote:

> Wait for next timer irq to trigger, then clear all pending external
> irqs before jumping into rendevous PDC loop.

*rendezvous

> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/kernel/smp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> index 60cc33fd345c..564442ac74c9 100644
> --- a/arch/parisc/kernel/smp.c
> +++ b/arch/parisc/kernel/smp.c
> @@ -491,6 +491,15 @@ int __cpu_disable(void)
> 
>  	/* disable all irqs, including timer irq */
>  	local_irq_disable();
> +
> +	/* wait for next timer irq ... */
> +	mdelay(1000/HZ+100);
> +
> +	/* ... and then clear all pending external irqs */
> +	set_eiem(0);
> +	mtctl(~0UL, CR_EIRR);
> +	mfctl(CR_EIRR);
> +	mtctl(0, CR_EIRR);
>  #endif
>  	return 0;
>  }
> --
> 2.35.1
> 

Kind regards,
     jer
