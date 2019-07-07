Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E55E61716
	for <lists+linux-parisc@lfdr.de>; Sun,  7 Jul 2019 21:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbfGGTpG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 7 Jul 2019 15:45:06 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:38956 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728544AbfGGTpF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Jul 2019 15:45:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 622FC8EE1CB;
        Sun,  7 Jul 2019 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562528705;
        bh=W1dzgfVStp5PnZV1Xl6fYStfkTjvK3yuJz0Kq62eMQA=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=tN00IhJ0tU0ZLi/eDuqv2pEZuG7K+MkKNBywOLYcSxTM/efIw2so9GQMOrDJ5vsJR
         37NHI8keZXhTtnT8t1QMN2ygDq7OITcVQj1Y3sOowJ21OwcfaCDXN90SnmBA9Wr+Wm
         BPF7HfnHcToDFXt5Zn8P2PeChryBQPTJNUN1cMCc=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3VosAG1LrgQv; Sun,  7 Jul 2019 12:45:05 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id EF5598EE1B2;
        Sun,  7 Jul 2019 12:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562528705;
        bh=W1dzgfVStp5PnZV1Xl6fYStfkTjvK3yuJz0Kq62eMQA=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=tN00IhJ0tU0ZLi/eDuqv2pEZuG7K+MkKNBywOLYcSxTM/efIw2so9GQMOrDJ5vsJR
         37NHI8keZXhTtnT8t1QMN2ygDq7OITcVQj1Y3sOowJ21OwcfaCDXN90SnmBA9Wr+Wm
         BPF7HfnHcToDFXt5Zn8P2PeChryBQPTJNUN1cMCc=
Message-ID: <1562528703.3216.17.camel@HansenPartnership.com>
Subject: Re: [PATCH] Update palo documentation
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Date:   Sun, 07 Jul 2019 12:45:03 -0700
In-Reply-To: <ff1f3d02-20bc-c1fa-5ff6-0520e9ebe8e0@gmx.de>
References: <1562522488.3216.15.camel@HansenPartnership.com>
         <ff1f3d02-20bc-c1fa-5ff6-0520e9ebe8e0@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, 2019-07-07 at 20:44 +0200, Helge Deller wrote:
> On 07.07.19 20:01, James Bottomley wrote:
[...]
> > +Palo allows you to specify a kernel command line, which is stored
> > in
> > +the firstboot partition.  The format should be kernel first
> > followed
> > +by an optional initrd= and then the rest of the kernel parameters.
> > +For parisc system, you should specify a boot console as console=
> > on
> > +the command line.
> 
> No, that's not recommended.
> palo will detect the currently used console and add it automatically,
> so one should NOT specify a console parameter.

Ah well, I've got an rp3430 so its console name changes depending on
kernel, which is why I specify it, but I can remove that from "For
parisc system, you should ..."

James

