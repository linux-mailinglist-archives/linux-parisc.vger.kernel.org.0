Return-Path: <linux-parisc+bounces-2477-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0883E991886
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 18:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A94E71F21CF4
	for <lists+linux-parisc@lfdr.de>; Sat,  5 Oct 2024 16:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD26D14A0BC;
	Sat,  5 Oct 2024 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hjmW7uOw"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4402F5B
	for <linux-parisc@vger.kernel.org>; Sat,  5 Oct 2024 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728147351; cv=none; b=Zs5N6DcFjbiGW18PcPut7fsW1VJDNU0pi7qgYwFBSDZWEueuqcmOLaPfPWRizhRiWgh8pkV5OEhEBJV89qSkt2KdJu4TwMIPfWIpozhmaBKYKyvs+JINh9q8+VcQdDhG1jQLR8OSLjXnFH2lUD0roQgaQLgvT+PnjuoHNBWr/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728147351; c=relaxed/simple;
	bh=IKELM8Ybxmfb9UUZ946oZOxLiNUuDZPPXTc695oWRYE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GpK1soETMx9g6p0Db9xWlej49xdMweeWRsfb+IkwXzrFyXFKtt4l1WkBpWCReIndSKh/BwnnUhYhGBTU8f0DCw8lO9kfA7r6XfHX/xi5rCc6+oEH+Sfl+06nbUrOT3Eot6lOI6EakOdoodVTtsZzU7ausqLyfTH6OZngWGoqXiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hjmW7uOw; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7e9ff6fb4c6so464947a12.3
        for <linux-parisc@vger.kernel.org>; Sat, 05 Oct 2024 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728147349; x=1728752149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XbpekZFMDuJM/kqKd3t1NOuoXoBPdvnQzAvZj3UcJpc=;
        b=hjmW7uOwa2nhMf3MD4Bnpb19KHX9o64BQt3vproz8zBg1gxXmNxQ0a3oy06BusYu4f
         5Yb1j/HhMVIA7Md4FksoPF87gb+158yCu0g/w4q/vTiRldzuZUmj7vCshSBRT6yQORF1
         K2swUwl52IVWGvQ0YMny52wYHJevW84w95aJZqEyNfaJniNupZvtiz683LPm6d3b/I44
         +wBkXia1oQtwo35w/d/BUrfFHOKWwZai/9i4QRwbcz0c7BPo/5UkDq6jyDdxJJxb56lF
         fWGxOrh+H3tjAthpUh6YNq3BwCFJXbPudqn8zgVbH8G1b2aQbXdXiq7c9cH39oN/1mU2
         HADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728147349; x=1728752149;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbpekZFMDuJM/kqKd3t1NOuoXoBPdvnQzAvZj3UcJpc=;
        b=JzKYlRBXel8fwIzEIkhABdnsKsqu31tUVAL2jGIMM1mgK/AfL2BBx4QLC4SePvUjhE
         FSH1eAh41ScTfAFXzFzwFO43KgzMv/yAP8/6ifMtP2kcKFgxAYTVEb4BUDPJJrMu2z0e
         8INVMuUAh1oE6Aw/7Zy7E/xBNLI/u1SiTKxqj5TwROWz/b4X3Ic6vaFsdDWpYoZa8naD
         iV6YnbNE9CMkW1QZmfrEu7zNLuV4UaGuJRzxdXTwYwezLTcXcg4rYmFht21sntafMbuh
         rcGCH35bEKFq7oaiBOy6KDwuO7VCnHpZDGfeshc3h0NHOna2Q44+Hng2yavmJNplhK4w
         /ENw==
X-Forwarded-Encrypted: i=1; AJvYcCXUJppA3vn7k8He8yPJ4R8ytqWOSzxvZ1NFNIRBUMrHPy23Zype+r92x/VxYJFUYDVQVLx9xBvuBU+EHNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLvGHdyInI1GJBQUZjNKS4NSUmq/IrOqhEfO6DWNKBCi0W+BxR
	k7Ve58kRpOpwDCm2aNMZg9/p6cUwlSC08WsTLT1Dzx+XRzkNgiJv6Hv429qj20Q=
X-Google-Smtp-Source: AGHT+IGyO1IYVhPdhi55RlYsq9gxduEAvQgnIY5+p+NDqB9y/Y7uxg71YFcMhS7N7OB6zYo1UURzpA==
X-Received: by 2002:a05:6a20:c886:b0:1cf:6d20:4d6 with SMTP id adf61e73a8af0-1d6dfa34c23mr10867889637.16.1728147349331;
        Sat, 05 Oct 2024 09:55:49 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm1680505b3a.45.2024.10.05.09.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 09:55:48 -0700 (PDT)
Message-ID: <9bfbfa32-9e23-48c6-8386-a611898ef306@linaro.org>
Date: Sat, 5 Oct 2024 09:55:47 -0700
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: {PATCH] accel/tcg: Fix CPU specific unaligned behaviour
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@kernel.org>
Cc: qemu-devel@nongnu.org, linux-parisc@vger.kernel.org
References: <Zvyx1kM4JljbzxQW@p100> <87cykimsb9.fsf@draig.linaro.org>
 <c05823ff-47dd-40b1-a363-0c4b9cb47713@linaro.org>
Content-Language: en-US
In-Reply-To: <c05823ff-47dd-40b1-a363-0c4b9cb47713@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/4/24 07:24, Richard Henderson wrote:
> I was hoping for a reorg of the target hooks that could allow the target to see 
> misalignment and permission check simultaneously, then the target chooses the order in 
> which the two faults are presented.  Given how complicated tlb_fill is though, I don't see 
> that being an easy job.
> 
> I'll play around with something and report back.
Careful review of exception priorities shows that this cannot be done without expanding 
tlb_fill, because of how the alignment fault must be prioritized in between other faults.


r~

