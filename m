Return-Path: <linux-parisc+bounces-3113-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B01E39FAF47
	for <lists+linux-parisc@lfdr.de>; Mon, 23 Dec 2024 15:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218C9165DD6
	for <lists+linux-parisc@lfdr.de>; Mon, 23 Dec 2024 14:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35BF194AD5;
	Mon, 23 Dec 2024 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSQ/9oqU"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AA11C36;
	Mon, 23 Dec 2024 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734963097; cv=none; b=VOeYUjPCj1kVyF8HRO74waye/lpl+NcJupaR4nbl5Nl0EAEBcWRDJ6BZ2LepiF1nJ8zqyH1CGXb9/A3OeHnyG0VwKCDesC7S1Cv0RBAoaNlElmtntAHlrb6ecsnVwMBuQzFagqZi7yb5FZX5hVOC7FaiSKBB5ZFAbsdkikpe+wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734963097; c=relaxed/simple;
	bh=TFDZ10LCzVzAVPmwwXm1t1ueVZF764P4MBpvUBlhNIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4WjbLsBJYUuRLZT/ykAcsVrCvxiaJnpcIu+W0ch6Bq0q45Z+Unzd8Ud7/2yX3t3aHRkHgV69uNpTjyVAUP78vzFw8Ui06ArKqb0/5HqoV6t1BRz6iLXs9mhX5NOhv15Jl4ZO4TmOzdgF0RUXiBnZlBGo4Cpa6AQZvmtmrTSPug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSQ/9oqU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA92BC4CED3;
	Mon, 23 Dec 2024 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734963097;
	bh=TFDZ10LCzVzAVPmwwXm1t1ueVZF764P4MBpvUBlhNIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSQ/9oqUd/i8BtwF4iftPWzrU1PL2X85JlLOlxJo76cCjvgHDscBZVpdNQeibO6j4
	 c3jg1iRIB+kOFMRX1B1URWZhmVYfUKJf4gYpvS3oEMfz2ae/5WsqAZR42xkNtyoMSa
	 pUxuTMJKZlgiFj/MFMTIOeb9hMrMQGZoX4FYkddlTIZNIS+/ntAEcUTaVkVqL/9Go4
	 GAfEZcAFaFLo8IhQ57ss2owCDS9KfDFUXdCVTLe577CUrwn6ejNG84Mis0iW1mtJeB
	 47oDxRIhG9Dtr3pG/SEttZdOYgSn5yP2M7IqzDzb6krMTRelLa/lqVFyjkoNNvklbw
	 lY+9bB0XI66WA==
Date: Mon, 23 Dec 2024 06:11:35 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: wzs <wangzhengshu39@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org, x86@kernel.org
Subject: Re: WARNING: kernel stack regs has bad "bp" value
Message-ID: <20241223141135.g5lkpzhz32pcpzku@jpoimboe>
References: <CAGXGE_LB3RBqujRWE4fai5hrG6WHk-_c9mToEc0Q_1rBY7M9Xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGXGE_LB3RBqujRWE4fai5hrG6WHk-_c9mToEc0Q_1rBY7M9Xg@mail.gmail.com>

On Mon, Dec 23, 2024 at 11:34:58AM +0800, wzs wrote:
> Hello,
> when fuzzing the Linux Kernel,
> i encountered several rare kernel warnings.
> It seems that the warning is related to the kernel stack.
> The versions in which this appeared are from Linux-6.8.0 to 6.13-rc3.
> 
> The two warning messages I provide below are both from the latest
> kernel version, Linux-6.13-rc3.
> If you need warnings from other versions, I would be happy to provide
> them as well.
> 
> kernel config :https://pastebin.com/hGFvz9vz
> console output1 :https://pastebin.com/7vBkDAvK
> console output2 : https://pastebin.com/T8h3Hnrr

I assume you booted with unwind_debug on the cmdline?  This "warning" is
harmless, in fact it's not a real WARNING, it's only a stack dump which
is useful for debugging stack tracing issues.

Can you share the dissassembly of vmw_send_msg? e.g. something like

  objdump -r --disassemble=vmw_send_msg vmwgfx.ko

-- 
Josh

