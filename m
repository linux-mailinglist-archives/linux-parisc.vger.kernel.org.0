Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD447E95D6
	for <lists+linux-parisc@lfdr.de>; Mon, 13 Nov 2023 05:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbjKMEFA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 Nov 2023 23:05:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbjKMEE6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 Nov 2023 23:04:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0578F1729
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 20:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699848246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MtNFooCff3vqCOUxCEz1jHRl+QbfPpBEZibpqDAaoCg=;
        b=DwKRNRZa+xVhO5aifoyoc0a6t/eISpLe5wUxbtFP4LcrQqkzayJZKHmdeTdL06ylZVhTgB
        K57bezKSZiCH92HkQd0Gr7QunNEs2Km3Mm1hsoDZtCQm1iuCezkPgP5NwqTxOVa4TUw/wV
        Nsgkfcwkgv5XgudM9ViwrFs7N0jgDes=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-ne4FuJvRPVWW8eSVzHsGvQ-1; Sun, 12 Nov 2023 23:04:04 -0500
X-MC-Unique: ne4FuJvRPVWW8eSVzHsGvQ-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1cc5c4972bdso54517145ad.1
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 20:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848243; x=1700453043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtNFooCff3vqCOUxCEz1jHRl+QbfPpBEZibpqDAaoCg=;
        b=m3uggzRseigbUanTdRpDg/U5OIpc/S71FQtJKTkT5/omrWGGsrZpb5zGXkRuh4JMVW
         6jZgM5oldoE/lJ+MmQjoxVwc4RiwIsIW/vvAoqStYNSxZ5NQavYwW8qcozGccT5hUP4F
         58vHWAAuHopMzVIlAy1dl+oEEYMmILleGq1wKRybeqSe03HDfr501hbRudGXjqFx8pxK
         i/ljgVyM4FpaQcDfPQ/OKGir/oMcDULB37F8SNXZ3WyKNsev3jOqR4MP3xQywjJfUxb+
         xWbVk/wwZc14Q1gk/CPxKixd+RvjEFqR3YeBefRkGCec37q0SYMsLVU037Ba7A6+HHhb
         WozQ==
X-Gm-Message-State: AOJu0YxzTAYf284vEg+01kjPmftkp4ULRhcrgY3I8+K82RwEb4EYNwu6
        OP8K2unbZnEwmoJ1+zTTJ17i5kA6oIjmRGEsFj1ASQLCZL51C/1bwJg+B6JuGMt/JNSIEhzz83t
        /PJIMZUBPVImkZ3uFgqw1ukiU
X-Received: by 2002:a17:903:124b:b0:1cc:3f10:4175 with SMTP id u11-20020a170903124b00b001cc3f104175mr7395311plh.28.1699848243623;
        Sun, 12 Nov 2023 20:04:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIUBgi1/lc4Y3idUGi3EHadW6QYxPGSgwR1L+ZBVEJt2K4HesJHzLX8fXA3t0WRPADwpmGUg==
X-Received: by 2002:a17:903:124b:b0:1cc:3f10:4175 with SMTP id u11-20020a170903124b00b001cc3f104175mr7395280plh.28.1699848243280;
        Sun, 12 Nov 2023 20:04:03 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e5d200b001c62d63b817sm3216342plf.179.2023.11.12.20.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:04:02 -0800 (PST)
Message-ID: <c4a0af68-153e-41a8-ae82-8ebb2b4c4bc9@redhat.com>
Date:   Mon, 13 Nov 2023 14:03:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/22] drivers: base: Print a warning instead of
 panic() when register_cpu() fails
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
 <E1r0JLg-00CTxd-31@rmk-PC.armlinux.org.uk>
From:   Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLg-00CTxd-31@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/7/23 20:30, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> loongarch, mips, parisc, riscv and sh all print a warning if
> register_cpu() returns an error. Architectures that use
> GENERIC_CPU_DEVICES call panic() instead.
> 
> Errors in this path indicate something is wrong with the firmware
> description of the platform, but the kernel is able to keep running.
> 
> Downgrade this to a warning to make it easier to debug this issue.
> 
> This will allow architectures that switching over to GENERIC_CPU_DEVICES
> to drop their warning, but keep the existing behaviour.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

