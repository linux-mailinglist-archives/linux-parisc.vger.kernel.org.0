Return-Path: <linux-parisc+bounces-2523-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83179938C7
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 23:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 084EE1C23A29
	for <lists+linux-parisc@lfdr.de>; Mon,  7 Oct 2024 21:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4711DE3BB;
	Mon,  7 Oct 2024 21:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="qMKfh0nn"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7631DCB06
	for <linux-parisc@vger.kernel.org>; Mon,  7 Oct 2024 21:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335376; cv=none; b=C+B1a/3JLeEIVDKsQP+dIHvP54m8XHfeQcwzL1/pb+BsC068cimZSV/oTFIrdp4j5NxOvsN6Ghi1+XXSDqNJTyPsDDFdC9M6Af8OUyLCiWeeSaC8JcQ2huKhbPfkzDNs7aCNM2AGA6UDi9vOeWQidP25lFqAE1kC7SSh/z4vidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335376; c=relaxed/simple;
	bh=LNKuwMRwpr5N1IH7pYFynxs42kX5A0MD+M7uMpPnzgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L32knTaVu/8JqsklOR9CXoEbkvDVScC+UOwmvGJnBIQwOZkSswqulY8cCST1M0CghVA/uMPeTdc9BzQf53tn7lwshPrWK+A/elp6cMBzepX1T+SbtVsIdGXDKroCrP0JtPb+jlvwBGu4mmGVc3TYfkQh6tmQgqVY0PTctEqWMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=qMKfh0nn; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335361; x=1728940161; i=deller@gmx.de;
	bh=TyKCRNHmeyFgjDaIevWefebvU9noqHM5gZ0NJ7NBUOE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qMKfh0nndex7u3T8M5LTv33MshgNYUUAAfXELrnT9v30ITAliY5p8umvEInJ3Jj/
	 ZsvvK3pdGtgzDy6kWIXB8bKWclWDuPBB4CB7wWIEqYnvPZQ19o3563laglmxxkFye
	 uXLz7+CfetpOIqRc1PZ6DMUpQkNmyIJnfqeobtk7fc3Kh5oqcCOW3NXBF1AGmL3xJ
	 To15kWbaWNXYmEPbD3LbycjGet2/QCx/WE3RWNzN7Gg7NhmZ9ZpWWTLrLGJaDtW76
	 dUIs1g5fcDON9vpxEHDvj6V+MQcB0OGOdMEOnuj1rMj0KP6+DWtez5Q2aYhAevLMd
	 iY9i11crY0Kjmic6wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1tMKgy2wtl-00LSxQ; Mon, 07
 Oct 2024 23:09:21 +0200
Message-ID: <1e416170-a14c-4d78-8141-412c32b3dc0f@gmx.de>
Date: Mon, 7 Oct 2024 23:09:20 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/21] hw/core/tcg-cpu-ops: Introduce tlb_fill_align
 hook
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-7-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CP1aOEoy66qdltkCQpaCnXfu567xmDWznClWUj5yuvS2uB/x74i
 AdvnpUnRivYyrYrKZJABlfH73B0HXA47nJFZyjanL2+BvpN8zTfYwFCICfS+SU58WQTlMRA
 GC1YTYfm1e9IphCdAbOuhRPRp9m4UyXU2ATX76/q62qyjaugdbrL/qqQiCV2jL+PWV1rc2m
 r6qJTO9k6hQohTpsAlfjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o6721oMgQFQ=;aztqfcqVxCBSH1bP6/4kwyEUxXk
 kQgEyMOYrGGjmnIaJAzpoQYGK2a9irBFMTASaHmkyBn5sKWgQz08LKi++c6GUyxTjKeUCJ+Zw
 YUL39hYCoRuI+ir+OMdYcYKPJ97jcYQoDB17lmcXVUvt3DCitFUb5EJ7dcV7Z9SNKnhghKQGk
 4A/qsqKbPijZkiQJnoVg7ldupNzENx4RBYvxVNYwQkE4Gqet78B0ikKJo6owTbrzN9THO7f7T
 ufr4U0flUr8cg78q5pjX80belOhc7oIdxJcUDldevgi747kbN1K1OuvBcJNxVnFLpryvIwDtU
 jv9EnBPI2hQzJ0utgKoWzaOApC5NERJ/5TxU59bwYRbddDJQyQT1R63NjtDHRfNjnA897wYtq
 eQTqhrZsFRoCInrItf1UrkjolYxldb8DAtLek9uAhtoeFCSI08AT7in7ZWpBqmh2W1kNW+fpr
 dFMvMq+YcWnFal2JRDl9BK7X2ZUtcdewVIx3H0Jg5Fo4BH2/e71R/VVB4gIfAH777Gnv9iGw/
 34r7O2q91fIOLsfVHj4iZ8Wc5IJ/tgvB0PjxOpYHtUUEIkgKf9YEqmnAjYNaWK98r9M+11Q/l
 dtfobh6IQgyWpn+65xwRzXYR+a1Z1VE0gAwa+2tUcX5zJjxDirwKxtWCYPQUfED4I53I/CBo6
 dq/dlGIDb7SF9opnXC7HQYXcNHvUoWPuiiPt4ERV3v9/OSiaOw0sMI5iWx2bJ5XZsRQLO40jk
 dtZ6I7nrHHcBHj/wbSvjxS0VmekgCzh6+kFd8b1sEGnp0DiXKnEhDnUN1DO2y09pFU4RFNqzk
 fZVZBwr/0YJO4OyoMq1yhaCQ==

On 10/5/24 22:05, Richard Henderson wrote:
> Add the hook to struct TCGCPUOps.  Add a default implementation
> that recognizes alignment faults before page faults.  Populate
> all TCGCPUOps structures with the default implementation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   include/hw/core/tcg-cpu-ops.h | 25 +++++++++++++++++++++++++
>   accel/tcg/cputlb.c            | 19 +++++++++++++++++++
>   target/alpha/cpu.c            |  1 +
>   target/arm/cpu.c              |  1 +
>   target/arm/tcg/cpu-v7m.c      |  1 +
>   target/avr/cpu.c              |  1 +
>   target/hppa/cpu.c             |  1 +
>   target/i386/tcg/tcg-cpu.c     |  1 +
>   target/loongarch/cpu.c        |  1 +
>   target/m68k/cpu.c             |  1 +
>   target/microblaze/cpu.c       |  1 +
>   target/mips/cpu.c             |  1 +
>   target/openrisc/cpu.c         |  1 +
>   target/ppc/cpu_init.c         |  1 +
>   target/riscv/tcg/tcg-cpu.c    |  1 +
>   target/rx/cpu.c               |  1 +
>   target/s390x/cpu.c            |  1 +
>   target/sh4/cpu.c              |  1 +
>   target/sparc/cpu.c            |  1 +
>   target/tricore/cpu.c          |  1 +
>   target/xtensa/cpu.c           |  1 +
>   21 files changed, 63 insertions(+)


