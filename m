Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDBE295051
	for <lists+linux-parisc@lfdr.de>; Wed, 21 Oct 2020 18:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444334AbgJUQBM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 21 Oct 2020 12:01:12 -0400
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:52952 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2444332AbgJUQBL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Oct 2020 12:01:11 -0400
X-Greylist: delayed 495 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Oct 2020 12:01:11 EDT
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 4A5151280DEB;
        Wed, 21 Oct 2020 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1603295576;
        bh=ERK2zt1ck0JMH5JxL/7yghYp05N10MYeCzxT3oU8988=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=KY1jU9AU6ek5RYDkmLaJVblXQnyWHIz0uMR9+3EaPEl5H93F81b3FP3lBncjzQYeP
         tz20JaRs2QCK+wBWX4stI5Zv7J0XjvE26ouq+ofhn0JS2ry+ZTTnpweNOi1YIWvaD1
         1Q6FyPDU9SS+U5RlX645TL279Sn2JaduBcFf0U2s=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id d4OJ0A3t9hYU; Wed, 21 Oct 2020 08:52:56 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 0097B1280DE9;
        Wed, 21 Oct 2020 08:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1603295576;
        bh=ERK2zt1ck0JMH5JxL/7yghYp05N10MYeCzxT3oU8988=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=KY1jU9AU6ek5RYDkmLaJVblXQnyWHIz0uMR9+3EaPEl5H93F81b3FP3lBncjzQYeP
         tz20JaRs2QCK+wBWX4stI5Zv7J0XjvE26ouq+ofhn0JS2ry+ZTTnpweNOi1YIWvaD1
         1Q6FyPDU9SS+U5RlX645TL279Sn2JaduBcFf0U2s=
Message-ID: <37ee0636688c782a59e8b50eae5c41b96926e7ab.camel@HansenPartnership.com>
Subject: Re: Kernel 5.8 and 5.9 fail to boot on C8000
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Date:   Wed, 21 Oct 2020 08:52:55 -0700
In-Reply-To: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
References: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 2020-10-20 at 15:45 +0200, Helge Deller wrote:
> Latest Linux kernels v5.8 and v5.9 fail to boot for me on the C8000
> machines with this error:
>  mptspi: probe of 0000:40:01.0 failed with error -12
>  mptbase: ioc1: ERROR - Insufficient memory to add adapter!
>  mptspi: probe of 0000:40:01.1 failed with error -12

I think you've already figured out that this is an allocation issue. 
However, it does seem fishy, the code is

	ioc = kzalloc(sizeof(MPT_ADAPTER), GFP_KERNEL);
	if (ioc == NULL) {
		printk(KERN_ERR MYNAM ": ERROR - Insufficient memory to
add adapter!\n");
		return -ENOMEM;
	}

And MPT_ADAPTER should be just under a page which looks like a very odd
allocation to fail so early in boot.  The memory subsystem should have
also printed out a trace explaining why it failed the allocation.

James


