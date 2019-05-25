Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB022A6ED
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 22:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbfEYUhf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 16:37:35 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:33918 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbfEYUhf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 16:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=BEXPuLMfhiiVAJ9wfrV/v3VhU0LCJ3MoDFCB4RFq2AU=; b=JBZAnwRKGrQkroG/IEJPRoXOs0
        tNz7hotKkOtUUA/f4tMx1uenpAGkdSDdxTehznOHjwgRvvz3tSrqmUYvd8U0We24gjQkvvRfnv9vN
        HBOqmOJNpQ4ecP0Dc9WQymYuvCqZ4shnIM6oHHlL9qNIJ0UL7W0TI88yt4B9q6Q72jdQ=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hUdQ4-00024u-Dk; Sat, 25 May 2019 22:37:32 +0200
Date:   Sat, 25 May 2019 22:37:30 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        Carlo Pisani <carlojpisani@gmail.com>,
        Grant Grundler <grantgrundler@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: HPPA problems with the PCI
Message-ID: <20190525203729.GA21294@t470p.stackframe.org>
References: <CAP6odjiBTYLAMDYxtWKOK1vbftXkf_6_r-_ttwjuswvrMyCdAQ@mail.gmail.com>
 <20190524063909.GA9661@t470p.stackframe.org>
 <CAP6odjj0uj3rj==jJbr-otuEn67boqAjCyEqsbZre1JihEScGQ@mail.gmail.com>
 <CA+QBN9DdzNgH27aNdNt9q_GJBje0hhhAJRrYD4_qC67YO--vQw@mail.gmail.com>
 <9aa6caf2-c9d0-8bbb-8f62-dc1becea841d@bell.net>
 <e033f241-6437-864f-c94b-9b1e15492258@gmx.de>
 <CA+QBN9A9jw-QsZXcDHUMZU03TY_m5=kfcmVhpUNyv-y3xy2Heg@mail.gmail.com>
 <55e937b6-a95e-d6e4-ef30-f9040f4daafd@bell.net>
 <20190525181304.GA5637@t470p.stackframe.org>
 <1a4a708b-09a0-cb46-1491-554df106967a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a4a708b-09a0-cb46-1491-554df106967a@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Sat, May 25, 2019 at 09:09:04PM +0200, Helge Deller wrote:

> > It's also set on my C3750, but not on my J5000 (PDC FW 5.0):
> >
> > root@j5000:~# cat /proc/cpuinfo
> > cpu		: PA8500 (PCX-W)
> > capabilities	: os32 os64 nva_supported (0x03)
> > model		: 9000/785/J5000
> > model name	: Forte W 2-way
> 
> Carlo & Sven, do you run 32- or 64-bit kernel?
> Maybe the 32-bit PDC does not return the NP (iopdir_fdc) while the 64-bit PDC does?
> Otherwise we maybe should only trust this bit, if it's a "PA8700 (PCX-W2)" or higher CPU ?

This was on 32 bit, but i tested it on 64 bit now and the iopdir_fdc flag is
also not present. Can't say whether your >PA-8700 idea is good or bad, don't
know enough about PA-RISC CPUs.

Sven
