Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CC41D2359
	for <lists+linux-parisc@lfdr.de>; Thu, 14 May 2020 02:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732871AbgENAAD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 13 May 2020 20:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732867AbgENAAC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 13 May 2020 20:00:02 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FD2C061A0E
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 17:00:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g1so1499551ljk.7
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 17:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fasYih196bvKUHb0YCxHna3fp2u2qNy7HWnYHVsQ+sQ=;
        b=fD3hyHvKHx/67q1VTFKCR74zDcE6394aAhGXhl0a0C48TMMb4AnhPQvs7IdErH6CX2
         um+ec95QL1F0EfXLmER3SmoJ0T+gygc4SnxysABRELnzBjVWudgYOLaUmLBf8bjna0/G
         B5XXX5vTTIkGXj8ZYK86YltWbiai+htzLW22s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fasYih196bvKUHb0YCxHna3fp2u2qNy7HWnYHVsQ+sQ=;
        b=SHQC/fVF844oylCMiNImfvwdAnd52h1MsZz6F5FcVQjFLfkYBXfvXeAfrtGR4Nk5Z6
         JlA/xIDg+vkQWQA10LkH89tAIS8HuD+NOpQGinXsnH7Lr640RhPnFnEeA8CB3BFtOt/7
         +m3WiRfJ9ELsUshai9Lg/EVVj1FeUlyNAviVXiga32ceRxBRtqoT68qOWg/S98i5Soig
         1+kxd4n3xZlQQ5EU6VVsjOxZZOdskIH/FONvO9TWJaripo+mCLWBr21IkP/Vq+26mUvg
         +k0xLaYgGR2dOPv8Hi7HP0a/kCpBawvhaB5UhJ5c0b8DYbwTe4wKjOpPu5nXx/xOibUq
         tltw==
X-Gm-Message-State: AOAM531uwQB2/ctzpw9fBzZi60x2W3dJRlf9NUSMZDzMR7Ps3+nedEL3
        9eXWN/4ap73eUnSrTNdKktoRu6QFIao=
X-Google-Smtp-Source: ABdhPJwZLi1vunWZV2pHnjm25/jJngW7jWMkTFXIYMJAibeGdTgnse7Rc3eXeW3gW+e84ORtw5ItAA==
X-Received: by 2002:a2e:81d5:: with SMTP id s21mr890972ljg.258.1589414398663;
        Wed, 13 May 2020 16:59:58 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id p8sm478247ljn.93.2020.05.13.16.59.56
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 16:59:57 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id u6so1516484ljl.6
        for <linux-parisc@vger.kernel.org>; Wed, 13 May 2020 16:59:56 -0700 (PDT)
X-Received: by 2002:a05:651c:319:: with SMTP id a25mr857486ljp.209.1589414396039;
 Wed, 13 May 2020 16:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200513160038.2482415-1-hch@lst.de> <20200513160038.2482415-12-hch@lst.de>
 <CAHk-=wj=u+nttmd1huNES2U=9nePtmk7WgR8cMLCYS8wc=rhdA@mail.gmail.com>
 <20200513192804.GA30751@lst.de> <0c1a7066-b269-9695-b94a-bb5f4f20ebd8@iogearbox.net>
 <20200514082054.f817721ce196f134e6820644@kernel.org>
In-Reply-To: <20200514082054.f817721ce196f134e6820644@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 13 May 2020 16:59:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjBKGLyf1d53GwfUTZiK_XPdujwh+u2XSpD2HWRV01Afw@mail.gmail.com>
Message-ID: <CAHk-=wjBKGLyf1d53GwfUTZiK_XPdujwh+u2XSpD2HWRV01Afw@mail.gmail.com>
Subject: Re: [PATCH 11/18] maccess: remove strncpy_from_unsafe
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Christoph Hellwig <hch@lst.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
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

On Wed, May 13, 2020 at 4:21 PM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
>
> For trace_kprobe.c current order (kernel -> user fallback) is preferred
> because it has another function dedicated for user memory.

Well, then it should just use the "strict" kernel-only one for the
non-user memory.

But yes, if there are legacy interfaces, then we might want to say
"these continue to work for the legacy case on platforms where we can
tell which kind of pointer it is from the bit pattern".

But we should likely at least disallow it entirely on platforms where
we really can't - or pick one hardcoded choice. On sparc, you really
_have_ to specify one or the other.

                  Linus
