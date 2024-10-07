Return-Path: <linux-parisc+bounces-2517-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEBD99389B
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 22:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429C51F2118D
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 20:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81C218B491;
	Mon,  7 Oct 2024 20:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="KpDT3Vjb"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A481727
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334547; cv=none; b=h+lI6Gh4JpZxkw/0CW8ta/sTkM9WH3k2yMm2ApJr1PUW/uFML61IgcacK/ojKZvJDE1Thn/9P6P6yhgHSsZ0iiE+4pO/ZAvtpVVun2/0+Yrrga8E5NBWkI5g3bROIR2NGZ15MteJ1sRpJZgx3E7KjaOO2l7P5DVEW3OZK3HuECo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334547; c=relaxed/simple;
	bh=iAWdG79J6P6A5dDXv6URSxExY8VLkos6MvA6FcdMZko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sg//Uff3T4IvT/bI/41+G9x5SOoNFCKWPZ/A+4TSegEbOP3Hm4/owSANNXxLWoucWJHZtXpDs829q3kIzTzbsWBq0MQ9ydwK+Zbu/xGLX95EV7EhXtQV5Goe2YVUzowbayzCWVpqbTyF2mElnRJvMjuhtObvv16urQkUuCSUMZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=KpDT3Vjb; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728334526; x=1728939326; i=deller@gmx.de;
	bh=g0KOZIJsJykpeXExGEg0GSylxBxBQk9/H5KSTg0I4hE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KpDT3VjbD3ETVvqUqgH59W8HD04iAPhjN87gE7xhR5LpS9yx9ELvRhtFEVrr1hVi
	 /o6HUrObrojxxoc/P2rkOfvbVyWLuIeH5/cnzgdyGDH6FcBjjocL9ew9y4R9Qyz7X
	 yLGtMGtJEfbyXh7D3QKhZqQzOoWAhyCE+OCcX5I7Y76IACqYv235LJV9xdQEvqUbc
	 h1EslO7SC8pEqBw/sLLMjVqGficFTRgZPBz6vCfO6HnOB/WxWazrGpnvURg2JQQJ2
	 vGloX1z3VBznlffUUbRSOVukK+72BUGsjkn4H+Rn5+3ZSZSBh/OJtlaQMCE3E2Xdw
	 kpb/SQS/eA1qBRUcHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfYm-1t8wJ34Bs8-00HQZX; Mon, 07
 Oct 2024 22:55:26 +0200
Message-ID: <7ea84509-eac2-40c4-be85-21a44120a87f@gmx.de>
Date: Mon, 7 Oct 2024 22:55:22 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/21] accel/tcg: Introduce tlb_fill_align hook
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7blf9h0PM7lWW4hRXyEDKyW1/vvsNIRsYpEZ1edcjWv+yLDMf4t
 7ErkDnscV62pdqbNghHoBra2hAEXXim2hdq+OGqbQjvm9rOQpSCT+dN4s4+zO3LG9U9CCdU
 V3CWN/vI+3f+TFy3cZ8lxskjgoD3yH1NUp35z8nqiN7J1eiO1dKLBRYZdMk9FIsJNAP/WMV
 0cCHWsmtDAP1IcThlrsqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7gVvFJdG+dY=;Ji+ea0CkhZ8u4ACMZXSApmpV0IK
 HeE+8qlGqLey2gyo9Z1parww9LIIX7jb681s3eXqJaCaeKLyBh7OOLaB/uHoziaaUCL2NTV0Q
 w1Ao+UTTMP2iBdrm8hLaYt0Ig50gC/hS06J0jEza2FqTzpkbX2IHpG2GFSRltFeVFkhFQwnPt
 50dKtJJf7raFzopDKFVUKIkykBhIl86sqjzGp9ej9qZkTwV4+yqXw3N5u3CRfffqsSEwmcA/k
 a+JdHxFjjZ3kljDwL1b3uhWXOHAinxN3s2HPFUYwamOUMVLNObuHxzA+YvQ7n+VK5dzT1NBfP
 URSmy40FNUC1hRbFcGH92rG36ZZrtzxqizZqT1r1cFik4IpZ2Uvf3hC8THR+e/5RQYurDzlXz
 JOYdqIVHliSqjSw5J0mmysfVzRso2hLH5NGXNpNPA6nkCZDxMJzTkB4ZS/yK3ovnVJBehJQW9
 LY/dr7Ub6+05fXBInjGFSKOyOg+/9KmRg0CAqLQ+Z4KsBZeYIes832rn8xzhUCDqoM7UykT73
 G3kaTZMjT6NG9QbHMCiWC+zCViJUCP5BjE/jnWaThFVJkET+ZUkUXe3BQMhS4/lm2lhx2ICZq
 vh4MfMEiUyR24lKEHAh78ty7x0HfPjVxT9JxWA40iNVrisuPeZZ64WHSDMGTPfsRIguNhlLKe
 BGFWw2cagOJPASTVn/N9RCqkMtLGs97mhg5pqBddzdTSXgS9yxkeRbYJ2FODKqME8lNBIRBr3
 TyGTnQxdpWitKGVnwaqZym7h9xfKiRewVkv8dpJrJ3LkuZz5owSgLVsCorkYjLnLBEZweq5jK
 9mbOQOb6LM0HnonZaw1DjjuQ==

On 10/5/24 22:05, Richard Henderson wrote:
> This new hook will allow targets to recognize an alignment
> fault with the correct priority with respect to other faults
> that can be raised by paging.
>
> This should fix several hppa fault priority issues, most
> importantly that access permissions come before alignment.

I can confirm that this patchset fixes the access permissions
before the alignment checks on hppa.
I used the testcase from the description of this bug report:
https://bugzilla.kernel.org/show_bug.cgi?id=3D219339#c0
Maybe you could add a reference to this BZ in your commit message?

> [ Helge, I find that my old hppa system images would not boot,
>    and a scratch re-install of debian 12 failed (networking error?).

A new debian-sid qemu image is here:
http://www.dellerweb.de/qemu/debian-sid-hdd-2024.img.bz2

>    Would you please test?  It would be nice to have a self-contained
>    regression test for this, using a port of the multiarch/system
>    minilib, but that's a larger job.]

I think the C example from the BZ might help for such a testcase.

Helge


> This should fix the documented error in the Arm alignment
> fault due to memory type.
>
> [ Also untested.  I should be possible to leverate aarch64/system/boot.S
>    to manage this, but it's still tricky. ]
>
> Changes for v2:
>    - Include the arm_cpu_tlb_fill_align patch.  Oops!
>    - Improve some commentary in target/arm/ptw.c.
>
>
> r~
>
>
> Richard Henderson (21):
>    accel/tcg: Assert noreturn from write-only page for atomics
>    accel/tcg: Expand tlb_fill for 3 callers
>    include/exec/memop: Move get_alignment_bits from tcg.h
>    include/exec/memop: Rename get_alignment_bits
>    include/exec/memop: Introduce memop_atomicity_bits
>    hw/core/tcg-cpu-ops: Introduce tlb_fill_align hook
>    accel/tcg: Use the tlb_fill_align hook
>    target/hppa: Add MemOp argument to hppa_get_physical_address
>    target/hppa: Perform access rights before protection id check
>    target/hppa: Fix priority of T, D, and B page faults
>    target/hppa: Handle alignment faults in hppa_get_physical_address
>    target/hppa: Add hppa_cpu_tlb_fill_align
>    target/arm: Pass MemOp to get_phys_addr
>    target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
>    target/arm: Pass MemOp to get_phys_addr_gpc
>    target/arm: Pass MemOp to get_phys_addr_nogpc
>    target/arm: Pass MemOp through get_phys_addr_twostage
>    target/arm: Pass MemOp to get_phys_addr_lpae
>    target/arm: Move device detection earlier in get_phys_addr_lpae
>    target/arm: Add arm_cpu_tlb_fill_align
>    target/arm: Fix alignment fault priority in get_phys_addr_lpae
>
>   include/exec/memop.h           |  47 +++++++++++
>   include/hw/core/tcg-cpu-ops.h  |  25 ++++++
>   include/tcg/tcg.h              |  23 ------
>   target/arm/internals.h         |   9 ++-
>   target/hppa/cpu.h              |   5 +-
>   accel/tcg/cputlb.c             | 142 +++++++++++++++++----------------
>   accel/tcg/user-exec.c          |   4 +-
>   target/alpha/cpu.c             |   1 +
>   target/arm/cpu.c               |   1 +
>   target/arm/helper.c            |   4 +-
>   target/arm/ptw.c               | 141 ++++++++++++++++++--------------
>   target/arm/tcg/cpu-v7m.c       |   1 +
>   target/arm/tcg/m_helper.c      |   8 +-
>   target/arm/tcg/tlb_helper.c    |  27 ++++++-
>   target/arm/tcg/translate-a64.c |   4 +-
>   target/avr/cpu.c               |   1 +
>   target/hppa/cpu.c              |   1 +
>   target/hppa/int_helper.c       |   2 +-
>   target/hppa/mem_helper.c       |  50 ++++++++----
>   target/hppa/op_helper.c        |   2 +-
>   target/i386/tcg/tcg-cpu.c      |   1 +
>   target/loongarch/cpu.c         |   1 +
>   target/m68k/cpu.c              |   1 +
>   target/microblaze/cpu.c        |   1 +
>   target/mips/cpu.c              |   1 +
>   target/openrisc/cpu.c          |   1 +
>   target/ppc/cpu_init.c          |   1 +
>   target/riscv/tcg/tcg-cpu.c     |   1 +
>   target/rx/cpu.c                |   1 +
>   target/s390x/cpu.c             |   1 +
>   target/sh4/cpu.c               |   1 +
>   target/sparc/cpu.c             |   1 +
>   target/tricore/cpu.c           |   1 +
>   target/xtensa/cpu.c            |   1 +
>   target/xtensa/translate.c      |   2 +-
>   tcg/tcg-op-ldst.c              |   6 +-
>   tcg/tcg.c                      |   2 +-
>   tcg/arm/tcg-target.c.inc       |   4 +-
>   tcg/sparc64/tcg-target.c.inc   |   2 +-
>   39 files changed, 329 insertions(+), 199 deletions(-)
>


