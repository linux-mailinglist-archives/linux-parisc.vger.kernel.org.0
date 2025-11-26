Return-Path: <linux-parisc+bounces-4332-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC745C8BFA9
	for <lists+linux-parisc@lfdr.de>; Wed, 26 Nov 2025 22:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 504853A8F3B
	for <lists+linux-parisc@lfdr.de>; Wed, 26 Nov 2025 21:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8C245BE3;
	Wed, 26 Nov 2025 21:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="dogae1zL"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390562192F2
	for <linux-parisc@vger.kernel.org>; Wed, 26 Nov 2025 21:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764191415; cv=none; b=aOCAk979V7QZNS3hfJnSW+I9+3FcKyLDA7VhjzsiYOyZy/jBN7bwqtTIDEtLWKn+KHN0KF7ondDIVr6vQunBHUUZErl5aLa8FWNl9DlKbHD+8YVNZATaZCQ4pUgR3aeNysMaBbFfIWgEJExkCpiBzH2hGSDG9rA90NYc6j5QwTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764191415; c=relaxed/simple;
	bh=HtpK1L3UXboDvtq/f4jhIG5+j1fYUEZGzG8GYBIQnpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRBlj2d3wcX1JYfr834rfO03q6MH9QzqBI+y+OhYR3U4W0ZHBgeWaq2rif1GrLbsfL4JuxhdPOFk4cCwzCe9tjsurjLfzbgkbwdJEWvCg5q7lNOSW+AZfeOfNwkAj75pIh7Kj/yWcbIxXci49hP0z+fyBXBzWxuxJzoofE5KeGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=dogae1zL; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 22EFE40F85
	for <linux-parisc@vger.kernel.org>; Wed, 26 Nov 2025 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764191408;
	bh=etwvSuPkB6K0qsrfspA5D5Yf0GIH78UqvE+Q+LobWHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=dogae1zL8VjlqZ2eGdF0R6p2HjlWlvzE5LUn9nmk7YX8hWw3Ewosh5JlB+VsZnjZ3
	 gcaoD6UkernA2llD0gojJp1zlzYcfvZud5FWSpdPxLhfwJFM9al4doPo0GAgmaRmTY
	 X6+QU45YaOMKEGNzoO8ddCwB9ekQknNDnKKOQHE6YbdWLEvsGsIjPrInPuJsqcrmKF
	 f0dKVWa6p6EGTI75jGGwTYEM4g2z0XMTNkpuzlqzzmxb03GSPtGHl/G8uV4nvzVddU
	 Wz951zn1RRcSHk81HAFM3z9Q6p3d8Hc7ftk9TMWoNOlIIyhSQtyqbqg3JvIHOW2SPT
	 /oBVTycDDWxYS/v6ysjR0AzbbsXVBVh4/Nxycu2EwTEunqrqu9waIrOWQq6Zqoy76S
	 fsAj8d86DXn2cS8QfRBs2MRKuiV43As82q67X57jOyZvmD9FpmGPEqvmSYu8JIlzj6
	 6uz54wqxg8ldO8/AUNAG3v4gdusR7TdUkoH56Dh2mBfvWTH/IMeiu3h/nn338i2ULY
	 IpWeP09BAiEW5/aIKUekJIFIu9YSfe9gshD9uSfTHGX0NBM9t8YhnEkn6iG1TJswWm
	 0iXwqMtV/bQV+nxiBl/0ORZnFmo1n7FXrklQVD+RnyNwOeArekeOnXeez6B1VS8fGv
	 NTlmbhFvLCUsqW4TBDCXx1mk=
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956a694b47so2123945ad.1
        for <linux-parisc@vger.kernel.org>; Wed, 26 Nov 2025 13:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764191405; x=1764796205;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etwvSuPkB6K0qsrfspA5D5Yf0GIH78UqvE+Q+LobWHQ=;
        b=AxIrjcrIqmzbqa1/Qrqu7iPShn4USik8Yx/afop9ekp1EXG9HWO8X86Qcg1N9HhkIp
         ymLzEPxACsGIfSINvwO6gonZXplvNnv/5GFb00/UbMNgDkaajkTy0Hja5sJmJfM8xIjP
         QzuISUBI+sWFKgN9AlXxTHYKDk0QVETWcXwdeOdkgGYZqOmACIXgjRH5fXo3fgOMA52o
         aVreMuhLPMu9hJT+XniSGmIzg9tHugVhebquU1U/SDy8YTOJ+RaD74DLbI68X80d4FSg
         j782wS2jgoXOUU5BN0NrJjSoeQREpuZ4sVoM2BWY5qprbciuiKZENKnZnB7lQrXj6vKr
         kfDg==
X-Forwarded-Encrypted: i=1; AJvYcCVwhXUAB8S19H4jb2KoZdDaId6PCM1sUJtn4cMAS5wR3QGZK9az9U12FSwz6eT1rNejaHADIS2wgVHfLwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEbDs/UkMp6ebvc9ya3ulCJpsrnVSbU1yFfe+Mq+3Ix1EmAuVj
	rH5d0DJehvtg3pZc5/Eoz7CyJ0RLisFUieT7cwrhSo4iUZtRAPkpRFROH6/MnG/A2rqjomjb8PR
	1bcB5E7X8qW358pqiFo0uXF5rClgbw8QwP8KrWjMZxSAD28iwgb8SsuUeE5b34F5EkoDtjrqWzH
	hB7YTqjQ==
X-Gm-Gg: ASbGncvF8lfIKEsNqgmc59eID2MB1UhKqQ/hWWBKTxFIiw2KSCrz23hAHEMGhfuO7vG
	1Jv9VcYvGY+pluErW3QLHipAlAj7BzoF5Nd7Qz+vv8pSN7Csay1SLRTGW0gg7gqoBf4i+j/dSyu
	9fX4D4YryRs662sKFs472FHpo8j9W69EqWSAJLqWyJIDdt2wC9sZVMFfSd0s1fW86Y0cV4k1QCe
	btKbIkYpG4X3+FJlAsg8DvvuSa0teLr2yZ+J3akn01/ZEbnXY3r7ZEYaVs3+CzdczRl22qKd11m
	EClp+wMN2RvxIJLMlgTA6tLhyCgIUjlrphlPErzsQdZuALkiHx8YwBm1q55xPFesYbVTy7Z+Bfu
	8SVLAXaLAObsnc14EI5yXaStS
X-Received: by 2002:a17:902:f54a:b0:295:6427:87d4 with SMTP id d9443c01a7336-29bab1db61fmr85232945ad.50.1764191405236;
        Wed, 26 Nov 2025 13:10:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO9cEqjZUKFW7BJRLCbL8zz0v+bKZwgqGsvGz/h3CjwbNizKdrFpT89fEjElUoizqoEVJ9nA==
X-Received: by 2002:a17:902:f54a:b0:295:6427:87d4 with SMTP id d9443c01a7336-29bab1db61fmr85232635ad.50.1764191404774;
        Wed, 26 Nov 2025 13:10:04 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29b5b26fc24sm209243355ad.67.2025.11.26.13.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 13:10:04 -0800 (PST)
Message-ID: <c64398f7-d470-4b30-a5a2-d3884581d9fc@canonical.com>
Date: Wed, 26 Nov 2025 13:10:03 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] apparmor unaligned memory fixes
To: Helge Deller <deller@kernel.org>
Cc: david laight <david.laight@runbox.com>, Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-parisc@vger.kernel.org
References: <ba3d5651-fa68-4bb5-84aa-35576044e7b0@canonical.com>
 <aSXHCyH_rS-c5BgP@p100> <e88c32c2-fb18-4f3e-9ec2-a749695aaf0a@canonical.com>
 <c192140a-0575-41e9-8895-6c8257ce4682@gmx.de>
 <d35010b3-7d07-488c-b5a4-a13380d0ef7c@canonical.com>
 <20251126104444.29002552@pumpkin>
 <4034ad19-8e09-440c-a042-a66a488c048b@gmx.de>
 <20251126142201.27e23076@pumpkin> <aScY13MEBATreotz@carbonx1>
 <f5637038-9661-47fe-ba69-e461760ac975@canonical.com>
 <aSdfyGv2T88T5FEu@carbonx1>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <aSdfyGv2T88T5FEu@carbonx1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/25 12:15, Helge Deller wrote:
> * John Johansen <john.johansen@canonical.com>:
>> On 11/26/25 07:12, Helge Deller wrote:
>>> * david laight <david.laight@runbox.com>:
>>>> On Wed, 26 Nov 2025 12:03:03 +0100
>>>> Helge Deller <deller@gmx.de> wrote:
>>>>
>>>>> On 11/26/25 11:44, david laight wrote:
>>>> ...
>>>>>>> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
>>>>>>> index 26e82ba879d44..3dcc342337aca 100644
>>>>>>> --- a/security/apparmor/match.c
>>>>>>> +++ b/security/apparmor/match.c
>>>>>>> @@ -71,10 +71,10 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
>>>>>>>      				     u8, u8, byte_to_byte);
>>>>>>
>>>>>> Is that that just memcpy() ?
>>>>>
>>>>> No, it's memcpy() only on big-endian machines.
>>>>
>>>> You've misread the quoting...
>>>> The 'data8' case that was only half there is a memcpy().
>>>>
>>>>> On little-endian machines it converts from big-endian
>>>>> 16/32-bit ints to little-endian 16/32-bit ints.
>>>>>
>>>>> But I see some potential for optimization here:
>>>>> a) on big-endian machines just use memcpy()
>>>>
>>>> true
>>>>
>>>>> b) on little-endian machines use memcpy() to copy from possibly-unaligned
>>>>>       memory to then known-to-be-aligned destination. Then use a loop with
>>>>>       be32_to_cpu() instead of get_unaligned_xx() as it's faster.
>>>>
>>>> There is a function that does a loop byteswap of a buffer - no reason
>>>> to re-invent it.
>>>
>>> I assumed there must be something, but I did not see it. Which one?
>>>
>>>> But I doubt it is always (if ever) faster to do a copy and then byteswap.
>>>> The loop control and extra memory accesses kill performance.
>>>
>>> Yes, you are probably right.
>>>
>>>> Not that I've seen a fast get_unaligned() - I don't think gcc or clang
>>>> generate optimal code - For LE I think it is something like:
>>>> 	low = *(addr & ~3);
>>>> 	high = *((addr + 3) & ~3);
>>>> 	shift = (addr & 3) * 8;
>>>> 	value = low << shift | high >> (32 - shift);
>>>> Note that it is only 2 aligned memory reads - even for 64bit.
>>>
>>> Ok, then maybe we should keep it simple like this patch:
>>>
>>> [PATCH v2] apparmor: Optimize table creation from possibly unaligned memory
>>>
>>> Source blob may come from userspace and might be unaligned.
>>> Try to optize the copying process by avoiding unaligned memory accesses.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> diff --git a/security/apparmor/include/match.h b/security/apparmor/include/match.h
>>> index 1fbe82f5021b..386da2023d50 100644
>>> --- a/security/apparmor/include/match.h
>>> +++ b/security/apparmor/include/match.h
>>> @@ -104,16 +104,20 @@ struct aa_dfa {
>>>    	struct table_header *tables[YYTD_ID_TSIZE];
>>>    };
>>> -#define byte_to_byte(X) (X)
>>> +#define byte_to_byte(X) (*(X))
>>>    #define UNPACK_ARRAY(TABLE, BLOB, LEN, TTYPE, BTYPE, NTOHX)	\
>>>    	do { \
>>>    		typeof(LEN) __i; \
>>>    		TTYPE *__t = (TTYPE *) TABLE; \
>>>    		BTYPE *__b = (BTYPE *) BLOB; \
>>> -		for (__i = 0; __i < LEN; __i++) { \
>>> -			__t[__i] = NTOHX(__b[__i]); \
>>> -		} \
>>> +		BUILD_BUG_ON(sizeof(TTYPE) != sizeof(BTYPE)); \
>>> +		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) || sizeof(BTYPE) == 1) \
>>> +			memcpy(__t, __b, (LEN) * sizeof(BTYPE)); \
>>> +		else /* copy & convert convert from big-endian */ \
>>> +			for (__i = 0; __i < LEN; __i++) { \
>>> +				__t[__i] = NTOHX(&__b[__i]); \
>>> +			} \
>>>    	} while (0)
>>>    static inline size_t table_size(size_t len, size_t el_size)
>>> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
>>> index c5a91600842a..13e2f6873329 100644
>>> --- a/security/apparmor/match.c
>>> +++ b/security/apparmor/match.c
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/vmalloc.h>
>>>    #include <linux/err.h>
>>>    #include <linux/kref.h>
>>> +#include <linux/unaligned.h>
>>>    #include "include/lib.h"
>>>    #include "include/match.h"
>>> @@ -70,10 +71,10 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
>>>    				     u8, u8, byte_to_byte);
>>>    		else if (th.td_flags == YYTD_DATA16)
>>>    			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
>>> -				     u16, __be16, be16_to_cpu);
>>> +				     u16, __be16, get_unaligned_be16);
>>>    		else if (th.td_flags == YYTD_DATA32)
>>>    			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
>>> -				     u32, __be32, be32_to_cpu);
>>> +				     u32, __be32, get_unaligned_be32);
>>>    		else
>>>    			goto fail;
>>>    		/* if table was vmalloced make sure the page tables are synced
>>
>> I think we can make one more tweak, in just not using UNPACK_ARRAY at all for the byte case
>> ie.
>>
>> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
>> index 26e82ba879d44..389202560675c 100644
>> --- a/security/apparmor/match.c
>> +++ b/security/apparmor/match.c
>> @@ -67,8 +67,7 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
>>   		table->td_flags = th.td_flags;
>>   		table->td_lolen = th.td_lolen;
>>   		if (th.td_flags == YYTD_DATA8)
>> -			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
>> -				     u8, u8, byte_to_byte);
>> +			memcp(table->td_data, blob, th.td_lolen);
> 
> True.
> Then byte_to_byte() can go away in match.h as well.
> So, here is a (untested) v3:
> 
and lightly tested now

I will pull it into my tree

> 
> [PATCH v3] apparmor: Optimize table creation from possibly unaligned memory
> 
> Source blob may come from userspace and might be unaligned.
> Try to optize the copying process by avoiding unaligned memory accesses.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
Acked-by: John Johansen <john.johansen@canonical.com>

> diff --git a/security/apparmor/include/match.h b/security/apparmor/include/match.h
> index 1fbe82f5021b..19e72b3e8f49 100644
> --- a/security/apparmor/include/match.h
> +++ b/security/apparmor/include/match.h
> @@ -104,16 +104,18 @@ struct aa_dfa {
>   	struct table_header *tables[YYTD_ID_TSIZE];
>   };
>   
> -#define byte_to_byte(X) (X)
> -
>   #define UNPACK_ARRAY(TABLE, BLOB, LEN, TTYPE, BTYPE, NTOHX)	\
>   	do { \
>   		typeof(LEN) __i; \
>   		TTYPE *__t = (TTYPE *) TABLE; \
>   		BTYPE *__b = (BTYPE *) BLOB; \
> -		for (__i = 0; __i < LEN; __i++) { \
> -			__t[__i] = NTOHX(__b[__i]); \
> -		} \
> +		BUILD_BUG_ON(sizeof(TTYPE) != sizeof(BTYPE)); \
> +		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) \
> +			memcpy(__t, __b, (LEN) * sizeof(BTYPE)); \
> +		else /* copy & convert convert from big-endian */ \
> +			for (__i = 0; __i < LEN; __i++) { \
> +				__t[__i] = NTOHX(&__b[__i]); \
> +			} \
>   	} while (0)
>   
>   static inline size_t table_size(size_t len, size_t el_size)
> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
> index c5a91600842a..1e32c8ba14ae 100644
> --- a/security/apparmor/match.c
> +++ b/security/apparmor/match.c
> @@ -15,6 +15,7 @@
>   #include <linux/vmalloc.h>
>   #include <linux/err.h>
>   #include <linux/kref.h>
> +#include <linux/unaligned.h>
>   
>   #include "include/lib.h"
>   #include "include/match.h"
> @@ -66,14 +67,13 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
>   		table->td_flags = th.td_flags;
>   		table->td_lolen = th.td_lolen;
>   		if (th.td_flags == YYTD_DATA8)
> -			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
> -				     u8, u8, byte_to_byte);
> +			memcpy(table->td_data, blob, th.td_lolen);
>   		else if (th.td_flags == YYTD_DATA16)
>   			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
> -				     u16, __be16, be16_to_cpu);
> +				     u16, __be16, get_unaligned_be16);
>   		else if (th.td_flags == YYTD_DATA32)
>   			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
> -				     u32, __be32, be32_to_cpu);
> +				     u32, __be32, get_unaligned_be32);
>   		else
>   			goto fail;
>   		/* if table was vmalloced make sure the page tables are synced


