Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D060E445789
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 17:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbhKDQxE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 12:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbhKDQxD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 12:53:03 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF82C061208
        for <linux-parisc@vger.kernel.org>; Thu,  4 Nov 2021 09:50:24 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id n13-20020a9d710d000000b005558709b70fso9086610otj.10
        for <linux-parisc@vger.kernel.org>; Thu, 04 Nov 2021 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=acYCFUtOaKDyAmhfNB97ZKxpxsJ33IdQAK3rNz9XuO0=;
        b=Bdf2PH4fdVcSpWwVWTplYE5D9A/qEKlGnBZFoFRoWif+EzYT4C8v2UoUcaaYiCRpQv
         Ea9bvEtI8iF2+Yt05HYxCWcbQI8pmjG2U58GjofonbCBq6HhPWEbMEc9jkGFovzsU+bW
         BHPS9g43IInWULEhG5WIHhetGgbvQHd1P7o2/IgEmznujY7j8GUn2OUU9E/nSVpbN9aQ
         zDCVoXDWG5M48Y7hz1X3cNq4YaG4DDsNQnp0Qsqll9rmVEVKFQZX5oQ4lUNkbz1t7ugf
         ESTgVWEyz6KVpAyTFxI5k/wRVe/8E2k6pkK6NU980JVzfunDz+M1PNXljEqwA13haS7f
         u2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=acYCFUtOaKDyAmhfNB97ZKxpxsJ33IdQAK3rNz9XuO0=;
        b=G6c01meowsnb/+515jsr43du4/2FVOW3eo9LeK1FPE1A7aQ5VvAOi+DCKtvmNuBQnk
         eGNvbbaolpMcaTzVPKzymyVhOt3JlqIdSPtbNlqa+CD3lL+appFZfJBmIG+AvYQpPrn1
         rcVgYxqA9hGaWfXC/ywgIE6sx0JZ0VVLMdH1smCc3BmbA8/GrVSv8QusgWr50XedzJyi
         tzmm3jCLqgl313EfztU3qceN7RzxvymuX4ArFEl8eOo26H1wPdIQFaUH1Ixo0yIzV6/t
         AY1YE+VHo6KaX27833htBE1Ravvtv5HoxJKGoP8jVOfAS7I+D7ybhSVUY5SShR9oqfpu
         cVpQ==
X-Gm-Message-State: AOAM5300Q77i+mQQ9H7mhpY1f28TwIVmpmxDNfJaiUBULicMb/lxwAbS
        zCFFuhHp4u0xQSuJPU8ixks=
X-Google-Smtp-Source: ABdhPJw+sYOPHJfhuT14nuxF83j+SL62Ft3Mdpzqz+4ceza6qJrAl/8uTpSX5NKBjdhl0xY4JnMiig==
X-Received: by 2002:a9d:5888:: with SMTP id x8mr9650740otg.277.1636044623757;
        Thu, 04 Nov 2021 09:50:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g15sm1634837oiy.8.2021.11.04.09.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 09:50:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 4 Nov 2021 09:50:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: parisc: move CPU field back into thread_info
Message-ID: <20211104165021.GA2791004@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Nov 04, 2021 at 09:26:28AM +0100, Ard Biesheuvel wrote:
> In commit 2214c0e77259 ("parisc: Move thread_info into task struct")
> PA-RISC gained support for THREAD_INFO_IN_TASK while changes were
> already underway to keep the CPU field in thread_info rather than move
> it into task_struct when THREAD_INFO_IN_TASK is enabled. The result is a
> broken build for all PA-RISC configs that enable SMP.
> 
> So let's partially revert that commit, and get rid of the ugly hack to
> get at the offset of task_struct::cpu without having to include
> linux/sched.h, and put the CPU field back where it was before.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: bcf9033e5449 ("sched: move CPU field back into thread_info if THREAD_INFO_IN_TASK=y")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Helge Deller <deller@gmx.de>

FWIW:

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
