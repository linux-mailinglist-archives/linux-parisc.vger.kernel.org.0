Return-Path: <linux-parisc+bounces-1954-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FF394C762
	for <lists+linux-parisc@lfdr.de>; Fri,  9 Aug 2024 01:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 227911C227DE
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Aug 2024 23:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5E715A851;
	Thu,  8 Aug 2024 23:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b8dI0Nah"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0BD55769
	for <linux-parisc@vger.kernel.org>; Thu,  8 Aug 2024 23:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723160009; cv=none; b=Z7fepwCprRDIKoTFtTS6zoGaLtdGjV4qQ5uZNFIjADU5oB7iE/1BhyTux29H1ezgx2YeUBoW9wfE/hiLyfl4kvcI0YHq41SXkTmN61JvlHdWUOd0CQxNEUNUCiz/CiXu9PvoHyQ5rro/6efaw9kaIa6VLf/s/fUkTkknlsT42GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723160009; c=relaxed/simple;
	bh=524bUS/jikPk0prhYgnLoimooCyCKUal6MFrC3vnAWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjqJ7P3kccn+2JzUuQLyEvhytA4Lubp5r/BP/Pnyq4zS+lkGhimRbY/aDO/LvsEPnmAu+LRkRjLvQyNRZg7UR2H9igtpqgcrGEr7xPUUvD66xizgfjmeTpo63EztNB6o9VMJCFT0h0Nujfj/Zp/d12yij3A4Ag7JO/zH1vvSCT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=b8dI0Nah; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a61386so1959918a12.2
        for <linux-parisc@vger.kernel.org>; Thu, 08 Aug 2024 16:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1723160005; x=1723764805; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rqlZbaQMZu+3GtlIS+SGt/2J89sdAOurpYSJPp/fzz4=;
        b=b8dI0NahREq9dO3XYD1H0PSI3HAaq6kV2ddtiVdS03REaWNmJrL2HHO2rWJUz4o1RE
         6gn3HHgRYwWOW6m70R5Cv4cwQWdrqagci797hZIliqeJgSkzqBdO42yEOC7lRBufY3t8
         xQccrJb6ee+W/R7+N+XKpm4ckJ/OzhccX8Z7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723160005; x=1723764805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqlZbaQMZu+3GtlIS+SGt/2J89sdAOurpYSJPp/fzz4=;
        b=JbY5r6+Yze3utVF7Pdq2gJme72OxWjsel4rcYY20+aiDKUaHYUBlmBNY/R1g7uHNdy
         VcjrT+ef/QxDvcALQ+YTtMC35ugLYLupz9idfkLkRWYsMwJdaEpGaKsVzgQJLkHy46Z1
         FN8nY6MCBIJvlVp+0jciD8lSZU9i1AE1bmqAUqM25N97zl1eod6RPl0YPX/CQmX9Ch+x
         JIXWg0TYikcp4nA1xlW1HtYi//RC9Go/84W1dtAyioFG6RKW3wcYj2O70aPpaqazmHqQ
         i9MeUVmXevCsDud9QxC7GNoMytMzSYMZn0LuZUNXZIbUQwkNLhBCdGXeAaaZozFD1OH0
         65Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVAkvhWI5b0vP0bCGMDbjzGi6wiTSTURQT1zldH9awHSUPsLWgYF5foGJdzGYTyMT/s5Wdz3Sp8Ia6mrUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92JUC5BYQyJxB6m9grhZPpqAW8OnFh9cncGado5ISJBm+eglp
	pbOD+dkr096xyJjqDia4tUUKWs6HgztUA6x7qXl4KtCePYasz2soUtPPL16+LsGzVr6XuZ/w8Tq
	30i+sIg==
X-Google-Smtp-Source: AGHT+IFivYujyWql6Fvse9ZU+R59AWeXxTPTH3dkODv5BZvaPA47kdfEJLw3veAlJiKmBJascBh+xQ==
X-Received: by 2002:a05:6402:2108:b0:5a3:5218:5d80 with SMTP id 4fb4d7f45d1cf-5bbb233f281mr2696255a12.21.1723160005510;
        Thu, 08 Aug 2024 16:33:25 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c6b836sm1049949a12.49.2024.08.08.16.33.24
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 16:33:24 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5af6a1afa63so1664124a12.0
        for <linux-parisc@vger.kernel.org>; Thu, 08 Aug 2024 16:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYFFtEM7Pdq5zGtLE5PGNaIZIkdorhf7vWklIh7Z8BIljKFCR3RB2Y5/6iEyA2r6zh+q1o2+aCqlmBkqA=@vger.kernel.org
X-Received: by 2002:a17:906:bc02:b0:a77:db36:1ccf with SMTP id
 a640c23a62f3a-a8090e40894mr247283366b.42.1723160003998; Thu, 08 Aug 2024
 16:33:23 -0700 (PDT)
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
 <8734nezz0g.ffs@tglx> <CAHk-=wiZUidi6Gm_6XFArT621H7vAzhDA63zn2pSGJHdnjRCMA@mail.gmail.com>
 <eba27c56-dc36-4410-bb6b-cbe8769b8a6d@roeck-us.net> <ac7284f9-ba29-4068-ab00-82ddc839afaf@bell.net>
 <37f94771-4ebc-46d2-ad10-f145d139dd9d@bell.net>
In-Reply-To: <37f94771-4ebc-46d2-ad10-f145d139dd9d@bell.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Aug 2024 16:33:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiwG4-5UZY9-ZvnhXuGXMsu+u8k5b2BBL-jRcyagW5oxg@mail.gmail.com>
Message-ID: <CAHk-=wiwG4-5UZY9-ZvnhXuGXMsu+u8k5b2BBL-jRcyagW5oxg@mail.gmail.com>
Subject: Re: [PATCH 6.10 000/809] 6.10.3-rc3 review
To: John David Anglin <dave.anglin@bell.net>
Cc: Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	Linux-MM <linux-mm@kvack.org>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Aug 2024 at 15:30, John David Anglin <dave.anglin@bell.net> wrote:
>
> > I believe the shladd instruction should be changed to shladd,l (shift left and add logical).
>
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index ab23e61a6f01..1ec60406f841 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -399,7 +399,7 @@
> -    shladd        \index,BITS_PER_PTE_ENTRY,\pmd,\pmd /* pmd is now pte */
> +    shladd,l    \index,BITS_PER_PTE_ENTRY,\pmd,\pmd /* pmd is now pte */

This doesn't seem wrong, but doesn't RFIR already restore the status word?

So even if the itlb fill modifies C/B, I don't see why that should
actually matter.

But again, parisc is very much not one of the architectures I've ever
worked with, so..

          Linus

