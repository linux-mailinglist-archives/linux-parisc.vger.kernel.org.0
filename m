Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D841B444707
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Nov 2021 18:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhKCR30 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Nov 2021 13:29:26 -0400
Received: from outbound5b.eu.mailhop.org ([3.125.66.160]:12424 "EHLO
        outbound5b.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbhKCR30 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Nov 2021 13:29:26 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1635959447; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=sDm/tmZWxB1/WXR6MKs5nJ0gAZ/G09eJkQ9lQU22WtWrrmU8aJKf8sdAP2vWQAONyGIV3F+2Nsiqh
         /+AvEZusV5TUuukynsTWpXI5YS+Z5BMPf0SfrRa1WfKSymgAS8Agfm92GT+BzAqaLt8tjajSEZF7EJ
         1tb0BGSOsj4wEnBNb9j5OAIDciqqqwXBfj9yr6kb9Wgu+ZjRVsPC/CvXO5pilH69TE9bV93vpR/1CV
         WXbLyIAepZXuUnaquUxvdT4pZlC52gexDrrV4iRyzDLguTv4cRwNTF3pyPhv8OL6A2MIUGNgjZwVYl
         RJZBUnp5pwq1JOiAQ3rrfTl3o8uBIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:dkim-signature:dkim-signature:from;
        bh=X4bM2Gi6Ibr1ECS7ugQvTRk/gYDaf3DuOOWj2Z9jitk=;
        b=HweqYYUW/TIHmPc9qjYF/2ro0y8fEAnckw9XmP8bTs1knBAgiGEucvJdMKf6VTQvrblzPmwglLXaI
         r2R1bUibnW1hnBBDr1XIqtSTHxIHoXyEZmu29HEmYRo6UpCkc4rz/tgFfyJQjXNvPZPvzhjMeUWA24
         PE7sOuTvScOFj+syUoiFV7DCIi7fgC80Ol0BYXIa+C3Dx3bHRO4ZDXiCPM5fvlQfVyIhpu6WKDJuio
         5xf/z5mCQOqLtcmqQwjDUb9i+FcT5CPKlmaVoNzEYdqujGII++bUw8BCiSnvuw/YHfx3XSVDE4wFi3
         5sH0LnN9SMNn8uEtP0my3DgmjlJhO6Q==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=X4bM2Gi6Ibr1ECS7ugQvTRk/gYDaf3DuOOWj2Z9jitk=;
        b=CqQVQwzbTNwVokVANQzu/n1Buqx9vxHGllid5++sq6p7+ou3RefiQrVOa5ZiKZTJpXVGxIBKNM4Pe
         yKVarbwj7s7/pXhfNZXlCwmblHxkiGqD1TwPygetbfCpPQbKXzPK6llfdOU7oYX7oh/zyBq80uw8fk
         3WNIYQm0qGWpRZ4c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=X4bM2Gi6Ibr1ECS7ugQvTRk/gYDaf3DuOOWj2Z9jitk=;
        b=DE8u4lrsPhpO/ieqXWmhP7Qv8+WQLQ+kwrqK+CVW3ebJGTWowmXNZxPaSIkjk2hrzIE01q1V2sPLb
         VPCj/9PHoJEV2qB1aspng90dOtqbZDEddlOXRardXo8Ipx/CIWJ2ju6F/OPj2vddde5idGGvexxuKb
         mNxNRM8qPX78K1UD6mRQUESm3WqXSaw1qVL1SPATt3QBiiOit/1LHvve5Z0cTolxFXvX+UwoJl8Vjz
         5oOZrpWbMnmhyGpiLNne2sUNVBKXbzBSyGnYit8T4uj/T3rwn/87JHyIfITbwFbKmKke6t+CKDuRYE
         CSXAx3kG3HUvJd61zuR3aQyXa3/bVqQ==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: fa484073-3cc8-11ec-8655-95b64d6800c5
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound3.eu.mailhop.org (Halon) with ESMTPSA
        id fa484073-3cc8-11ec-8655-95b64d6800c5;
        Wed, 03 Nov 2021 17:10:43 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1miJmc-00DYPf-I0; Wed, 03 Nov 2021 19:10:42 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: [PATCH v2] parisc: Don't disable interrupts in cmpxchg and
 futex operations
References: <20211015195612.25203-1-svens@stackframe.org>
        <969e8f20-d27c-77cd-62c1-ddb86213ddec@gmx.de>
        <a5030b48-b6bc-639c-5360-0389103c228e@bell.net>
        <ac539330-bdc2-1bba-e2c2-78d29614864f@bell.net>
        <8bef26c2-daee-2a6c-1828-100a5b27e205@gmx.de>
        <28325394-99de-67f4-dcca-b1caf1105df2@bell.net>
        <87o87oxhhf.fsf@x1.stackframe.org>
        <48780780-0f8c-5aa9-d362-a9b9ddeaeedb@gmx.de>
        <e8a1f0c9-2af2-baa5-a252-4abbc8d28373@bell.net>
        <877de734aj.fsf@x1.stackframe.org> <YYKf5XA4fVeo/02l@ls3530>
Date:   Wed, 03 Nov 2021 18:10:41 +0100
In-Reply-To: <YYKf5XA4fVeo/02l@ls3530> (Helge Deller's message of "Wed, 3 Nov
        2021 15:42:45 +0100")
Message-ID: <87k0hpjhbi.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Helge Deller <deller@gmx.de> writes:

> * Sven Schnelle <svens@stackframe.org>:
>> John David Anglin <dave.anglin@bell.net> writes:
>>
>> > On 2021-10-17 12:30 p.m., Helge Deller wrote:
>> >> It seems the warnings are gone if I remove the irq masking.
>> >> I see the options:
>> >> a) revert the irq masking in syscall.S. Not sure if it really hurts performance.
>> >> b) revert the patch from Sven.
>> >> c) insert code to turn back irq on in the fault handler if we are on the gateway page.
>> >> What is your thought?
>> >
>> > After some thought, I believe option a) is the best.  I no longer think interrupts can be
>> > disabled in the futex and cmpxchg operations because of COW breaks.  This not ideal but
>> > I suspect it's the best we can do.
>> >
>> > For the cmpxchg operations in syscall.S, we rely on the code to not schedule off the gateway
>> > page.  For the futex, I added code to disable preemption.
>> >
>> > So far, I haven't seen the warnings with the attached change but the change is only lightly tested.
>>
>> Thanks Dave. I just applied it to my tree and will give it a spin.
>
> Sven, did you had some outcome?

The outcome is that i haven't seen any problems yet.

> I've cleaned up Daves patch and applied it to my for-next tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=b7cd8a368c986abf184e609772b083f43e5d522d
> together with this patch from Sven ("parisc: don't enable irqs
> unconditionally in handle_interruption()"):
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=493f84fcb3a791350ffaa2fa2984a0815a924e39
>
> When not applying to master branch from Linus, this patch is needed as well:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1030d681319b43869e0d5b568b9d0226652d1a6f
>
> All is in my for-next tree.
> Testing seems that those are OK and I don't see any
> "BUG: using __this_cpu_add() in preemptible [00000000] code" warnings
> any more.
>
> Any objections if I push those patches to Linus soon?

No objections.

Sven
