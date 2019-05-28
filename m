Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89B82CDBE
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 19:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfE1Rja (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 13:39:30 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:46686 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfE1Rj3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 13:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=emRQ6Q0rejDIQ7fQsi2cgKgd6anJUEYONBGKmh6gL6s=; b=a9SHg+Mf6Aepa+R7JiN8Ud6cnu
        olgsSvHJdV87kgtEPQg0Gxr8KUG1M+5A+Rp9aa9xJvN2F1WxLNkHOKIiR9EQQPnRSko4A217/i4Q8
        6h/F9CqHnixxaA4lx9WU2Ua2l+Wb5tzkMdi6eJAOT89wo10REHGKorlD+K0m3uhsnd7Q=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hVg4J-0006eU-Ib; Tue, 28 May 2019 19:39:23 +0200
Date:   Tue, 28 May 2019 19:39:22 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>,
        Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <20190528173922.GA32192@t470p.stackframe.org>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <20190528153815.GB16860@t470p.stackframe.org>
 <674f8b61-e897-f657-68a2-648babca00be@bell.net>
 <1943613.tnj53yOHQY@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1943613.tnj53yOHQY@daneel.sf-tec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Tue, May 28, 2019 at 07:24:29PM +0200, Rolf Eike Beer wrote:
> Am Dienstag, 28. Mai 2019, 19:06:48 CEST schrieb John David Anglin:
> > On 2019-05-28 11:38 a.m., Sven Schnelle wrote:
> > > Interesting. Now that you mention it i see that my C3750 reports the same.
> > > Google returned the following page
> > > https://support.hpe.com/hpsc/swd/public/detail?swItemId=PF_CCJ70020
> > > 
> > > Which is 2.0, and only mentions "C3650/C3700/C3750/J6700/J6750 firmware"
> > > So maybe these machines have NP set, and machines "below" (like C3600)
> > > don't have it set.
> > > 
> > > I wonder what happens if you try to flash a 5.0 firmware to such a box.
> > 
> > From what I see, the "C3650/C3700/C3750/J6700/J6750" and "HP 9000 Model
> > B1000/C3000/J5000/J7000" use different firmware.
> 
> Which makes sense as the former have use a 8600 CPU, while the latter have 
> 8700 ones.

Exactly. And as:

a) All C3600 PDC versions clear the NP bit
b) All C37XX/J5000 PDC version set the NP bit

i don't think there's some bug in the PDC. I would guess that the patch Carlo
reported to fix issues is just hiding the real problem. Would be interesting
to run Carlo's Test on a C37XX.

Sven
