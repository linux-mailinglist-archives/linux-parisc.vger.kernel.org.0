Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55CE482ABF
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jan 2022 11:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbiABKZp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jan 2022 05:25:45 -0500
Received: from outbound5h.eu.mailhop.org ([18.156.94.234]:60058 "EHLO
        outbound5h.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbiABKZp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jan 2022 05:25:45 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1641119083; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=FL4BDF42Ztf6sb3Zy09RhoMAmulLX3z+vV43Uv324mLBT6lJT2MF5X0X3RdNHqelh+WuBmvK4gaJj
         H2IFfwWp8pxXWTvwNhU1/eOPlEVsQu0FKRsvXI5lkLiyjpOaVrcrJpYt8jwxrM2J1JZyk5Ij/n6z/3
         4oUzYaDo3r/zylpPmHcw0fxOh8WG+LSd5YUOpYx/bWnyGqp0oELmJHvdqDLwtqQ8iTGQVvJ8eLHrTK
         fbTeVC57RXBtXTjlTU+lOrp7rwnEpMCFKfWcduH0MOoAHJJMpcczkvw1+49qtLGHJmTVAPb6qI51CU
         QRoLoUL5BbTl5SLRGKR/UClTVNUNL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:dkim-signature:dkim-signature:from;
        bh=UXw9H14SoOcsujjgjERaBH/pTGt1vNHSMMpicQrW9Rw=;
        b=eoB3AraG1x1eENFnPnK9d7igQiCldSH/0ObBDa0VE+KnDQsEOkxkh3sjFJFt5UpkcW5m5AbT9Fn65
         VY1lxS+AWBSTid/uLTOCRhsXahm3WvD8IRIQHdVJJkF51x6CZ2MICveTlb0DSK7wGCQt7UCMTzxfsV
         Hw73R0w8jOTsN5EYQ1Bk3mcd80jFji2F4w2b/6dn02Cvu6JgyMdgHxPyRe9qs8KyTmB6jeP9LAcLQn
         qqQfI2xR/iHRk2/Bzg7C/rogHFokMh8sP0WlA12aiGAHf1Mr12l/IOay8y6tQ11EqdxbM99goHkjB9
         requwkQhFgrTWD+ZBIoRfltbQFCGdUQ==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=UXw9H14SoOcsujjgjERaBH/pTGt1vNHSMMpicQrW9Rw=;
        b=ep9OYqRbGkdCKhtQpat1lsxWa0K75uKZ9GTYyOqfc3+YNvgHeJ4BLGEg8Eq6AQt41EbqjClLiISbp
         EqPzhogBqsA9N66A6evaFM02EA1k57+aXDGQNuGGR8173/o4fXg/w+uK/FZQTsRTDETK2a5rWToZOn
         aXb02x2yZhWQvaV4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=UXw9H14SoOcsujjgjERaBH/pTGt1vNHSMMpicQrW9Rw=;
        b=myaimENz7pMuYnxDSCHOaEszIVtSQTh38t7KtJkhGNqdf+11vX5tl1lUTWpFRcKnRoyxvHx5t4ci8
         NtIfGOsIfAlJAFvStYVCckvPeJQWwWRMhj3hx7vS2amqd7/6McYY8r1hCfwqZ8b+MPT9GbzJm1V67V
         nnx6OUS2NR0UllXu2CWoeTMZLCtmhZa/1U9Ycb3jhXfD1hcDP+C2f4rwzPh/6vDQf2y5uR+arJnIll
         XB5FAaPODt2dUOwy7RBMJM9r0SSr48knXuE8/xRm4E0no6UwGjmQoqcIgUKc2/NTL1KO4dWXAvDAYu
         6PR/aCi+Pb6s842Y0SvMNeLEBmmbb8g==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 316e6367-6bb6-11ec-a075-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id 316e6367-6bb6-11ec-a075-973b52397bcb;
        Sun, 02 Jan 2022 10:24:40 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1n3y2Z-002fU0-CH; Sun, 02 Jan 2022 12:24:39 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: pagefaults and hang with 5.15.11
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
        <3407744.iIbC2pHGDl@daneel.sf-tec.de>
        <87pmpbds1r.fsf@x1.stackframe.org>
        <2612761.mvXUDI8C0e@daneel.sf-tec.de>
Date:   Sun, 02 Jan 2022 11:24:38 +0100
In-Reply-To: <2612761.mvXUDI8C0e@daneel.sf-tec.de> (Rolf Eike Beer's message
        of "Sat, 01 Jan 2022 23:28:30 +0100")
Message-ID: <87lezye8pl.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Rolf Eike Beer <eike-kernel@sf-tec.de> writes:

> Am Samstag, 1. Januar 2022, 23:12:16 CET schrieb Sven Schnelle:
>> Hi Eike,
>> 
>> Rolf Eike Beer <eike-kernel@sf-tec.de> writes:
>> > Am Montag, 27. Dezember 2021, 15:30:10 CET schrieb Rolf Eike Beer:
>> >> Am Sonntag, 26. Dezember 2021, 18:22:12 CET schrieb John David Anglin:
>> >> > On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
>> >> > > [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613
>> >> > > rcu_eqs_enter.constprop.0+0x8c/0x98
>> >> > 
>> >> > This is probably not reproducible. You might try this change from Sven
>> >> 
>> >> At least this time the git testsuite has finished, but with some errors
>> >> as
>> >> usual.
>> > The machine locked up again, but without many output:
>> > 
>> > [13093.642353] INEQUIVALENT ALIASES 0x96000 and 0xf5bba000 in file xargs
>> > [13094.122900] INEQUIVALENT ALIASES 0x110000 and 0xf5a63000 in file find
>> > [13260.968430] INEQUIVALENT ALIASES 0x96000 and 0xf5bba000 in file xargs
>> > [16995.351108] ttyS ttyS1:[17649.655079] t[17650.739194] t[17658.174951]
>> > t[17659.307044] t[24039.432030] INEQUIVALENT ALIASES 0x113000 and
>> > 0xf5a66000 in file find
>> 
>> Looks like you have a serial console connected? If yes, could you trigger a
>> 'TOC s' from the BMC, and post the output from 'ser x 0 toc', where x is
>> the processer number? This could help debugging this.
>
> Yes, this is all from serial. I guess this only works during the hang? That 
> means I have to boot into the bad kernel again and wait until it breaks. 

Yes, when it hangs, press ESC followed by '('. This should give you the
BMC prompt:

CLI>

Enter TOC s - this will take around 10s, and reboot the box. in the boot
menu, you can than take a look at the TOC data with the mentioned
service command.

/Sven
