Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4BE67CF3D
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 23:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfGaVBi (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 17:01:38 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:35166 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726268AbfGaVBh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 17:01:37 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id F36AB8EE130;
        Wed, 31 Jul 2019 14:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564606897;
        bh=vBOB+syYkpDiz5jdV6DoreXgh7FGALuNPuH8agcc/Ck=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=q4V/tb8Z7gufLEsYb7kUmXm85kYCArhj0d7T9Rpn0IAvpBhRBlqrGrlHDfcxNOSb+
         dpTVkIV+WTPB8+c9ee4CXEQROt9hxeNoKGN2YGzm9IXetFm8n0tZLaJhkgEyGiAeQK
         L+hSIa0X5jiDmNBOWhzsfADsoIOalw1MFVQezAlk=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Lo197QTfscc2; Wed, 31 Jul 2019 14:01:36 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 24BED8EE10C;
        Wed, 31 Jul 2019 14:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564606896;
        bh=vBOB+syYkpDiz5jdV6DoreXgh7FGALuNPuH8agcc/Ck=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=xhUvssgZfpJPLzbOTMo+j0VTQA/0dchDgorayf0dUR6WbaQT4iLNsm4vRvYS709MG
         jIbEaRHU/iDYbODRbW4XctX/YsX3nfUY5RPd5HnQqo+P9t6eOqCbiBSb5LSHPXqupH
         P/C+Q46mbp33LXLSfj2Wv/XS1QLE4cfLALPnIsQQ=
Message-ID: <1564606894.3319.72.camel@HansenPartnership.com>
Subject: Re: Compressed kernels currently won't boot
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Wed, 31 Jul 2019 14:01:34 -0700
In-Reply-To: <20190731194413.GB23520@t470p.stackframe.org>
References: <1564591443.3319.30.camel@HansenPartnership.com>
         <20190731173016.GA23520@t470p.stackframe.org>
         <1564595402.3319.40.camel@HansenPartnership.com>
         <1564602012.3319.45.camel@HansenPartnership.com>
         <20190731194413.GB23520@t470p.stackframe.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 2019-07-31 at 21:44 +0200, Sven Schnelle wrote:
> Hi James,
> 
> On Wed, Jul 31, 2019 at 12:40:12PM -0700, James Bottomley wrote:
> 
> > What about causing the compressed make to build both a stripped and
> > a non-stripped bzImage (say sbzImage and bzImage).  That way you
> > always have the stripped one available for small size things like
> > boot from tape or DVD?  but in the usual case we use the bzImage
> > with full contents.
> 
> In that case we would also need to build two lifimages - how about
> adding a config option option? Something like "Strip debug
> information from compressed kernel images"?

Actually, I just looked at what x86 does.  It has this in the
arch/x86/boot/compressed/Makefile:

OBJCOPYFLAGS_vmlinux.bin :=  -R .comment -S
$(obj)/vmlinux.bin: vmlinux FORCE
	$(call if_changed,objcopy)

So it basically strips all the debug information from the kernel before
compressing, which argues there's no need to retain the information
because x86 doesn't bother.

James

