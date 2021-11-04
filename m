Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC2A444DE3
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 05:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhKDEVL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 00:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhKDEVL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 00:21:11 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86BAC061714
        for <linux-parisc@vger.kernel.org>; Wed,  3 Nov 2021 21:18:33 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id g3so7361602ljm.8
        for <linux-parisc@vger.kernel.org>; Wed, 03 Nov 2021 21:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=90++hVL9ksldtHiu9rwvekCenPGcU9OqcBPl5dZt7as=;
        b=eZot60q+nad9YtjcjnPXRTfV8JNqaKl5KHVlr0uAk1mmT49CsV8ecATGG4ZidkpmM3
         pa6z25Z1oCnrk3nMzjXbxoC6MSI3hxq6rq6vXZX1TiB9ntHffkcWMIIXqioPW7EEvwDN
         GxmqSVVJ+hoCX1gCLfow5fGKoChJGcH2sP4PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90++hVL9ksldtHiu9rwvekCenPGcU9OqcBPl5dZt7as=;
        b=2hIK5mMhrtLaZdr9JBng8wyckkSbBqBvFavNYEh1Ulr3/WlrHfdp+oo4haDu5iE4tM
         tcCkaA9xHLgzOybK9ze9LjpUk+kZsN+2mJtbqqjvsT2PEb0IxdJbge5CJww6uiXtQnAX
         D2YA+fzvaNyD85Vjzkj6YTrJAkgiRvWm18GcYN8WhrmdYYTiRAZwmd7YG049rHF37Uqt
         3+wzCmJibinEfGxixzrE7s4B9IppW7pR4pDNe1CC25JkuucaQiVo2sWuC+xsOoCFuUUa
         OSOtJ3hkrkU5TEFG7ixPOoejc3R3PwrP43r7YyNdQvtnKkj9vsJiv8xEo2YUsT2xSOon
         fvPA==
X-Gm-Message-State: AOAM5302Pi/IVu0sSVmjukNxWPModolLmk2SxujDwazHQ4QJtAehcVmf
        l9tg3gOstRSlqiFggojHT6Q8z3vGCGECWkoX
X-Google-Smtp-Source: ABdhPJxHz3VaNdKyJ93S8HrNLiFa+hR00OoSVGwVpeKvJJt/HtNKscfsLj67uhfESxaxZfhVgwMr7A==
X-Received: by 2002:a05:651c:4c8:: with SMTP id e8mr51439502lji.173.1635999511681;
        Wed, 03 Nov 2021 21:18:31 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id q6sm347173lfg.188.2021.11.03.21.18.30
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 21:18:30 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id u11so9470915lfs.1
        for <linux-parisc@vger.kernel.org>; Wed, 03 Nov 2021 21:18:30 -0700 (PDT)
X-Received: by 2002:a19:ad0c:: with SMTP id t12mr45032464lfc.173.1635999510361;
 Wed, 03 Nov 2021 21:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211104031554.GA34798@roeck-us.net>
In-Reply-To: <20211104031554.GA34798@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 3 Nov 2021 21:18:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjvWORtC5vwgavJxpBtV3-q9GGidezS_2NjtUFvqg7H5Q@mail.gmail.com>
Message-ID: <CAHk-=wjvWORtC5vwgavJxpBtV3-q9GGidezS_2NjtUFvqg7H5Q@mail.gmail.com>
Subject: Re: parisc build failures in mainline kernel
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ardb@kernel.org>, Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000ab27e005cfeed125"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--000000000000ab27e005cfeed125
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 3, 2021 at 8:15 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> the mainline kernel fails to build almost all 'parisc' images.

All with CONFIG_SMP?

Does this silly patch fix it?

                 Linus

--000000000000ab27e005cfeed125
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_kvkfue9u0>
X-Attachment-Id: f_kvkfue9u0

IGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggfCAzICsrKwogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2luY2x1ZGUv
YXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5o
CmluZGV4IDc1NjU3YzJjNTRlMS4uMWE1ODc5NWY3ODVjIDEwMDY0NAotLS0gYS9hcmNoL3Bhcmlz
Yy9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCisrKyBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNt
L3RocmVhZF9pbmZvLmgKQEAgLTksNiArOSw5IEBACiBzdHJ1Y3QgdGhyZWFkX2luZm8gewogCXVu
c2lnbmVkIGxvbmcgZmxhZ3M7CQkvKiB0aHJlYWRfaW5mbyBmbGFncyAoc2VlIFRJRl8qKSAqLwog
CWludCBwcmVlbXB0X2NvdW50OwkJLyogMD1wcmVtcHRhYmxlLCA8MD1CVUc7IHdpbGwgYWxzbyBz
ZXJ2ZSBhcyBiaC1jb3VudGVyICovCisjaWZkZWYgQ09ORklHX1NNUAorCXVuc2lnbmVkIGludCBj
cHU7CisjZW5kaWYKIH07CiAKICNkZWZpbmUgSU5JVF9USFJFQURfSU5GTyh0c2spCQkJXAo=
--000000000000ab27e005cfeed125--
