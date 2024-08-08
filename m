Return-Path: <linux-parisc+bounces-1943-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BCE94C20C
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Aug 2024 17:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE501F27DCA
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Aug 2024 15:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006AC18E02D;
	Thu,  8 Aug 2024 15:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GvhQz1hR"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A710E1DA21
	for <linux-parisc@vger.kernel.org>; Thu,  8 Aug 2024 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723132455; cv=none; b=kATPrONyoA3Fwj4rhIgUFCwMsIxb5BCjnZTUULUCmuwV+rcZD6nXDfmokjE0uiiunB0oqFfzJaxXBSo5sdQgshMv/Ew2JKNCR8wVllyVEHZFwMRdtcJW4XrBcCGAOHzcV2+i0JzUPI6WkhB8B8OuOmr5h9Plp/kK+6aFZEiKV6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723132455; c=relaxed/simple;
	bh=74ofta4tuVDtjmE3sMKxYesbYsKyDSwub6JiP0riGnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sq3FX4eBJc/HPxzu0HX1NeuPNlDBUsSVndRHQNtUuS594tl6yFVtWcOLcrRiTd+w/m0u5sVnnapYdb93o/pQETHcKTcSJHiPQwkwAcctrqmogYuwRum57sY9NmsXw/1XOLedhi39hN//J48i1HMIZa/qItp6xqws7emuv+yLWRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GvhQz1hR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-530e22878cfso1027259e87.2
        for <linux-parisc@vger.kernel.org>; Thu, 08 Aug 2024 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1723132451; x=1723737251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EX5+8aeSzFSKcA+0lbl8uR/ffra+3uio0EheWhiGtJ4=;
        b=GvhQz1hR/ZFcFR7wDq9vTVAsY/AML7Kphkui7TBwoTPHEoxTMl5hNZUBaIFo8zo3iv
         0YHran8uGE0kgFd4i99wH3zAR8TEauPpIPSMjVLhq0566FAFHfRLPo1IBQLx1Z/yUbCX
         tf3MZkSBdRKB1ozLKqYf9s+n/xJIAebLmYPXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723132451; x=1723737251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EX5+8aeSzFSKcA+0lbl8uR/ffra+3uio0EheWhiGtJ4=;
        b=vsvQS/bF+zBYBcyhWTwIUTD+BXQ8egFi9UDDcJO3ouiwBDnnAG3QaNwZQQ4k8Xk8yb
         OcTGbz12I/30LnODLnx5Corak2QrLjpp37Pocjub79KjO/wyEM9Zj6CDYumZo4h7XsaS
         E0KwJiLdlkfRlMHYa4gZoobm/iIQfYF8+q8phnqPjUQYABlUFMnlkZ85Yp5JqBxmzuA8
         6sXTFkWxogdgCcPyqkskTR//oOaJ+X3N97436dVL8SagPKs4b9rBmTQWnGf6Gn6vyZxq
         B2oaIX+Kl76kv69vHJ13YOLhZry9BoTZ+a5Qg+67MMMjFNsvCD8w4RbpnL9gW/b4PuEh
         zwlg==
X-Forwarded-Encrypted: i=1; AJvYcCVulBS+Ffi1Au7n/UHkeg0dj15SDT/qNAT1Pus5JI3etCOHhCthnzPDloyKMi/PsY9yiHW5K/kFc7YJXvw2TrBL6BhgTMeRDP21NDYz
X-Gm-Message-State: AOJu0YxGJt9H2nBtzoOHEl0ODXbrH+2Rs0KxcgggKx+Ft6nbRBJR4aml
	MOZbivh3qRRRf9TZC75yAUqqbGrMVN3MfAZcJcCsXZ1dgaO5MnqIoA95o+ZXmhBjJMl3lFNH2kC
	qG9Lulw==
X-Google-Smtp-Source: AGHT+IEiv7+raGZ2Fy+5nHaK1n5Wo3jb/EFGfUhsVqhw3rHRBU9gNhpxysnDntV10WL0wvPMU5ykDg==
X-Received: by 2002:a05:6512:3e10:b0:52e:f99e:5dd1 with SMTP id 2adb3069b0e04-530e5891c4cmr1500248e87.47.1723132451397;
        Thu, 08 Aug 2024 08:54:11 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3cd0sm770442166b.11.2024.08.08.08.54.10
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 08:54:10 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a9a7af0d0so141995866b.3
        for <linux-parisc@vger.kernel.org>; Thu, 08 Aug 2024 08:54:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6bQaP0bVrsfo0tMIxacfpjnedm3J0fcrS/mAZgpV2plxHr3fXkl/S4wBe0j0QoiTpArf4BPfD4kqpuU3wgISo5L9E8SdpuFdq0VuC
X-Received: by 2002:a17:907:f716:b0:a77:cbe5:413f with SMTP id
 a640c23a62f3a-a8090c2228bmr161289566b.4.1723132449801; Thu, 08 Aug 2024
 08:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731095022.970699670@linuxfoundation.org> <718b8afe-222f-4b3a-96d3-93af0e4ceff1@roeck-us.net>
 <CAHk-=wiZ7WJQ1y=CwuMwqBxQYtaD8psq+Vxa3r1Z6_ftDZK+hA@mail.gmail.com>
 <53b2e1f2-4291-48e5-a668-7cf57d900ecd@suse.cz> <87le194kuq.ffs@tglx>
 <90e02d99-37a2-437e-ad42-44b80c4e94f6@suse.cz> <87frrh44mf.ffs@tglx>
 <76c643ee-17d6-463b-8ee1-4e30b0133671@roeck-us.net> <87plqjz6aa.ffs@tglx>
In-Reply-To: <87plqjz6aa.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Aug 2024 08:53:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_YCS9y=0VJ+Rs9dcY-hbt_qFdiV_6AJnnHN4QaXsbLg@mail.gmail.com>
Message-ID: <CAHk-=wi_YCS9y=0VJ+Rs9dcY-hbt_qFdiV_6AJnnHN4QaXsbLg@mail.gmail.com>
Subject: Re: [PATCH 6.10 000/809] 6.10.3-rc3 review
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	Linux-MM <linux-mm@kvack.org>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Aug 2024 at 02:57, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Careful vs. the pr_once(). It's not necessarily the first allocation
> which trips up. I removed slab_err() in that condition and just printed
> the data:
>
> [    0.000000] Order: 1 Size:  384 Nobj: 21 Maxobj: 16 21 Inuse: 14
> [    0.000000] Order: 0 Size:  168 Nobj: 24 Maxobj: 16 24 Inuse:  1
> [    0.000000] Order: 1 Size:  320 Nobj: 25 Maxobj: 16 25 Inuse: 18
> [    0.000000] Order: 1 Size:  320 Nobj: 25 Maxobj: 16 25 Inuse: 19
> [    0.000000] Order: 1 Size:  320 Nobj: 25 Maxobj: 16 25 Inuse: 20
> [    0.000000] Order: 0 Size:  160 Nobj: 25 Maxobj: 16 25 Inuse:  5
> [    0.000000] Order: 2 Size:  672 Nobj: 24 Maxobj: 16 24 Inuse:  1
> [    0.000000] Order: 3 Size: 1536 Nobj: 21 Maxobj: 16 21 Inuse:  1
> [    0.000000] Order: 3 Size: 1536 Nobj: 21 Maxobj: 16 21 Inuse:  2
> [    0.000000] Order: 3 Size: 1536 Nobj: 21 Maxobj: 16 21 Inuse: 10
>
> The maxobj column shows the failed result and the result from the second
> invocation inside of the printk().

Hmm. There's a few patterns there:

 - the incorrect Maxobj is always 16, with wildly different sizes.

 - the correct value is always in that 21-25 range

and neither of these are particularly common cases for slab objects
(well, at least on x86-64).

I actually went into the gcc sources to look at the libgcc routines
for the hppa $$divU routine, but apart from checking for trivial
powers-of-two and for divisions with small divisor values (<=17), all
it is ends up being a series of "ds" (divide step) and "addc"
instructions. I don't see how that could possibly mess up. It does end
up with the final addc in the delay slot of the return, but that's
normal parisc behavior (and here by "normal" I mean "it's a really
messed up instruction set that did everything wrong, including branch
delay slots")

I do note that the $$divU function (which is what this all should use)
oddly doesn't show up as defined in 'nm' for me when I look at
Guenter's vmlinux file. So there's some odd linker thing going on, and
it *only* affects the $$div* functions.

Thomas' System.map shows some of the same effects, ie it shows $$divoI
(signed integer divide with overflow checking), but doesn't show
$$divU that is right after it. The reason I was looking was exactly
because this should be using $$divU, and clearly code alignment is
implicated somehow, but the exact alignment of $$divU wasn't obvious.

But it looks like "$$divU" should be somewhere between $$divoI and
$$divl_2, and in Guenter's bad case that's

  0000000041218c70 T $$divoI
  00000000412190d0 T $$divI_2

so *maybe* $$divU is around a page boundary? 0000000041218xxx turning
into 0000000041219000?

Some ITLB fill issue together with that delayed branch and a qemu bug?

                Linus

