Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78084828B3
	for <lists+linux-parisc@lfdr.de>; Sat,  1 Jan 2022 23:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbiAAWN1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 1 Jan 2022 17:13:27 -0500
Received: from outbound5e.eu.mailhop.org ([52.28.168.19]:57309 "EHLO
        outbound5e.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiAAWN1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 1 Jan 2022 17:13:27 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1641075141; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=Lij9FgdYeo3paQWQTFLtoDsBmQtUnQRR+7K3hQpVhyRKO+nG08why1R8VCNlCovzPNnSlcYIs/1fQ
         JBtr6dIW+Fzjp94YwhiQ1OTJdUJbr+vzmMADQQQAssDcjePeGghijN0q1ABOjvIVuf3LGlC8V+iBrI
         fLfcani2Rl6p8iKTyntub2G4pOhRSBIu/77pUQ2yMKThg0fg5TLpqGHzP97z4R/o3nOqcy3HRGKXL0
         3EQf3wkAKUwAjEeyjQuO84V9jXMYV8OENpEr7WtnhNjRgiWtwPyrx05JgzraSTRPa7QOi0ZDHOLrcU
         mA0fX4DLK6l34NvkW2u4KkubqZEMU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:dkim-signature:dkim-signature:from;
        bh=sSyYzJxyAzC1HqDqlHds4g9nc/Y594G5RBU9LPvWM4w=;
        b=dunM+bYqTMkbWqLoUOnBif6ahdfDZ1w596Ep6yciW1b3w4+ZvIR0Bl+vSg3vTE+cjVVbcro+7rPsP
         ibsO+rqZGpE/fVEIq3m5mEQLlYXlBWAGJp+7oQFFxOqQA0aqVavHgoHs2MQt7Pojq3c1dimEq/I6j8
         Kzdt1HHsZDTpwjoX1mdgPAGfWsFZYl0ufD+3ICGvJAMRja8A8tVjSocdQI+ezDVoIdIAWPBzaLZTYr
         kpXp5VVpD8+JaxMLS4OipWhmbwjuFaXx2zjg9E6i9Gz/lKnHcksTECRjSGKPl38LQxaOto/x2LqnxW
         rweUzTXRbODgSSL+V/sY8fD+7qSgWvQ==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=sSyYzJxyAzC1HqDqlHds4g9nc/Y594G5RBU9LPvWM4w=;
        b=hzEMtusftvrEpUmBObVwurz6VgZZr/3DE1fTj1n5ftULZMrzWpkazEeoDSFA8sKgVVjWlqT3FraR5
         WghM4ZVlNXjhMHAWHHXcoZji4dyJHEBbYfCNOj63uOJZ9KI4VmDHjBiMyFfZld0saX7nYyXD2nQ5qq
         Mvgn66it1eNy2BBk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=sSyYzJxyAzC1HqDqlHds4g9nc/Y594G5RBU9LPvWM4w=;
        b=E/pJYrPZEVfFsb2KfSC+jCnlp5h7uoDf6jBjR9RyfgIGS2eetyXvJqNwOYTBkkM0U03v5BGeLzUH/
         lNSmptv8X3Z2cPr5hovF/84vS3+ieR/H/6KJA/Qjaz/M9pPsN9Tyhb7xE+AsS2rzSPu1/b0ERfEjEU
         dY/QHhileqSeZ7O39ou6sMhS5sO5PEHOU2z8u372Ie0MN4bv1Dc6S+N9Mju3yQ8uPfFc2VQfBQINNT
         maSHDtUsHpY3P0DTwx69C7t1011D14QN26XayvBXHuXAn5G2C/C4QBNI0NSTDvXFoi9Lcmve4KUnL/
         OY/Zdc2mi/mxoKb3w/7IdeS82aXGpmA==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: e2590ac2-6b4f-11ec-a075-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id e2590ac2-6b4f-11ec-a075-973b52397bcb;
        Sat, 01 Jan 2022 22:12:19 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1n3mbq-002d4y-0l; Sun, 02 Jan 2022 00:12:18 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: pagefaults and hang with 5.15.11
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
        <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
        <12921974.uLZWGnKmhe@daneel.sf-tec.de>
        <3407744.iIbC2pHGDl@daneel.sf-tec.de>
Date:   Sat, 01 Jan 2022 23:12:16 +0100
In-Reply-To: <3407744.iIbC2pHGDl@daneel.sf-tec.de> (Rolf Eike Beer's message
        of "Tue, 28 Dec 2021 22:55:47 +0100")
Message-ID: <87pmpbds1r.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Eike,

Rolf Eike Beer <eike-kernel@sf-tec.de> writes:

> Am Montag, 27. Dezember 2021, 15:30:10 CET schrieb Rolf Eike Beer:
>> Am Sonntag, 26. Dezember 2021, 18:22:12 CET schrieb John David Anglin:
>> > On 2021-12-26 11:21 a.m., Rolf Eike Beer wrote:
>> > > [139181.966881] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613
>> > > rcu_eqs_enter.constprop.0+0x8c/0x98
>> > 
>> > This is probably not reproducible. You might try this change from Sven
>> 
>> At least this time the git testsuite has finished, but with some errors as
>> usual.
>> 
>> > diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
>> > index cf92ece20b75..0cd97fa004c5 100644
>> > --- a/arch/parisc/kernel/smp.c
>> > +++ b/arch/parisc/kernel/smp.c
>> > @@ -228,11 +228,13 @@ static inline void
>> > 
>> >   send_IPI_allbutself(enum ipi_message_type op)
>> >   {
>> >   
>> >          int i;
>> > 
>> > -
>> > +
>> > +       preempt_disable();
>> > 
>> >          for_each_online_cpu(i) {
>> >          
>> >                  if (i != smp_processor_id())
>> >                  
>> >                          send_IPI_single(i, op);
>> >          
>> >          }
>> > 
>> > +       preempt_enable();
>> > 
>> >   }
>> >   
>> >   #ifdef CONFIG_KGDB
>> 
>> I'll add this and see what happens.
>
> The machine locked up again, but without many output:
>
> [13093.642353] INEQUIVALENT ALIASES 0x96000 and 0xf5bba000 in file xargs
> [13094.122900] INEQUIVALENT ALIASES 0x110000 and 0xf5a63000 in file find
> [13260.968430] INEQUIVALENT ALIASES 0x96000 and 0xf5bba000 in file xargs
> [16995.351108] ttyS ttyS1:[17649.655079] t[17650.739194] t[17658.174951] 
> t[17659.307044] t[24039.432030] INEQUIVALENT ALIASES 0x113000 and 0xf5a66000 
> in file find

Looks like you have a serial console connected? If yes, could you trigger a 'TOC
s' from the BMC, and post the output from 'ser x 0 toc', where x is the
processer number? This could help debugging this.

Thanks
Sven
