Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 454737E9622
	for <lists+linux-parisc@lfdr.de>; Mon, 13 Nov 2023 05:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbjKMEXK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 Nov 2023 23:23:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233131AbjKMEXD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 Nov 2023 23:23:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78637173E
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 20:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699849332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XF3NQ57kyjxk1hcvqu+Pq8JhkrYu8jIWva1UTHj4B8I=;
        b=LeeHkZhjOw9rGBkKeffpqGS938JOnOYzsnYlS/4gFJL8N9/YsUrDmWTZsTrVjCa5tSCazE
        O4xw6fWgbpeP/LB/wwIl3PQJO8ubE95q+2ZPYBemBctfen3v1fWLuWbIWScnEJwTbYZXnW
        0RQHY6emzjj0cQi2JfOo5uBUeacESxI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-HPJ_IsnXMo69PW34fk13Hg-1; Sun, 12 Nov 2023 23:22:11 -0500
X-MC-Unique: HPJ_IsnXMo69PW34fk13Hg-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3b2e0f24de0so4619023b6e.0
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 20:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699849330; x=1700454130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XF3NQ57kyjxk1hcvqu+Pq8JhkrYu8jIWva1UTHj4B8I=;
        b=bg4VyHIJcp6ubaI22+sbQ512rUY29bKnNgWmZOe7tFqCz1Ds0FUSrDwTTWzJxBNUi7
         AJhANRQ6nhtiZKaqRYs8RCBoGExpOJQiPmV+TjbP3QLah4MxxErCqUfjHDf9dOJxEGat
         3OVqYo3pPNVsnVx1MEzv8ZRfi3szwxnszYbjL1qXV+/fkGbV++hgpOov4zeJLXdlOtM1
         pMB1WP4b1lvDPfIA0Po3juVUXwlNBRhbq5Q/ewJA4HqKEg4qDFNLTdt7xiAp4vN0W9Pp
         XrlZ7sI1xU2MSOYyq0AaTpDPm9CWVzVwHALEa9uj3m5jd6pJFbcheVa9v0ndQU8aBtAx
         UEtg==
X-Gm-Message-State: AOJu0YwPcIGaZgpJnXMchq23SdiO+To3q9jACz7Oc3ILfq3x8I6HnTnp
        a5EU7gtyfh5BdhZXrPG6w8CRZAWndbNz/2dqH4taHWldLAo5UZFWxPHHPrtEOKKPhlqPIEzcTqK
        UOVYQQHZKkhad9OxOJeGb7bCX
X-Received: by 2002:a05:6808:3c8a:b0:3af:e556:4602 with SMTP id gs10-20020a0568083c8a00b003afe5564602mr8733116oib.11.1699849330587;
        Sun, 12 Nov 2023 20:22:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXY595uxruxGZ6Ui5zU3loMnBcIT42OgsioZr0yKGr5XKhKsixYTlwKjcTTf2f20K0od7lOA==
X-Received: by 2002:a05:6808:3c8a:b0:3af:e556:4602 with SMTP id gs10-20020a0568083c8a00b003afe5564602mr8733096oib.11.1699849330328;
        Sun, 12 Nov 2023 20:22:10 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id fm6-20020a056a002f8600b006c4db182074sm3111661pfb.196.2023.11.12.20.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:22:09 -0800 (PST)
Message-ID: <191a356f-a9cd-4510-9676-dc28026088be@redhat.com>
Date:   Mon, 13 Nov 2023 14:22:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 20/22] LoongArch: convert to use
 arch_cpu_is_hotpluggable()
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
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JML-00CTyV-9a@rmk-PC.armlinux.org.uk>
From:   Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JML-00CTyV-9a@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/7/23 20:31, Russell King (Oracle) wrote:
> Convert loongarch to use the arch_cpu_is_hotpluggable() helper rather
> than arch_register_cpu(). Also remove the export as nothing should be
> using arch_register_cpu() outside of the core kernel/acpi code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   arch/loongarch/kernel/topology.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

