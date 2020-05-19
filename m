Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367E21D9C81
	for <lists+linux-parisc@lfdr.de>; Tue, 19 May 2020 18:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbgESQ0S (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 May 2020 12:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729372AbgESQ0R (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 May 2020 12:26:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE9BC08C5C0
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:26:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q2so352506ljm.10
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dhbRZ27gTq3LlamCeWaOIagumkyuEgHdNj01JBr2vyU=;
        b=a8S6FimrljQCYdqdMRjHudj5xuwSAYeW17sDBke8Wp/wO6Vv10u9cXvAcweW0ZSEYT
         O3hXN68ol8TooTR2xUI2YNd5y+PctNRhxhENJnhmYB+aBitMMtqsXQFMvUY86xEYH5PA
         jFICERjG8bgZGMW0GbVN6qDt50ZsFp9Lq9zCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dhbRZ27gTq3LlamCeWaOIagumkyuEgHdNj01JBr2vyU=;
        b=sNPDtN3tteMsnPPK5Qc/J9nsoBLBMeNCBecUES3aMRf32pfP4NN7RVfKua4IwZOppa
         h+3Szt9wLFR58FyHymA4b012VupdNXqzz0cG6Zhrii9jFiPsbRZiGNiLaf7M7CRee5vg
         VVzE3uSGF352ZvdYrHSSVl3xKoh1Kk9DaP7FcjQKbOxc6vkF03Ijmhp5Ue+QbyY+8Bav
         NX8rBwtBSfguvj1b3hWIX9UBcfnK7G+dVSr5n2/BgTMRLEtrHrie2wOR/yzPS0rSheMU
         1XFdg0wz5tLMS6AtHTZ+C6TcVdxLnuYKclbspScyqnk6bIqujS0Ck/Dih1TRLISQgU4o
         hbgQ==
X-Gm-Message-State: AOAM533/gUmPR7670Bw9qni6WnNoOj1IbVjERlYSPEf+b0hOeNHmnOOR
        IoIl++EytMjN/i2QlSe+yos6IQLgnj0=
X-Google-Smtp-Source: ABdhPJyoysml/fPn3bzXRyqoSdnrTKoZPAFKejw8JuGKxnucAuar2vg96gu2XDa3k5FDUUTf5070aw==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr155937ljo.90.1589905575123;
        Tue, 19 May 2020 09:26:15 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id v10sm61753lja.23.2020.05.19.09.26.13
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 09:26:14 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id u6so381087ljl.6
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:26:13 -0700 (PDT)
X-Received: by 2002:a05:651c:1183:: with SMTP id w3mr128485ljo.265.1589905573160;
 Tue, 19 May 2020 09:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200519134449.1466624-1-hch@lst.de> <20200519134449.1466624-13-hch@lst.de>
In-Reply-To: <20200519134449.1466624-13-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 May 2020 09:25:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=whE_C2JF0ywF09iMBWtquEfMM3aSxCeLrb5S75EdHr1JA@mail.gmail.com>
Message-ID: <CAHk-=whE_C2JF0ywF09iMBWtquEfMM3aSxCeLrb5S75EdHr1JA@mail.gmail.com>
Subject: Re: [PATCH 12/20] maccess: remove strncpy_from_unsafe
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

On Tue, May 19, 2020 at 6:45 AM Christoph Hellwig <hch@lst.de> wrote:
>
> +       if (IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) &&
> +           compat && (unsigned long)unsafe_ptr < TASK_SIZE)
> +               ret = strncpy_from_user_nofault(dst, user_ptr, size);
> +       else
> +               ret = strncpy_from_kernel_nofault(dst, unsafe_ptr, size);

These conditionals are completely illegible.

That's true in the next patch too.

Stop using "IS_ENABLED(config)" to make very complex conditionals.

A clear #ifdef is much better if the alternative is a conditional that
is completely impossible to actually understand and needs multiple
lines to read.

If you made this a simple helper (called "bpf_strncpy_from_unsafe()"
with that "compat" flag, perhaps?), it would be much more legible as

  /*
   * Big comment goes here about the compat behavior and
   * non-overlapping address spaces and ambiguous pointers.
   */
  static long bpf_strncpy_from_legacy(void *dest, const void
*unsafe_ptr, long size, bool legacy)
  {
  #ifdef CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
        if (legacy && addr < TASK_SIZE)
            return strncpy_from_user_nofault(dst, (const void __user
*) unsafe_ptr, size);
  #endif

        return strncpy_from_kernel_nofault(dst, unsafe_ptr, size);
  }

and then you'd just use

        if (bpf_strncpy_from_unsafe(dst, unsafe_ptr, size, compat) < 0)
                memset(dst, 0, size);

and avoid any complicated conditionals, goto's, and make the code much
easier to understand thanks to having a big comment about the legacy
case.

In fact, separately I'd probably want that "compat" naming to be
scrapped entirely in that file.

"compat" generally means something very specific and completely
different in the kernel: it's the "I'm a 32-bit binary on a 64-bit
kernel" compatibility case.

Here, it's literally "BPF legacy behavior", not that kind of "compat" thing.

But that renaming is separate, although I'd start the ball rolling
with that "bpf_strncpy_from_legacy()" helper.

                Linus
