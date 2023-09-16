Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB067A3234
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Sep 2023 21:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237290AbjIPTcd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Sep 2023 15:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238414AbjIPTcI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Sep 2023 15:32:08 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7929F189
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 12:32:03 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40472f9db24so31044295e9.2
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 12:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694892722; x=1695497522; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4tSANpdPZtQ5moNLopTdGJ5bxa+NmMhHjATNkQUyBj8=;
        b=V+yYhZLbKJNP4oqVO+SbF6N94IXgnHqWmje7JtrK8ugDV/G0T6ch4AzUb4ktbH1lO1
         LfDAWEHebisYTcJVk+KYydfZNVfaPcHa5ZK67RsK8b1YwI5/L8Em12k1fFvwqKIsXJf9
         yaHskSM0ljXy7k15eN/nyYb6nn92+o8vSWpYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694892722; x=1695497522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tSANpdPZtQ5moNLopTdGJ5bxa+NmMhHjATNkQUyBj8=;
        b=j53+YM2bvBJz1mchFGrJkpd4kEw9Sv0X/+Fwfq7Sk6gBvTY4NodS6kYTz3yRQ/nuZY
         HzbJHvuRtq1vzok3wkQaTu+JodA9whzCDbS5y/LR78Xa2LjbsxaWjiXzOqfOgjxD90U9
         Wpv3gPE7KL4/XCAIzx0o2y/OopGfwGq0VhPyPbAl+JufEQIvWRHxymhaYV+Yj+V7+iVy
         iM/veDEXvlGn5pxPHZ0JnIkv9sOHGTNiGBzUA0vZC5y6O7ztsU2vxaG3avSr6uabC//F
         +RHLq/VB3pxSidDrChdtKxIezLQ7+ERoya2ttkkezWYuoBIAmwkZqa/nItjtG+Mprnvq
         q1HQ==
X-Gm-Message-State: AOJu0YyihSz774kyfHDFjyhaqoAwp5lKQwQITr/ZxfO4AY728xMSQ4Ts
        28uHO5mg8foSw+lptciNql9Q5xsVozAweH8bxTf+Qffr
X-Google-Smtp-Source: AGHT+IEjkoce+bOq/jDQhoKAtbF11fZ9TE+p1/th0Qb66cSlpFNn+EqKRRYOJ51f3cWrUTwB2qn7bw==
X-Received: by 2002:adf:9bd2:0:b0:31f:fb08:d2c5 with SMTP id e18-20020adf9bd2000000b0031ffb08d2c5mr2479475wrc.62.1694892721564;
        Sat, 16 Sep 2023 12:32:01 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906340a00b009ad854daea6sm4018075ejb.132.2023.09.16.12.31.59
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 12:31:59 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52a4737a08fso3793575a12.3
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 12:31:59 -0700 (PDT)
X-Received: by 2002:a05:6402:229a:b0:530:a19b:175 with SMTP id
 cw26-20020a056402229a00b00530a19b0175mr3639630edb.2.1694892719344; Sat, 16
 Sep 2023 12:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <1694366957@msgid.manchmal.in-ulm.de> <ZQWUzwiKWLk79qbp@debian.me>
In-Reply-To: <ZQWUzwiKWLk79qbp@debian.me>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 16 Sep 2023 12:31:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
Message-ID: <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Michael Labiuk <michael.labiuk@virtuozzo.com>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Cc:     Linux PARISC <linux-parisc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Regressions <regressions@lists.linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: multipart/mixed; boundary="000000000000783fdf06057ef6ee"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--000000000000783fdf06057ef6ee
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Sept 2023 at 04:43, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Thanks for the regression report. Michael had already bisected it [1], so
> telling regzbot:
>
> #regzbot ^introduced: 408579cd627a15
> #regzbot title: huge committed memory due to returning 0 on do_vmi_align_mmunmap() success
>
> [1]: https://lore.kernel.org/linux-parisc/30f16b4f-a2fa-fc42-fe6e-abad01c3f794@virtuozzo.com/

Funky. That commit isn't actually supposed to change anything, and the
only locking change was because it incorrectly ended up doing the
unlock a bit too early (before it did a validate_mm() - fixed in
commit b5641a5d8b8b ("mm: don't do validate_mm() unnecessarily and
without mmap locking").

HOWEVER.

Now that I look at it again, I note this change in move_vma().

-       if (do_vmi_munmap(&vmi, mm, old_addr, old_len, uf_unmap, false) < 0) {
+       if (!do_vmi_munmap(&vmi, mm, old_addr, old_len, uf_unmap, false)) {

and I think that is wrong.

The return value that changed was the old "return 1 if successful
_and_ lock downgraded".

Now it does "lock is always released on success if requested". So the
special "1" return went away, but the failure case didn't change.

So that change to "move_vma()" seems to be bogus. It used to do "if
failed". Now it does "if success".

Does the attached patch fix the problem?

Liam - or am I just crazy? That return value check change really looks
bogus to me, but it looks *so* bogus that it makes me think I'm
missing something.

                       Linus

--000000000000783fdf06057ef6ee
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lmmf85c00>
X-Attachment-Id: f_lmmf85c00

IG1tL21yZW1hcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbXJlbWFwLmMgYi9tbS9tcmVtYXAuYwppbmRleCAw
NTY0NzhjMTA2ZWUuLjM4MmU4MWMzM2ZjNCAxMDA2NDQKLS0tIGEvbW0vbXJlbWFwLmMKKysrIGIv
bW0vbXJlbWFwLmMKQEAgLTcxNSw3ICs3MTUsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBtb3Zl
X3ZtYShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAl9CiAKIAl2bWFfaXRlcl9pbml0KCZ2
bWksIG1tLCBvbGRfYWRkcik7Ci0JaWYgKCFkb192bWlfbXVubWFwKCZ2bWksIG1tLCBvbGRfYWRk
ciwgb2xkX2xlbiwgdWZfdW5tYXAsIGZhbHNlKSkgeworCWlmIChkb192bWlfbXVubWFwKCZ2bWks
IG1tLCBvbGRfYWRkciwgb2xkX2xlbiwgdWZfdW5tYXAsIGZhbHNlKSA8IDApIHsKIAkJLyogT09N
OiB1bmFibGUgdG8gc3BsaXQgdm1hLCBqdXN0IGdldCBhY2NvdW50cyByaWdodCAqLwogCQlpZiAo
dm1fZmxhZ3MgJiBWTV9BQ0NPVU5UICYmICEoZmxhZ3MgJiBNUkVNQVBfRE9OVFVOTUFQKSkKIAkJ
CXZtX2FjY3RfbWVtb3J5KG9sZF9sZW4gPj4gUEFHRV9TSElGVCk7Cg==
--000000000000783fdf06057ef6ee--
