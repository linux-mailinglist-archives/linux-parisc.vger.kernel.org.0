Return-Path: <linux-parisc+bounces-3863-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6430B364AC
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Aug 2025 15:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFE181C22217
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Aug 2025 13:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE86C3469E3;
	Tue, 26 Aug 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="0m1reDW4"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A458342CA2
	for <linux-parisc@vger.kernel.org>; Tue, 26 Aug 2025 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756215186; cv=none; b=OOc3z9Rz1ZFT8ijHge44E7nQqLrbc859sLLne9AOtxHwhZ/Dnny9vyHwHzb8+kQ2/jPbkp97BkZsTQKqgp4gaR+WqX1Mk0cThneMCiA/ixthp5KZa1GaeTSH7TAslm7YqKlofnS2RAVTK3HOUrXAKhxYHoXFIUN4bIsaZ5v9r/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756215186; c=relaxed/simple;
	bh=oWw9E1ARf/liDxi+bd5estjy09+4qZSi69zGI82k4YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIt4VjnAMrg8KZXA9SmBRNl0PtgzgJtAYCmM8ax/brcpjiq0QlYHX8Y4c1b6FJkX+w9/BSHYGsQ20Uj0q4kMWWTK9Oagmpkn3gWf84kP0SV7RLqvuTDb1sZfZ5j8wJkdkcJoWfTFWH27Z3KW8bLFr8r4hkMFiLCbdcKEF+ttbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=0m1reDW4; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ec3b5f05e8so12599995ab.0
        for <linux-parisc@vger.kernel.org>; Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756215183; x=1756819983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=0m1reDW4hAfva0Q73AZIZFTIW2ixbvSgs1vQSkyEGR71DEPrhBuJXaQURutOBynY1v
         2vRClAv4jZk//2U1ABvIoW9v9pGCEjVPeKeR+P/vYwGUnPmsYJ+9pqOPBMvOiGAzGRzP
         aosWWb4mReYkYDqE5H1PeLiJnRbxcS0Qq0SyAjn/fjYVFcHVzlhXddXAE9U4XP3AW4+r
         QnLjmrPENmFKAcl7mweDO5NL7ch0MnNzF8xhgTcz5DAjI33bNIZdZSSxODvDi3NoFl0E
         BiLZ9l93jMHK8lYXw+QEIJKdi4QL95i8PbrXjnVnp9oFJBpIu/nukcCslWqa/rAaYuRa
         hDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215183; x=1756819983;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=JRCo4qT0lYQKpEQ3Exxdtd+TuJ8U+QrGDjpkWQz9mxGXe/jY2y2ytS4v+gvG/lP1Rp
         3mpWH8rAY/VzFKXX20OH1vUj6boZGdlRWQyt4d/fL/+4juHbNUzCkahrKr9v96ovmfz7
         2z35TpUAMnVR7IfbCdK+TjJcElKJloZVW+FCZWUTs3HszLTkt4x71wq4rqFtNgHh5rs4
         YsM2YSBOcZ+HeOv4rLVf58fcD0wNsH/bv69JcEgVnl4XXfnW+P+9yMUi30z6PN3o/PIP
         0gqTyj2vVsaqxWVXogXWh45Uo/g4owUO76HIFUdkb9FifGSl49K2G1sosb+Y7JS8SPbx
         AMZw==
X-Forwarded-Encrypted: i=1; AJvYcCU5VfAACJ51ocOg4NPG1UuZ5AUDW0n123Pm9scyfW8zar0VAQKBr+QJ8aUyb+vyiX5KwOzGFUfIdcA2IvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPD+xWZiQ7ryXFV8sKXossECRmcDM8AdNV05dmmJhCF18XC5MG
	UhRGRg5DLK8GQfILAkUU9VGbzb+UGLMZegFbF+lGzmpfjZgXxv3fRLyat1sCXKIuEFg=
X-Gm-Gg: ASbGnctrkiiHscm4a9koLkLtr1qD1GZ8g1ByaZqav6EZ82ZO0agh85T6/IYWvAUFKPQ
	gCc38qOGOvJox4tTWRQJzci/rJBqWOdJ+wE3FXsfS26ok92towcCwUb8yTKHrLnH/BUS58yaHdw
	25j/0DPE5crDywl+TVdEfa4/dRwuVrtOwjnYn0Nl3zqh0LnM/mZuRbGI1xNG1YAq8GggQ716vhk
	V3NsnFFeqL3JydMJDrRS75C/IP65KjNLSgY+aWtzClP6DGaxda8ZpBzYicnuT1urKfbE5KgeMZI
	vEqKC7txSN/A77nAozXXs6+ccaZbPX0eqS210rBUG1DZPsJ12HNV6sA3LQMhsZGXfG1owDegY/A
	S+v0nXzu/CQZOu+BYaSUrT/Yd9WEK/g==
X-Google-Smtp-Source: AGHT+IHyeNqFLofJtawZSGlF7nwnpmwOET4pLDhklPZVdBrPT2USiWbLxPrFpiB4fDQsUH70NQxHfA==
X-Received: by 2002:a92:c244:0:b0:3ee:7c7a:c880 with SMTP id e9e14a558f8ab-3ee7c7acb24mr41586495ab.28.1756215183022;
        Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886c8fa63casm630889339f.17.2025.08.26.06.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 06:33:02 -0700 (PDT)
Message-ID: <4d8cfe65-a8fd-4f3d-a324-8873f4016ad0@kernel.dk>
Date: Tue, 26 Aug 2025 07:32:59 -0600
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
 <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
 <aK22kUhlxlyvVLax@smile.fi.intel.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <aK22kUhlxlyvVLax@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/26/25 7:28 AM, Andy Shevchenko wrote:
> On Mon, Aug 25, 2025 at 02:48:21PM -0600, Jens Axboe wrote:
>> On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
>>> There are a few places in architecture code for the floppy driver
>>> that may be cleaned up. Do it so.
>>>
>>> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
>>>
>>> Changelog v2:
>>> - combined separate patches sent earlier into a series
>>> - added tags (Helge, Geert)
>>> - fixed typo in the commit message (Geert)
> 
> [...]
> 
>> Applied, thanks!
> 
> Ah, thanks! It's good to know you can take (and actually did that) them.

I've always been happy to apply floppy fixes or cleanups, I just treat
it like any other orhpaned/unmaintained block driver.

-- 
Jens Axboe

