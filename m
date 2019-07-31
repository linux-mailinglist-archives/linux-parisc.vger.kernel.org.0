Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB077CE11
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 22:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbfGaUTn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 16:19:43 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:46791 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfGaUTn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 16:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=5qN03oh6SvYV7Q2u2KtOX3cnV2HmIDhHC6byJkAGqJc=; b=dP4TOqiJFSUNWz0EXihC5WIqtR
        dDqv7Du6zm3Jq7tUENUtApABfTT4LBTeLyEwbMAdjOI1hYr+KwonQeUAT2fKsOS7GYnCKhGJu3DMJ
        RTfMHmB/uRmzLLWqER7uEtjiYc9c78sBLp6dTduRp+wtykIcmv5JH5PLW3/aTwMaBnbg=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hsv4Y-0001J3-AM; Wed, 31 Jul 2019 22:19:42 +0200
Date:   Wed, 31 Jul 2019 22:19:40 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: strip debug information when building compressed
 images
Message-ID: <20190731201940.GD23520@t470p.stackframe.org>
References: <20190731171923.24155-1-svens@stackframe.org>
 <20190731192835.GA14352@ls3530.fritz.box>
 <20190731193601.GA26551@ls3530.fritz.box>
 <20190731195550.GC23520@t470p.stackframe.org>
 <5b9ccfca-f28b-f0f6-de1e-56778d2a98fa@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b9ccfca-f28b-f0f6-de1e-56778d2a98fa@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Wed, Jul 31, 2019 at 10:07:57PM +0200, Helge Deller wrote:
> On 31.07.19 21:55, Sven Schnelle wrote:
> > uncompressed image too long - wouldn't fit into destination
> 
> You are using the built-in palo gzip decompression function.
> Please don't use it, it is an old (not bug-free) implementation which got replaced
> by the kernel self-decompressor.
> My palo.conf in the build dir has:
> --init-tape=lifimage
> --recoverykernel=vmlinuz
> 
> and set
> CONFIG_PARISC_SELF_EXTRACT=y
> in .config.

Thanks. I had the palo option (probably because they are default), but missed the
Kernel option. The lifimage is now 28MB in size, and your patch works for me.

Thanks!
Sven
