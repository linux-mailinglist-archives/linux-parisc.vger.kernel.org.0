Return-Path: <linux-parisc+bounces-3811-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D721B12499
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 21:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4558717C796
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Jul 2025 19:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8C8253925;
	Fri, 25 Jul 2025 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="CFsTvtIw"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo002.bell.net (mta-mtl-008.bell.net [209.71.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3290254877
	for <linux-parisc@vger.kernel.org>; Fri, 25 Jul 2025 19:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753470484; cv=none; b=JaO586xVkt+Zc98CN7qWhKe7+E29g/ORagEvuQwkqDDtUE4odg410ZMB+HiRMO0l8Kk+gVMMiHs6oRaYrySGbT3IS/hClGYvTlV0iM6KGDKBXPbi8ZwMBjwxOa5Wt3snreokHt0c9zFX6GJPYw+R9WMvMl9pN8W9w/5VVhwJsDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753470484; c=relaxed/simple;
	bh=5lpoLKJAOTTuWZMqdS2cjN+BAdbjtm2A5BtW6D5vmHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJ/HCyQB9OV0qHnUqphqzbjsmu6Z+wF4/K2B3S07DEOWsrNJRZ6tVtHPD8P7ksst1BECBz4poDMTv7BIfdwmIuW2q+iwcB8emDGr6HzKMi/JCy3SEpypC3KeuNRrZwH8HTSFviE7hSaiPvIHjZFLO+UK/5SUhR4p0BKwj+6dcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=CFsTvtIw; arc=none smtp.client-ip=209.71.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753470481; 
        bh=/HQtBFcRiUEpPqUNdguvAXMCra0ogfRICiGpBBW/wBE=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=CFsTvtIwzzKD+WT6N/8bkIYyA9aFnSXvw3pmYAHxR1bpn4qYHB934//wv/z3pmT3mCS+pw/IWEl+5z+/+WdFvGsZkG3Y+WekXOfG2IfOmmR3jn/FDFhrpQQSuHryC1FfV/p69F3/Z03BkDTO56jdLqeMEseaRSwgJ544U5DpWisMj8lUhkXtW8RAadGCYCO6/Uow8QpMF+lGyjJVO1l4PQ2Y7Q0dRzrW4Tu5Ke2LFF92LGcoROjR1CpSCfbqO7xDgPbGj+gzod8mp2q6E8UNbEcjk3SqEL0j1+5WytEATXUOHiKYm/cFUbX+hGGVpILA5fSlpzz1HgMB112DbWLcsQ==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687D2719008951C7
X-RazorGate-Vade: dmFkZTEpDpzgi7H3ykA8i4mzjV/qicd3P4BihpsEP1mnizOg6+GpEVJ4AQ6dC54a73Gj572r1H8vL/aLByB8+Sw7os7xAKw9aMwKBIvDUOlW+jfwRs2ToJmRkfn0Z+vXuttQ7mJRDwolsUITlJwiBnY+lsjVE6LyxVnSO7zh/9AR7NtJEhik0rjKHxjZ67TMcAFY8d206pm8HLROPXcUAj7tPTjHo6ZA/XkSPQ+v565AGCdI7+QIr+QChlU2lzrUJj6ojN4JEyJx0xHdT11fjhdz4K+aDHI9bFXzG9gFO9kckxbMfWXMywuH1XLXpyXXn078uOfO9UGhKoEK2/+8kim7aMxJIQoSKlngi/DXY9T7Rq29k6h2jsFD62ElUq0XFnXP1tuWLzERhSwPBM8KAJAT4A7BcC60Ahoz4MDXja+S/8AwOPdpYheeInNqDx0U+Zsc4h7q4oTQJFRpI2KFt2NTKGWLoR0MXZvf2fExTkVdJD+6nFIAhvhQ1cN6nvmLYXmNrEqevsQhZRwpoVsW9nkupkSUOZE8QKZGprSza5NS6CINS1qfyopqM0HtDpU8rc4bawYR/4QXFakLDgD29qFJeJqfjH7XeXDwExmJpnvBCB3ZlW2JhB+xI9y2cWx6TKYZ5/52hU/FRrroG5vlR5CzwT4WGza+oYgsIxmlR0QJ2oIVgg
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.136.104) by cmx-mtlrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 687D2719008951C7; Fri, 25 Jul 2025 15:07:57 -0400
Message-ID: <52946f87-5a1f-41ff-8cf5-2637f89f9350@bell.net>
Date: Fri, 25 Jul 2025 15:07:58 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] parisc: Revise __get_user() to probe user read access
To: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
References: <aIPEJOOMJQtuW49u@mx3210.local>
 <8524edb6-f011-4e0c-8647-c03dfb720c09@gmx.de>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <8524edb6-f011-4e0c-8647-c03dfb720c09@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-07-25 2:37 p.m., Helge Deller wrote:
> On 7/25/25 19:51, John David Anglin wrote:
>> parisc: Revise __get_user() to probe user read access
>>
>> Because of the way read access support is implemented, read access
>> interruptions are only triggered at privilege levels 2 and 3. The
>> kernel executes at privilege level 0, so __get_user() never triggers
>> a read access interruption (code 26). Thus, it is currently possible
>> for user code to access a read protected address via a system call.
>>
>> Fix this by probing read access rights at privilege level 3 and
>> setting __gu_err to -EFAULT (-14) if access isn't allowed.
>>
>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> 
> Thanks a lot, Dave!
> 
> I've applied that patch, but modified it to utilize PRIV_USER and
> EFAULT constants instead of the hardcoded values in the proberi instruction.
> Compiler does not seem to complain.
> Maybe you want to check:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next

Maybe that works since you added extra arguments to asm.  It didn't work with EFAULT
directly in asm.

Another minor issue to note is the cmpiclr instruction does a 32-bit compare because
COND macro doesn't work inside asm.

Dave
-- 
John David Anglin  dave.anglin@bell.net

