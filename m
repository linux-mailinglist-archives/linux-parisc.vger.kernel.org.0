Return-Path: <linux-parisc+bounces-453-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF288842987
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jan 2024 17:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19C9DB2343D
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jan 2024 16:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13DB12838A;
	Tue, 30 Jan 2024 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViZqwHJ8"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3112839E;
	Tue, 30 Jan 2024 16:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632701; cv=none; b=M0WgQ6mUQ2luL5w8g6p48Mu0AM/Ov5NE/m//lIPeOZmvONc4ZM9wKZsqHqetPP2jm7+nRZJ3ODgf+Zmq79kew1+eIo0QERJ93PNZX4tHk5hhDAVUb+7ZaFrMnlcclEwNqokcPKLU8XH6MJB+xIjuFgD3DSAfTwOMeLTDdknI69E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632701; c=relaxed/simple;
	bh=dcTIwXEeh9f7AtnxS25AJ8u+4+HsMy5wGbpvZyPekks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDas0xUTllqyOW9/BszWRGNl20dWFxA6s8zdE05NL/x/rM6L+Hts8kK+sj1P+xB+9F0fXWjy7SxcUu60proLaAY68ihbHf4YC5swWsG8m4azECA9RQdFoEwjbU+fWlZUyXrex31SAh9uVg0r6sb/ru5k5Qu1/TqoKJ9ud0gsjpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViZqwHJ8; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ddb1115e82so2718237b3a.0;
        Tue, 30 Jan 2024 08:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706632692; x=1707237492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/72zDHFg4+KvP8+lqQTnD42Gw2vx9nj2lIPZMv0IcXQ=;
        b=ViZqwHJ8CiU3edb/OIC3Bl1IOjg1tDFKZu/uTWycpLkQ6TETL59uDPaigekJ4gcEqy
         wQKPWA2n10U/XhHCyRBpruM5Z44pXxU8ATHYadMZKB3IuKc4KoWjz37ZB0GHsng4hjY/
         PEdF25Z+pD/7eOkglbKgSc3+tXewGe4jNgDLvzX1T27mWpsjbVN+mS87jkSpRdwxnf2k
         R0AGXPQBg1dvNaMEzrwfcqsg1L8Q0UJPjn/ek7+25w6VrEBp0r2Thy8DVidaL81L9i+6
         CrJ012V/tQfIqOjs1xjU+41lwaoCMKir4+j3ruDRbvmSn28p/eNQOqR7mcvIdlYo1E/G
         J4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706632692; x=1707237492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/72zDHFg4+KvP8+lqQTnD42Gw2vx9nj2lIPZMv0IcXQ=;
        b=oUek3MSKjXMKbJCAFkz89ogARysbQU8fu5MeCUFTdWnT1gXfVQQ8nsJSCL1FgRZz1O
         HmjcSQSw+mpvNp9ATQSb7RU/ve05wgZXQSTCB1ifswj9tT6pgpq23qv8gLOnpZ/gdDmE
         6UKGwTaYo0ZzpRgVL9b2Pj0xCR0lEWx+JuVfv7qbDQzaTtmqI2YoYJDLaRVFVUvwWveM
         H7KyFZpE/NywM7DJHneFYAUpuG5DTvQaMTiPoBj85s2iz+6+EQ9uIHaDaW7geJU3R/bz
         W+ey5SYxvDCSu8M72GBlyNJbsVjWpsRidtKYhFlKdB86c5b3cDW+zbuydq7WhbtNPbIE
         6osA==
X-Gm-Message-State: AOJu0YwSNiPlsE6AC34ro1LAWu96C7eL05lAnttClt1YmWLgA2tZMpgd
	cbpYYQj2yGTfJGAAcjU72da/VNJlmLAxOi4WKh8cDpRMkbwOsY1X
X-Google-Smtp-Source: AGHT+IFLT3p75WJv0nFK4MSK3aDi0a28NrN8LA0AiTMqBDjfQs7CZ5T4txKXjFjeTfPfyvhvk1q+QQ==
X-Received: by 2002:a05:6a00:1a8c:b0:6de:1921:6754 with SMTP id e12-20020a056a001a8c00b006de19216754mr7547677pfv.13.1706632692595;
        Tue, 30 Jan 2024 08:38:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k1-20020aa788c1000000b006de3ffa19f4sm2093218pff.0.2024.01.30.08.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 08:38:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a1fe7c95-a583-424b-9902-735462df5168@roeck-us.net>
Date: Tue, 30 Jan 2024 08:38:10 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build regressions/improvements in v6.8-rc2
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
Cc: sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org
References: <CAHk-=wgxzm+Oc1ywuNGxb1R1=ZEC85LJi776R2QEpk6=_2Qfdw@mail.gmail.com>
 <20240129104954.1778339-1-geert@linux-m68k.org>
 <8ea40b3-adde-acb5-5e46-fe1fd395daf@linux-m68k.org>
 <56b9c222-4e97-4eda-89af-3e0d0c39acb2@roeck-us.net>
 <90cd0f1a-29c0-4c6f-9efd-92b69da194c0@gmx.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <90cd0f1a-29c0-4c6f-9efd-92b69da194c0@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/29/24 23:49, Helge Deller wrote:
> On 1/29/24 15:58, Guenter Roeck wrote:
>> On 1/29/24 03:06, Geert Uytterhoeven wrote:
>> [ ... ]
>>> parisc-gcc1[23]/parisc-{allmod,def}config
>>>
>>>    + /kisskb/src/drivers/hwmon/pc87360.c: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]:  => 383:51
>>>
>>
>> The "fix" for this problem would be similar to commit 4265eb062a73 ("hwmon: (pc87360)
>> Bounds check data->innr usage"). The change would be something like
>>
>> -               for (i = 0; i < data->tempnr; i++) {
>> +               for (i = 0; i < min(data->tempnr, ARRAY_SIZE(data->temp_max)); i++) {
>>
>> but that would be purely random because the loop accesses several arrays
>> indexed with i, and tempnr is never >= ARRAY_SIZE(data->temp_max).
>> I kind of resist making such changes to the code just because the compiler
>> is clueless.
> 
> I agree with your analysis.
> But I'm wondering why this warning just seem to appear on parisc.
> I would expect gcc on other platforms to complain as well ?!?
> 

I have seen that problem before, where specifically gcc for x86 doesn't even
generate warnings for really problematic code but gcc for other architectures
does. I never found out what causes this. Don't ask me for examples, I didn't
write it down, forgot specifics, and just accepted it as "one of those things".

Guenter


