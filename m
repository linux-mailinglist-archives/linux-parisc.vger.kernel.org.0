Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA41B7F0207
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Nov 2023 19:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjKRSmb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Nov 2023 13:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjKRSmb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Nov 2023 13:42:31 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28B9EA
        for <linux-parisc@vger.kernel.org>; Sat, 18 Nov 2023 10:42:27 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso40784161fa.1
        for <linux-parisc@vger.kernel.org>; Sat, 18 Nov 2023 10:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700332946; x=1700937746; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbzyH2ZyAECsisdG+hU0lyimTFxasBONEbchbfYaF1A=;
        b=GuJQwLnsoUjXNAmxmnlx+crMxx326ddapRFuGQ4YkdTcc8F5cWr8uMwvEMLbCIF14X
         Dxwjcp21nNIgL9sEu5n2KLPZgtwJmIMy07tG5tUBowiAIYqGNSNMUh5dGQ9hfIT8OW9D
         dDwpZ7QQ4Pljq/xHBEG7OBJ2NvS4b1ZlE+q0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700332946; x=1700937746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbzyH2ZyAECsisdG+hU0lyimTFxasBONEbchbfYaF1A=;
        b=TfHbpJIlFLVqIGPuNNjn4DJQwS9rms9a4vFXsiuKuA3l3v1VrYriGlg39TBqCM2u0J
         7raIZFnVQBG4YzG21TvkLUv+9UzQBw9Usn9fKcAtthPkJLczxZZ3GrNl/ZVFGc1qsXLp
         6GlxIT4WhIbHcHVwWB8qp0c0M88pc92hDl0gVyl61b3xJdqeDBqcnA4FHcX0lTgCBomd
         t/2dTnu88MLRPDZ/unrTNPNdsyxEMfypM4oOzl37vPZBRiw/BJup/l0v/+OC9FgmW3x2
         DlJF+ElILKrBlUPOnVoAuRvN30eokbxpWshRn4HxR+XYJa5X1/0g2tZ0SLF59FLz1Swe
         XPkw==
X-Gm-Message-State: AOJu0YyXv6Vu+HM4GjxfjMB8gsz1fK8HXFuNwkY9skl0Y7kPzb5UO580
        TAEVAIN5yT8Qu/DpWXLS5q5QwEYr3UjmmzWcKA30aISO
X-Google-Smtp-Source: AGHT+IH+Zk0PZVG18ViUq6+43b3B49lWfQsLfh4BIAchhoIik5tW5/4455+LbA5mQ8f9pltthjKcBg==
X-Received: by 2002:a2e:9e8f:0:b0:2c5:3261:615e with SMTP id f15-20020a2e9e8f000000b002c53261615emr2317566ljk.35.1700332945786;
        Sat, 18 Nov 2023 10:42:25 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id l23-20020a2e8697000000b002c4fdb0ef12sm583625lji.19.2023.11.18.10.42.24
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Nov 2023 10:42:25 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso40783951fa.1
        for <linux-parisc@vger.kernel.org>; Sat, 18 Nov 2023 10:42:24 -0800 (PST)
X-Received: by 2002:a2e:2a83:0:b0:2c8:2e3a:e974 with SMTP id
 q125-20020a2e2a83000000b002c82e3ae974mr2299009ljq.44.1700332944553; Sat, 18
 Nov 2023 10:42:24 -0800 (PST)
MIME-Version: 1.0
References: <ZVjC9P0h5mw3ZbnD@p100> <CAHk-=wgtxsw8hrLNcGz9aJtP17NR3=NSvRdYGfKB52VorhkWzQ@mail.gmail.com>
 <0f492aac-9ba7-4bc6-95b2-6b1104a12244@gmx.de>
In-Reply-To: <0f492aac-9ba7-4bc6-95b2-6b1104a12244@gmx.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Nov 2023 10:42:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgtie=7Z79CssOF10twd1mdQuy1JeiPVgbGFTa9q7JePQ@mail.gmail.com>
Message-ID: <CAHk-=wgtie=7Z79CssOF10twd1mdQuy1JeiPVgbGFTa9q7JePQ@mail.gmail.com>
Subject: Re: [GIT PULL] parisc architecture fixes for v6.7-rc1
To:     Helge Deller <deller@gmx.de>
Cc:     linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Kees Cook <keescook@chromium.org>, Sam James <sam@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 18 Nov 2023 at 10:40, Helge Deller <deller@gmx.de> wrote:
>
> Would the patch below be OK? It's basically yours but with EINVAL.
> (might be whitespace-scrambled!)

I don't particularly like EINVAL, but it's not the kind of
show-stopper that the other issues were.

               Linus
