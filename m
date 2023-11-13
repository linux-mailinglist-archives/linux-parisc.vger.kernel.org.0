Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 863FA7E93B0
	for <lists+linux-parisc@lfdr.de>; Mon, 13 Nov 2023 01:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjKMAqI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 Nov 2023 19:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbjKMAqH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 Nov 2023 19:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18CB1BDA
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 16:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699836319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AIBcuinF5ss2DgGVnkjihkWjegSjrF5pOFgfBoAd6NQ=;
        b=WIy5zAvInhpPvNYpp5Nk+NgvUBFL6o3h3mA/MeAzwJLp2ZusOLVDuIpjpm3A+K8LNFh8Qb
        3GTLMn1QQ2kpWvLcQ6YeMZKIwME4xlEomluMu0LJN+E4xfFtJA5v3nXCPq+wonLx5NY/HR
        FkMTntMTVw0oJuP4VblDhLWx7UUMPHQ=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-E1Q90v5SOWGT9sGZnOPs3w-1; Sun, 12 Nov 2023 19:45:15 -0500
X-MC-Unique: E1Q90v5SOWGT9sGZnOPs3w-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1eb43ff49b2so3642377fac.2
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 16:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699836315; x=1700441115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIBcuinF5ss2DgGVnkjihkWjegSjrF5pOFgfBoAd6NQ=;
        b=DhxQyvjTnlO1mdmfN/R2NBgVysGxYQMrPHZ042OEYIiqokBZAGZSkttAhZzN/BpAZo
         JR+VfQyPbn4cpc4+cWTYwccKiXph64GBnrsO8hRsq6+z67XgApIfLe1fRK6wYapjg1oR
         P1MSvDf3AHKw28j6b8MzN2JetjHjjZONQy+B/Qyh1xaLIcvNsUJ7F84AVznMcu0gpjmY
         BI9y0Kpg7BhKnCpCcWJxhTIgfNIwmrHt0hTQTZrC8gv4wEgHyhYJvkFf8BoEfJgH70ZK
         ANExFyEEsA0z7ekz1th+FFs4uFqsSPy53OgMuflk/3mrOYbivtR7FkL9H94atwzN60ch
         fsjA==
X-Gm-Message-State: AOJu0YwtQBsYMQ4SyNWgcakbWnTfBXC6CdZ3gWf3rPWAHmdvIp7Ks97v
        IhxlIqejg77Mxcz+TExxwWHEtEzAU8ayI6hCgIqogryYpLPIrfjhJ8yijt1tB73q3u1hhiZNHNL
        7Nvmyi+m745yZymmZeCVjv422
X-Received: by 2002:a05:6870:f14d:b0:1d5:b2ba:bc93 with SMTP id l13-20020a056870f14d00b001d5b2babc93mr7060133oac.13.1699836315190;
        Sun, 12 Nov 2023 16:45:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9rLDeDKmdt9jI4rfj9b9OvZLsFOMuiJgoFwWcjW46CaFvA839DNqkdgqlkT2G64l2xzZLdg==
X-Received: by 2002:a05:6870:f14d:b0:1d5:b2ba:bc93 with SMTP id l13-20020a056870f14d00b001d5b2babc93mr7060111oac.13.1699836314952;
        Sun, 12 Nov 2023 16:45:14 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id hq18-20020a056a00681200b006933822e7a6sm2957854pfb.66.2023.11.12.16.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:45:14 -0800 (PST)
Message-ID: <df5fb117-96e0-4231-85c6-70c960fbb6c4@redhat.com>
Date:   Mon, 13 Nov 2023 10:45:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/22] drivers: base: Implement weak
 arch_unregister_cpu()
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
From:   Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


On 11/7/23 20:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Add arch_unregister_cpu() to allow the ACPI machinery to call
> unregister_cpu(). This is enough for arm64, riscv and loongarch, but
> needs to be overridden by x86 and ia64 who need to do more work.
> 
> CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>   * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
> Changes since RFC v2:
>   * Move earlier in the series
> ---
>   drivers/base/cpu.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

