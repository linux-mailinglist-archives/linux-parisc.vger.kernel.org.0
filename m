Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502B542ADDB
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Oct 2021 22:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbhJLUfG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Oct 2021 16:35:06 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:54732 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhJLUfF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Oct 2021 16:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Type:MIME-Version:Message-ID:In-Reply-To
        :Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=iU34VS7K3OYruJV3UcXa8ta08JSnIrfT4+/lPUvaexQ=; b=qMAbwgofrdTgg7zZCHxF52Ntpd
        mznG51gCnbB5BUiBMP3Wl1RJt4EjTykXlRywBBZqC65CIuUMKZrIYEMkXg4Q5Us+Ml5Nf6JYF1Ryv
        qmdkzS66vo7RdwswPnULoSIL+wzc+le4kX7onffWMbKVDlaKXiJZbqsBMX1NS+hKwLfM=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by smtp.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1maOSL-00012d-3w; Tue, 12 Oct 2021 22:33:01 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/2] parisc/firmware: add functions to retrieve TOC data
References: <20211010183815.5780-1-svens@stackframe.org>
        <20211010183815.5780-2-svens@stackframe.org>
        <11844080.O9o76ZdvQC@daneel.sf-tec.de>
        <9567f761-5100-b367-32f9-a6b39094d630@gmx.de>
Date:   Tue, 12 Oct 2021 22:33:00 +0200
In-Reply-To: <9567f761-5100-b367-32f9-a6b39094d630@gmx.de> (Helge Deller's
        message of "Mon, 11 Oct 2021 22:13:11 +0200")
Message-ID: <875yu20yrn.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Helge Deller <deller@gmx.de> writes:

> On 10/11/21 17:05, Rolf Eike Beer wrote:
>>> --- a/arch/parisc/include/uapi/asm/pdc.h
>>> +++ b/arch/parisc/include/uapi/asm/pdc.h
>>> @@ -689,6 +689,28 @@ struct pdc_hpmc_pim_20 { /* PDC_PIM */
>>>  	unsigned long long fr[32];
>>>  };
>>>
>>> +struct pdc_toc_pim_11 {
>>> +	unsigned int gr[32];
>>> +	unsigned int cr[32];
>>> +	unsigned int sr[8];
>>> +	unsigned int iasq_back;
>>> +	unsigned int iaoq_back;
>>> +	unsigned int check_type;
>>> +	unsigned int hversion;
>>> +	unsigned int cpu_state;
>>> +};
>>> +
>>> +struct pdc_toc_pim_20 {
>>> +	unsigned long long gr[32];
>>> +	unsigned long long cr[32];
>>> +	unsigned long long sr[8];
>>> +	unsigned long long iasq_back;
>>> +	unsigned long long iaoq_back;
>>> +	unsigned int check_type;
>>> +	unsigned int hversion;
>>> +	unsigned int cpu_state;
>>> +};
>>> +
>>>  #endif /* !defined(__ASSEMBLY__) */
>>
>> Since these are defined by the hardware and have a well defined size I suggest
>> using u32 and u64 to cover this.
>
> You're right.
> But in the whole file we use "unsigned int" for 32bit, and "unsigned long long"
> for 64bit, so this change is consistent with the other contents.

Yes, especially the 'unsigned long long' catched my eye. However, i kept
it that way so it is consistent with the other structs. I'm happy to
change the types with a cleanup patch, but i'm wondering: why is that
all uapi? IMHO this should go to include/asm? Any objections against
moving it? I don't see how userspace could use that given that only the
kernel should be able to call into firmware.
