Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 262A874530B
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 01:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjGBXbD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jul 2023 19:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjGBXbC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jul 2023 19:31:02 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46FBE41
        for <linux-parisc@vger.kernel.org>; Sun,  2 Jul 2023 16:31:00 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98e109525d6so696702666b.0
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jul 2023 16:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688340659; x=1690932659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a/JDLP8CymZmDlmvB9dj/413Y4QC83ykfU77d78w06M=;
        b=LdrV6yOAytJccBHsFBgKwQH0pa7PQjGxtiGXkdLx0F/5401wQHfTHAU5RFT3qsFu5y
         W/pP4/DUnFUO/WlSkcgPafKXMIqOUHPxJVbaHsAOPITja9TZTu8etqW5O8BRP5487hXl
         Cvm84Szqtd9TjoMY8tfoU5m4WpeOMwJ9X37dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688340659; x=1690932659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/JDLP8CymZmDlmvB9dj/413Y4QC83ykfU77d78w06M=;
        b=YYCWJNONr7wImTCBcW6xz9ZmWr451eTJB157yTG65I0rBP0bJj30IL3gm5ywIOxzLj
         r2SDL+eAes+6S3Yj93re1PKzhxAj9r7jjgiHqkkquD0le7SciVjJEaQGgPWtG8UQFC0O
         /TtzYqtUR7IhfqWht2klZnrkYVbWRBC4dhEC2QYc/mxnuOgy8wCbEgUL4NJ7ZFH6N1VY
         u2TquXVkRPtLVA4fNWQa538OTbwJVfIu6GSPhTwYDqEFkCWBeoogNcpXwMhEx7g8/0CC
         noW3xPUZcRmyHReW6H/bCYuJJAT2diHP7X/4brVTNLgQyxYbp7+XB+OL+7FV4NWeKgUy
         5E3w==
X-Gm-Message-State: ABy/qLbVe1gw8Pw1ZsArZ8z21N6XC6+A4B11JWgn+QGej7cXpG9pXZAg
        ox/Jnj4j/ZNPA8R1eZYOjYeZivdduaksvoFL3O/rsGeL
X-Google-Smtp-Source: APBJJlHiN4J28vXKH0ho0cwe8MilEYA3hg4ruTNPZijRgEyEbzFgwq+1oAqoh7C9KsOZ6igkh5NACg==
X-Received: by 2002:a17:906:3453:b0:98f:8481:24b3 with SMTP id d19-20020a170906345300b0098f848124b3mr7607337ejb.37.1688340659287;
        Sun, 02 Jul 2023 16:30:59 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id z18-20020a1709067e5200b00985bdb7dd5fsm10932346ejr.201.2023.07.02.16.30.57
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 16:30:57 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so6792267a12.0
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jul 2023 16:30:57 -0700 (PDT)
X-Received: by 2002:aa7:c541:0:b0:51d:a4fa:c62c with SMTP id
 s1-20020aa7c541000000b0051da4fac62cmr9098498edr.0.1688340657183; Sun, 02 Jul
 2023 16:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
 <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
 <2023063001-overlying-browse-de1a@gregkh> <0b2aefa4-7407-4936-6604-dedfb1614483@gmx.de>
 <5fd98a09-4792-1433-752d-029ae3545168@gmx.de> <CAHk-=wiHs1cL2Fb90NXVhtQsMuu+OLHB4rSDsPVe0ALmbvZXZQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiHs1cL2Fb90NXVhtQsMuu+OLHB4rSDsPVe0ALmbvZXZQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 2 Jul 2023 16:30:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=0jkhj2=HkHVdezvuzV-djLsnyeE5zFfnXxgtS2MXFQ@mail.gmail.com>
Message-ID: <CAHk-=wj=0jkhj2=HkHVdezvuzV-djLsnyeE5zFfnXxgtS2MXFQ@mail.gmail.com>
Subject: Re: [PATCH 6.4 00/28] 6.4.1-rc1 review - hppa argument list too long
To:     Helge Deller <deller@gmx.de>
Cc:     stable@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, linux@roeck-us.net,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: multipart/mixed; boundary="00000000000021bec905ff897138"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--00000000000021bec905ff897138
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Jul 2023 at 15:45, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Would you mind just verifying that yes, that commit on mainline is
> broken for you, and the previous one works?

Also, while I looked at it again, and still didn't understand why
parisc would be different here, I *did* realize that because parisc
has a stack that grows up, the debug warning I added for GUP won't
trigger.

So if I got that execve() logic wrong for STACK_GROWSUP (which I
clearly must have), then exactly because it's grows-up, a GUP failure
wouldn't warn about not expanding the stack.

IOW, would you mind applying something like this on top of the current
kernel, and let me know if it warns?

.. and here I thought ia64 would be the pain-point. Silly me.

                  Linus

--00000000000021bec905ff897138
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ljm2eq3m0>
X-Attachment-Id: f_ljm2eq3m0

IG1tL2d1cC5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCmluZGV4IGVmMjk2
NDE2NzFjNy4uNjY1MjAxOTQwMDZiIDEwMDY0NAotLS0gYS9tbS9ndXAuYworKysgYi9tbS9ndXAu
YwpAQCAtMTE2OCwxMSArMTE2OCwxNSBAQCBzdGF0aWMgbG9uZyBfX2dldF91c2VyX3BhZ2VzKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLAogCiAJCS8qIGZpcnN0IGl0ZXJhdGlvbiBvciBjcm9zcyB2bWEg
Ym91bmQgKi8KIAkJaWYgKCF2bWEgfHwgc3RhcnQgPj0gdm1hLT52bV9lbmQpIHsKLQkJCXZtYSA9
IGZpbmRfdm1hKG1tLCBzdGFydCk7CisJCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnByZXYgPSBO
VUxMOworCQkJdm1hID0gZmluZF92bWFfcHJldihtbSwgc3RhcnQsICZwcmV2KTsKIAkJCWlmICh2
bWEgJiYgKHN0YXJ0IDwgdm1hLT52bV9zdGFydCkpIHsKIAkJCQlXQVJOX09OX09OQ0Uodm1hLT52
bV9mbGFncyAmIFZNX0dST1dTRE9XTik7CiAJCQkJdm1hID0gTlVMTDsKIAkJCX0KKwkJCWlmICgh
dm1hICYmIHByZXYgJiYgc3RhcnQgPj0gcHJldi0+dm1fZW5kKQorCQkJCVdBUk5fT05fT05DRShw
cmV2LT52bV9mbGFncyAmIFZNX0dST1dTVVApOworCiAJCQlpZiAoIXZtYSAmJiBpbl9nYXRlX2Fy
ZWEobW0sIHN0YXJ0KSkgewogCQkJCXJldCA9IGdldF9nYXRlX3BhZ2UobW0sIHN0YXJ0ICYgUEFH
RV9NQVNLLAogCQkJCQkJZ3VwX2ZsYWdzLCAmdm1hLAo=
--00000000000021bec905ff897138--
