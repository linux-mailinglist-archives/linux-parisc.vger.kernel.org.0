Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A89D43536B
	for <lists+linux-parisc@lfdr.de>; Wed, 20 Oct 2021 21:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhJTTIC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 20 Oct 2021 15:08:02 -0400
Received: from outbound5e.eu.mailhop.org ([52.28.168.19]:32143 "EHLO
        outbound5e.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhJTTIB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 20 Oct 2021 15:08:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1634756746; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=NCmLkjEXyIVkDhMTRORhqtwLEziI+ydU5OZRPzhigeXUZsXdKB5ma/nJbJWz8lznSiXkUdKaqD8Vg
         RHuxdawHjkeVL7ocCIptVPdxbNsfYjlPAARQD9/r58Ei1/IGpyhmTIJOd0vtU+cqGuvtsOO13lmiZP
         QJqT9fRO3YbmMmhtn8kwTUs7NGNq0V0kIJHup8Y4lfysWWjlFIZoZB2pwU0j7cebyH0I7nAznH7Id0
         hajP8YUPcdxbz0+dDLbS10eozqFeEV2XISIEzBpKEm9JnWLztOAWH2yrn54w3M501KseAJ7yPsoTYJ
         hi5SBI5qk8U4LbJ4tihSUCGA+sPmr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:dkim-signature:dkim-signature:from;
        bh=Wp7CG+/sIewEKUFnN0zyXL+VywmG8BsRhClow92VS6Y=;
        b=V40xGHGPWUCtJsG1KUKokwcw2PLCgWJR7patjs599E62H04OmFQ5gOYgZf85hz3Aq4V/UV4TetTyN
         ++5bC0iMpxjN4x5qqkfS0NuG4TWAbuk8rjuYwfnKgw1VIebvs4TNm2zhIG//F1qONQ8bpGx1+j+2kX
         Pk09yXhYokCeDEPNVCwfvinWnP2Ou9dtKLgs71f7UiWQtrkZ40LhCXGfEMlIklg6tIHc8AOuV8QvaK
         KFfym1wAoMLYiMrX9+ksrisClwYMNXMOwxKqD+XTXz5eUskU/NokIxrpjFnZspFnJbmIyeDjpFm9K2
         gQByCJfNyqkNrjhDMohz8YlwGlW3fdw==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=Wp7CG+/sIewEKUFnN0zyXL+VywmG8BsRhClow92VS6Y=;
        b=VCQvjv9q0I676V7TZ7SH04XiTyQQ0eoYgqb+AtrztCpoyquK6M3h+ecidvsS5EP4YZMf6XDytjOak
         Syv39dL2nvBntRcZBzUIaiLnZUK/WOIvqQvIg6C5+Akvar27W4GWpFnsXoDDcBSBvGDs5X+nYWdHiU
         BIL+stkz2h8EST7o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=Wp7CG+/sIewEKUFnN0zyXL+VywmG8BsRhClow92VS6Y=;
        b=TO7/hvJSeSEQpoI0Xm+81IAoFO3DXnxzrNLi5p++0DsLSPXIKv5HUZx/JAKeZGyhINjOQt2McjFFE
         vk6BMoF0ahdpb4WFbZNLXHK/eLA7xzuElBlb4JoiGNZJNZI0VRM0vn54iY2Z9SKcTBoMYwj2rn/5bc
         LpEoFrcCtCSxiEIUk+w+wehsY6kF1b5A8xu5DamQEMonucF8OIrR6C3T1IjVLK9oeC15sMOS74OVrI
         jJggUn5MGv8T7TRdBrNIg8Iwf2AVxmQXNUjG1njmG1OrlDnq7umZt+oywFxv73jkrO30j64xaQgsPu
         K2F5weEx6AcZlHujCvJ9ZIuR6MG57Fg==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: b91aee1d-31d8-11ec-a070-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id b91aee1d-31d8-11ec-a070-973b52397bcb;
        Wed, 20 Oct 2021 19:05:43 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mdGuE-00BpXn-Df; Wed, 20 Oct 2021 22:05:42 +0300
From:   Sven Schnelle <svens@stackframe.org>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: [PATCH] parisc: Don't disable interrupts in cmpxchg and futex
 operations
References: <20211015195612.25203-1-svens@stackframe.org>
        <969e8f20-d27c-77cd-62c1-ddb86213ddec@gmx.de>
        <a5030b48-b6bc-639c-5360-0389103c228e@bell.net>
        <ac539330-bdc2-1bba-e2c2-78d29614864f@bell.net>
        <8bef26c2-daee-2a6c-1828-100a5b27e205@gmx.de>
        <28325394-99de-67f4-dcca-b1caf1105df2@bell.net>
        <87o87oxhhf.fsf@x1.stackframe.org>
        <48780780-0f8c-5aa9-d362-a9b9ddeaeedb@gmx.de>
        <e8a1f0c9-2af2-baa5-a252-4abbc8d28373@bell.net>
Date:   Wed, 20 Oct 2021 21:05:40 +0200
In-Reply-To: <e8a1f0c9-2af2-baa5-a252-4abbc8d28373@bell.net> (John David
        Anglin's message of "Wed, 20 Oct 2021 14:32:55 -0400")
Message-ID: <877de734aj.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

John David Anglin <dave.anglin@bell.net> writes:

> On 2021-10-17 12:30 p.m., Helge Deller wrote:
>> It seems the warnings are gone if I remove the irq masking.
>> I see the options:
>> a) revert the irq masking in syscall.S. Not sure if it really hurts performance.
>> b) revert the patch from Sven.
>> c) insert code to turn back irq on in the fault handler if we are on the gateway page.
>> What is your thought?
>
> After some thought, I believe option a) is the best.  I no longer think interrupts can be
> disabled in the futex and cmpxchg operations because of COW breaks.  This not ideal but
> I suspect it's the best we can do.
>
> For the cmpxchg operations in syscall.S, we rely on the code to not schedule off the gateway
> page.  For the futex, I added code to disable preemption.
>
> So far, I haven't seen the warnings with the attached change but the change is only lightly tested.

Thanks Dave. I just applied it to my tree and will give it a spin.
