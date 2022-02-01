Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28344A610F
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Feb 2022 17:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240864AbiBAQL0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 1 Feb 2022 11:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240870AbiBAQLY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 1 Feb 2022 11:11:24 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774BFC061401
        for <linux-parisc@vger.kernel.org>; Tue,  1 Feb 2022 08:11:24 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h7so1223224wrc.5
        for <linux-parisc@vger.kernel.org>; Tue, 01 Feb 2022 08:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DUcPfG2jvk8soPrh/GXSOclq4tBhWSCtwAZfbfPfsxI=;
        b=Q39c2YdTI6tt8Mw9qweDpEUlYSsHqIy+Aj9hBDLyopqZWjD1N9HO4MNtFEGyKEShRw
         s6vHsgbK3CIrTZ7cEq4bjXDQgRcZ4DJUv2B5ylPjzFQTfnZNwni5kZZM+mwkGHymGYWD
         +KK+YVnOK61brOsQEwZ2Hv2T7Usz/dKjg8KlDCmNz98g2UGkt351ZVCbDAKCLGjx/wYP
         Zfb5Uyum8DJ1pizAWMHv1uU2Zg7Gdjx3H6Z9PF5EfQisOsO3MNW5sgYc6VMiytZXZGvL
         NB7QGOlXeVHr/VUMxLbVj7a/A8P88NZy5rCD5bIga2SgmncsXNxFRzHJTJ6nV6kCmuu2
         h7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DUcPfG2jvk8soPrh/GXSOclq4tBhWSCtwAZfbfPfsxI=;
        b=vB25NVwaFgFtRa38GQPUVpXOPvpSItScKbg6PtlPQxvrM7FEPD/DNyGiQvzGsdliYL
         Cutfp4kdiT9AUhEbNptWX2vn+vix/wShWduNJWTNd7Yb33aC+l19CM7VqxhpfaVYNwy/
         4iuP1dBdWkpHWvmhYineK6Yzu9hkLwSGHXymn6lNugETyDGBWpwBBQPL+YRK0GEH/Woy
         4oGHwEhhDIXYC6EE549FD94i8AwpwJl0nOAWfYxv0Ln6xeUfZFKpuGRV0s9ARnDHmrmB
         GKnZo/ljDUJcB8C7hbGB7GsVe/PcPZywA8Kf6tQ/LsbCCXAIr4wV+UToyY0lLmGXn4xZ
         g+HQ==
X-Gm-Message-State: AOAM53101j8mEkf9orH9SFqqlVLua6ZMBBatyPUFDp8v75rjsP7xz1RB
        +R4owwo1i2BCLs2iIGsW3diheWQr2HmuG2/X3eT07mY3zpIQEw==
X-Google-Smtp-Source: ABdhPJxRdu3koNSPRx51iMYR6D0s+iKeotnR/bbkjDDTVNuZlVppZz9dPxmoqMgZz1gJ1RxiMb7ruVkHSMMs7QbxGSk=
X-Received: by 2002:adf:d08c:: with SMTP id y12mr22519591wrh.346.1643731882701;
 Tue, 01 Feb 2022 08:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org> <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com> <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
In-Reply-To: <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Tue, 1 Feb 2022 21:41:11 +0530
Message-ID: <CAAhSdy0U+41OWG_0C=820U+07accLsHxNYENtp=ZZsy6K4mJ0g@mail.gmail.com>
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>,
        kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Feb 1, 2022 at 9:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 2/1/22 16:44, Anup Patel wrote:
> > +Paolo
> >
> > On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
> >>
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> Current riscv doesn't support the 32bit KVM API. Let's make it
> >> clear by not selecting KVM_COMPAT.
> >>
> >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> Signed-off-by: Guo Ren <guoren@kernel.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: Anup Patel <anup@brainfault.org>
> >
> > This looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Hi Anup,
>
> feel free to send this via a pull request (perhaps together with Mark
> Rutland's entry/exit rework).

Sure, I will do like you suggested.

Regards,
Anup

>
> Paolo
>
