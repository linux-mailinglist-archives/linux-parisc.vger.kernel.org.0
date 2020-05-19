Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6F11D9CD0
	for <lists+linux-parisc@lfdr.de>; Tue, 19 May 2020 18:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgESQd2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 May 2020 12:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729455AbgESQd1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 May 2020 12:33:27 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CF3C08C5C0
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:33:27 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z6so357846ljm.13
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TFvy+u64rADS0X9wXPVDcnjojb1U9iWCN3n097gO97s=;
        b=KITgpUd5bP2WD+I3Ft3adLmt6MH7MS4MFJexni61RXcXlzD9Gqjwa8Lmdkq9TYyfqS
         KL4aFjs9x04ZYvGYs2IsxZG5dgyhwKLIBJrjoMKhrn6xZPweQeBnKjN1RmntmQCr96TY
         jycjBR645lH/xqU7rOHokwZ9wup3usfS+9Z3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TFvy+u64rADS0X9wXPVDcnjojb1U9iWCN3n097gO97s=;
        b=osKDe45GOpJcg3HlGI4E+WpgPNr58OoevTQSf9VWtZ1pLX4P4rK9fA95zfp28PY/Vz
         egCrVPlnw1nxYwA9EX1NfxRG4L8Kv27uL8ym9EYK3Uj7lSr4kMFJh4WMB7/7yXoXSf43
         uzXUuHfIJOqDuB9U/Q72pN3yO253voLVZmJNhsDX1V6zaktoU5NSL4dQemx3DDjS8lxH
         s+29Q45pxlqqKSwPf6kjm5thDmbBo5Vpu7npOZ1W3GmBMR929/7sWOEV0BGU9XCKkarE
         gNLKBns6tE1sdrQZgn6xCPdWSVY+v2f2+CdS188yyKAG7Ue1Y5PGN472asNQykmUtcTQ
         LyBg==
X-Gm-Message-State: AOAM533Ikb8Kse3Sk74kYrejCateS6d2nGgjsti26vOQgth80bcc+GbO
        mUjTlFC6L0ZC211mj1lhTJhQrINTVCM=
X-Google-Smtp-Source: ABdhPJzzFdHkyqfUn3M23/nRw88oKz0JWZpHVZkiRR47Dc5Fc6ApRMtfy2dM1xrpBqRYubZNjKpwlw==
X-Received: by 2002:a2e:8108:: with SMTP id d8mr165873ljg.248.1589906005008;
        Tue, 19 May 2020 09:33:25 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id u20sm52856ljk.103.2020.05.19.09.33.22
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 09:33:23 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id o14so426943ljp.4
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:33:22 -0700 (PDT)
X-Received: by 2002:a2e:9641:: with SMTP id z1mr145949ljh.201.1589906002260;
 Tue, 19 May 2020 09:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200519134449.1466624-1-hch@lst.de> <20200519134449.1466624-14-hch@lst.de>
In-Reply-To: <20200519134449.1466624-14-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 May 2020 09:33:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjg6v1NU31ku2aAMfX7Yu0oDKRvKeBJVGZFQB7AjcwhAA@mail.gmail.com>
Message-ID: <CAHk-=wjg6v1NU31ku2aAMfX7Yu0oDKRvKeBJVGZFQB7AjcwhAA@mail.gmail.com>
Subject: Re: [PATCH 13/20] maccess: always use strict semantics for probe_kernel_read
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
> +
> +       if (IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) &&
> +           compat && (unsigned long)unsafe_ptr < TASK_SIZE)
> +               ret = probe_user_read(dst, user_ptr, size);
> +       else
> +               ret = probe_kernel_read(dst, unsafe_ptr, size);
...
> -               ret = probe_kernel_read(&c, (u8 *)addr + len, 1);
> +               if (IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) &&
> +                   (unsigned long)addr < TASK_SIZE) {
> +                       ret = probe_user_read(&c,
> +                               (__force u8 __user *)addr + len, 1);
> +               } else {
> +                       ret = probe_kernel_read(&c, (u8 *)addr + len, 1);
> +               }
...
> +       if (IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) &&
> +           (unsigned long)src < TASK_SIZE) {
> +               return probe_user_read(dest, (__force const void __user *)src,
> +                               size);

If you can't make the conditional legible and fit on a single line and
make it obvious _why_ you have that conditional, just use a helper
function.

Either for just the conditional itself, or for the whole operation.
And at least for the bpf case, since you want the whole operation for
that error handling and clearing of the result buffer anyway, I
suspect it would be cleaner to have that kind of
"bpf_copy_legacy_nofault()" function or whatever.

(And see previous email why I dislike that "compat" naming in the bpf case)

                    Linus
