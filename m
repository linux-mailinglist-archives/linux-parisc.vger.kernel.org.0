Return-Path: <linux-parisc+bounces-1948-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E398A94C42B
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Aug 2024 20:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A047A286E37
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Aug 2024 18:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B41978C98;
	Thu,  8 Aug 2024 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BBIrsMWM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FE41422B8
	for <linux-parisc@vger.kernel.org>; Thu,  8 Aug 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723141217; cv=none; b=Ha07fdS080X4SXLDDIYxUBdHw4soBIgKz+NoxqCLjZiPr/sHceOrggL1w2696Zpt26Stx+52xZBBmrA7nlPskEU8n0FSl3AhlpHEg6QeZOXOnNaWK7ql/lIu/NKbr7vMJLfuYL+mJp+KMFcYl7rrcqR/tGHfqVwiKyO1eZU8Jb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723141217; c=relaxed/simple;
	bh=wpwjiHoc7VgLtkIkF9IrlpNoofn0hUJ7BBPVJfy6oSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVPvesBhRXvSvML6RX26e/MdBxIaS+sDQqhoJNNyLgp5+QryPxWCEmDFZfbqh0hcshyM6tMeZXSXYYGChpRpt6i99T/46Zi1D/ulxR/B04ZZoUdBKcHn+v9Pk67x1KlQzabFXqHAgVZwCYrQqTjNYRJNhvj8gr7RXWgTf64JshE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BBIrsMWM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ba482282d3so1605611a12.2
        for <linux-parisc@vger.kernel.org>; Thu, 08 Aug 2024 11:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1723141214; x=1723746014; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vs6dpRbqJripr2KpHyDnR1cQAk+xLDTiAQY8cHPi6fA=;
        b=BBIrsMWMsHWdI16h+ljpxHZxKeYnnK+nm+iFyhyFMWz/RuSHxHkmMiJpKIoZ9m7Rbi
         Ns/V/jjsnOK+75+liSmgh6yhpp/B0oDPaGdxPNsyL2fvbZ1CqSpd1Ov7U5bhxW6DOiyA
         AUoSG2FgLTNqY1KySqLWzjjdeXjRisbXNuGG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723141214; x=1723746014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vs6dpRbqJripr2KpHyDnR1cQAk+xLDTiAQY8cHPi6fA=;
        b=PO3MW7V+gAuVjVyGYjN59NXvaDfrg7IFCX82gwWaYEDyM9BKiKanhXA5qWnYROiNNY
         9JUOom/KdjaJHIf26elV9c4q5V9RMAyffukBPX5muERE/0PlJG0GFXzJxsIRiRjFalPH
         NQOSDMYc68YP0360PUalNQPjON+kqoEuCLp/wYu99KmkfHnakugkoPPiOGir9shjN+mC
         hApie1DwC90+VsYiQ1jWsgkfTVcge33RiCkWJ1KmtorRNMKDhFqYoyVQElWwMtmeQkdt
         3jPnmhVZYp9T4VDqjuIB5YAklt2MDOb7rgwnWS5sLiE+Yip2vhPxoXqIyxPORdcIz09D
         9dVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNctnDsJMO3HfeutuSHr994d6iRfykpOnXJAM5uuNX6Xtp1EP209V4kmezcG7jJg/CE1wLmU1El87KDxoOOO2231L+NKVznQ5Lz/A8
X-Gm-Message-State: AOJu0Yym0cPLZEI2PHgLL2lboNX5qW9tQS3tWyqQDlJ4wDh8omOYPDz0
	Cy6UcKV1tbQdcW7SCX3XMz2YBiEfGj1Z3P4vdGvRpxXi5skR9Z9dmWC4Oqty3ZLOqafeixZJCXj
	eCASxWw==
X-Google-Smtp-Source: AGHT+IECdh2Us7/xaMSJ4F2z049FTpINFq58PrDjQoG1kkTI70U5loa5kVm3/1b2f+e8W3rSrUIvhA==
X-Received: by 2002:a17:907:72c9:b0:a7a:d093:f843 with SMTP id a640c23a62f3a-a8090f04ab8mr201136466b.63.1723141213598;
        Thu, 08 Aug 2024 11:20:13 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ecb1c3sm765448966b.225.2024.08.08.11.20.12
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 11:20:12 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ba482282d3so1605557a12.2
        for <linux-parisc@vger.kernel.org>; Thu, 08 Aug 2024 11:20:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLkLjsmEqslUvg1R8T/zfLJBoXUgGJy7wLeOWwKgSJsPgeipGvZnDbIGRF44u3+2k4yv/lILgE8c3srcTi7B0Jl/jEBKRnvdsZN1Iz
X-Received: by 2002:a17:907:969e:b0:a7d:2c91:fb1b with SMTP id
 a640c23a62f3a-a8090f1a339mr207711166b.68.1723141212363; Thu, 08 Aug 2024
 11:20:12 -0700 (PDT)
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
 <CAHk-=wi_YCS9y=0VJ+Rs9dcY-hbt_qFdiV_6AJnnHN4QaXsbLg@mail.gmail.com>
 <87a5hnyox6.ffs@tglx> <CAHk-=wh4rxXPpYatnuXpu98KswLzg+u7Z9vYWJCLNHC_yXZtWw@mail.gmail.com>
 <8734nezz0g.ffs@tglx>
In-Reply-To: <8734nezz0g.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Aug 2024 11:19:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZUidi6Gm_6XFArT621H7vAzhDA63zn2pSGJHdnjRCMA@mail.gmail.com>
Message-ID: <CAHk-=wiZUidi6Gm_6XFArT621H7vAzhDA63zn2pSGJHdnjRCMA@mail.gmail.com>
Subject: Re: [PATCH 6.10 000/809] 6.10.3-rc3 review
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	Linux-MM <linux-mm@kvack.org>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Aug 2024 at 10:48, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Here is the disassembly from my latest crashing debug kernel which
> shifts it up a couple of pages. Add 0x10 or sub 0x20 to make it work.

Looks like I was off by an instruction, it's the 28th divide-step (not
29) that does the page crosser:

>     4121dffc:   0b 21 04 41     ds r1,r25,r1
>     4121e000:   0b bd 07 1d     add,c ret1,ret1,ret1

but my parisc knowledge is not good enough to even guess at what could go wrong.

And I have no actual reason to believe this has *anything* to do with
an itlb miss, except for that whole "exact placement seems to matter,
and it crosses a page boundary" detail.

None of this makes sense. I think we'll have to wait for Helge. It's
not like parisc is a huge concern, and for all we know this is all a
qemu bug to begin with.

          Linus

