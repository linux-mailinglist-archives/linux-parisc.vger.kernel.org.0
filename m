Return-Path: <linux-parisc+bounces-4308-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 738E0C7BC00
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Nov 2025 22:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6F9A34237A
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Nov 2025 21:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5EB533D6;
	Fri, 21 Nov 2025 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="eZRx2r/y"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-mtlrgo002.bell.net (mta-mtl-008.bell.net [209.71.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E9254AE4
	for <linux-parisc@vger.kernel.org>; Fri, 21 Nov 2025 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763760513; cv=none; b=e+IX4o5sdKdt5H8wtEfE+PXNl7uxMaS1huvw3xCNBWpHH0MF35jqu4UD94t/K+bEd9n8nx7HC8w1sHsQ25bSK0M/fdbb7oamWflS6AkC2D7irOmM0BuQY8fwPN+/6aZhvalwx7SNa2aP/E3mEfvs7zvPQ/YszMn+lUI5y1pl+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763760513; c=relaxed/simple;
	bh=fruq9lk1DW0pPBDycjucgVA+7+GFOM5LibKvH/hq7uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uXOw7NIONugdgAzoKGTCmRm3FSPEZpNQSPHHs3QnkuXr9kNlKGoYH5js7T11nHqbs++QHRVquY6SKy2GGqkWjXEHCZB2EPjtXxz4yAi1Jou9XMzhsAU6Eoh+1RhbcbS4I5mIFCNhT0CwBnFKHh5Mg1aeR1uFBItvte5HrAxO6C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=eZRx2r/y; arc=none smtp.client-ip=209.71.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1763760511; 
        bh=MFajJ6IAQ1ZW5891ypkRYHmQSrzPuCEsv/7FvedAd/4=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=eZRx2r/yKp6IIfsU1Q2Zuu77YzKQPdOygsenaUA8egDwle4Y8X9CukAxC1A0BU8sCnlGDJuw3dhGj4AEYFpfALv97UIkBVA8GDJR5gsYX6EKobwQfwMw+vtvEiisCXWzmQfeJstglEyj9VjwiliUVGn4ZHUjOURthCUXR8bDOaNilUo3J72kuJi8F4CgRiES+QGo1ZBuN4yTqAB3eaJjdPVfjGGkAyEv/vFPSWG+3q8BEXsJDXpWOxr5IvwaVXDG+G/c8HuyW+4k/LAfotDsH7NMTD4tNIVg5LQ5oflkjQkjSdpHPABZ8SaAqCCQElhZSv9cEsIhtFOlsaDm1prXbA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 690E03AE00EFE9AA
X-RazorGate-Vade: dmFkZTEX3RxiknNTgspvFoSE9d55ZuD081AdjdERb7yoxFyD3IcUdDT29AziL7dzmUU4PqdJeA2ZS2Y/f/hjf8auql8QTAzxP9mwUNdrteR9tRJx+/JUoWSOGKXKgXIQnqENQT6aww+FfghmmzvkLkPQ99UPJUVyKFqV3jtqbFOCsW7P8lKj4kQ4udlX5tD9+F2TTe+z2/qGxDYfG9ZSf0xoOo/X6m1Dal8W6ArJj+JOSomSNYJ881bAgYXWn1TykbV0U3ASWgpa5PFx8s9SisXGnV0PsK4zhi00dCfnqZynRkNzPRZ2srXnklM/ZvuIkJBdkBu9TFwyEbyYk7n5/6toGxrySVnb534WEaSbLu/sxhyJl/X78BZampQ2Eu9YK8FIbx9vKuI5pmpPw8x3yyEM9liZQWLyJnEze5xMnPaj88ccOE1LDsK79fZjWedIPk9RdJmdGcwe+0b9A57ZJ7hcoO7/WxItCCtNcm5WSTFToF+YAajt1JHQxOqNFTzqeu8xQwuKrt/ym2aFHmt1Vbmnp4stUlQ6j2B4byMpj0O3BbbLSdQsz3S5RnbNHUf5KvCNZirEEu4Az9O3BNaDSZI5LzDHdtvgunpS5i22gJJV1ZDyvJWqzhzTD5A/nbUopQDRX7fhnbSPdz+Y1lT0z9aLgTgDvnS1dVCaCCJAzZP61/nT8g
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.189.246) by cmx-mtlrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 690E03AE00EFE9AA; Fri, 21 Nov 2025 16:17:25 -0500
Message-ID: <12543787-dbb0-403c-bdfd-85e75ff40b2a@bell.net>
Date: Fri, 21 Nov 2025 16:17:25 -0500
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PIDFD_GET_INFO
To: Helge Deller <deller@gmx.de>, linux-parisc
 <linux-parisc@vger.kernel.org>, Christian Brauner <brauner@kernel.org>
References: <2380a8de-5284-49f3-8155-f7fb9496b422@bell.net>
 <092acd39-3783-4f33-a26d-e6b4f8dfdf1a@gmx.de>
From: John David Anglin <dave.anglin@bell.net>
Content-Language: en-US
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <092acd39-3783-4f33-a26d-e6b4f8dfdf1a@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-11-21 4:05 p.m., Helge Deller wrote:
> On 11/21/25 20:04, John David Anglin wrote:
>> We have a new glibc failure that may be a kernel issue:
>>
>> make[2]: Entering directory '/home/dave/gnu/glibc/glibc/misc'
>> env GCONV_PATH=/home/dave/gnu/glibc/objdir/iconvdata LOCPATH=/home/dave/gnu/glibc/objdir/localedata LC_ALL=C
>> /home/dave/gnu/glibc/objdir/elf/ld.so.1 --library-path
>> /home/dave/gnu/glibc/objdir:/home/dave/gnu/glibc/objdir/math:/home/dave/gnu/glibc/objdir/elf:/home/dave/gnu/glibc/objdir/dlfcn:/home/dave/gnu/
>> glibc/objdir/nss:/home/dave/gnu/glibc/objdir/nis:/home/dave/gnu/glibc/objdir/rt:/home/dave/gnu/glibc/objdir/resolv:/home/dave/gnu/glibc/
>> objdir/mathvec:/home/dave/gnu/glibc/objdir/support:/home/dave/gnu/glibc/objdir/misc:/home/dave/gnu/glibc/objdir/debug:/home/dave/gnu/glibc/
>> objdir/nptl:/usr/lib/gcc/hppa-linux-gnu/15/../../../hppa-linux-gnu/:/usr/lib/gcc/hppa-linux-gnu/15/../../../hppa-linux-gnu/
>> /home/dave/gnu/glibc/objdir/misc/tst-pidfd_getinfo  > /home/dave/gnu/glibc/objdir/misc/tst-pidfd_getinfo.out; \
>> ../scripts/evaluate-test.sh misc/tst-pidfd_getinfo $? false false > /home/dave/gnu/glibc/objdir/misc/tst-pidfd_getinfo.test-result
>> make[2]: Leaving directory '/home/dave/gnu/glibc/glibc/misc'
>> FAIL: misc/tst-pidfd_getinfo
>> original exit status 1
>> error: ../sysdeps/unix/sysv/linux/tst-pidfd_getinfo.c:52: ioctl (PIDFD_GET_INFO) failed: Invalid argument
>> error: 1 test failures
>>
>>    if (ioctl (pidfd, PIDFD_GET_INFO, &info) != 0)
>>      {
>>        if (errno == ENOTTY)
>>          FAIL_UNSUPPORTED ("kernel does not support PIDFD_GET_INFO");
>>        else
>>          FAIL_EXIT1 ("ioctl (PIDFD_GET_INFO) failed: %m");
>>      }
> Which kernel are you running?

6.12.58.

Dave
-- 
John David Anglin  dave.anglin@bell.net

