Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 518824F0680
	for <lists+linux-parisc@lfdr.de>; Sat,  2 Apr 2022 23:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345801AbiDBVvP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 2 Apr 2022 17:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbiDBVvJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 2 Apr 2022 17:51:09 -0400
X-Greylist: delayed 1373 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 02 Apr 2022 14:49:13 PDT
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com [192.185.50.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA7E10FE0
        for <linux-parisc@vger.kernel.org>; Sat,  2 Apr 2022 14:49:13 -0700 (PDT)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 06C568B09
        for <linux-parisc@vger.kernel.org>; Sat,  2 Apr 2022 16:26:20 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id alGFn6v1CRnrralGFnC92t; Sat, 02 Apr 2022 16:26:20 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
        To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZTJVrtV2bPXKy9Lv7uyAs51lcVNOxCIk+2W6Trzht7E=; b=WqZ8e4S3Fh9yn0nmh83rN6V2/s
        o/0heQE3chxvQNFEZaLA/MpoMK8x3K0dF71raaIHHz5BsO6lzaDVPO97MtLWHYqnMF+iKz5grfKuz
        QD9tLvCGkwcHWfZw7zFRYsn/KNt8XtlVOo6UWTLxFzo98SWlYbMMaeMLOCKQDpnK2ZVwOIWbKI3EB
        xxGnWDzvrtDAobSIyacxX4F28df57XtEmF3XaDjCnEqfNWLQMfierEWYnB40cIF+Qw2dwQeFg4jcC
        dLESzKqQHmBhKEESphkGsR7fQo932chg6yuFEXObiPzItExfxcZwMKGcbUQxrGfy7qKet/KKbiYtb
        +8aUiD8Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57808 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nalGF-00128S-Kq; Sat, 02 Apr 2022 21:26:19 +0000
Date:   Sat, 2 Apr 2022 14:26:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Re-enable GENERIC_CPU_DEVICES for !SMP
Message-ID: <20220402212618.GA3962081@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nalGF-00128S-Kq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57808
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Apr 01, 2022 at 10:31:14PM +0200, Helge Deller wrote:
> In commit 62773112acc5 ("parisc: Switch from GENERIC_CPU_DEVICES to
> GENERIC_ARCH_TOPOLOGY") GENERIC_CPU_DEVICES was unconditionally turned
> off, but this triggers a warning in topology_add_dev(). Turning it back
> on for the !SMP case avoids this warning.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 62773112acc5 ("parisc: Switch from GENERIC_CPU_DEVICES to GENERIC_ARCH_TOPOLOGY")
> Signed-off-by: Helge Deller <deller@gmx.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  arch/parisc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 52e550b45692..bd22578859d0 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -38,6 +38,7 @@ config PARISC
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select GENERIC_SMP_IDLE_THREAD
>  	select GENERIC_ARCH_TOPOLOGY if SMP
> +	select GENERIC_CPU_DEVICES if !SMP
>  	select GENERIC_LIB_DEVMEM_IS_ALLOWED
>  	select SYSCTL_ARCH_UNALIGN_ALLOW
>  	select SYSCTL_EXCEPTION_TRACE
> --
> 2.35.1
> 
