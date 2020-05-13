Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C541D1E9E
	for <lists+linux-parisc@lfdr.de>; Wed, 13 May 2020 21:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390303AbgEMTLt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 May 2020 15:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390391AbgEMTLt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 May 2020 15:11:49 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFA7C061A0F
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 12:11:48 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 188so448114lfa.10
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 12:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DlDe1IobgVm68K0PtFybaGZyKFGHK1OfKry00qMtGtQ=;
        b=V1UkNiRNfL733X9vr+6V4+xkxNISM7utjyshsT36quvy8jA5IVqpf+k3EDQxjXOIYU
         JkvVkJQB05ajebE0nuwA1SP0j1/ZNVxXHdyZbBxtTdovrxuSXCzKJOTV20D7eG1vu7ZV
         OomJViLlEUU/v3q1g+qPNyPfCuDydticNEJPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlDe1IobgVm68K0PtFybaGZyKFGHK1OfKry00qMtGtQ=;
        b=gmaKLGPI6wcc5V9T2YeD7uoALmyvNa5c9kCGwGTk5gdnH4OdDsYM4jTjufA+2hhrGb
         8RHhX0Yt0OX9fJ6x97gMoiN7LbSQfbedqzI1ZWUyKCgACz4szjNP3sFJeJijLQJWo+Ax
         4x/FyewvfniH3in3IfKT6gbwSbNDcEpgkMysCe6v4ZrCbCkzWip7NGHI0HxzW8wfw+bp
         IA9RbPdmg1+eYMjZYfUHD1CCHaOjJnWJAMME4lhR3xyMFsePYIx9UmAt8/a3FhtbMukJ
         zDhFHneHR1QeKXlbXx76U4WemUMrEycJBU6O9opZzTpljVy8a0V7yERvQOblMGZP4lFR
         7t6A==
X-Gm-Message-State: AOAM532o4SkuXvQjpIxgK0Q2JblwpSMw+r4/ooFkC1lb4aQHGBRG1TmT
        AJTJ/uzxL0W20gnjmAQvi7a847XOe90=
X-Google-Smtp-Source: ABdhPJzdK3jLyHkGgHdd2nF+R6ZTnubsOUtopck+zgpnz4H/BwkIDsCaQJPatKAMdAcCTA7/tZnVIw==
X-Received: by 2002:a19:4209:: with SMTP id p9mr74313lfa.175.1589397105206;
        Wed, 13 May 2020 12:11:45 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id w24sm278606lfk.47.2020.05.13.12.11.43
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 12:11:44 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id c21so485105lfb.3
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 12:11:43 -0700 (PDT)
X-Received: by 2002:a19:ed07:: with SMTP id y7mr627896lfy.31.1589397103373;
 Wed, 13 May 2020 12:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200513160038.2482415-1-hch@lst.de> <20200513160038.2482415-12-hch@lst.de>
In-Reply-To: <20200513160038.2482415-12-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 13 May 2020 12:11:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=u+nttmd1huNES2U=9nePtmk7WgR8cMLCYS8wc=rhdA@mail.gmail.com>
Message-ID: <CAHk-=wj=u+nttmd1huNES2U=9nePtmk7WgR8cMLCYS8wc=rhdA@mail.gmail.com>
Subject: Re: [PATCH 11/18] maccess: remove strncpy_from_unsafe
To:     Christoph Hellwig <hch@lst.de>
Cc:     "the arch/x86 maintainers" <x86@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
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

On Wed, May 13, 2020 at 9:01 AM Christoph Hellwig <hch@lst.de> wrote:
>
> +static void bpf_strncpy(char *buf, long unsafe_addr)
> +{
> +       buf[0] = 0;
> +       if (strncpy_from_kernel_nofault(buf, (void *)unsafe_addr,
> +                       BPF_STRNCPY_LEN))
> +               strncpy_from_user_nofault(buf, (void __user *)unsafe_addr,
> +                               BPF_STRNCPY_LEN);
> +}

This seems buggy when I look at it.

It seems to think that strncpy_from_kernel_nofault() returns an error code.

Not so, unless I missed where you changed the rules.

It returns the length of the string for a successful copy. 0 is
actually an error case (for count being <= 0).

So the test for success seems entirely wrong.

Also, I do wonder if we shouldn't gate this on TASK_SIZE, and do the
user trial first. On architectures where this thing is valid in the
first place (ie kernel and user addresses are separate), the test for
address size would allow us to avoid a pointless fault due to an
invalid kernel access to user space.

So I think this function should look something like

  static void bpf_strncpy(char *buf, long unsafe_addr)
  {
          /* Try user address */
          if (unsafe_addr < TASK_SIZE) {
                  void __user *ptr = (void __user *)unsafe_addr;
                  if (strncpy_from_user_nofault(buf, ptr, BPF_STRNCPY_LEN) >= 0)
                          return;
          }

          /* .. fall back on trying kernel access */
          buf[0] = 0;
          strncpy_from_kernel_nofault(buf, (void *)unsafe_addr,
BPF_STRNCPY_LEN);
  }

or similar. No?

                   Linus
