Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D4B7E9600
	for <lists+linux-parisc@lfdr.de>; Mon, 13 Nov 2023 05:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbjKMEOB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 Nov 2023 23:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbjKMEN7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 Nov 2023 23:13:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004911729
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 20:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699848795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OYixRZav3C3iBpUpIpT8jXDG1/jkmr5ugIcaaWqfvjU=;
        b=OZL+WGrbv969y30HAdb6ZGh2Spj2zw7VPcYnuDt+GtZSosvui9Wukg+zhlNL6J/+FTdzUA
        L+plwWv734GyM+m5HWbmb9/izkNiN8QUKcAZbq9vU+LG4E4YVcYr0enVwKsBxRosTErF2v
        CmeA65Mjm9R51/eG3EB5U1oi1i1PfN4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-UagCFVMUMFW6xwbHAs5ztA-1; Sun, 12 Nov 2023 23:13:13 -0500
X-MC-Unique: UagCFVMUMFW6xwbHAs5ztA-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1cc237c79f1so38789385ad.2
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 20:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848793; x=1700453593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYixRZav3C3iBpUpIpT8jXDG1/jkmr5ugIcaaWqfvjU=;
        b=oCdk75w/ZuTYEyzxCz5lLIUTVf0cqRGv21K5iHU6eDU+XlKWUKD4Py0VbM8brandNs
         xg29tXb1JyD+RZZR3yjvlu+63p7GLR3IPx1ApKy443IcYn8vCuutQAtxf4s+gTK00Ib+
         qe+LYDUrZLhbeq+DcTjSyPTWCuMOalupzS2JmgE/tRMJxuvPwG6+RjdLWuIe08i4tHir
         0y79pGbHgEPMXoO/haedmyjwKVkTXplyddKYAI5f5KE803GnwY0jdO/ocSiCzuwLkENu
         pAY1y/3Fr0niBZKvBEBUDKl+DEIRkZJs8IbZ9gI/JlGwFUQQNXRky8godrKFbQ916JAp
         oKSQ==
X-Gm-Message-State: AOJu0Yz8gRCLP7pXMVlREPsJlzLahscPrQQ/Xz+81tdFICxVquMmvCfT
        jXW3e8oFyzSUDUor+VV4jOoNQtGLwk2uq8DJk+PnmxK84yv7zKEkxGlZctqEk275SYaOxRFtigA
        WJZU+OS/6/7+OcsTt3KIBXTPc
X-Received: by 2002:a17:903:41cd:b0:1cc:6fa6:ab62 with SMTP id u13-20020a17090341cd00b001cc6fa6ab62mr4016475ple.29.1699848792649;
        Sun, 12 Nov 2023 20:13:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeVOFMA0QCBZizKA9tBYcgAmzTI5mhR1cqxGbQYoi32/jpLTsg/y/gXt+4vuBSLdXi2pW82A==
X-Received: by 2002:a17:903:41cd:b0:1cc:6fa6:ab62 with SMTP id u13-20020a17090341cd00b001cc6fa6ab62mr4016447ple.29.1699848792330;
        Sun, 12 Nov 2023 20:13:12 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001cc41059a11sm3227272pli.196.2023.11.12.20.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:13:12 -0800 (PST)
Message-ID: <9890d7b5-a51b-4556-bd20-96b617e6b880@redhat.com>
Date:   Mon, 13 Nov 2023 14:13:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/22] x86/topology: Switch over to
 GENERIC_CPU_DEVICES
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
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLv-00CTy1-Gq@rmk-PC.armlinux.org.uk>
From:   Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLv-00CTy1-Gq@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/7/23 20:30, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Now that GENERIC_CPU_DEVICES calls arch_register_cpu(), which can be
> overridden by the arch code, switch over to this to allow common code
> to choose when the register_cpu() call is made.
> 
> x86's struct cpus come from struct x86_cpu, which has no other members
> or users. Remove this and use the version defined by common code.
> 
> This is an intermediate step to the logic being moved to drivers/acpi,
> where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.
> 
> This patch also has the effect of moving the registration of CPUs from
> subsys to driver core initialisation, prior to any initcalls running.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ----
> Changes since RFC:
>   * Fixed the second copy of arch_register_cpu() used for non-hotplug
> Changes since RFC v2:
>   * Remove duplicate of the weak generic arch_register_cpu(), spotted
>     by Jonathan Cameron. Add note about initialisation order change.
> Changes since RFC v3:
>   * Adapt to removal of EXPORT_SYMBOL()s
> ---
>   arch/x86/Kconfig           |  1 +
>   arch/x86/include/asm/cpu.h |  4 ----
>   arch/x86/kernel/topology.c | 27 ++++-----------------------
>   3 files changed, 5 insertions(+), 27 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

