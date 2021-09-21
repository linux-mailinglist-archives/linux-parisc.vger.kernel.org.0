Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E49413CA5
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Sep 2021 23:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234813AbhIUVk5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Sep 2021 17:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhIUVk4 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Sep 2021 17:40:56 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796FBC061574
        for <linux-parisc@vger.kernel.org>; Tue, 21 Sep 2021 14:39:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y28so3440307lfb.0
        for <linux-parisc@vger.kernel.org>; Tue, 21 Sep 2021 14:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=etMERyO5cXuT7ztAbaC/GlqmC3cAXEqV+9N36mq/9pk=;
        b=I0TyBwnXF+bUo7W4G5JZtneAVf3VMwg/ZWjS9cKUTZHc3nqWhAf+hbgFYVVxC/NqoT
         r3CzEckh+NmHLbQ1A115cBiUFwUrqQCoXFXrmAfU3dmBsHGSQobXi8R3vWwY9ZE21BOp
         fo7LxIUDxEZ4GAH29RGSWScTf97von/Z+SbGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=etMERyO5cXuT7ztAbaC/GlqmC3cAXEqV+9N36mq/9pk=;
        b=ov9bVNs87NBjvtt3zRwbOT+rGoGgh4IwvdVaKpXpZXwUfoMOyCR43GwEC2ByT6rLhn
         AsTQqo9Vsi7CM/PwCb2j9cUEhbNhX5q1dxudRiFO515CcmkYBDUYjiHyUZ1f/WWn75Vc
         2X1yH/kMA51KAQ5UKXSZVtUi78HjMJQR9E2JbLF431CRGWZwUqH40c77RPbYOmaU/pb3
         IDEFIbXF1rF+nv9PZHIKfhbJWvCHMx4fY9NBnvqs01jG6uRokhuZsKU+qFP4WuscOkCx
         mdNofWk+Lc5EjLrk/dAD839U7TuZg/12o2+o+eBG7NUp9U8/TFWKlcrDH42HNal/7FK3
         b+QA==
X-Gm-Message-State: AOAM530rQXJ0Uj+lNNnUT7+6ZlCfw3UIemdXEDyF7w+pHmFB0BiCFAdM
        5IVILvR+i6W6IsMw1K9xNYKylnFXd4Yxtqgmw7k=
X-Google-Smtp-Source: ABdhPJypfPIVw/peL+ZNilbe37xzKeghmO76pG3Zq69OZ/XgJHd4pMDds6kzkDJ2+NOEiwbZgRY7vA==
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr20931665ljk.18.1632260364573;
        Tue, 21 Sep 2021 14:39:24 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id v1sm11477lja.134.2021.09.21.14.39.23
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 14:39:23 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id p29so3000854lfa.11
        for <linux-parisc@vger.kernel.org>; Tue, 21 Sep 2021 14:39:23 -0700 (PDT)
X-Received: by 2002:a2e:7f1c:: with SMTP id a28mr29436587ljd.56.1632260362889;
 Tue, 21 Sep 2021 14:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wibRWoy4-ZkSVXUoGsUw5wKovPvRhS7r6VM+_GeBYZw1A@mail.gmail.com>
 <202109211913.18LJDnXp031134@valdese.nms.ulrich-teichert.org>
In-Reply-To: <202109211913.18LJDnXp031134@valdese.nms.ulrich-teichert.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 21 Sep 2021 14:39:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=whwreptD=WByMRNsv-gfqR3oUu4v33i5Swd2dyeLObyRw@mail.gmail.com>
Message-ID: <CAHk-=whwreptD=WByMRNsv-gfqR3oUu4v33i5Swd2dyeLObyRw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
To:     Ulrich Teichert <krypton@ulrich-teichert.org>
Cc:     Michael Cree <mcree@orcon.net.nz>,
        Guenter Roeck <linux@roeck-us.net>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000001ca22e05cc883ba9"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--0000000000001ca22e05cc883ba9
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 21, 2021 at 12:14 PM Ulrich Teichert
<krypton@ulrich-teichert.org> wrote:
>
> I would try the SRM bootimage (make bootimage), but the build is broken:

The attached patch is too ugly for words, and there's no way I will
commit anything like this.

But it at least builds for and seems to successfully make an alpha
bootimage even when cross-compiling on x86-64.

So something to test, perhaps..

           Linus

--0000000000001ca22e05cc883ba9
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_ktuln2ng0>
X-Attachment-Id: f_ktuln2ng0

IGFyY2gvYWxwaGEvYm9vdC9zdGRpby5jICAgICAgICAgIHwgIDEgKwogYXJjaC9hbHBoYS9ib290
L3Rvb2xzL29ianN0cmlwLmMgfCAxOSArKysrKysrKysrKysrKystLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
bHBoYS9ib290L3N0ZGlvLmMgYi9hcmNoL2FscGhhL2Jvb3Qvc3RkaW8uYwppbmRleCA2MGY3M2Nj
ZDJlODkuLjJiOTFiODZhYWZkZSAxMDA2NDQKLS0tIGEvYXJjaC9hbHBoYS9ib290L3N0ZGlvLmMK
KysrIGIvYXJjaC9hbHBoYS9ib290L3N0ZGlvLmMKQEAgLTI0Nyw2ICsyNDcsNyBAQCBpbnQgdnNw
cmludGYoY2hhciAqYnVmLCBjb25zdCBjaGFyICpmbXQsIHZhX2xpc3QgYXJncykKIAogCQljYXNl
ICdYJzoKIAkJCWZsYWdzIHw9IExBUkdFOworCQkJZmFsbHRocm91Z2g7CiAJCWNhc2UgJ3gnOgog
CQkJYmFzZSA9IDE2OwogCQkJYnJlYWs7CmRpZmYgLS1naXQgYS9hcmNoL2FscGhhL2Jvb3QvdG9v
bHMvb2Jqc3RyaXAuYyBiL2FyY2gvYWxwaGEvYm9vdC90b29scy9vYmpzdHJpcC5jCmluZGV4IDA4
YjQzMGQyNWEzMS4uMWZlYjA0YWY5M2I2IDEwMDY0NAotLS0gYS9hcmNoL2FscGhhL2Jvb3QvdG9v
bHMvb2Jqc3RyaXAuYworKysgYi9hcmNoL2FscGhhL2Jvb3QvdG9vbHMvb2Jqc3RyaXAuYwpAQCAt
MjMsNyArMjMsNiBAQAogI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiAjaW5jbHVkZSA8c3lzL3R5cGVz
Lmg+CiAKLSNpbmNsdWRlIDxsaW51eC9hLm91dC5oPgogI2luY2x1ZGUgPGxpbnV4L2NvZmYuaD4K
ICNpbmNsdWRlIDxsaW51eC9wYXJhbS5oPgogI2lmZGVmIF9fRUxGX18KQEAgLTMzLDYgKzMyLDEx
IEBACiAjIGRlZmluZSBlbGZfY2hlY2tfYXJjaCh4KSAoKHgpLT5lX21hY2hpbmUgPT0gRU1fQUxQ
SEEpCiAjZW5kaWYKIAorLyogSGFjayBoYWNrLiBXZSB3YW50IHRoZSBfYWxwaGFfIHVhcGkvYXNt
L2Eub3V0LmggKi8KKyNpbmNsdWRlICIuLi8uLi9pbmNsdWRlL3VhcGkvYXNtL2Eub3V0LmgiCisj
ZGVmaW5lIF9BU01fWDg2X0FfT1VUX0gKKyNpbmNsdWRlIDxsaW51eC9hLm91dC5oPgorCiAvKiBi
b290ZmlsZSBzaXplIG11c3QgYmUgbXVsdGlwbGUgb2YgQkxPQ0tfU0laRTogKi8KICNkZWZpbmUg
QkxPQ0tfU0laRQk1MTIKIApAQCAtNDgsNiArNTIsMTEgQEAgdXNhZ2UgKHZvaWQpCiAgICAgZXhp
dCgxKTsKIH0KIAorc3RhdGljIF9fYWx3YXlzX2lubGluZSBzaXplX3Qgc3RyX2hhc19wcmVmaXgo
Y29uc3QgY2hhciAqc3RyLCBjb25zdCBjaGFyICpwcmVmaXgpCit7CisJc2l6ZV90IGxlbiA9IHN0
cmxlbihwcmVmaXgpOworCXJldHVybiBzdHJuY21wKHN0ciwgcHJlZml4LCBsZW4pID09IDAgPyBs
ZW4gOiAwOworfQogCiBpbnQKIG1haW4gKGludCBhcmdjLCBjaGFyICphcmd2W10pCkBAIC0xOTAs
NyArMTk5LDcgQEAgbWFpbiAoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAlpZiAodmVyYm9zZSkg
ewogCSAgICBmcHJpbnRmKHN0ZGVyciwgIiVzOiBleHRyYWN0aW5nICUjMDE2bHgtJSMwMTZseCAo
YXQgJWx4KVxuIiwKIAkJICAgIHByb2dfbmFtZSwgKGxvbmcpIGVsZl9waGRyLT5wX3ZhZGRyLAot
CQkgICAgZWxmX3BoZHItPnBfdmFkZHIgKyBmaWxfc2l6ZSwgb2Zmc2V0KTsKKwkJKGxvbmcpIGVs
Zl9waGRyLT5wX3ZhZGRyICsgZmlsX3NpemUsIG9mZnNldCk7CiAJfQogICAgIH0gZWxzZQogI2Vu
ZGlmCkBAIC0yMjAsOCArMjI5LDEwIEBAIG1haW4gKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAK
IAlpZiAodmVyYm9zZSkgewogCSAgICBmcHJpbnRmKHN0ZGVyciwgIiVzOiBleHRyYWN0aW5nICUj
MDE2bHgtJSMwMTZseCAoYXQgJWx4KVxuIiwKLQkJICAgIHByb2dfbmFtZSwgYW91dC0+YWgudGV4
dF9zdGFydCwKLQkJICAgIGFvdXQtPmFoLnRleHRfc3RhcnQgKyBmaWxfc2l6ZSwgb2Zmc2V0KTsK
KwkJICAgIHByb2dfbmFtZSwKKwkJICAgIChsb25nKWFvdXQtPmFoLnRleHRfc3RhcnQsCisJCSAg
ICAobG9uZylhb3V0LT5haC50ZXh0X3N0YXJ0ICsgZmlsX3NpemUsCisJCSAgICBvZmZzZXQpOwog
CX0KICAgICB9CiAK
--0000000000001ca22e05cc883ba9--
