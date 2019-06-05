Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382A835F5A
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jun 2019 16:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfFEOdt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jun 2019 10:33:49 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:40407 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfFEOdt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jun 2019 10:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=xDkIYU5xviD8BThQyk+ZDquRDzLN9rQqGj45asylAX4=; b=OR+QgvMswOlOq4BVqtRVMuufAc
        IjQGF/a27aHfE3T2Ri1XgMyXjmgxtQ2GPJipu26GlpvWRhf20DP11J1PD3yb1aNvn7IMr2nkSXhSR
        oLSnSGeQOKfPiuc7Bc4ZKAsV9P8IWXbzkZcS5KEutVnG0DYtVQzx2tCvwLa8R6Mc2Lp0=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYWz5-00038H-9S; Wed, 05 Jun 2019 16:33:47 +0200
Date:   Wed, 5 Jun 2019 16:33:45 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: SCSI Adaptec aha-3950u2
Message-ID: <20190605143345.GA27783@t470p.stackframe.org>
References: <5d53371f-d918-0333-08a7-ad0d04eb3b26@bell.net>
 <5aaedf55-97bf-8d38-da37-bdafa54b5e9f@gmx.de>
 <99ef56f8-4814-93ca-4c33-71ccbad5dd61@bell.net>
 <CA+QBN9BpA80MORxGafyit4-mPXk9jTWhNzd3Nj90WZwpZHoE=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+QBN9BpA80MORxGafyit4-mPXk9jTWhNzd3Nj90WZwpZHoE=Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Wed, Jun 05, 2019 at 02:38:31PM +0200, Carlo Pisani wrote:
> hi guys
> has Adaptec aha-3950u2 been tested on HPPA?
> it looks a PCI64 card with a RISC chip on it for processing SCSI commands.
> 
> So it looks perfect for a stress test on the PCI bus
> 
> found a discount for qty=4 units, so I am considering it

Can't say about 3950u2, but a 29320A works in my J5000.
Unlikely that this is well tested though, as NCR/LSI/Symbios Logic
was the default SCSI chipset vendor in the PA-RISC world.

Sven
