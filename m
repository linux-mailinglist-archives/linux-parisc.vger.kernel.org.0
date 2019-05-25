Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9452D2A715
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 22:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbfEYU4k (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 16:56:40 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:32842 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfEYU4k (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 16:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=R6+AHZajOmwhYlF14AyaYGeXbAAbtRfV94ykIUg2fMs=; b=hlaSdO9lAKqPly0011L8sGc3tK
        e+F15BJVgv4qIJO7WHtdHbgBKqxL2ldAToFF1CeScm+J4JCV9DFL1WgsMyD47U1zmJK5qVcH/JyOl
        NCq1chypHUxDekCS868yZpbirEW0RZF9dlRyKgSKqldChXOJrV/ewAHyXnlLsoUHdbuI=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hUdiX-0002Ld-LB; Sat, 25 May 2019 22:56:37 +0200
Date:   Sat, 25 May 2019 22:56:36 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Grant Grundler <grantgrundler@gmail.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: HPPA problems with the PCI
Message-ID: <20190525205636.GA1969@t470p.stackframe.org>
References: <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
 <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net>
 <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
 <CA+QBN9Dg16azb3kLZ4pPi+G5h46C628dWZRdXJmrmxOZZvLn9Q@mail.gmail.com>
 <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org>
 <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, May 25, 2019 at 11:01:27AM +0200, Carlo Pisani wrote:
> on  kernel 5.1, from the git repository, compiled with SMP
> 
> dmesg | grep altern
> [    2.551002] alternatives: applied 156 out of 175 patches
> 
> this patch has made my day!
> It seems the solution for the problem!
> 
> the card is still working after 10 hours of burn-in test!
> 
> --- a/arch/parisc/include/asm/cache.h
> +++ b/arch/parisc/include/asm/cache.h
> @@ -52,7 +52,6 @@ void parisc_setup_cache_timing(void);
> 
>  #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
>                         ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
> -                       ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) \
>                         : : "r" (addr) : "memory")
>  #define asm_io_sync()  asm volatile("sync" \
>                         ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \

Just for clarification: This change was never meant to be a real fix - it
was just a change i made to figure out which alternative patch breaks things
on my C240.

Sven
