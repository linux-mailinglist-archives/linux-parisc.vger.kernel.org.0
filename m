Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026E91D22E3
	for <lists+linux-parisc@lfdr.de>; Thu, 14 May 2020 01:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732516AbgEMXUk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 May 2020 19:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732380AbgEMXUj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 May 2020 19:20:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E74C061A0F
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 16:20:37 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h4so1405158ljg.12
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 16:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=phWq6l4aTvr/C2K/X4+k/YrVnCjrPXRTWTh12+oYaOk=;
        b=cD3d6Z8Oy8/Dx9WXsRuTcoa6/5Rh9rx4ZXh8joWvH4poHn6SlmiaIW98FjAPsN6Nbh
         x66jaomRN8ZljFVlOmAhCKb3qMEmAXGGOLhPnCxRlO2Vc19b0KxaWqaBnUOu9g5IgaPv
         XmTXcJb6msXzq5HV1afcp377hyESwqrNggFac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=phWq6l4aTvr/C2K/X4+k/YrVnCjrPXRTWTh12+oYaOk=;
        b=Av+pFHcnCNhSJGPtAYE9Tw2XS6jD98RgKLwwYzzRj/B8J9Sl+xz5uB5rNHwVROBfBE
         T5wyPdIpthP5h4S7QjPr5SwMeVSo7VA8pBMVNV8975hgnjwsRaAN2hpvtLhgYW8gQulh
         jfXm27ZjTtWSO+hoOqcLSlx4OILdEdOG81UQ/OI1nvnVhMt9WCIwuCob1ZWmyfjh02ag
         /1kDaZO6x17A7GS+Qwc7wdhSFsxPuGiY/zhQeDIWFEc6XqLkHLJNYGzJOdWkeece7DQC
         N190xjrnQxQa7dCxcnciZCFLiz1LBZR2qMUz+7BCvRuBBM+6SJsq+rMMNLInpmZ5dKvv
         i2Gg==
X-Gm-Message-State: AOAM532dLKonbHV4TJsPiN/TZd95ETymrD5iA2p38iTanXTZnbCY4sh7
        xIwrG2VPE80AetU7O2PEp72JSAUW0RI=
X-Google-Smtp-Source: ABdhPJx6YPFZVP8Ucr0rgR27CpfyF1qG0rFiiRgCSQ3+MpfHSHGNAnDgM2vKTOaTlbtrS4VyrdzWYA==
X-Received: by 2002:a2e:9b0f:: with SMTP id u15mr841070lji.272.1589412035123;
        Wed, 13 May 2020 16:20:35 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id r13sm445284ljh.66.2020.05.13.16.20.33
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 16:20:34 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id a9so961593lfb.8
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 16:20:33 -0700 (PDT)
X-Received: by 2002:a19:ed07:: with SMTP id y7mr1180765lfy.31.1589412033540;
 Wed, 13 May 2020 16:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200513160038.2482415-1-hch@lst.de> <10c58b09-5ece-e49f-a7c8-2aa6dfd22fb4@iogearbox.net>
In-Reply-To: <10c58b09-5ece-e49f-a7c8-2aa6dfd22fb4@iogearbox.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 13 May 2020 16:20:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjJKo0GVixYLmqPn-Q22WFu0xHaBSjKEo7e7Yw72y5SPQ@mail.gmail.com>
Message-ID: <CAHk-=wjJKo0GVixYLmqPn-Q22WFu0xHaBSjKEo7e7Yw72y5SPQ@mail.gmail.com>
Subject: Re: clean up and streamline probe_kernel_* and friends v2
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-parisc@vger.kernel.org,
        linux-um <linux-um@lists.infradead.org>,
        Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, May 13, 2020 at 4:04 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> Aside from comments on list, the series looks reasonable to me. For BPF
> the bpf_probe_read() helper would be slightly penalized for probing user
> memory given we now test on copy_from_kernel_nofault() first and if that
> fails only then fall back to copy_from_user_nofault(),

Again, no.

If you can't tell that one or the other is always the right thing,
then that function is simply buggy and wrong.

On sparc and on s390, address X can be _both_ a kernel address and a
user address. You need to specify which it is (by using the proper
function). The whole "try one first, then the other" doesn't work.
They may both "work", and by virtue of that, unless you can state
"yes, we always want user space" or "yes, we always want kernel", that
"try one or the other" isn't valid.

And it can be a real security issue. If a user program can be made to
read kernel memory when BPF validated things as a user pointer, it's
an obvious security issue.

But it can be a security issue the other way around too: if the BPF
code expects to get a kernel string, but user space can fool it into
reading a user string instead by mapping something of its own into the
user space address that aliases the kernel space address, then you can
presumably fool the BPF program to do bad things too (eg mess up any
BPF packet switching routines?).

So BPF really really really needs to specify which one it is. Not
specifying it and saying "whichever" is a bug, and a security issue.

             Linus
