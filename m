Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 831F729650
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 12:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390512AbfEXKuF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 06:50:05 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:51440 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389448AbfEXKuF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 06:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:To:From:Date;
        bh=BudMoQWWqXKiBC+IvYq0p8uR7KUP8oiYXHmSs9pCV0M=; b=a3WDoEPlu5+yiVHQBLBnVaXJmK
        pem5189+HSrSPmHYsZevPId4bm0X7rYwLe9SjQPzUXKle8fbQLcunarjV0gobl4sPtyUvUbB7MZ92
        3Jc10ZojXYx7C6vbOsPgZObVJTcTWXFrvauSaI1GWFi4BBZ4Alt7nI283uSDbnQtfGrE=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hU7m0-0002Mw-Gg
        for linux-parisc@vger.kernel.org; Fri, 24 May 2019 12:50:04 +0200
Date:   Fri, 24 May 2019 12:50:03 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: PCI HPMC on C240 with alternatives Patching
Message-ID: <20190524105003.GE9450@t470p.stackframe.org>
References: <20190524065850.GA9849@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524065850.GA9849@t470p.stackframe.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, May 24, 2019 at 08:58:50AM +0200, Sven Schnelle wrote:
> Hi List,
> 
> i recently got my hands on an old C240. I see a Kernel oops pretty early when
> alternatives patching is enabled:
> [..]
> My (wild) guess is that we're patching away some memory barrier or cache flush
> so the SCRIPTS engine in the SCSI controller starts executing garbage and triggers
> a PCI bus read/write to an invalid address. The reason the INB() is given as the
> HPMC location is likely caused by the delay between writing DSPS and the chip actually
> starting to fetch insn/data.
> 
> Does that ring any bell for someone on the list? Otherwise i can check the
> alternatives patching over the weekend, i think there are not that many locations.
> 
> The good thing is it's reproducible - it always crashes. Either in SCSI or in
> Tulip.

Did a quick test, removing ALT_COND_N_IOC_FDC from asm_io_fdc() seems to fix this
issue. Haven't looked in more detail into this though.

index 73ca89a47f49..d83b1adf2f3f 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -52,7 +52,6 @@ void parisc_setup_cache_timing(void);

 #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
                        ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
-                       ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) \
                        : : "r" (addr) : "memory")
 #define asm_io_sync()  asm volatile("sync" \
                        ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \


Sven
