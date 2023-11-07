Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBBAE7E478E
	for <lists+linux-parisc@lfdr.de>; Tue,  7 Nov 2023 18:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343887AbjKGRs2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 7 Nov 2023 12:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235254AbjKGRsM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 7 Nov 2023 12:48:12 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E672510D8
        for <linux-parisc@vger.kernel.org>; Tue,  7 Nov 2023 09:48:10 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ccce410660so19248805ad.3
        for <linux-parisc@vger.kernel.org>; Tue, 07 Nov 2023 09:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699379290; x=1699984090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TY15kIau+eDARAHjRIt1BbGYq8C7hJS6gitrNXYnQoM=;
        b=HousSzc/TjsP9QqgcvSIDoufRgk897tprX2D8mQ95adj1B/2RgSgyZNdoHXOAi4POE
         RyGSeJv4XJeNzp1qJCFnJQQdRkoq56vsC4XirAWI7snyChYAVnTwpS3fa+wBy9WrqElS
         9R2e8WFkuuqV43XkSuhbARRfsELb92BgB/q37zaN2ZiYWtYUWAt96mKJdUdjhiN0/0FP
         o4hxVnfu24k/VrGRdQn2TDq9wXbKSdRoTirQs8urvQaLa+An1fTZu6enivRYHA9IM7Yb
         c87zXju/6oae3/n4iaoZqgW34MushccCIy0qF6RXIroGfOWMsOEZEH+xsciQFGCCFpP0
         jVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699379290; x=1699984090;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY15kIau+eDARAHjRIt1BbGYq8C7hJS6gitrNXYnQoM=;
        b=Wm1vWoAEBXFkIdluQLpaXyYCylgmhFe5GNOqx8w8UYk0ezNPJRJ48V3uiJJYgNvy7/
         lXXwCwugjOPr0XyD4VYge29v3QfYuhNEcebfcnQTeJIG6eLCzkVrsEIZZFL7PASjqcL0
         vnAgBYh2j+9pAj6mo6GWayzHR31XPReYbaaOrx97YZr00u7hqr64+FxzelQZmrNGPy4c
         RDk5FRHW7IdTT5TcEyxstaihcCpIEk7tlNAhsReDYNGWgqOqmjIVB2ngO0ZGF4AErmQr
         716URL4LaA7BszNE8aV89KMa178YazHvWQ6FKlfaqP1j7Kr4qxifwhv0KwKMp5OilUXb
         NJhw==
X-Gm-Message-State: AOJu0Yw6Y6+3tYDC9JCtDIsV+llU2q9NRxAqpbNN8ar4PkgFAUX8/ISZ
        hRRmRcZyXCsJfajXjERSUqYLIpCX07kwcwPWhn7+lQ==
X-Google-Smtp-Source: AGHT+IE1uUN1bCnM0e+Ov1l1naTtElUtLA3DgMMTfPPCXEEwKaTGd4dv0hVEl36p8Py1780zIW4h7w==
X-Received: by 2002:a17:902:ccca:b0:1bd:c7e2:462 with SMTP id z10-20020a170902ccca00b001bdc7e20462mr31928892ple.11.1699379290316;
        Tue, 07 Nov 2023 09:48:10 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903244c00b001b9be3b94d3sm102654pls.140.2023.11.07.09.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 09:48:09 -0800 (PST)
Date:   Tue, 07 Nov 2023 09:48:09 -0800 (PST)
X-Google-Original-Date: Tue, 07 Nov 2023 09:48:06 PST (-0800)
Subject:     Re: [PATCH RFC 22/22] riscv: convert to use arch_cpu_is_hotpluggable()
In-Reply-To: <E1r0JMV-00CTyh-It@rmk-PC.armlinux.org.uk>
CC:     linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
        x86@kernel.org, linux-csky@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-parisc@vger.kernel.org, salil.mehta@huawei.com,
        jean-philippe@linaro.org, jianyong.wu@arm.com, justin.he@arm.com,
        james.morse@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     rmk+kernel@armlinux.org.uk
Message-ID: <mhng-b535d186-b241-4fe8-a6b5-b06aff516d1c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 07 Nov 2023 02:31:11 PST (-0800), rmk+kernel@armlinux.org.uk wrote:
> Convert riscv to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/riscv/kernel/setup.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f8875ae1b0aa..168f0db63d53 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -294,12 +294,9 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_set_dma_cache_alignment();
>  }
>
> -int arch_register_cpu(int cpu)
> +bool arch_cpu_is_hotpluggable(int cpu)
>  {
> -	struct cpu *c = &per_cpu(cpu_devices, cpu);
> -
> -	c->hotpluggable = cpu_has_hotplug(cpu);
> -	return register_cpu(c, cpu);
> +	return cpu_has_hotplug(cpu);
>  }
>
>  void free_initmem(void)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
