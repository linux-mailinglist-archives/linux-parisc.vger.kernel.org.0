Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFBCB6FC240
	for <lists+linux-parisc@lfdr.de>; Tue,  9 May 2023 11:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbjEIJCh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 9 May 2023 05:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbjEIJCg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 May 2023 05:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9398F8A57
        for <linux-parisc@vger.kernel.org>; Tue,  9 May 2023 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683622908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Cm14icj1xcLZwuyrUAh+VMkzJdTwWmftCly76BVpCHQ=;
        b=NNiaF7CoOkE7DvWc/FUaVCtcfLMxhWk47OWdRAgIH9DH27HJsHWLL7CHJRuOMikiRMk8CD
        8+SfgFk5tLCLgZ8PQq7PcvFh29fkC2Y8/ZpfWLeyaGHcRd+rN5i9LqrOHilBdl+TBK4MJy
        M/0wYOv+mC7yfJp9EeBTP56s3hfD7Uc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-jYw41fAHM-2pUokrhyocWA-1; Tue, 09 May 2023 05:01:46 -0400
X-MC-Unique: jYw41fAHM-2pUokrhyocWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 525CC101A55C;
        Tue,  9 May 2023 09:01:46 +0000 (UTC)
Received: from localhost (ovpn-12-139.pek2.redhat.com [10.72.12.139])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ED4B40C2063;
        Tue,  9 May 2023 09:01:45 +0000 (UTC)
Date:   Tue, 9 May 2023 17:01:42 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Simon Horman <horms@kernel.org>
Cc:     "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        kexec@lists.infradead.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] parisc: kexec: include reboot.h
Message-ID: <ZFoL9ntYCCfZFCNs@bhe.users.ipa.redhat.com>
References: <20230508-parisc-kexec-include-reboot-v1-1-78a155a8a0a4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508-parisc-kexec-include-reboot-v1-1-78a155a8a0a4@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 05/09/23 at 09:01am, Simon Horman wrote:
> Include reboot.h in machine_kexec.c for declaration of
> machine_crash_shutdown and machine_shutdown.
> 
> gcc-12 with W=1 reports:
> 
>  arch/parisc/kernel/kexec.c:57:6: warning: no previous prototype for 'machine_crash_shutdown' [-Wmissing-prototypes]
>     57 | void machine_crash_shutdown(struct pt_regs *regs)
>        |      ^~~~~~~~~~~~~~~~~~~~~~
>  arch/parisc/kernel/kexec.c:61:6: warning: no previous prototype for 'machine_shutdown' [-Wmissing-prototypes]
>     61 | void machine_shutdown(void)
>        |      ^~~~~~~~~~~~~~~~
> 
> No functional changes intended.
> Compile tested only.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Acked-by: Baoquan He <bhe@redhat.com>

We may need to find out the places in all architectures and fix all of
them.

> ---
>  arch/parisc/kernel/kexec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/parisc/kernel/kexec.c b/arch/parisc/kernel/kexec.c
> index 5eb7f30edc1f..db57345a9daf 100644
> --- a/arch/parisc/kernel/kexec.c
> +++ b/arch/parisc/kernel/kexec.c
> @@ -4,6 +4,8 @@
>  #include <linux/console.h>
>  #include <linux/kexec.h>
>  #include <linux/delay.h>
> +#include <linux/reboot.h>
> +
>  #include <asm/cacheflush.h>
>  #include <asm/sections.h>
>  
> 

