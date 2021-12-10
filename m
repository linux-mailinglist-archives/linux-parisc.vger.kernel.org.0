Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222CF470AFF
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Dec 2021 20:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242897AbhLJT5V (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Dec 2021 14:57:21 -0500
Received: from outbound5h.eu.mailhop.org ([18.156.94.234]:28164 "EHLO
        outbound5h.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242855AbhLJT5V (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Dec 2021 14:57:21 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1639166025; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=ezHChSz4xMPXcPAf3ORm7YNip2OZjfynCFXmw6HI0T7TjUONaNweDdGviLGincXqWNtwUHYXiuE8l
         IrejlWCmNhHbAgcp5kdFiOpoTEAc+0+uIB+OjUJD9z6d9x7w/+6h53Dj7+1od8f3vSg+UEkSznlPzT
         PbHnSsPqx/XmzCjsBpjbmTUDTxmKy1NSH2/DA4i8zbdsv8WQrrgRGP/IjpskSRZxQANGxttF6Vd+F9
         0AVKADKJIbdKt3Obe21Ezk8SAy4sjezFZ6ytr5wWY6FmZa8oRDoqwuQFmCxnDEvVVfXP1A1FWhqoBi
         M+/C2oYylTu4HQN0DE0gYkysh2suCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
         date:references:subject:cc:to:from:dkim-signature:dkim-signature:from;
        bh=aPSF5uWnewaVgfsHsFbBpR3KIYtsSAgSImOUnFjOS6Y=;
        b=GbWFywc+FXNYzDn1TDYJPopuX2Kotoll8iAO44PIg2fIyTKizYK6scPEMDgBhgqjUbucLGIMaFh8Q
         FsQLUyn+r6BrvnS1ZrPrEnsdsMAxo5nfduVMmVXb39ZCoKltlmc4XZlnyaxrwuw/3b7FwkW89Pb5gZ
         l8AOMYfcUq+TRstajkg0gOX1HdABII0ViaVBLNd7cI3NQp+gOI0x3iSCChumwzGblnY1DFCaYEJqva
         ucHnw7qpdsknbnVe9HIgAwNGJS8Da7jSDhVRt145bA8NGw8G6nLhZjCk48W3dWOM51ElsmY1t5b5a6
         CqN73WYM/Ui6Pihz0scKIckgDW1llHA==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
         date:references:subject:cc:to:from:from;
        bh=aPSF5uWnewaVgfsHsFbBpR3KIYtsSAgSImOUnFjOS6Y=;
        b=RyeV4R7ViPZjv7woFZP98XZmAHhzHUcErBzaQ3Uyj/N2IE2KfVPzQSXy7Jtn46IIwd4sY1/lI/2Jj
         /6huaM7kxsnSnvnMUJBNRiNMezJQ5Z12g0bviqXKBKpRPjZXUTK/FrFVgjMoOswGemp97DG8Ew1o8j
         B8jKskooqcxYFa94=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
         date:references:subject:cc:to:from:from;
        bh=aPSF5uWnewaVgfsHsFbBpR3KIYtsSAgSImOUnFjOS6Y=;
        b=jSCFET6TZejz9HkgHxHS3rpyM9CgPx4h2Ljq9YBgN/uEsa2z2RokqckK/sOdorGamV+t3Uz1JWSEP
         cfg+dRKrAJXYfD5BqNNIDhuGOgOdCBdLiONTFz+T+MpUlsYvTHwb0e9WhkkUAHHUFqVTUvAbsLm9dN
         hsfQ8uEqWAYK95B6r7sFXyLsnNMNZx8br9lrlW97XTIM/bveg/nkJpU8CC0HghYP3F7ZSWljrk9MUB
         M7z7QR97Sa7TCkKajgXwLc5JsktfrT5Tve38utab97AXaXgtSqDfJj0XQKlGZ1lE5GLX0OoHb6K9ty
         dNkqsz0qIiOnlvSi+YEhuyemm1ls/7w==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: e024d289-59f2-11ec-a073-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id e024d289-59f2-11ec-a073-973b52397bcb;
        Fri, 10 Dec 2021 19:53:42 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mvlxd-0008GI-BG; Fri, 10 Dec 2021 21:53:41 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: Your System ate a SPARC! Gah! in map_pages()
References: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
        <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
        <a5eef9c4-8e0d-95e8-0c3d-0d0052d8edae@bell.net>
        <8a56f234-1126-e068-a70c-3b333320ef14@gmx.de>
Date:   Fri, 10 Dec 2021 20:53:39 +0100
In-Reply-To: <8a56f234-1126-e068-a70c-3b333320ef14@gmx.de> (Helge Deller's
        message of "Wed, 8 Dec 2021 09:14:38 +0100")
Message-ID: <87fsr0s0cc.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Helge Deller <deller@gmx.de> writes:

> On 12/7/21 23:07, John David Anglin wrote:
>> On 2021-12-05 3:46 p.m., Helge Deller wrote:
>>>> =C2=A0 10574:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43 ff ff 40=C2=A0=C2=
=A0=C2=A0=C2=A0 ldb 1fa0(sr3,r31),r31
>>> This IIR is strange. We most likely don't touch userspace at this stage
>>> when the kernel boots, and...
>> I'm thinking IIR is sometimes unreliable.  I see the same value
>> printed for the tst-minsigstksz-5 fault yet the actual fault
>> instruction was "ldi 1,r25".
>
> Good finding.
> It seems to be at least always unreliable if we get a trap 7 (Instruction=
 access rights).
> In that case the CPU couldn't execute the instruction due to missing
> execute permissions. I believe the CPU simply didn't fetched the
> instruction and as such has stale content in IIR.
>
> I'm sending a patch to the list which marks IIR with a magic value in tha=
t case.

The same might happen with ISR and IOR - i wonder whether we should take
a few bit in struct pt_regs, store the interruption code there, and only
display the fields that are valid for a certain code? pt_regs has an
unused pad0 field (at least i think it's unused...) which we could use.
What's your take on this? I would prefer this over some magic values in
the oops output...

Sven
