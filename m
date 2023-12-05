Return-Path: <linux-parisc+bounces-146-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F55806226
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Dec 2023 23:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 088FD1F21460
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Dec 2023 22:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9ADD3FE4C;
	Tue,  5 Dec 2023 22:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzApKLyJ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9329B5
	for <linux-parisc@vger.kernel.org>; Tue,  5 Dec 2023 14:52:52 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-58d4968c362so3944043eaf.0
        for <linux-parisc@vger.kernel.org>; Tue, 05 Dec 2023 14:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701816772; x=1702421572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aQaWJaFkK30ya49jw6sgdDKOexZEsk0Dl6HhmWmn6Ig=;
        b=KzApKLyJuZIrC8HqqPHMuBvEWsUA3s2C6rJaV99w4uykZyrRfuCFlVPvdVUQvLGEBI
         x+q09thx5oN+7aAIn+RjJBk2DrtUyfsr+4prfzzKJD/6fFqooFD2SxsBj1IRYZwgFjTb
         5F80oVE+3hs90ym7NcatILN52u988+aiYEvinB0XlzJVA1iXyYKxvHssYrvWHkwO5RGf
         nBktrZhrVnGdIrxB9IwsCoMxS5lOWTE0GFcFshtmEQ0kNu6yRIrD4KunVSeE0D+S9idq
         FWcs+X14UCATgSK1jfe/w5kgaE6ac2L+ovpebxds33nuqHlSBI896OTa0wHVbEnbfWXE
         /PAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701816772; x=1702421572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQaWJaFkK30ya49jw6sgdDKOexZEsk0Dl6HhmWmn6Ig=;
        b=AytV7CBAz57U9C19EY6sxtDMuQzaolnqyPdEckKJ0W6/7cc7LLaVj6C9VOsCVgpZcG
         K4abjhvfflVwYxtfLyDy86trdYbCXhZ1JmaBNFoWIbaXLxWxC3wnTo50rV1WHWv+c6Up
         dJeqvPN5KmIYNeAPohHI+85DuiCcasHE8yM2tVGDcJqvbnd4sSq8P2c0rvxzRo6ibIrv
         7QSfk5HniAdsPyz8CuIhclqsF9W56MkCrZvwS5aLCrgxEJ6JUJ+PzDp6Uk4EQaMJ6Dum
         T7qqwPZQ0B8HwpkZKPSaK6tDFbm6otGRh6754iuy8BE91LdEdrLk0wO+XW/ZFxz6V9dP
         xRlQ==
X-Gm-Message-State: AOJu0YyjsO+QWw7s9DZO+o+J5mEdbxOEsjBEZ94rlq6ReiJfpaqLrsyD
	K6NcK54+uUj4MfZPK0mHzsiM46v2xu4=
X-Google-Smtp-Source: AGHT+IHf0uDOoyhJJkAyZD7IFK457vt5mOvulRcUkaHRPnzacUfEvH5dy+FXbX+M+u9PTOGUR2yyQw==
X-Received: by 2002:a05:6820:1ac4:b0:58d:97ad:4c00 with SMTP id bu4-20020a0568201ac400b0058d97ad4c00mr74066oob.6.1701816771960;
        Tue, 05 Dec 2023 14:52:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2535427ooy.28.2023.12.05.14.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 14:52:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aeceb922-b6e9-4814-919e-6a82fb869f63@roeck-us.net>
Date: Tue, 5 Dec 2023 14:52:50 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
 <a52d08a9-1114-4d0c-8d10-508d6d49627b@bell.net>
 <b1c864a0-cdda-409a-94c2-1a2cb827f7e1@gmx.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <b1c864a0-cdda-409a-94c2-1a2cb827f7e1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Helge,

On 12/5/23 13:58, Helge Deller wrote:
> On 12/5/23 03:39, John David Anglin wrote:
>> On 2023-12-04 8:08 p.m., Guenter Roeck wrote:
>>> I started to play with the new qemu hppa64 emulation.
> 
> This emulation is in the first row planned to be able to
> be used with 64-bit kernels (until we hopefully once get
> 64-bit userspace).
> Sadly there still seems to be a bug in the emulation
> so that it fails when the kernel is built with specific
> modules.... :-(
> I still don't know where the bug is though.
> 

I don't try to build / load modules, so I don't see that problem.

Couple of observations:
- There are spurious issues if I enable more than one CPU.
   I am not sure if that is realistic (the emulated systems seem to be
   single-CPU systems), so I dropped those tests. Historically
   (with older kernels and/or older versions of qemu), multi-core boots
   didn't work at all (they were slower than single-core),
   so there is definitely an improvement, but it isn't stable enough
   to use for kernel regression testing.
- The e1000 and e1000-82544gc network interfaces don't work
   (those work fine with the 32-bit emulation)
- ne2k_pci doesn't work anywhere. I get either a hang or a spinlock recursion
   error if I try.
- Not sure it if is worth mentioning: There may be hung task crashes in
   usb_start_wait_urb/usb_kill_urb during shutdown when booting from usb
   or when using an usb network interface. That happens with all emulations,
   though, and is not parisc specific.

Guenter


