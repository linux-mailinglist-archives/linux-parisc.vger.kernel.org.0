Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B879642836A
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Oct 2021 21:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhJJTik (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 10 Oct 2021 15:38:40 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:57656 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbhJJTii (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 10 Oct 2021 15:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Type:MIME-Version:Message-ID:In-Reply-To
        :Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nKhJ75hPW7iRg32drssui+vu/rx3h2vtgUEU5eKwq+g=; b=mXQmeFxJbPiJnaonaZHVTKaWXN
        ux/1D3zCxXNgYd4IeWR7BGBU4hBtyzl7GMBLbZhNl8I2ICwQtmlEfc185HsClIrbGacBDq69McDyP
        J6pptIb8YVmpff1R3nkzVcnX/mYLYv/wT/6g342Inxfq/WBer2luvoE4We4i0vHcuJcE=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by smtp.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZecf-0006YS-U3; Sun, 10 Oct 2021 21:36:38 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH 2/2] parisc: add support for TOC (transfer of control)
References: <20211010183815.5780-1-svens@stackframe.org>
        <20211010183815.5780-3-svens@stackframe.org>
        <57e64e6d-88a6-7789-efa5-7e3bdbeae8df@gmx.de>
Date:   Sun, 10 Oct 2021 21:36:37 +0200
In-Reply-To: <57e64e6d-88a6-7789-efa5-7e3bdbeae8df@gmx.de> (Helge Deller's
        message of "Sun, 10 Oct 2021 21:31:00 +0200")
Message-ID: <87lf30hdtm.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

Helge Deller <deller@gmx.de> writes:

> On 10/10/21 20:38, Sven Schnelle wrote:
>> +void notrace toc_intr(struct pt_regs *regs)
>> +{
>> +	struct pdc_toc_pim_20 pim_data20;
>> +	struct pdc_toc_pim_11 pim_data11;
>> +
>> +	nmi_enter();
>> +
>> +	if (boot_cpu_data.cpu_type >= pcxu) {
>
> I wonder if this is correct.
> If we boot a 32bit-kernel on a 64-bit (pcxu) machine, then
> I think the code below for pdc_pim_toc11() should be executed.
> So, maybe we need a #ifdef CONFIG_64BIT above...
>
>
>> +		if (pdc_pim_toc20(&pim_data20))
>> +			panic("Failed to get PIM data");
>> +		toc20_to_pt_regs(regs, &pim_data20);
>> +	} else {
>
> ... with an #else here
>
>> +		if (pdc_pim_toc11(&pim_data11))
>> +			panic("Failed to get PIM data");
>> +		toc11_to_pt_regs(regs, &pim_data11);
>> +	}
>
> and #endif here. ??

Hmm, that's what i understood from the HPMC PIM code,
transfer_pim_to_trap_frame(). If it's running a 32 Bit OS, than PDC
returns a wide frame on a 64 bit capable CPU? But maybe i have to read
the documentation/code again.

Regards
Sven
