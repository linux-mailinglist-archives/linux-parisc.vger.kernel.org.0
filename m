Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B402CA69
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 17:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfE1PiT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 11:38:19 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:54105 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfE1PiT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 11:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=aj41GBKgCOS9gvEcpJdqyOBWSluKRmiVflSgRPf0dEg=; b=M2aMphIcWKmiAFsUsqa+pUWEvg
        PJq0UjsxLbbsVJ/GFKtpAFv4/j9e68gm42CW2l6n8Q4nkzouNSMqM0Tcg3V/oDZa3Pjw1hqJQ35xv
        /iS26+Qf7onTlfYvd8cFNy/xkUAegMlxDsKL4DXYCEgZz9FYTb9hELmll5iwtCcUss7U=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hVeB6-0003P6-Hc; Tue, 28 May 2019 17:38:16 +0200
Date:   Tue, 28 May 2019 17:38:15 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <20190528153815.GB16860@t470p.stackframe.org>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
 <20190527201538.GD29337@t470p.stackframe.org>
 <20190528110627.GA16860@t470p.stackframe.org>
 <e81b7ae4-3126-5fda-58e4-4a83bd4fcfcf@bell.net>
 <3396728e-622c-eb88-dbf6-bb577e045600@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3396728e-622c-eb88-dbf6-bb577e045600@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Tue, May 28, 2019 at 05:11:36PM +0200, Helge Deller wrote:
> >
> > My c3750 prints "Firmware 2.0" and NP is set, but it might also be 3.1?
> >
> > [    0.000000] Initialized PDC Console for debugging.
> > [    0.000000] Determining PDC firmware type: System Map.
> > [    0.000000] model 00005dc0 00000481 00000000 00000002 77e45e84 100000f0 00000008 000000b2 000000b2
> > [    0.000000] vers  00000301
> > [    0.000000] CPUID vers 19 rev 11 (0x0000026b)
> > [    0.000000] capabilities 0x7
> 
> Same as Dave: My C3700 prints "Firmware 2.0" and NP is set, but it might also be 3.1?
> [    0.000000] model 00005dc0 00000481 00000000 00000002 777c3e84 100000f0 00000008 000000b2 000000b2
> [    0.000000] vers  00000301
> [    0.000000] CPUID vers 19 rev 11 (0x0000026b)
> [    0.000000] capabilities 0x7
> [    0.000000] model 9000/785/C3700
> 

Interesting. Now that you mention it i see that my C3750 reports the same. Google
returned the following page https://support.hpe.com/hpsc/swd/public/detail?swItemId=PF_CCJ70020

Which is 2.0, and only mentions "C3650/C3700/C3750/J6700/J6750 firmware" So maybe
these machines have NP set, and machines "below" (like C3600) don't have it set.

I wonder what happens if you try to flash a 5.0 firmware to such a box.

BTW, i figured out that register 0xf05f1038 bit 0 seems to be the FLASH write
enable. So it's basically just a matter of writing some code to send correct
commands to the flash chip, and being crazy enough to actually erase and reprogram
the flash.

I'm not sure whether that would actually be of help if we know that the NP bit goes
away with a 5.0 firmware on a C3750.

Regards
Sven

