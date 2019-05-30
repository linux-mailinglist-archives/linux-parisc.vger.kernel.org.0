Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBEF630306
	for <lists+linux-parisc@lfdr.de>; Thu, 30 May 2019 21:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfE3Tzx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 30 May 2019 15:55:53 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:59859 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfE3Tzw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 30 May 2019 15:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=FJ1ILBet1SEBBvAp9sohY855uezTHiiUOE5qGdFfqfU=; b=tfZHhxTMTQmfWxZPeCo/RxmW7E
        FanTAwR7ht1uf0lI1uN0f4MDtDql/XM7180VDZVJ4VXBkBPUVt2B3yxeZ7oWkE8aWPPpYIm0hSi6y
        qNSD/X3W2cU6wGw4qJDStlhYUL9mj5I/o/RJkrzUqYvEU+TjGwh73cLFcOVrRVB8ck3g=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hWR9N-0007yd-9k; Thu, 30 May 2019 21:55:45 +0200
Date:   Thu, 30 May 2019 21:55:43 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <20190530195543.GB683@t470p.stackframe.org>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <20190528153815.GB16860@t470p.stackframe.org>
 <674f8b61-e897-f657-68a2-648babca00be@bell.net>
 <1943613.tnj53yOHQY@daneel.sf-tec.de>
 <20190528173922.GA32192@t470p.stackframe.org>
 <f782e9cd-0824-6c29-09bc-986813dd1e56@bell.net>
 <61253aef-2571-f8bb-756a-bf2018e533e4@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61253aef-2571-f8bb-756a-bf2018e533e4@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Wed, May 29, 2019 at 04:15:03PM +0200, Helge Deller wrote:
> >> Exactly. And as:
> >>
> >> a) All C3600 PDC versions clear the NP bit
> >> b) All C37XX/J5000 PDC version set the NP bit
> >>
> >> i don't think there's some bug in the PDC. I would guess that the patch Carlo
> >> reported to fix issues is just hiding the real problem. Would be interesting
> >> to run Carlo's Test on a C37XX.
> >
> > Probably, hardware cache coherent I/O is not implemented correctly for Elroy based systems.
> > https://www.hpl.hp.com/hpjournal/96feb/feb96a6.pdf
> > Does it work on C360?
> 
> I slowly start to get confused...
> Just thinking about another possibility: Maybe we can rely on the value of the
> NP iopdir_fdc bit only on machines with >= PA8700 CPUs?
> For older machines (which would need opdir_fdc) HP-UX or other operating
> systems decides on the found CPU.
> This would explain why it's not  set on Carlo's C3600, and if Sven's C240
> (with a PA8200 CPU) doesn't has the bit set too, then this could explain this theory.

I just re-tested my kexec branch, and the HPMC i was seeing when kexec'ing a new
kernel on my J5000 is now gone with Helge's patch. J5000 also has PCX-W. It was
only triggered when i had SMP enabled, but this is somehow not suprising given
the fact that a cache flush was missing.

Regards
Sven
