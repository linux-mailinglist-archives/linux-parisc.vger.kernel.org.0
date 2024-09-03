Return-Path: <linux-parisc+bounces-2217-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2FD96A6BF
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 20:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363F1288788
	for <lists+linux-parisc@lfdr.de>; Tue,  3 Sep 2024 18:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EFB191F8D;
	Tue,  3 Sep 2024 18:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dLdHfM0h"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85415175D45
	for <linux-parisc@vger.kernel.org>; Tue,  3 Sep 2024 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725389018; cv=none; b=BsVWP3oBLaqj0bU0awrs62SRDoKPrSNW9WyMdmnOR+oIleGB2hrxgyjt4Ogi2I7cANU92okPpK/xzLsMbXKV5dE8cfc1lL5fmAMNfdHiZLTZw1h2F6bhpcxdSBjIQCPvcGxZ8H6SB6uZequP7HNBpnXZp+qw77F64fyoJb99W/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725389018; c=relaxed/simple;
	bh=Vrj6/05jRt2uY03EgftYD7q7dWPhXqzaJDztOoZvlZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwKdKssZoZ9p2+fCl2GzGGDDm9C7ZJtbPXJs0UP9vCBOQn69VmqtF8kQzCS0NDcqxm+fUsBCpJIzLOBun4cs6HmXx51U1p6X1b3HAoSahubA32lamyJYENvfvi4go7QAM65pPBwdv3ypgSCwxswY4dn9FIV9V8oHhZcEhstboF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dLdHfM0h; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5353d0b7463so9638317e87.3
        for <linux-parisc@vger.kernel.org>; Tue, 03 Sep 2024 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1725389014; x=1725993814; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ODYdcN8Hxw4ndq6m0wtriIL/Eaism2Bz3VxeMOOInA=;
        b=dLdHfM0hJLKBcVGZZOUcLqZ0oNEvSd4gX3oGNEmi5h8ZVOD7WNfFqrevkcHgXBv7IG
         WGRzXwX/R6vBbym9CZjtVwlKtWx1SvPh0uWT8eZkk+/xI5u9djvVfToz82RNkCXD7rW1
         +rue3F2rhg83zYWulNSHT2Ej3hYCsXJMpsq/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725389014; x=1725993814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ODYdcN8Hxw4ndq6m0wtriIL/Eaism2Bz3VxeMOOInA=;
        b=rc9ospN9w5oEKqIVqbVVdeXbDTyh3Ae2eJfv4tMy9zJYjHMWodVL9K1BL5u6Dj6u28
         v9OnEw2/AWvbQj13KKhRee6daSc3sm4ggqbQ/hhHWtIjilOAF/l54Sa5MUptZjS3a12w
         ANeg+ws7I655rPH4tpztKYvLv6wW1qpqiL0Sq/e2KBnTJTDXvnDTXqp4IH0sb6qvoupv
         4gVhUfd4f8ZVc4Tdd5iKXbX6Z5zHjBiZG4j30qH2s76sMVsUacQYMMPMauK4yxryvCcU
         OUoCAYcDnKJhMBWR+TyCmi5l2svmh/K1jb2gtlxQiZN6jBlNdLBNrzOZd+boWvhfUh5j
         w4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXwiacbkhj4fpFQVddUkuCWhcvD3uAuiXQ1jxlezeI/Lqz/Mlh/t4tGeUyBFtx0PJfIIvMK8Oy4T7aYHQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZKNzm+TLeiDU7lCu51fZlqn9BCfpbK8pTqpC2DaoTqzP1Xp/
	E1Co2n161tHsr+n+G1Xwd9oLP45dH09kVqgWCNWomI3SQxQdzYpQq2ZxZjXbSyCGoo7TCDb76qN
	u/H5YZA==
X-Google-Smtp-Source: AGHT+IEraQH9OcHU/XStJ+iUDdPT5t/GEUO6AxbbA4L/Q+IgRudybpeeqUdDnPdE6mfzwPZ4MvU3KQ==
X-Received: by 2002:a2e:b8d6:0:b0:2f1:750d:53a7 with SMTP id 38308e7fff4ca-2f6105c4993mr174566011fa.8.1725389013877;
        Tue, 03 Sep 2024 11:43:33 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a239fbeedsm129843866b.46.2024.09.03.11.43.32
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 11:43:32 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8683dc3b17so354801066b.3
        for <linux-parisc@vger.kernel.org>; Tue, 03 Sep 2024 11:43:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4KIRAJay5EyvXANgC6vP1zyuWC0uBir4y+uHOzn0JB3PV8jAy3Ux0WZuvG0OqDwaCgatPswfxUwX/ypY=@vger.kernel.org
X-Received: by 2002:a05:6402:27c7:b0:5c2:5620:f72 with SMTP id
 4fb4d7f45d1cf-5c2562011e0mr6545096a12.0.1725389012268; Tue, 03 Sep 2024
 11:43:32 -0700 (PDT)
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
 <250f3ae6-3a81-40c7-a747-4713e8888510@gmx.de>
In-Reply-To: <250f3ae6-3a81-40c7-a747-4713e8888510@gmx.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Sep 2024 11:43:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whWchFofUF9cai6QUixbZNGU=pqDxNUdtZvtBkbFc9QfQ@mail.gmail.com>
Message-ID: <CAHk-=whWchFofUF9cai6QUixbZNGU=pqDxNUdtZvtBkbFc9QfQ@mail.gmail.com>
Subject: Re: [PATCH 6.10 000/809] 6.10.3-rc3 review
To: Helge Deller <deller@gmx.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	Linux-MM <linux-mm@kvack.org>, linux-parisc@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Sept 2024 at 00:54, Helge Deller <deller@gmx.de> wrote:
>
> During packaging the bits there is a qemu coding bug, where we missed
> to handle the PSW-V-bit as 32-bit value even on a 64-bit CPU.

Well, that was a fun bug.

And by "fun" I obviously mean "let's hope to never do this again".

               Linus

