Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6076368B1A5
	for <lists+linux-parisc@lfdr.de>; Sun,  5 Feb 2023 21:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjBEUlo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Feb 2023 15:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjBEUln (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Feb 2023 15:41:43 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821EF193D5
        for <linux-parisc@vger.kernel.org>; Sun,  5 Feb 2023 12:41:38 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id p26so28860589ejx.13
        for <linux-parisc@vger.kernel.org>; Sun, 05 Feb 2023 12:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=RAXg4fKD/6SPLwBhZz74xHccwCI6WZIYpGpGHWQ9ObJeCvGoohTSAtwCqfiD+ZaDQ1
         aIRLI8OL+avYEEBlM4uINCdq7A3GKoZhraxTCpB9pYCimwQ4kIElEWhkml7G/7PEKTT6
         Vy21ly1st4HkkM+1bI4kXV+bK57J6A6HvWAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=VsgE3ICKH3THFDlrs78N/q+/+9AMlZk6vTBGPv0ZpzIL6MuHWmotDPreYINH4TOQf/
         1LctTy1EEJoaKr8iJyu8zYg+1QLvyafodW+G0lD8Cuh4UB+Zi3gOJ2Uc0qXX8sOMjzXo
         tf0b+ol6vgAtbAGN445exSh6IbR33tYICDkY9RhLLDN8wVGVpo+QLVIvivkTJ6BqRnbZ
         vTGIWjX5zYfPqWljWsVUd2LIcfTCUAqonO/L8HckosoY5EuCkMMzqd5LczzbMjVRSHLN
         lwuqLAEgH4ctIVim5mmVkOG8qo7D3ahAZZDbt7QWZPz4mcAwWEyAhgBK54rp6uvsq+/L
         IG6g==
X-Gm-Message-State: AO0yUKWAun3dt37vUF+sLX9VObIjlrLHRj1Fc+cT60jCgSCuSykj512D
        ALJvZ743CWRy0VdJraqr7bzxt+hghmwwNI2H3aM=
X-Google-Smtp-Source: AK7set8exAkBysSlcKDGdKNac01U43PZIIdQPEW+dmS+GMXYCP8pWX5w8aoSMAhjBT0hppopfBKUbA==
X-Received: by 2002:a17:906:d04d:b0:89c:d072:e33e with SMTP id bo13-20020a170906d04d00b0089cd072e33emr3004767ejb.49.1675629696674;
        Sun, 05 Feb 2023 12:41:36 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id lv3-20020a170906bc8300b00883410a786csm4450472ejb.207.2023.02.05.12.41.35
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 12:41:36 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id ud5so29003633ejc.4
        for <linux-parisc@vger.kernel.org>; Sun, 05 Feb 2023 12:41:35 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4402604eje.78.1675629695651; Sun, 05
 Feb 2023 12:41:35 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV>
 <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org> <Y+AUEJpWYdUzW0OD@ZenIV>
In-Reply-To: <Y+AUEJpWYdUzW0OD@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Feb 2023 12:41:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Finn Thain <fthain@linux-m68k.org>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sparclinux@vger.kernel.org
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

On Sun, Feb 5, 2023 at 12:39 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> BTW, since these patches would be much easier to backport than any unification
> work, I think the right thing to do would be to have further unification done on
> top of them.

Ack. I'm not NAKing the patches, I was just hoping that we also have
some way forward.

So "fix the issues, then unify" sounds like the right thing to do to me.

               Linus
