Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58D264C071D
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Feb 2022 02:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236646AbiBWBno (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Feb 2022 20:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236684AbiBWBnb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Feb 2022 20:43:31 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBE250B29
        for <linux-parisc@vger.kernel.org>; Tue, 22 Feb 2022 17:42:59 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 27so13312968pgk.10
        for <linux-parisc@vger.kernel.org>; Tue, 22 Feb 2022 17:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=EIgDsKHK/7A3hYjGzuwp0mt1Zx4DqedctDxyTOeLL7s=;
        b=zoYMgTMzBim7kT8E8RtAzBQzMnYT267FbUn9niV42OhWDDak0NhGQ8Ea/WIztMSdKQ
         WSxjG++qNqyUmAc2rFY4lbsG8EtYCif2aWPLPIhNyEZJFdnXyvMGv1g5SNsAeHcVaduN
         3aF9JUoL1uISZZVizP5eOdEs4wFcri1mJ7W2+7jH2qbukUw1tdGNQIlJ7nb9rT4vPg83
         DNDX30kjb/RQrzmTdb3zLlrb9dUO4t3W5ODDYJ1SgNy4mYdShMW01rxlYfOZC4Zw1ELa
         Ncu4htbBSvAwLAgsMrP0ne4wobOp/VZfsAFVcBGt3znGcbkmYmTp/NzzfAR3cyfAxHK5
         q+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=EIgDsKHK/7A3hYjGzuwp0mt1Zx4DqedctDxyTOeLL7s=;
        b=qNEEN/JziZSHmV1dgJHGpmGudbVSY9QTyMuHRT+8qCT8EknrAg03FaIaLU9Qel1ibz
         dv4iafjep18JJfQ2P+gqjILgl2Nn58zBWDr8Uhm9/qB57CB7alXDIbqyRNPp2xTe+CRp
         +eBybd/0fWc1/Hwg7WmV3pntB9NxEIewELYyywKGShSNebHkf9L+vvwByUf9Eb62SNi/
         wOdBTl7lr9wFGuE6OH6PiRHOUc+l1o+SUoME0fLII4i8VOwzOqGvyV9HD91qkM7ZMPrW
         6eA91+xLRNQOQ0nzPH1hLH33rmiPfoOCx96oeqheXuBm+7OCS6FOad09mkCWXH1FGK5b
         POeQ==
X-Gm-Message-State: AOAM530SWpA1ZhBedrAG0STCNuow8bOKZL5HGDlpWQY8UZEMiVXfjtTt
        AvdUKTJrzBJvHx1j3NeDfFW1AA==
X-Google-Smtp-Source: ABdhPJzyj2zCoiD8VneIC0PIYB0EkFnPoGuLVRxasLol3DuwplyySz8DnRpIoBlUCpRMhRxzsN0fNg==
X-Received: by 2002:a05:6a00:114f:b0:4cd:65d0:7dd5 with SMTP id b15-20020a056a00114f00b004cd65d07dd5mr27015541pfm.41.1645580578972;
        Tue, 22 Feb 2022 17:42:58 -0800 (PST)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id h7sm18228501pfi.128.2022.02.22.17.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 17:42:58 -0800 (PST)
Date:   Tue, 22 Feb 2022 17:42:58 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 17:22:39 PST (-0800)
Subject:     Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from being selected
In-Reply-To: <20220201150545.1512822-22-guoren@kernel.org>
CC:     guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        anup@brainfault.org, Greg KH <gregkh@linuxfoundation.org>,
        liush@allwinnertech.com, wefu@redhat.com, drew@beagleboard.org,
        wangjunqiang@iscas.ac.cn, Christoph Hellwig <hch@lst.de>,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org, guoren@linux.alibaba.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     guoren@kernel.org
Message-ID: <mhng-6be88a24-32d7-451d-8a78-b9dcc90ce991@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 01 Feb 2022 07:05:45 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Current riscv doesn't support the 32bit KVM API. Let's make it
> clear by not selecting KVM_COMPAT.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Anup Patel <anup@brainfault.org>
> ---
>  virt/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index f4834c20e4a6..a8c5c9f06b3c 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
>
>  config KVM_COMPAT
>         def_bool y
> -       depends on KVM && COMPAT && !(S390 || ARM64)
> +       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
>
>  config HAVE_KVM_IRQ_BYPASS
>         bool

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm assuming Anup is going to take this as per the discussion, but LMK 
if you want me to take it along with the rest of the series.  There's 
some minor comments outstanding on the other patches.
