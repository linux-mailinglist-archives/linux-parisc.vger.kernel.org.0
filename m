Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C44D77454A3
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jul 2023 06:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjGCEto (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jul 2023 00:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjGCEtl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jul 2023 00:49:41 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BA11AB
        for <linux-parisc@vger.kernel.org>; Sun,  2 Jul 2023 21:49:40 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb8574a3a1so6141927e87.1
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jul 2023 21:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688359778; x=1690951778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6oL9qDsOjfK7r9knIwSjcUz0vQDj1U2NVBW26ulewU=;
        b=PSvjfcffZImmOnxeP/t9WSgBRfO2Jt9UgJuIHUshK06qEn7O8H2AMErVkCNB7q1gyu
         7d3s7/YqeOc/f/KLOYPcP6dwSgt+yqBhU6t9YVF/o6PU5S9I4NfVZAE9gDmaBIBk6MEs
         ype2PJ/63+By1hA6oJtL1/nWMeFVjF3jqS0zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688359778; x=1690951778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6oL9qDsOjfK7r9knIwSjcUz0vQDj1U2NVBW26ulewU=;
        b=TL5RF3E4AedeacEETTnn7IafEdnnoh7rNK4IeAKcSM7nDNVs4dh+2FJry43xdxDDN7
         ozuF533KfGI26lJ/gh5yjcyrGlOCTsLLF4YD+Ghm440frFPiVOmouNUmzzcsnTzfu6Je
         Sor+hszdPTTo27nEXA8ojZu8Xv4wsyN0TCGBfjKXQu9g0FnpRIuk8TOrG/oQYNVrtfjh
         Jz8/qi91zdukGh7qIELcY0X6hNOKYt9D99JwgUuR4fifDRKIJElnJ248kPlytV+kT5Pv
         0FyhFGHdq/VkYTLohXOW8bVc/Cc7+1e8rR4wYv9bGUBkgD+rzaiKja89awCJExmoeSqV
         Iclg==
X-Gm-Message-State: ABy/qLYn7xMZxkHl6TnXYg3f02WyMEc2DS+fPk0y437bm+sC52dmSFz8
        fNyw3hNp4tjqVeDmBV5/tPDtFCsPw0t7VS5O0OodWbxo
X-Google-Smtp-Source: APBJJlHpNZBAxYV4dCJrLocbuy3DQVELhLp+JgLf0osVfu/mzaq8529q7+3Tk0iycRjNlckqSNgS4Q==
X-Received: by 2002:a19:5047:0:b0:4f8:71bf:a259 with SMTP id z7-20020a195047000000b004f871bfa259mr5387892lfj.67.1688359778050;
        Sun, 02 Jul 2023 21:49:38 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id d23-20020ac244d7000000b004fbb0ccbc9csm695117lfm.83.2023.07.02.21.49.37
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 21:49:37 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so6132590e87.2
        for <linux-parisc@vger.kernel.org>; Sun, 02 Jul 2023 21:49:37 -0700 (PDT)
X-Received: by 2002:a19:6403:0:b0:4f8:5e11:2cbc with SMTP id
 y3-20020a196403000000b004f85e112cbcmr5196334lfb.36.1688359777109; Sun, 02 Jul
 2023 21:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230629184151.888604958@linuxfoundation.org> <CA+G9fYsM2s3q1k=+wHszvNbkKbHGe1pskkffWvaGXjYrp6qR=g@mail.gmail.com>
 <CAHk-=whaO3RZmKj8NDjs4f6JEwuwQWWesOfFu-URzOqTkyPoxw@mail.gmail.com>
 <2023063001-overlying-browse-de1a@gregkh> <0b2aefa4-7407-4936-6604-dedfb1614483@gmx.de>
 <5fd98a09-4792-1433-752d-029ae3545168@gmx.de> <CAHk-=wiHs1cL2Fb90NXVhtQsMuu+OLHB4rSDsPVe0ALmbvZXZQ@mail.gmail.com>
 <CAHk-=wj=0jkhj2=HkHVdezvuzV-djLsnyeE5zFfnXxgtS2MXFQ@mail.gmail.com>
 <9b35a19d-800c-f9f9-6b45-cf2038ef235f@roeck-us.net> <CAHk-=wgdC6RROG145_YB5yWoNtBQ0Xsrhdcu2TMAFTw52U2E0w@mail.gmail.com>
 <2a2387bf-f589-6856-3583-d3d848a17d34@roeck-us.net>
In-Reply-To: <2a2387bf-f589-6856-3583-d3d848a17d34@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 2 Jul 2023 21:49:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgczy0dxK9vg-YWbq6YLP2gP8ix7Ys9K+Mr=S2NEj+hGw@mail.gmail.com>
Message-ID: <CAHk-=wgczy0dxK9vg-YWbq6YLP2gP8ix7Ys9K+Mr=S2NEj+hGw@mail.gmail.com>
Subject: Re: [PATCH 6.4 00/28] 6.4.1-rc1 review - hppa argument list too long
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Helge Deller <deller@gmx.de>, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: multipart/mixed; boundary="000000000000c55c2605ff8de4c1"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--000000000000c55c2605ff8de4c1
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Jul 2023 at 21:46, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Sorry, you lost me. Isn't that the same patch as before ? Or
> is it just time for me to go to bed ?

No, I think it's time for *me* to go to bed.

Let's get the right diff this time.

              Linus

--000000000000c55c2605ff8de4c1
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ljmdsz1o0>
X-Attachment-Id: f_ljmdsz1o0

IGZzL2V4ZWMuYyB8IDkgKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvZXhlYy5jIGIvZnMvZXhlYy5jCmluZGV4
IDFhODI3ZDU1YmE5NC4uNTA0NjJlZTYwODVjIDEwMDY0NAotLS0gYS9mcy9leGVjLmMKKysrIGIv
ZnMvZXhlYy5jCkBAIC0yMTIsNiArMjEyLDkgQEAgc3RhdGljIHN0cnVjdCBwYWdlICpnZXRfYXJn
X3BhZ2Uoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSwgdW5zaWduZWQgbG9uZyBwb3MsCiAJCXJl
dCA9IGV4cGFuZF9kb3dud2FyZHModm1hLCBwb3MpOwogCQlpZiAodW5saWtlbHkocmV0IDwgMCkp
IHsKIAkJCW1tYXBfd3JpdGVfdW5sb2NrKG1tKTsKKwkJCXByX3dhcm4oInN0YWNrIGV4cGFuZCBm
YWlsZWQ6ICVseC0lbHggKCVseClcbiIsCisJCQkJdm1hLT52bV9zdGFydCwgdm1hLT52bV9lbmQs
IHBvcyk7CisJCQlXQVJOX09OX09OQ0UoMSk7CiAJCQlyZXR1cm4gTlVMTDsKIAkJfQogCQltbWFw
X3dyaXRlX2Rvd25ncmFkZShtbSk7CkBAIC0yMjYsOCArMjI5LDEyIEBAIHN0YXRpYyBzdHJ1Y3Qg
cGFnZSAqZ2V0X2FyZ19wYWdlKHN0cnVjdCBsaW51eF9iaW5wcm0gKmJwcm0sIHVuc2lnbmVkIGxv
bmcgcG9zLAogCQkJd3JpdGUgPyBGT0xMX1dSSVRFIDogMCwKIAkJCSZwYWdlLCBOVUxMKTsKIAlt
bWFwX3JlYWRfdW5sb2NrKG1tKTsKLQlpZiAocmV0IDw9IDApCisJaWYgKHJldCA8PSAwKSB7CisJ
CXByX3dhcm4oImdldF91c2VyX3BhZ2VzX3JlbW90ZSBmYWlsZWQ6ICVseC0lbHggKCVseClcbiIs
CisJCQl2bWEtPnZtX3N0YXJ0LCB2bWEtPnZtX2VuZCwgcG9zKTsKKwkJV0FSTl9PTl9PTkNFKDEp
OwogCQlyZXR1cm4gTlVMTDsKKwl9CiAKIAlpZiAod3JpdGUpCiAJCWFjY3RfYXJnX3NpemUoYnBy
bSwgdm1hX3BhZ2VzKHZtYSkpOwo=
--000000000000c55c2605ff8de4c1--
