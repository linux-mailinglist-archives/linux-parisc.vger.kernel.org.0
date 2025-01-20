Return-Path: <linux-parisc+bounces-3234-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C099FA170E6
	for <lists+linux-parisc@lfdr.de>; Mon, 20 Jan 2025 17:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDA0E3A0FF5
	for <lists+linux-parisc@lfdr.de>; Mon, 20 Jan 2025 16:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDD61EB9EF;
	Mon, 20 Jan 2025 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Es7OSTtm"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9391EB9F3
	for <linux-parisc@vger.kernel.org>; Mon, 20 Jan 2025 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737392285; cv=none; b=d4MMxvc4sOU18bsYPxjC4K4L+yhRFNGvYZb+/uouj1oOVnuxGgwPk0u1H/7J9u/M+aCpkEYK4gxUg2cdLyaDgeDLilpvpXF02csmymmjiiX2V8YrWsEuAb0lu8vPmf7/QYKsN0kBC8BpHMc13WXQFM+03rdcT9vWTjHm7VhTNnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737392285; c=relaxed/simple;
	bh=V3Tzb/d8KGJAv9XZYdlyyfNCQAyeVoMMqgcMB12jSKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nmuIZGcXLLVnmpRxhW7zvc4cOkpNsjl7JH6WZbwDhli8I7K7khPPr3VYx+sFhIh58mhMqKANd81KseZog7Bd1ofmOFqmRaXATyiMDr+72/WT7oxa3XW9LrBi7vQaCH5QQLL0+P3TOIE0QWVnrF05YIgS0pl/i1Z/NjNONz2XPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Es7OSTtm; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so5961348a91.3
        for <linux-parisc@vger.kernel.org>; Mon, 20 Jan 2025 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737392283; x=1737997083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eikf/LMzgzcqql2/teyz8Otf/XK6+g1oQ+EmcV7Rlg4=;
        b=Es7OSTtmtNI1QVjg+TOgkNm9Ude4t/sHUuiC2xdCvKGsAzklC7azuzkWxahG1aRzgA
         vCdOtzxBU9HgLOgHVmzHCVyIUXA4AMKOqXAstOTB4JFjkqNZD2b8VaXcb71IKDwetBF5
         Bmo3MHa5vCN2YYXrdZmd0v88uPn3Ll0lINQlluI/iJA3qdjJF6EH6r2YzMiX39xL09XR
         h0VIO61UJunrxGTxWGVvtEa9vFIa5bAj39uyDIHnFdLB87AsiIYIGKj9esOkI4zZFsii
         rm5P82SAlfJ9ZxakBAQlx2SIC3csDhN+NfOJDaj9OOLLPN/wMy/wltxV59EN5QSQ0ODj
         KntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737392283; x=1737997083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eikf/LMzgzcqql2/teyz8Otf/XK6+g1oQ+EmcV7Rlg4=;
        b=Ou6+mgz0PWQDvwESG+fi1Tie3ClXQSYf72DzRfgUD4qXF4FJOasDxY1HdTO5ZBTf9e
         itiBlQu+fTCbWJ4MzIqhhNOg+giS2cW3RFjSsX2lwwvP9vA4eTgff1YdqYzbyAuTHs/o
         E50r0KSFJzChiEUmO1+XdM4XaQYD5CxRMruu2HsPGrVvR94U3YZBvdYUeCPPqSsTQrZ1
         LAHpZ62t6xTWzzhYPAlBgsnvHvE+ro5aMEcT3ibEjIthF6pxmVohaG2qax+flMAD/IN1
         hfbTBWWJiZa5sHshTmxp0Bb5lJoQoqxES8BlYacojTMKIMm7xsubnSdXWgekMTrTb734
         HHeg==
X-Forwarded-Encrypted: i=1; AJvYcCXQnowJ9zrE45VlqYL+CPZ404/9MZ9a7CqtWwJygaLrrgWApccB5zrV19CApbt3DGeOUps6a1NABdWPppk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZWSpIodDfB7KlUZJWdTF5vATTc7hxglgz1LCHw0AMGk1OPui
	g0Cukar/UQ8vrGTurYe/KuJmLeySbmQfuBOJpanPDbgeaXIhNKQI
X-Gm-Gg: ASbGncvAEsnX0GSYPFNSDwEXexxu4d9kOCJ3KcQCuZKAdOGkY6pKvOC/4JVQ8zrtd4j
	8B7bJl+10IUvMXJewBUIgyMMrObmaEl+Wc+5RErauUsXt4z0n9cVrsRhQ01865N6L35mraPWnDa
	fwRMeN/C3fBJTpqD+NRDX5sC8S1JKVbXJJmUGaPqPovBatzKvUhC7kTjJMkfbURmAuVXGa375Vu
	htyjzndJLBkNdzK6gRk3FD9G98pf6gslFOUUVWXgVWRk0fOVUfaHfUuS70waPnPQy0HVdlfjFpx
	Xq4RjYcHhG/8/Hfl3kK9S3STcdmuELopHaEi2/6ukxw=
X-Google-Smtp-Source: AGHT+IFCHL2muZZ7xf8b2dHI3PxolR5SyeiYvTuFoOVMgEpwOcjuslQoJIy8a8ZLnkZI6xrjaq+Y3w==
X-Received: by 2002:a05:6a00:928b:b0:728:e382:5f14 with SMTP id d2e1a72fcca58-72dafa1091emr17292675b3a.9.1737392282718;
        Mon, 20 Jan 2025 08:58:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f07c6sm7624355b3a.17.2025.01.20.08.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 08:58:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <34397f4d-c8f3-4a71-a656-a3caf7c1c2ea@roeck-us.net>
Date: Mon, 20 Jan 2025 08:58:01 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Temporarily disable jump label support
To: Helge Deller <deller@kernel.org>, linux-parisc@vger.kernel.org
References: <Z4lpa9qoJClb6X7Z@p100>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z4lpa9qoJClb6X7Z@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/25 12:17, Helge Deller wrote:
> The 32-bit Debian kernel 6.12 fails to boot and crashes like this:
> 
>   init (pid 65): Protection id trap (code 7)
>   CPU: 0 UID: 0 PID: 65 Comm: init Not tainted 6.12.9 #2
>   Hardware name: 9000/778/B160L
> 
>        YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>   PSW: 00000000000001000000000000001111 Not tainted
>   r00-03  0004000f 110d39d0 109a6558 12974400
>   r04-07  12a810e0 12a810e0 00000000 12a81144
>   r08-11  12a81174 00000007 00000000 00000002
>   r12-15  f8c55c08 0000006c 00000001 f8c55c08
>   r16-19  00000002 f8c58620 002da3a8 0000004e
>   r20-23  00001a46 0000000f 10754f84 00000000
>   r24-27  00000000 00000003 12ae6980 1127b9d0
>   r28-31  00000000 00000000 12974440 109a6558
>   sr00-03  00000000 00000000 00000000 00000010
>   sr04-07  00000000 00000000 00000000 00000000
> 
>   IASQ: 00000000 00000000 IAOQ: 110d39d0 110d39d4
>    IIR: baadf00d    ISR: 00000000  IOR: 110d39d0
>    CPU:        0   CR30: 128740c0 CR31: 00000000
>    ORIG_R28: 000003f3
>    IAOQ[0]: 0x110d39d0
>    IAOQ[1]: 0x110d39d4
>    RP(r2): security_sk_free+0x70/0x1a4
>   Backtrace:
>    [<10d8c844>] __sk_destruct+0x2bc/0x378
>    [<10d8e33c>] sk_destruct+0x68/0x8c
>    [<10d8e3dc>] __sk_free+0x7c/0x148
>    [<10d8e560>] sk_free+0xb8/0xf0
>    [<10f6420c>] unix_release_sock+0x3ac/0x50c
>    [<10f643b8>] unix_release+0x4c/0x7c
>    [<10d832f8>] __sock_release+0x5c/0xf8
>    [<10d833b4>] sock_close+0x20/0x44
>    [<107ba52c>] __fput+0xf8/0x468
>    [<107baa08>] __fput_sync+0xb4/0xd4
>    [<107b471c>] sys_close+0x44/0x94
>    [<10405334>] syscall_exit+0x0/0x10
> 
> Bisecting points to this commit which triggers the issue:
> 	commit  417c5643cd67a55f424b203b492082035d0236c3
> 	Author: KP Singh <kpsingh@kernel.org>
> 	Date:   Fri Aug 16 17:43:07 2024 +0200
> 	        lsm: replace indirect LSM hook calls with static calls
> 
> After more analysis it seems that we don't fully implement the static calls
> and jump tables yet. Additionally the functions which mark kernel memory
> read-only or read-write-executable needs to be further enhanced to be able to
> fully support static calls.
> 
> CONFIG_SECURITY_YAMA=y was one option to trigger the issue.
> 

Your configuration triggers the problem for me, but I do have
CONFIG_SECURITY_YAMA enabled in my configuration and don't see the problem
there. There must be something else, but I have been unable to figure out
what exactly it is.

Either case, this is better than crashing, so:

> As a temporary solution disable JUMP_LABEL functionality to
> avoid the crashes.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: Guenter Roeck <linux@roeck-us.net>
> 

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter


