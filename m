Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89BE22BB54
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 22:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfE0UPn (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 16:15:43 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:48446 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbfE0UPm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 16:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=ETnj+47iRwL7HfA+yEl7DuaYkO+BWSawe4Bc+7A5XVI=; b=jT5oRFBK0vUJ3TK3DiE0A0aUdF
        LUBrdib4k134x3euLyQILnRqcrN+u0PqxaHDvYNGOBwoNPKzCkknS6aD6u9TIdguRJE57t9G8azxR
        ay9XW9anHnC/3beunOOzwJdEcrY+z7CuMDkcv/GjQ+DxC9qLErj4m/gUmv5oq/qLHyLs=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hVM1z-0006zd-Sy; Mon, 27 May 2019 22:15:39 +0200
Date:   Mon, 27 May 2019 22:15:38 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <20190527201538.GD29337@t470p.stackframe.org>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Mon, May 27, 2019 at 09:35:54PM +0200, Carlo Pisani wrote:
> isn't possible to burn the flash in the C3600 machine with the
> firmware of C3750?
> these two look similar.

I have a firmware image here that has '9000/785 B,C,J Workstation PDC', built
08/10/1999 in the header. In that firmware, the PDC_MODEL capabilities handler
is pretty simple and static:

  _pdc_model_capabilities
   fffffff0f002588c 081e0601             add                sp, r0, r1
   fffffff0f0025890 73c23fe1             std                rp, -0x10(sp)
   fffffff0f0025894 73c300c8             std,ma             r3, 0x60(sp)
   fffffff0f0025898 73c43f51             std                r4, -0x58(sp)
   fffffff0f002589c 0fc112d1             std                r1, -0x10(sp)
   fffffff0f00258a0 b4210020             addi               0x10, r1, r1
   fffffff0f00258a4 37430000             copy               r26, r3		; load pointer for capabilites word
   fffffff0f00258a8 20800000             ldil               0x0, r4
   fffffff0f00258ac 20200000             ldil               0x0, r1
   fffffff0f00258b0 34840006             ldo                0x3( r4), r4	; OS32|OS64
   fffffff0f00258b4 34210000             copy               r1, r1
   fffffff0f00258b8 f0810c00             depd               r1, 0x1f, 0x20, r4
   fffffff0f00258bc 0c6412c0             std                r4, 0x0(r3)			; store value
   fffffff0f00258c0 341c0000             copy               r0, r28
   fffffff0f00258c4 53c23f21             ldd                -0x70(sp), rp
   fffffff0f00258c8 53c43f51             ldd                -0x58(sp), r4
   fffffff0f00258cc e840d000             bv                 ( rp)
   fffffff0f00258d0 53c33f4d             ldd,mb             -0x60(sp), r3

So at least this version has no clue about the NP bit (or leaves it intentionally
at zero, which would mean it's independent of CPU/Chipset revisions) - it would
be interesting how this function looks in newer firmware revisions. Anyone has
a Firmware update file for any of the B/C/J Class systems flying around? I'll
take it regardless of the version.

Sven

