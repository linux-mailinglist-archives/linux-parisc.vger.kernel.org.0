Return-Path: <linux-parisc+bounces-3224-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A005CA13EA1
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Jan 2025 17:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACC6F161692
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Jan 2025 16:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860791D8A0D;
	Thu, 16 Jan 2025 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q0DWgFs/"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331AB22ACE7
	for <linux-parisc@vger.kernel.org>; Thu, 16 Jan 2025 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043243; cv=none; b=ZDP/Wl1SUmfyd1FoF7/D511NV77YkYlQQ8aiXi52Gsnd+4+5xa8G7oerhOCxhr/GOlSBXuUFfB30RS34B+V9vQ3oIhjOd86Y8KKSbcwIz2DteDOlfJSWm0E0pmf7z2Kfc/EGI3vL8zTdbWaIL6bcnRlDo9R4Gw95+NBj1Rn2qbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043243; c=relaxed/simple;
	bh=QlLWjDvlbc8j5F56nFS+dRaLQzMqHByqsSLBVlVW68k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sP7ZdWoI0rJpGLL3TubPNeZfrGoAEwyhOUwQ1xCEHyBprU6ufWVxOWAZV1srwv2TWaKctPjZ9YVj+xutTyob0oEd01mt+ozTEn5Ni95arlKeWm3qMVNogfEdC4LU8LPey6mAngbgbHQkhzZgNEWMdhq+y7PDBtR5EwdwI13cDNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q0DWgFs/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso7482315e9.0
        for <linux-parisc@vger.kernel.org>; Thu, 16 Jan 2025 08:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737043239; x=1737648039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V8jytR0Fz5izaJMRgiaU5hNnSExCadyQD1yt5Xda5Uk=;
        b=Q0DWgFs/3eFOZT1jBUWh1MB9NbjR8jTfPT0tg5Uqn/82Gj5URRC+EvlziqUWtp2oOS
         M3HsuRW2LrHkOg0aCjrSscRmlhebJ/sBcGL7Iy2HcUQ2VWbrMSVQrOAKrTBrRkuKZGwk
         i5CCR8RTQdnD9+oW2HzX/OqVUc9+WLEWlirwNn08b2/krr8lnWT1ZRVhKbfVdWmVwO+5
         RBqgowzdQoHG05zuiPNEUeExioCnK1AnzPbME7G8jruQ+h5bM01fYRuwO7ntZDosaPsr
         pYHACTkynej3gnzltKxHVq3MYwrYAOzKuR+EUtUoIbeByZGtk0T44429Kt0QotDgQ1i1
         Eypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043239; x=1737648039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8jytR0Fz5izaJMRgiaU5hNnSExCadyQD1yt5Xda5Uk=;
        b=wVvO9N518FzZUQZGnOyINJ8hlCqTq/V/EewJK2kuqYBai0/qWSimlioOnxxLsdWld0
         VkxG/Xuw+rYBVLNaDFMnitbnH2IPeg4oXC1/nf3vc3vkCTnvXTRnO6R6UNDQEeWrPoHz
         ZaQATaPJOaorn/eeq8w1Mu8uw8q5moC5FoCYLW+P1SWY8/hLwqv/9nm6RSCR3NszXja9
         ruYK2gLMoiJ8lKzBgJQfyx7yCfjI9fnoytFgQ2Vgbg8dkwOckOI9or7YylYlvBfGeHCx
         23BAYe+1nACIuCnl5p7PPPwGJCs0jox4x+Mp4sDITClYQXK7t4ou8kf6SUmoQEbd5Wnf
         QHkg==
X-Forwarded-Encrypted: i=1; AJvYcCX+DbAJaCLVm1T0YZ4sQmi5YB0RdUtW60LYLyuTeEs5Ua3rRTo9u8zW8rX7QQejUbY+zOpqiCQ6+0SDzA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4sG/TzjfBnVahDLWYy3ESwcrN2H7uQ+c+68IG6j1kGUiaxn8
	xlWGyDeaQU3L1kBEPfKb/WoHF26+467wqBI4ER4tNLYn4S8ydLa5YPXHlgnv9Q==
X-Gm-Gg: ASbGncvDgv1B7bGXKJJcVL8ISLyREA3l88kwxWnOxJFucCrBkTcZUPYW1sLJELEgjLD
	QZdt9jqSGWmOena5Hw9uCUjgepJ61lOhRM9nxvU/FwVn2U5FSwr9QAu+3hFbx6gDRw+fobVYe5I
	Dzwrs+7I3VUOkNlmUwIPGeaochpT3sOKzEa7TAWMe5mpSOloVaTaFsIu4+v4E9Mc11Rej2jljCc
	3C7LEzZUfU+7XT0RS9tj8Owrv0cykzX6kcsb0QpZpazLPo44PxazGBgxcgwx2YQPVPKe6Hn1v+s
	Fm4tlyGC9KA/yJPEY9jbbkfM4NY9uvYAI3vG0MbcBA==
X-Google-Smtp-Source: AGHT+IGAE0ofJoM+gONDxVir2ycJxXmNiaDUu0uIL0aS09D12iNW5//898EFPkM3v3unPlayiczWgQ==
X-Received: by 2002:a05:6000:1869:b0:38a:8b2c:53ad with SMTP id ffacd0b85a97d-38a8b2c5601mr32355702f8f.39.1737043238670;
        Thu, 16 Jan 2025 08:00:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32150a6sm228472f8f.15.2025.01.16.08.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 08:00:38 -0800 (PST)
Message-ID: <9bab8b8a-1e63-4b40-aa1e-6d6a88cbeee8@suse.com>
Date: Thu, 16 Jan 2025 17:00:36 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unaligned accesses when loading modules
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>
References: <1665d54c-178f-ff72-e627-776e7c76798b@redhat.com>
 <CABCJKud9RCJzVZ2VuTRoaBavOC9bnyTv_W_-AC3mGOy9AY7dWA@mail.gmail.com>
 <aedcb0fd-040b-0dcc-8c28-34a0b07d5a7e@redhat.com>
 <16bf04b0-64ad-4614-957e-2971f053949d@suse.com>
 <0144332b-be9c-2f6d-81bc-a18f13990d65@redhat.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <0144332b-be9c-2f6d-81bc-a18f13990d65@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.01.2025 16:29, Mikulas Patocka wrote:
> 
> 
> On Thu, 16 Jan 2025, Jan Beulich wrote:
> 
>> On 15.01.2025 19:02, Mikulas Patocka wrote:
>>> On Tue, 14 Jan 2025, Sami Tolvanen wrote:
>>>> On Tue, Jan 14, 2025 at 6:07 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
>>>>> On PA-RISC, with the kernel 6.12.9, I get unaligned pointer warnings when
>>>>> a module is loaded. The warnings are caused by the fact that the
>>>>> .gnu.linkonce.this_module section is not aligned to the appropriate
>>>>> boundary. If I dump the module content with "objdump -h configs.ko", I get
>>>>> this. Note that the .gnu.linkonce.this_module has "File off 000042d2" and
>>>>> "Algn 2**4".
>>>>>
>>>>> On x86-64, the same misalignment can be seen, but it doesn't cause
>>>>> warnings because unaligned pointers are handled in hardware.
>>>>>
>>>>> This seems to be a bug in the linker, because when I compile an old kernel
>>>>> with a new linker, I also get the misalignment. Do you have an idea how to
>>>>> work around this bug?
>>>>
>>>> Does explicitly specifying section alignment in the module linker
>>>> script fix this by any chance?
>>>>
>>>>> kernel-6.12.9, binutils from Debian ports:
>>>>> [...]
>>>>> kernel 6.10, older binutils:
>>>>
>>>> Which exact versions of binutils were used here? I don't see the
>>>> alignment issue with binutils 2.42 on either x86_64 or parisc64, so I
>>>> assume you're testing with something newer?
>>>>
>>>> $ hppa64-linux-gnu-ld.bfd --version
>>>> GNU ld (GNU Binutils for Debian) 2.42.50.20240625
>>>>
>>>> $ hppa64-linux-gnu-objdump -h configs.ko | grep -E '(format|this_module)'
>>>> configs.ko:     file format elf64-hppa-linux
>>>>  17 .gnu.linkonce.this_module 00000300  0000000000000000
>>>> 0000000000000000  00005c50  2**4
>>>>
>>>> Sami
>>>
>>> Hi
>>>
>>> I use version "GNU ld (GNU Binutils for Debian) 2.43.50.20250108".
>>>
>>> It was broken in the commit 1f1b5e506bf0d9bffef8525eb9bee19646713eb6 in 
>>> the binutils-gdb git and partially fixed in the commit 
>>> d41df13ab36b224a622c0bdf28a96a0dee79db77 - the section is still not 
>>> aligned at their specified boundary (16), but at least it is aligned on 8 
>>> bytes, which avoids the warnings.
>>
>> When you say "broken", can you please explain what it is that is _broken_?
>> Things have changed, yes, but the produced ELF is - afaict - still within
>> spec. The "partial fix" as you call it wasn't really a fix, but a band-aid
>> for some broken consumers of ELF. Plus modpost, being one such example,
>> was supposedly corrected already (Linux commit 8fe1a63d3d99). Said "partial
>> fix" was also confirmed to help modpost [1] - are you saying that wasn't
>> quite true?
> 
> By "broken" I mean that the file offset is not aligned to the section's 
> alignment.

Except that this isn't broken at all. The section's alignment has no meaning
for the file offset (in ordinary object files that is; things are different
for executables); it solely affects the eventual virtual address assignment
by the linker.

> By "partial fix" I mean that the file offset is aligned to 8 bytes, but 
> the section's alignment is 16.
> 
> When Linux loads a module, it takes the .gnu.linkonce.this_module section 
> from the module file and points a pointer to "struct module *" to it (see 
> "info->mod = (void *)info->hdr + info->sechdrs[info->index.mod].sh_offset;").
> So, if the section is misaligned, you get warnings about kernel accesses 
> to unaligned memory.

Right, but that's a problem with the code you quote. The mere use of a
cast plus the assignment of a void * pointer to one requiring better
alignment is already indicative of possible problems.

Jan

