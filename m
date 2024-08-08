Return-Path: <linux-parisc+bounces-1946-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DB294C2CA
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Aug 2024 18:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48FE61F21C3D
	for <lists+linux-parisc@lfdr.de>; Thu,  8 Aug 2024 16:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17B418F2D6;
	Thu,  8 Aug 2024 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Fw0ZBUsf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AFE18E764
	for <linux-parisc@vger.kernel.org>; Thu,  8 Aug 2024 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723134824; cv=none; b=kgB+e8kQm3TaUozBb0+wW+GBjU63bwxBMSJyUu8HvQ4UHzkB2FmVSb1lQRGSXhARnG6zHLYYo4JIfvci6+2kUCQP8tn09PzL4g9VxREWtbD06KHsaqQWhzqOyHTuDV+/BC1C/MylaOmFkm2Ee4tyAXQj5R8vWBjMO+DwNaxN/ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723134824; c=relaxed/simple;
	bh=Cp3sfqfHLcsGlvsmYor99GrDX4MiXqgqAEXC7IaeM1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qt/q51WRbySIrdiAj75iVaacHa0LypJKtC/Uyl0t9V9tnQK/qDYVA3r096kShUVqSgRapMb5J6X08id4nUse6kiwWKZQaJFQy7h1f/xJmwZ87dOo1NBq8iwzumhmGSfj0P15abEZVxGzx8wCl/rpKIHCCd3JUeYYPUDklOZPUzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Fw0ZBUsf; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a309d1a788so1214508a12.3
        for <linux-parisc@vger.kernel.org>; Thu, 08 Aug 2024 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1723134821; x=1723739621; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fdSF9wmMV90yZVPB/6CkjluHABOiI6a5iFzuYp6vi/A=;
        b=Fw0ZBUsfsJBRJUVgKwkv/1bomPn6bXmjn+W5TpX8aiT3852L0NWy+U6hKsJuv98vnn
         s29mcY6GSwNA2KKP9msDpdjbDwk7dRXCEUKd1lo1MCbtXD9ULMJcrVq2LKydMk5XFRvX
         u0B1jJFDeHwkXaaWk53vO21uL7rs9a9AEc9dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723134821; x=1723739621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdSF9wmMV90yZVPB/6CkjluHABOiI6a5iFzuYp6vi/A=;
        b=ajQuZVfFr1563S1TNpwrj+u3W2zyDygvBc5ae76KENk8FioKM0BYvD9Vne02lXxfak
         UGgyHFttPQvb9043xLBzE1LrbYnxRHRZNq48ScZxlfsR+QzIpwI9SOG71nKT1KG6PWUC
         dKBqwbMVPTYH+1yaOQqBylccFqfOIRIxxWmZ1dLuzHYZ+v8G2vjJnOBUxJPR51nD2z/z
         8Rc13lNeXheGsYfy9YLmE6gtYAZhGYqrz9+Ov33koJMwaoERqBxBu39kiZ38YSg9iJIv
         kmCYYKYyboisdO+Rhq6kZY2FV02XmobHxbHviCwAz+EZoQRiZvnEG/eXTT71/4xeh1/T
         ki2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMr6uj6g/t/QjErug2ntjUG7LKRkixc/OOoULeJAPXrm7QYZPpKhwrq4g/sDvNLlbrEa1cu+DNnbehXraiSoXwb+tbOWIwFDru3OSn
X-Gm-Message-State: AOJu0Yz1XfwjW8ZHA0h8OkdBNj3qy7PE1V/sMqI3z4Gv1Gf5gYX5tJ6P
	udAe5u6sj04mauKiQh0MGr34SkbDJ6v2GfU53h7pxPRiKjJWk1YkWFJuYIDFUr/yflWt/j1EwZZ
	LERVE3g==
X-Google-Smtp-Source: AGHT+IE3JIfAMHozSJ5Qk7UfWSMgaAFz0d1OUYXg4/MtOX3s2GfNztm8T2L55j8vM2tO/D3IbjRa2g==
X-Received: by 2002:a17:907:e603:b0:a7d:a031:7bb2 with SMTP id a640c23a62f3a-a8090de765emr194150566b.40.1723134820317;
        Thu, 08 Aug 2024 09:33:40 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ecb551sm756267966b.223.2024.08.08.09.33.38
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 09:33:38 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7aa4ca9d72so138700766b.0
        for <linux-parisc@vger.kernel.org>; Thu, 08 Aug 2024 09:33:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWD4B1RVNaSGiqPQBO6ik9kUpOrvzq3PbOPtFYQT0uSjVuZoJi/u+99FErjsMt3xCaoegQLcqd66W410BxUCbIwmqQnIPMgV0oHcAgK
X-Received: by 2002:a17:907:3f10:b0:a7a:b070:92c0 with SMTP id
 a640c23a62f3a-a8090c825b8mr215179766b.23.1723134817798; Thu, 08 Aug 2024
 09:33:37 -0700 (PDT)
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
 <CAHk-=wi_YCS9y=0VJ+Rs9dcY-hbt_qFdiV_6AJnnHN4QaXsbLg@mail.gmail.com> <87a5hnyox6.ffs@tglx>
In-Reply-To: <87a5hnyox6.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Aug 2024 09:33:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4rxXPpYatnuXpu98KswLzg+u7Z9vYWJCLNHC_yXZtWw@mail.gmail.com>
Message-ID: <CAHk-=wh4rxXPpYatnuXpu98KswLzg+u7Z9vYWJCLNHC_yXZtWw@mail.gmail.com>
Subject: Re: [PATCH 6.10 000/809] 6.10.3-rc3 review
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	Linux-MM <linux-mm@kvack.org>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Aug 2024 at 09:12, Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > But it looks like "$$divU" should be somewhere between $$divoI and
> > $$divl_2, and in Guenter's bad case that's
> >
> >   0000000041218c70 T $$divoI
> >   00000000412190d0 T $$divI_2
> >
> > so *maybe* $$divU is around a page boundary? 0000000041218xxx turning
> > into 0000000041219000?
>
> It uses $$divU which is at $$divoI + 0x250. I validated that in the
> disassembly.

Well, that does support "maybe we have a page crosser issue", but it's
not quite at the delayed branch.

Because that would mean that $$divU starts at 0x41218ec0, and that
means that there are 80 instructions from the start of $$divU to the
end of that 0x41218xxx page.

And if I counted instructions right (I don't have a disassembler, so
I'm just looking at the libgcc sources), that puts the page crosser
not quite at the delayed branch slot, but it does put it somewhere
roughly at or around

        ds      temp,arg1,temp          /* 29th divide step */
        addc    retreg,retreg,retreg    /* shift retreg with/into carry */

so it's around the last few bits of the result. The ones we get wrong.

Which is intriguing, but honestly, I don't see how we could get itlb
misses horribly wrong and not crash left and right.

The $$divU routine is unusual in that it uses that millicode calling
convention, but I think that's just a different register for the
return address.

And it obviously depends on the carry flag, which is pretty unusual.
Maybe if the ITLB fill messes up C, it wouldn't show up in other
areas? But the $$divU result error is more than one single bit getting
cleared.

              Linus

