Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189487E7823
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Nov 2023 04:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbjKJDiR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 9 Nov 2023 22:38:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234633AbjKJDiP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 9 Nov 2023 22:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D8D4692
        for <linux-parisc@vger.kernel.org>; Thu,  9 Nov 2023 19:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699587445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pROeszy9ePncz4nZyjZpb065/8N1ucMk0OODbP+hams=;
        b=GF7PFWZyMW8P712ez37azl/DCqNiBiJVzwq/YcXWF3yr/Ea28AUcpKn+tQHCYi8CJROUkt
        8zo7tcrYIqPD0uiZ+C2iQT9YXhdSLPUJ5wbWGWsngDKO45N4/p/nFUMaVogxuO581/n/OM
        Us8s6hD9YPeyrw9MfN/KAQCs8Py5aWQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-gmCquzouMrmEofgGglATgA-1; Thu, 09 Nov 2023 22:37:23 -0500
X-MC-Unique: gmCquzouMrmEofgGglATgA-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3b2ec6de4e4so63830b6e.1
        for <linux-parisc@vger.kernel.org>; Thu, 09 Nov 2023 19:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699587442; x=1700192242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pROeszy9ePncz4nZyjZpb065/8N1ucMk0OODbP+hams=;
        b=XJUU5DLmr+8HgHhKWmRYg9Pkw0/Medry6cPPh27Df9+/7qIP8HerPFu8WbTx5DFhwx
         t5MkwlPFHeOs3TGSgF8bh7EO6BQdGnMMPVH3VZsZoJU2JrE/CY1ZyGgaeNQRCbFyL02D
         3PIBisMs+nKGT7jB852B6eNFl1NN+AAEf6VCljTiQhBzcEPgqb8fkdsWUrJucVAf/GMf
         9T5Kxb3871wg0cjd5slTHBapkWh/1stxf/Q0qpRPeqDMBlpxpSQ38Cmtoqwkq9kgC0yK
         kTL4zfU9d1tMycRJn/HU9Lie+engpEuPLL1vGQ7CkCDPfjaDyQVny0ruHJ6imOzxUbJ9
         N/bw==
X-Gm-Message-State: AOJu0YyuxgAHNevW4qAjX2q7rPqd1N+1vhEEoq5S7QtjLPjzMgUXLHyP
        21G0sR6lfNDU4VQ77uKHkUU6HrrH3T5upHeOv7cFVo0nXQiLXH3Yxx15wDn1k+bdQzuvN8trv7V
        65/Di72T8FqkE4jOcCR2O3Etj
X-Received: by 2002:a05:6808:199c:b0:3a9:e8e2:579d with SMTP id bj28-20020a056808199c00b003a9e8e2579dmr8276245oib.2.1699587442421;
        Thu, 09 Nov 2023 19:37:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPdXOyaUAzV6aldemEymWFIQu5uK8SS6EoZEeBtta4Ue7SEB3JH44cFaCIyyqf1iZkLKsTPg==
X-Received: by 2002:a05:6808:199c:b0:3a9:e8e2:579d with SMTP id bj28-20020a056808199c00b003a9e8e2579dmr8276228oib.2.1699587442206;
        Thu, 09 Nov 2023 19:37:22 -0800 (PST)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id e8-20020a63d948000000b005a9b20408a7sm5370547pgj.23.2023.11.09.19.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 19:37:21 -0800 (PST)
Message-ID: <fd78bb81-1f83-13a4-ec37-3fe0cd040ec0@redhat.com>
Date:   Fri, 10 Nov 2023 11:37:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 14/22] arm64: convert to arch_cpu_is_hotpluggable()
Content-Language: en-US
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
        x86@kernel.org, linux-csky@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-parisc@vger.kernel.org
Cc:     Salil Mehta <salil.mehta@huawei.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        jianyong.wu@arm.com, justin.he@arm.com,
        James Morse <james.morse@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
From:   Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On 11/7/23 18:30, Russell King (Oracle) wrote:
> Convert arm64 to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/kernel/setup.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 165bd2c0dd5a..42c690bb2d60 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -402,13 +402,9 @@ static inline bool cpu_can_disable(unsigned int cpu)
>   	return false;
>   }
>   
> -int arch_register_cpu(int num)
> +bool arch_cpu_is_hotpluggable(int num)
>   {
> -	struct cpu *cpu = &per_cpu(cpu_devices, num);
> -
> -	cpu->hotpluggable = cpu_can_disable(num);
> -
> -	return register_cpu(cpu, num);
> +	return cpu_can_disable(num);
>   }
>   
>   static void dump_kernel_offset(void)

-- 
Shaoqin

