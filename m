Return-Path: <linux-parisc+bounces-3741-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7370AF815C
	for <lists+linux-parisc@lfdr.de>; Thu,  3 Jul 2025 21:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 551341C83C77
	for <lists+linux-parisc@lfdr.de>; Thu,  3 Jul 2025 19:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFD52F5C47;
	Thu,  3 Jul 2025 19:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parisc-linux.org header.i=@parisc-linux.org header.b="hcfoXI62"
X-Original-To: linux-parisc@vger.kernel.org
Received: from paco.parisc-linux.org (paco.parisc-linux.org [62.169.29.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8331C2980A4
	for <linux-parisc@vger.kernel.org>; Thu,  3 Jul 2025 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.169.29.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571029; cv=none; b=cBlr1sy6GYGf4OzARay1YGqK2IgUOXlzhs4ETL3D5UV6WbjrTEW9EHBfumXtxgc6Q4CtOGl+LMGWcr2BSArzxF18BgBROSoUsFdFy6EYeqQxe3KDEuZShV3WCMNL2Tm50bLznXXP7SjyBZmSjLw9XGcTK2fwg27FflkDOPd8868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571029; c=relaxed/simple;
	bh=ugNujB1hxAbgeVz/9mAkjXRvmSlTH3R1OSY0fau+v/A=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=mdJdoYCtM+eOPL+tkPsModjCKdyVG24xXjgUfK+UrK3WTuHRlsW5Z1UTFF+XAZv1oxVnOXdB/WqGJzXXQvSEkiUMdsyfp76+21if4URqH9q+XzBj80fNt4i3Qdh0QY6oT85oyFD8qoFhzq/N0QIbNxtjT0y7hNYoNdh9MC9FiBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=parisc-linux.org; spf=pass smtp.mailfrom=parisc-linux.org; dkim=pass (2048-bit key) header.d=parisc-linux.org header.i=@parisc-linux.org header.b=hcfoXI62; arc=none smtp.client-ip=62.169.29.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=parisc-linux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parisc-linux.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=parisc-linux.org;
	s=2021; t=1751570559;
	bh=ugNujB1hxAbgeVz/9mAkjXRvmSlTH3R1OSY0fau+v/A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=hcfoXI62eToPgUtDvfP3uabMx0m2nEJi8pMlv635OlMuELukUZ/4PXde64lchTUFu
	 VT6erutjyDgZAcKXabzR1UNLtJJFo8yBeTvKcmum7MHZPqN48nIiyRd/tl1Xi6t+a+
	 WkGMp/0G/WOSSqHnjyMY6EdLPHMAY5ZMTe1aqKrfmBmtZmWem4UeOxmiI1o/8hvnYF
	 PyhXwS7/9tC8ipGo2adnLEMCXregGmuEz1ZEzvYsmp9knTFPR+OmmZ8i+QM9pJq3Zc
	 2fN0YpFyj6GMyCmwujqVRPmvDTe+0ISfDRkVg0vumrtLckjKk1znAlNB0jk+9O7skD
	 tWdDWZ/ABlB2w==
Received: from [192.168.2.49] (unknown [142.126.146.249])
	by paco.parisc-linux.org (Postfix) with ESMTPSA id 3F30C17E0232;
	Thu,  3 Jul 2025 19:22:39 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------OiIP0rbjvssqFyapEEoSr4eE"
Message-ID: <08ea1631-5c5f-4081-bbab-5feb38c19957@parisc-linux.org>
Date: Thu, 3 Jul 2025 15:22:27 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: parisc kernel cache flush issue with mprotect()
To: Helge Deller <deller@gmx.de>, linux-parisc <linux-parisc@vger.kernel.org>
References: <1793f351-614b-489d-9c44-a044aec46eec@gmx.de>
Content-Language: en-US
From: Dave Anglin <dave@parisc-linux.org>
In-Reply-To: <1793f351-614b-489d-9c44-a044aec46eec@gmx.de>

This is a multi-part message in MIME format.
--------------OiIP0rbjvssqFyapEEoSr4eE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-06-25 4:56 p.m., Helge Deller wrote:
> While analyzing testcase failures in the libunwind package,
> I found a parisc Linux kernel issue.
>
> The attached testcase initilizes a memory region, then
> calls mprotect(PROT_NONE) on that region and thus effectively
> should prevent userspace and kernel to access that memory.
>
> But on parisc it seems the CPU cache isn't flushed when
> changing the protection of a memory region with mprotect().
> So, the kernel will wrongly not fault when accessing this memory.
>
> I think we are missing to purge the data cache when changing
> the protection.
> Ideas?
The attached patch fixes the test.  It also 

After a lot of study regarding our TLB handling, I realized that user pages can always be
read by the kernel even when _PAGE_READ is dropped.  We need to use the probe instruction
to determine whether a page is accessible in user mode or not.

Probably, get_user needs a similar fix.

I've wondered if _PAGE_WRITE pages should always be writable by kernel?  We could put
_PAGE_WRITE in the most significant bit of PL2.  Access mode 0 is nominally for public pages
as protection checking is disabled for it.  Maybe shouldn't use it?  Does _PAGE_WRITE imply
_PAGE_READ on Linux?

Dave

-- 
John David Anglin  dave@parisc-linux.org

--------------OiIP0rbjvssqFyapEEoSr4eE
Content-Type: text/plain; charset=UTF-8; name="check-user-read-access.txt"
Content-Disposition: attachment; filename="check-user-read-access.txt"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NwZWNpYWxfaW5zbnMuaCBi
L2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NwZWNpYWxfaW5zbnMuaAppbmRleCA1MWY0MGVh
Zjc3ODAuLjNiZWM5YmMyMDc1YSAxMDA2NDQKLS0tIGEvYXJjaC9wYXJpc2MvaW5jbHVkZS9h
c20vc3BlY2lhbF9pbnNucy5oCisrKyBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NwZWNp
YWxfaW5zbnMuaApAQCAtMzIsNiArMzIsMjEgQEAKIAlwYTsJCQkJCQlcCiB9KQogCisjZGVm
aW5lIHByb2Jlcl91c2VyKHZhKQkoewkJCQlcCisJdW5zaWduZWQgbG9uZyBwYTsJCQkJXAor
CV9fYXNtX18gX192b2xhdGlsZV9fKAkJCQlcCisJCSJjb3B5ICUlcjAsJTBcbiIJCQlcCisJ
CSI4Olx0cHJvYmVpLHIgKCUlc3IzLCUxKSwzLCUwXG4iCVwKKwkJIjk6XG4iCQkJCQlcCisJ
CUFTTV9FWENFUFRJT05UQUJMRV9FTlRSWSg4YiwgOWIsCVwKKwkJCQkib3IgJSVyMCwlJXIw
LCUlcjAiKQlcCisJCTogIj0mciIgKHBhKQkJCQlcCisJCTogInIiICh2YSkJCQkJXAorCQk6
ICJtZW1vcnkiCQkJCVwKKwkpOwkJCQkJCVwKKwlwYTsJCQkJCQlcCit9KQorCiAjZGVmaW5l
IENSX0VJRU0gMTUJLyogRXh0ZXJuYWwgSW50ZXJydXB0IEVuYWJsZSBNYXNrICovCiAjZGVm
aW5lIENSX0NSMTYgMTYJLyogQ1IxNiBJbnRlcnZhbCBUaW1lciAqLwogI2RlZmluZSBDUl9F
SVJSIDIzCS8qIEV4dGVybmFsIEludGVycnVwdCBSZXF1ZXN0IFJlZ2lzdGVyICovCmRpZmYg
LS1naXQgYS9hcmNoL3BhcmlzYy9saWIvbWVtY3B5LmMgYi9hcmNoL3BhcmlzYy9saWIvbWVt
Y3B5LmMKaW5kZXggNWZjMGM4NTJjODRjLi4yMTE2YjYwZDQwNzIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcGFyaXNjL2xpYi9tZW1jcHkuYworKysgYi9hcmNoL3BhcmlzYy9saWIvbWVtY3B5LmMK
QEAgLTMyLDYgKzMyLDE1IEBAIEVYUE9SVF9TWU1CT0wocmF3X2NvcHlfdG9fdXNlcik7CiB1
bnNpZ25lZCBsb25nIHJhd19jb3B5X2Zyb21fdXNlcih2b2lkICpkc3QsIGNvbnN0IHZvaWQg
X191c2VyICpzcmMsCiAJCQkgICAgICAgdW5zaWduZWQgbG9uZyBsZW4pCiB7CisJdW5zaWdu
ZWQgbG9uZyBzdGFydCA9ICh1bnNpZ25lZCBsb25nKSBzcmM7CisJdW5zaWduZWQgbG9uZyBl
bmQgPSBzdGFydCArIGxlbjsKKworCS8qIENoZWNrIHJlZ2lvbiBpcyB1c2VyIGFjY2Vzc2li
bGUgKi8KKwl3aGlsZSAoc3RhcnQgPCBlbmQpIHsKKwkJaWYgKCFwcm9iZXJfdXNlcihzcmMp
KQorCQkJcmV0dXJuIGxlbjsKKwkJc3RhcnQgKz0gUEFHRV9TSVpFOworCX0KIAltdHNwKGdl
dF91c2VyX3NwYWNlKCksIFNSX1RFTVAxKTsKIAltdHNwKGdldF9rZXJuZWxfc3BhY2UoKSwg
U1JfVEVNUDIpOwogCXJldHVybiBwYV9tZW1jcHkoZHN0LCAodm9pZCBfX2ZvcmNlICopc3Jj
LCBsZW4pOwo=

--------------OiIP0rbjvssqFyapEEoSr4eE--

