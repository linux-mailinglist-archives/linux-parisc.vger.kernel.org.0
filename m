Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A54CDC6C
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2019 09:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfJGHdU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 7 Oct 2019 03:33:20 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:58827 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfJGHdU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 7 Oct 2019 03:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=JRziUrb5H1301RvdgPSx+Al5yntYg4F3TooNNRjEyyw=; b=SJQKqxxGdbVccJcZEo5Y1DMEIT
        Z6h3CpMlyRcgh6H6UvcQmcgbtC2OtjAXu11KI7tH/BAaw0E8BIQCBZFALcNFoCbW++mzMfu+PY8qE
        Qm9zGsVuwf2+ys478EdUN4k/y2pcFdwNrv/PMJpfSeiJn56H7y0GMitqwB3Fl3ejn1Dg=;
Received: from [2001:470:70c5:1111:5054:ff:febf:83e1] (helo=stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1iHNWA-0005Z0-Qw; Mon, 07 Oct 2019 09:33:18 +0200
Date:   Mon, 7 Oct 2019 09:33:17 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-parisc@vger.kernel.org, deller@gmx.de
Subject: Re: some progress with radeon on C8000
Message-ID: <20191007073317.GA20007@stackframe.org>
References: <20190928214436.GC18685@stackframe.org>
 <20191002141907.GA8897@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002141907.GA8897@alpha.franken.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Thomas,

On Wed, Oct 02, 2019 at 04:19:07PM +0200, Thomas Bogendoerfer wrote:
> On Sat, Sep 28, 2019 at 11:44:36PM +0200, Sven Schnelle wrote:
> > Hi List,
> > 
> > i've spent quite some time this evening debugging why the Fire GL
> > doesn't work in my C8000. As reading debug output didn't give me
> > much insights, i decided to throw some Hardware at the Problem and
> > connect a Logic Analyzer to the C8000. For that i switched to an old
> > PCI Radeon 7000 which shows the same ring test failure.
> 
> below patch (with debug print left in) got PCI radeon working for me, when
> I played with it last time.  The added fdc is a real fix, while the change
> in parisc_agp_mask_memory is just a hack. The big problem there is to get
> virtual address where the memory is mapped to in user space...

Thanks. I wasn't aware that you spent already the time to debug this.

Regards
Sven
