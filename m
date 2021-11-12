Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF1344E2C4
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Nov 2021 09:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhKLIHe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 12 Nov 2021 03:07:34 -0500
Received: from outbound5a.eu.mailhop.org ([3.124.88.253]:36015 "EHLO
        outbound5a.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhKLIHd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 12 Nov 2021 03:07:33 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1636701519; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=GiY6L02WuC7slOLqjwjklBYFNyabxpZXHPlctFv5u8qaW8OA94ZmSZQhL+7F7VWcW+8t9146zoQvO
         XMDotxIXzLA6tsXeGKQmI78spNDwU6oIPuF6e8hj9ORb5W/lqX6wFuwWyVU26KNh0mA/Df1b7FbPQB
         RfaW3YAKwZWfosvZM2R5FsUIXKni6pSPX4q2n7sXn2099UIjksi5PdIWZmQe/AWmVidmQ64EnZwKEY
         CjYiKtwsz+gxougpxGXI8vtgmKQGgc6QCXzEZ4E6zRzJ7GI87e4MRwYQaWHUfhjHwtoLNsOjrDRlkZ
         /EXCedczmghDhAnb4D/sp2Y3lUNYh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:dkim-signature:dkim-signature:from;
        bh=LReuj4dKfoo/2kPSCOZny2GgnVGaO0qQ7SHQbQPCPtA=;
        b=tbkuh1omP81wb/V13Ubke7YBHdepgbiToQFUcRtb38y+RTq5PJ8BSw63/HMD2y6uLBOt40r41Z4p4
         O0SndiOMYLZ1BDhdN6f2L7hicg40DiG+i/vvfYRDDF4+suLJJ3Tvti63owzwbvmKxCuw3fa2t+2Nrq
         Q3Lsv1ppc825bKfPiuJ0KXSCJwWkpN68uvXQ503F+pN7lK7QxP4JpLCNRRz83BmgYJcpDVhTqG3Yko
         f0rp1mOsAVLQzpc87xEqehzBGo8ouHPM+Yw00qbZrcsxg/N2ekq1o6SRPM6VXZZqeAIamS0WAFIiCI
         xRTlnHDL0b2v+RCqFnpm/vfbMs3Ja9w==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=LReuj4dKfoo/2kPSCOZny2GgnVGaO0qQ7SHQbQPCPtA=;
        b=fVk8X8zOYAJlklMxK1z9l8umB5rQWCZupQqXK7zREAHckfYctHVpxvAMAr6iu9aENf33Jvciqoshm
         OT2ao/mmkyMhbQOcXhHEfNAjL47J5u6T2ztW+TOar2zhCpSyYFoz1aEYOs3Ncf6XprpTZeGveGQvca
         /kAncnrvBLDHbTgc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=LReuj4dKfoo/2kPSCOZny2GgnVGaO0qQ7SHQbQPCPtA=;
        b=ks7JMcPyTSVKffNH49JMEYB3RCVPyzM+9E7SglNhgb+C0wYj9TPrfQ2gQ0OWNa0JJ3o1AQ2M2hO5u
         EeI/h8xOj7V+R+SRxlnM+TI5DoU6j4Yxp8j5ye4jXKcSPuxKwHGPhTdJblLhdQ2tSBdhlBdAacu+4B
         M4AiyqYEWzakxwUgof0pbUpLBc6fulvkvdPqOrQ7HXTCyMf0XiByeIEW3t75Tl9tLDZ40sAeRDTs9D
         xYCwIa1uqHiaDlH+GqGmt7Fbm91q6CVR1+i52W+Y31Vp0hzBMzIQgVczLsZh0UZ5MOQXsPI+I8CsQQ
         ak/clOFofakK0Ff7Z58WGzTIjSNIa+g==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: c093d026-4388-11ec-8c22-95b64d6800c5
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
        by outbound3.eu.mailhop.org (Halon) with ESMTPSA
        id c093d026-4388-11ec-8c22-95b64d6800c5;
        Fri, 12 Nov 2021 07:18:37 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mlQpY-00ETQM-6o; Fri, 12 Nov 2021 09:18:36 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc/entry: fix trace test in syscall exit path
References: <20211111220429.797-1-svens@stackframe.org>
Date:   Fri, 12 Nov 2021 08:18:35 +0100
In-Reply-To: <20211111220429.797-1-svens@stackframe.org> (Sven Schnelle's
        message of "Thu, 11 Nov 2021 23:04:29 +0100")
Message-ID: <87tughalkk.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Sven Schnelle <svens@stackframe.org> writes:

> commit 8779e05ba8aa ("parisc: Fix ptrace check on syscall return")
> fixed testing of TI_FLAGS. This uncovered a bug in the test mask.
> syscall_restore_rfi is only used when the kernel needs to exit to
> usespace with single stepping via recovery counter enabled. The test
> however used _TIF_SYSCALL_TRACE_MASK, which includes a lot of bits
> that shouldn't be tested here.
>
> Fix this by using TIF_SINGLESTEP and TIF_BLOCKSTEP directly and
> remove those bits from TIF_SYSCALL_TRACE_MASK.

I think we need to have TIF_SINGLESTEP and TIF_BLOCKSTEP in
TIF_SYSCALL_TRACE_MASK otherwise do_syscall_trace_exit() isn't
called when leaving to userspace. I'll read the code a bit more
during the weekend and prepare a v2.
