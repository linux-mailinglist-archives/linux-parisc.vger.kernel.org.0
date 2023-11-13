Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446057E93D5
	for <lists+linux-parisc@lfdr.de>; Mon, 13 Nov 2023 01:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjKMA7p (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 Nov 2023 19:59:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbjKMA7p (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 Nov 2023 19:59:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE571BDA
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 16:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699837137;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cDT/Yw6MepTUY5berRyzp+iGTh5/71yTqnFQ/kYgufg=;
        b=F2nQ34+LtuVNAzyHYMhY7XKF8bKgDNlg2lTV3kPzOyfNVqMTnoyZycOp3/kc191s/cPkOT
        X9y36lz/hegBsN5yN0+KnUJa1Wh3z27wNu1V7y1dhKJHdpVpaZ/Uzz59iae17ivmd+/piC
        IaPEuDzPSDJOa3dvZmFTGJa+XSk1Ruo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-YMENibyhMpO_0cvJP3N8Kw-1; Sun, 12 Nov 2023 19:58:56 -0500
X-MC-Unique: YMENibyhMpO_0cvJP3N8Kw-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1cc385e90e2so37724915ad.3
        for <linux-parisc@vger.kernel.org>; Sun, 12 Nov 2023 16:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699837135; x=1700441935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDT/Yw6MepTUY5berRyzp+iGTh5/71yTqnFQ/kYgufg=;
        b=VSXbusAmXW7O71sRoif1VyGB7LznXMnSeg29R9h0c0iunWMmz1FsBlIHiseLXX1iX5
         dYWvw19pTOeZjVTjnK8a2p4sBzgpl5ehrewbSznPXuNPwCkMID90EBYkLmItc9hqvHQs
         x7Q74Mf+ZUC71QaDi6cHCXkoGhXUqZ28Y7zER/hCuzjYnFjWHB0oWOVW+nbbubD/7rHl
         HGNQ1dnmiFI/3olGGm9SXo3P+jqUP219Tq9gARKoq1LMLLkBoBDIPCC7Uj9O9SN2bObL
         XDCUh0/nCKXW2efM5HGiol+eN80IMTOc8T3XkbBBBcqKVHV5kIHIv8LiFppXfzeBMAE6
         JcjA==
X-Gm-Message-State: AOJu0YxEH9yo5ftcxVlWp0vdh+sKtEPrPrcDuTLV3RlyQjg4ZKxu+yC1
        jrohltOvHkfrCRroMzae09JjBeDsPcBcK8oW1UqSoObQQeHExiFkpwFCQLPiZqe1sKFYJ3KzDx7
        jyWU8PR8c3l3M6Hec9ocYn6yy
X-Received: by 2002:a17:903:18a:b0:1c5:d063:b70e with SMTP id z10-20020a170903018a00b001c5d063b70emr3527476plg.53.1699837134998;
        Sun, 12 Nov 2023 16:58:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYIxs5W0nH5PRlEPeC7HszJcExOhwxIk5eQviHGK0uTrxM/8D+SW3tGS+WkqqASqjIUf7rPA==
X-Received: by 2002:a17:903:18a:b0:1c5:d063:b70e with SMTP id z10-20020a170903018a00b001c5d063b70emr3527451plg.53.1699837134747;
        Sun, 12 Nov 2023 16:58:54 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b001c5fc291ef9sm3053276plg.209.2023.11.12.16.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:58:54 -0800 (PST)
Message-ID: <095c2d24-735b-4ce2-ba2e-9ec2164f2237@redhat.com>
Date:   Mon, 13 Nov 2023 10:58:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/22] drivers: base: Move cpu_dev_init() after
 node_dev_init()
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
        "Rafael J. Wysocki" <rafael@kernel.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLV-00CTxS-QB@rmk-PC.armlinux.org.uk>
From:   Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLV-00CTxS-QB@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On 11/7/23 20:30, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> NUMA systems require the node descriptions to be ready before CPUs are
> registered. This is so that the node symlinks can be created in sysfs.
> 
> Currently no NUMA platform uses GENERIC_CPU_DEVICES, meaning that CPUs
> are registered by arch code, instead of cpu_dev_init().
> 
> Move cpu_dev_init() after node_dev_init() so that NUMA architectures
> can use GENERIC_CPU_DEVICES.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Note: Jonathan's comment still needs addressing - see
>    https://lore.kernel.org/r/20230914121612.00006ac7@Huawei.com
> ---
>   drivers/base/init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

With Jonathan's comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

