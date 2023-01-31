Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C27A683774
	for <lists+linux-parisc@lfdr.de>; Tue, 31 Jan 2023 21:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjAaUZP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 Jan 2023 15:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjAaUZP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 Jan 2023 15:25:15 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC00F9769
        for <linux-parisc@vger.kernel.org>; Tue, 31 Jan 2023 12:25:13 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id k4so39697444eje.1
        for <linux-parisc@vger.kernel.org>; Tue, 31 Jan 2023 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S9zE9SYxpAWSxHcA5MCfO5n3twTThlqtds31HX8QFBE=;
        b=aemAfuUnY1ELoSc7IUGtDXonWc+4QG8ERZrpu/U/YwdqE2n2Bpj6luJk/097Q/K8OS
         SFS8Qyyo49VnqHVfbtwXR+U8XaDW2zSatg93gi1FCf1KUp4bR5ZA07l/sIwPOxGMY5Bj
         z+w6W/Yy+ZuDO8CKrXR/rYMxzOKxWFf0lPOEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9zE9SYxpAWSxHcA5MCfO5n3twTThlqtds31HX8QFBE=;
        b=Btl+zBs1xHDNgdzZGRA/L/O6VWoR5oMaduYpkiOXYEpg5DvSRiWZc4qW2bnn0vmwFM
         CAslKVbgJocj3qAYAAbhw66/rn6Nt6SDQwGAEuBk4NueLsI2cmu07KksI7bKIo+bzgVC
         Z+fzsJSmfIa8+oSMkRJSd7vkgK7IW7LK3TOeNWpFKaCzF+5vZCbnd/O420VPIHPGtuPP
         968thtGzQ6VLbZKDGHAoeB1BolXPWozQ2aeCOj1tgjo+S8cW0Hx9UteewvOmRUBeWIqL
         mdhVhQAiyNfBRkNULq8kcIzB3h2/PJaCk9z2bPz3xLCsuPIQf5+r4/9DoZ8uFds9NNb8
         7yUw==
X-Gm-Message-State: AO0yUKXIwd3xVdvWQocxC7zcw6ZvLs3uXbEZjSKQ87SvZ0Udi2hwTrHe
        xR5qouMBBg3EkSAmXDdAtIRO4XcSRwpG+d3mS3Q=
X-Google-Smtp-Source: AK7set8Y7z6bnphHN51TMFgQOrUM88+zt7CK87OuLsTuGj3tn3KLRC7FBiSdRYPBMWEcBZqqlix/9w==
X-Received: by 2002:a17:907:775a:b0:88a:da35:dd51 with SMTP id kx26-20020a170907775a00b0088ada35dd51mr6531874ejc.14.1675196712253;
        Tue, 31 Jan 2023 12:25:12 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id n21-20020a170906089500b0087ba1ed4a58sm7669882eje.191.2023.01.31.12.25.11
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 12:25:12 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id u21so15622710edv.3
        for <linux-parisc@vger.kernel.org>; Tue, 31 Jan 2023 12:25:11 -0800 (PST)
X-Received: by 2002:a50:bb4c:0:b0:4a2:649a:72eb with SMTP id
 y70-20020a50bb4c000000b004a2649a72ebmr1579842ede.70.1675196711395; Tue, 31
 Jan 2023 12:25:11 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV>
In-Reply-To: <Y9lz6yk113LmC9SI@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 31 Jan 2023 12:24:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
Message-ID: <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Al Viro <viro@zeniv.linux.org.uk>, Peter Xu <peterx@redhat.com>
Cc:     linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

[ Adding Peter Xu to the participants, he did a lot of "add generic
helpers" code a few years ago. Peter, see

    https://lore.kernel.org/linux-arch/Y9lz6yk113LmC9SI@ZenIV/

  for context ]

On Tue, Jan 31, 2023 at 12:03 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> However, it never had been done on a bunch of architectures - the
> current mainline still has that bug on alpha, hexagon, itanic, m68k,
> microblaze, nios2, openrisc, parisc, riscv and sparc (both sparc32 and
> sparc64).  Fixes are trivial, but I've no way to test them for most
> of those architectures.

Gaah. The patches look simple and "trivially correct", but I hate how
we duplicate basically the same (complicated) logic across
architectures.

Peter improved a bit on things, but I think we could do better.

Yes, all architectures basically have their own special code for
special error registers etc, and for various errata and/or special
handling for vmalloc addresses of vdso's etc.

And they aren't always translated to the generic flags, looking at
alpha, for example, we have code like this:

        si_code = SEGV_ACCERR;
        if (cause < 0) {
                if (!(vma->vm_flags & VM_EXEC))
                        goto bad_area;
        } else if (!cause) {
                /* Allow reads even for write-only mappings */
                if (!(vma->vm_flags & (VM_READ | VM_WRITE)))
                        goto bad_area;
        } else {
                if (!(vma->vm_flags & VM_WRITE))
                        goto bad_area;
                flags |= FAULT_FLAG_WRITE;
        }

because it uses the alpha internal "cause < 0" logic, instead of
having translated it into FAULT_FLAG_INSTRUCTION.

But *if* the alpha code were to just translate it into the
FAULT_FLAG_xyz namespace, apretty much *all* of the alpha
do_page_fault() could have been then done by a completely generic
"generic_page_fault()" that has all of the retry logic, all of the
si_code logic, etc etc.

So in a perfect world, we'd only have the special errata handling (*)
and the "translate to FAULT_FLAG_xyz" code in the architecture code,
and then just call that generic_page_fault() function for what really
is pretty much generic.

And then we would never again have these kinds of "architecture got
the retry wrong" issues.

Would anybody be interested in trying that? Just converting one or two
architectures to a new world order?

But if not, Al's patches all look "obviously fine" to me, but that's
because they basically all do the same thing except for that odd
special TSTATE_PRIV thing for sparc-64 - why can't that use
'!user_mode(regs)' like everybody else?)

                   Linus

(*) we really have a *lot* of architectures that have gotten
'prefetch' wrong and have errata for prefetch: alpha, arm and x86 all
have magic "bogus fault on prefetch" cases.
