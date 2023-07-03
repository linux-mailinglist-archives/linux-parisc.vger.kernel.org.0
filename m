Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6BF745484
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 06:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjGCEW7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jul 2023 00:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjGCEW6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jul 2023 00:22:58 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82167188
        for <linux-parisc@vger.kernel.org>; Sun,  2 Jul 2023 21:22:57 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98934f000a5so456476666b.2
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jul 2023 21:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688358176; x=1690950176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LBv71BkedBGYMkqGKsr3uyFzGINH/oPOCalyJ1iyXF8=;
        b=DRfZ+r9wmnsJ2NsqxbykaB7AxtX+KdmCwwNJ9SkKGxD9hJPxqoEtMp9o4pbi8tb9OI
         9aFb7r0VTG2GbW4PSTX0E7PWqIz4CKaoMqzLDzJICvx/cKmPjOWDIW4Irzvu0+VMSSjv
         vLgfTwfb4Jb/TYpj6DJwBofqYVscJ1FrE7BtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688358176; x=1690950176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBv71BkedBGYMkqGKsr3uyFzGINH/oPOCalyJ1iyXF8=;
        b=CnlE/S8KTKYnfnAyXdT9WjyrfG4hz5qacOYO8wfD+uI0ryRBLIo3+0M/GtpZsAkzga
         A/wUkAQ66MMTJKVJ2WgdwSTwEHY36xP79dsMdXTPqKQQ9cG/xQ9okfgRV9nsYuwZW2GU
         A9nEVkY7tZQ4SGGzWYZrjicir6dVkSgpQBDhYETzOyPnprO+POLlZAkmf4NvEoKs6qkg
         iGF67/4A5ezzdzPoNE59/CxIS1Tx/k4l87us8KUDx39Z7apWbHQw7IccWnKUMITAOAGT
         eJkp5jGxIlyJBdLCre3DmCsxwe76JtGEwoNbxOdFTwXnobzdvF5K6Em2bqRjibY27rII
         6JmQ==
X-Gm-Message-State: AC+VfDzEeKOfMJoJHhMsZ8j4k93q0nqVIq+WJcCr6OgNiwJVm2Xy4k88
        it/64aZ9iaexjIdlp2TCGGTMHsyaSD8YKkYaP0Li83s1
X-Google-Smtp-Source: APBJJlF1XVPX6l/pwgdzq6y29lSO/zYCZtLoItp3eX6BSucW06VK5c+ssM6LgFwYqn3UwycjHeDMEQ==
X-Received: by 2002:a17:906:a053:b0:977:abac:9635 with SMTP id bg19-20020a170906a05300b00977abac9635mr6049205ejb.20.1688358175893;
        Sun, 02 Jul 2023 21:22:55 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id qx22-20020a170906fcd600b009931baa0d44sm2961461ejb.140.2023.07.02.21.22.54
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 21:22:54 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51d9865b8a2so4401916a12.3
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jul 2023 21:22:54 -0700 (PDT)
X-Received: by 2002:aa7:c711:0:b0:51d:d4c0:eea5 with SMTP id
 i17-20020aa7c711000000b0051dd4c0eea5mr5453955edq.40.1688358174441; Sun, 02
 Jul 2023 21:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
 <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
 <2023063001-overlying-browse-de1a@gregkh> <0b2aefa4-7407-4936-6604-dedfb1614483@gmx.de>
 <5fd98a09-4792-1433-752d-029ae3545168@gmx.de> <CAHk-=wiHs1cL2Fb90NXVhtQsMuu+OLHB4rSDsPVe0ALmbvZXZQ@mail.gmail.com>
 <CAHk-=wj=0jkhj2=HkHVdezvuzV-djLsnyeE5zFfnXxgtS2MXFQ@mail.gmail.com> <9b35a19d-800c-f9f9-6b45-cf2038ef235f@roeck-us.net>
In-Reply-To: <9b35a19d-800c-f9f9-6b45-cf2038ef235f@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 2 Jul 2023 21:22:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdC6RROG145_YB5yWoNtBQ0Xsrhdcu2TMAFTw52U2E0w@mail.gmail.com>
Message-ID: <CAHk-=wgdC6RROG145_YB5yWoNtBQ0Xsrhdcu2TMAFTw52U2E0w@mail.gmail.com>
Subject: Re: [PATCH 6.4 00/28] 6.4.1-rc1 review - hppa argument list too long
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Helge Deller <deller@gmx.de>, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: multipart/mixed; boundary="0000000000003de76805ff8d8571"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--0000000000003de76805ff8d8571
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Jul 2023 at 20:23, Guenter Roeck <linux@roeck-us.net> wrote:
>
> I can reproduce the problem in qemu. However, I do not see a warning
> after applying your patch.

Funky, funky.

I'm assuming it's the

                                page = get_arg_page(bprm, pos, 1);
                                if (!page) {
                                        ret = -E2BIG;
                                        goto out;
                                }

in copy_strings() that causes this. Or possibly, the version in
copy_string_kernel().

Does *this* get that "pr_warn()" printout (and a stack trace once,
just for good measure)?

              Linus

--0000000000003de76805ff8d8571
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ljmcud9a0>
X-Attachment-Id: f_ljmcud9a0

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
--0000000000003de76805ff8d8571--
