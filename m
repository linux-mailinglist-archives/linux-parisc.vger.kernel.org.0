Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535C22CA70
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 17:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfE1PlL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 11:41:11 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:44929 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfE1PlL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 11:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=QuVDOPn+ccI22JZFXkKkeOF7aLTHXCpxj1ARTF1u8FU=; b=UlIAtzfRblCDZT4qH3mGsfV8th
        fDjN5/L9V30gVVSY9jI5mF9BXZRg/zcDYRPTwR28ZMNdRtEbGP88iyYKZpEPYh5zAINE5PrrOlz2C
        k9Yrr4e9dXheEp04FNffNX8NhZIZUowNKj5EFz/N2XAxk5odWrC2BymZJ6AVNLmrhY5c=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hVeDs-0003Su-M9; Tue, 28 May 2019 17:41:08 +0200
Date:   Tue, 28 May 2019 17:41:07 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc-owner@vger.kernel.org
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <20190528154107.GC16860@t470p.stackframe.org>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
 <20190527201538.GD29337@t470p.stackframe.org>
 <20190528110627.GA16860@t470p.stackframe.org>
 <8250bd3cf4a0bf32ff3ecb21dd81eca6@sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8250bd3cf4a0bf32ff3ecb21dd81eca6@sf-tec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Tue, May 28, 2019 at 01:28:12PM +0200, Rolf Eike Beer wrote:
> > FWIW, i hacked up a small driver to read the firmware, i'm attaching it
> > to this
> > Mail. Would be nice if some people could try reading the firmware from
> > their PA-RISC
> > system so we can collect and archive them. Note that it HPMC's in 32 Bit
> > Mode,
> > but it worked in 64 Bit mode on my C3750/J5000.
> 
> Nice!
> [..]
> Any particular reason you are not simply using BIN_ATTR_RO?

The reason is just my missing experience with Kernel APIs. If anyone says such
a driver is helpful in the upstream kernel, we could clean it up. But for now
i just wanted to get the contents of the flash, no matter how nice the code is

:-)

Regards
Sven
