Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF5307A3292
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Sep 2023 23:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234214AbjIPVSA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Sep 2023 17:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbjIPVRg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Sep 2023 17:17:36 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2DC1AD
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 14:17:29 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so3974712a12.0
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694899048; x=1695503848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nsQTPm1Pcces4jObIPICpUNhN/fBbrd7/cdATB/UoXo=;
        b=D5LjQhUoRIbqMGSPn+65QcU0EchMjo6sfLoRPwATheVWdlSQqlUK9f8LWoaRykc/m+
         6NViHNxeNwyzWBsbRsdndewBKL7ZV1xqjUa6JSwJt5p9HR4USquGzChMGNHqefb1NQ1w
         g6P6UaZ+Xr+fgfOWKMvX4KoJ3QbJiRSqm+u4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694899048; x=1695503848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsQTPm1Pcces4jObIPICpUNhN/fBbrd7/cdATB/UoXo=;
        b=Vm46QwoMo0k6qpOl8gKxo5qDJsTRErZw98o1m6UVt2Z8mMouyLOQk6p95xOipa9upZ
         dOBxe9UlxK2ngUJf2K3m5iuhszaK1YOQgKqoU2sFQd5vMYV2YJnuj5/TAFvc9q8ziBoZ
         BnnMLmsiuSrhxcjE46sBoBGtHDfgCFtASDqwhYvgwpIu/xVlGBToPaGgJhOpR8h/V6wV
         tVCE4gdJybWiQ7DA+jrt0Gprv4jsp+Av/0IaVKis6qOwdUYS/uM3YBJ3SEDsPOeFErE2
         qXt5hImA7rDWKoQBmgX6NVZ0+mjPPcouEqQbz1KGkauRA6zhFYHu9nT3mPcLx2J0wJRk
         MoPQ==
X-Gm-Message-State: AOJu0Yz0DWV2VT/jlbs6bkHGDIOpjWXRMrvIxkhayoWAcdS9TEzT5fkM
        X9itLlbI+vOGlNOhD4BXcYKH3QSOp5TuduIDQKGe2JAL
X-Google-Smtp-Source: AGHT+IEsmmqdw4BlatHx8UCCw42drZW1hNqhDY2KWWiQNM2R2z7KH3ulDGHJD3BbSteoRu1UT+C1Pg==
X-Received: by 2002:aa7:d4d7:0:b0:522:ae79:3ee8 with SMTP id t23-20020aa7d4d7000000b00522ae793ee8mr4868142edr.5.1694899047958;
        Sat, 16 Sep 2023 14:17:27 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id l2-20020aa7c3c2000000b005257f90c976sm3879732edr.3.2023.09.16.14.17.26
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 14:17:26 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so3974696a12.0
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 14:17:26 -0700 (PDT)
X-Received: by 2002:aa7:cad3:0:b0:52c:e607:3866 with SMTP id
 l19-20020aa7cad3000000b0052ce6073866mr4342397edt.32.1694899046430; Sat, 16
 Sep 2023 14:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <1694366957@msgid.manchmal.in-ulm.de> <ZQWUzwiKWLk79qbp@debian.me> <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
In-Reply-To: <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 16 Sep 2023 14:17:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com>
Message-ID: <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="0000000000009839770605806f0b"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--0000000000009839770605806f0b
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Sept 2023 at 12:31, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Does the attached patch fix the problem?

So while I didn't confirm the fix myself, I'm pretty sure that was it.
Getting the return value wrong would cause an incorrect extra
vm_acct_memory() call in the non-error case when VM_ACCOUNT is set
(and mean the loss of one in the error case, but the error case never
happens in practice).

Which then causes 'vm_committed_as' to grow when it shouldn't, and
causes exactly that "Committed_AS" in /proc/meminfo to be off.

So here's the same patch, but now with a proper commit message etc.

I haven't pushed it out (because it would be lovely to get a
"Tested-by" for it, and that will make the commit ID change), but I'll
probably do so later today, with or without confirmation, because it
does seem to be the problem.

              Linus

--0000000000009839770605806f0b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-vm-fix-move_vma-memory-accounting-being-off.patch"
Content-Disposition: attachment; 
	filename="0001-vm-fix-move_vma-memory-accounting-being-off.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lmmj2etv0>
X-Attachment-Id: f_lmmj2etv0

RnJvbSA2NWEwZTEwMGM4YTZmODc2M2E5YzNiZjJjMGIzNjFjOGY0MzZlNDJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IFNhdCwgMTYgU2VwIDIwMjMgMTI6MzE6NDIgLTA3MDAKU3ViamVjdDog
W1BBVENIXSB2bTogZml4IG1vdmVfdm1hKCkgbWVtb3J5IGFjY291bnRpbmcgYmVpbmcgb2ZmCgpD
b21taXQgNDA4NTc5Y2Q2MjdhICgibW06IFVwZGF0ZSBkb192bWlfYWxpZ25fbXVubWFwKCkgcmV0
dXJuCnNlbWFudGljcyIpIHNlZW1zIHRvIGhhdmUgdXBkYXRlZCBvbmUgb2YgdGhlIGNhbGxlcnMg
b2YgZG9fdm1pX211bm1hcCgpCmluY29ycmVjdGx5OiBpdCB1c2VkIHRvIGNoZWNrIGZvciB0aGUg
ZXJyb3IgY2FzZSAod2hpY2ggZGlkbid0CmNoYW5nZTogbmVnYXRpdmUgbWVhbnMgZXJyb3IpLgoK
VGhhdCBjb21taXQgY2hhbmdlZCB0aGUgY2hlY2sgdG8gdGhlIHN1Y2Nlc3MgY2FzZSAod2hpY2gg
ZGlkIGNoYW5nZToKYmVmb3JlIHRoYXQgY29tbWl0LCAwIHdhcyBzdWNjZXNzLCBhbmQgMSB3YXMg
InN1Y2Nlc3MgYW5kIGxvY2sKZG93bmdyYWRlZCIuICBBZnRlciB0aGUgY2hhbmdlLCBpdCdzIGFs
d2F5cyAwIGZvciBzdWNjZXNzLCBhbmQgdGhlIGxvY2sKd2lsbCBoYXZlIGJlZW4gcmVsZWFzZWQg
aWYgcmVxdWVzdGVkKS4KClRoaXMgZGlkbid0IGNoYW5nZSBhbnkgYWN0dWFsIFZNIGJlaGF2aW9y
IF9leGNlcHRfIGZvciBtZW1vcnkgYWNjb3VudGluZwp3aGVuICdWTV9BQ0NPVU5UJyB3YXMgc2V0
IG9uIHRoZSB2bWEuICBXaGljaCBtYWRlIHRoZSB3cm9uZyByZXR1cm4gdmFsdWUKdGVzdCBmYWly
bHkgc3VidGxlLCBzaW5jZSBldmVyeXRoaW5nIGNvbnRpbnVlcyB0byB3b3JrLgoKT3IgcmF0aGVy
IC0gaXQgY29udGludWVzIHRvIHdvcmsgYnV0IHRoZSAiQ29tbWl0dGVkIG1lbW9yeSIgYWNjb3Vu
dGluZwpnb2VzIGFsbCB3b25reSAoQ29tbWl0dGVkX0FTIHZhbHVlIGluIC9wcm9jL21lbWluZm8p
LCBhbmQgZGVwZW5kaW5nIG9uCnNldHRpbmdzIHRoYXQgdGhlbiBjYXVzZXMgcHJvYmxlbXMgbXVj
aCBtdWNoIGxhdGVyIGFzIHRoZSBWTSByZWxpZXMgb24KYm9ndXMgc3RhdGlzdGljcyBmb3IgaXRz
IGhldXJpc3RpY3MuCgpSZXZlcnQgdGhhdCBvbmUgbGluZSBvZiB0aGUgY2hhbmdlIGJhY2sgdG8g
dGhlIG9yaWdpbmFsIGxvZ2ljLgoKRml4ZXM6IDQwODU3OWNkNjI3YSAoIm1tOiBVcGRhdGUgZG9f
dm1pX2FsaWduX211bm1hcCgpIHJldHVybiBzZW1hbnRpY3MiKQpSZXBvcnRlZC1ieTogQ2hyaXN0
b3BoIEJpZWRsIDxsaW51eC1rZXJuZWwuYmZyekBtYW5jaG1hbC5pbi11bG0uZGU+ClJlcG9ydGVk
LWFuZC1iaXNlY3RlZC1ieTogTWljaGFlbCBMYWJpdWsgPG1pY2hhZWwubGFiaXVrQHZpcnR1b3p6
by5jb20+CkNjOiBCYWdhcyBTYW5qYXlhIDxiYWdhc2RvdG1lQGdtYWlsLmNvbT4KQ2M6IExpYW0g
Ui4gSG93bGV0dCA8TGlhbS5Ib3dsZXR0QG9yYWNsZS5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8xNjk0MzY2OTU3QG1zZ2lkLm1hbmNobWFsLmluLXVsbS5kZS8KU2lnbmVk
LW9mZi1ieTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgot
LS0KIG1tL21yZW1hcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbXJlbWFwLmMgYi9tbS9tcmVtYXAuYwppbmRl
eCAwNTY0NzhjMTA2ZWUuLjM4MmU4MWMzM2ZjNCAxMDA2NDQKLS0tIGEvbW0vbXJlbWFwLmMKKysr
IGIvbW0vbXJlbWFwLmMKQEAgLTcxNSw3ICs3MTUsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBt
b3ZlX3ZtYShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAl9CiAKIAl2bWFfaXRlcl9pbml0
KCZ2bWksIG1tLCBvbGRfYWRkcik7Ci0JaWYgKCFkb192bWlfbXVubWFwKCZ2bWksIG1tLCBvbGRf
YWRkciwgb2xkX2xlbiwgdWZfdW5tYXAsIGZhbHNlKSkgeworCWlmIChkb192bWlfbXVubWFwKCZ2
bWksIG1tLCBvbGRfYWRkciwgb2xkX2xlbiwgdWZfdW5tYXAsIGZhbHNlKSA8IDApIHsKIAkJLyog
T09NOiB1bmFibGUgdG8gc3BsaXQgdm1hLCBqdXN0IGdldCBhY2NvdW50cyByaWdodCAqLwogCQlp
ZiAodm1fZmxhZ3MgJiBWTV9BQ0NPVU5UICYmICEoZmxhZ3MgJiBNUkVNQVBfRE9OVFVOTUFQKSkK
IAkJCXZtX2FjY3RfbWVtb3J5KG9sZF9sZW4gPj4gUEFHRV9TSElGVCk7Ci0tIAoyLjQyLjAucmMw
LjMwLmdjYTgxYWJhM2IwCgo=
--0000000000009839770605806f0b--
