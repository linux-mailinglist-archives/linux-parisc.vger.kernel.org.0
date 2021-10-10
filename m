Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83E44280E9
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Oct 2021 13:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhJJLoC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 10 Oct 2021 07:44:02 -0400
Received: from smtp.duncanthrax.net ([178.63.180.169]:36056 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbhJJLoB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 10 Oct 2021 07:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Type:MIME-Version:Message-ID:In-Reply-To
        :Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dvsBYIPmKandhP4ZYE92tao9q/ZjWres86PXE6W07Oc=; b=MsbSWCZZD6YkxTCghvU2M1shgH
        srwRgOGKQOmVwrRrvfd7oYmqWMxPfkSTQjVdMbk/wiqzYoZ+XLAimsqxrzyxFEEBC8zC254gSugeY
        AptRaUggDvUGiEr3yQL5Y507NkuITYljUeZ8EpXZ89UVhd8NQx/3qyZRhRAnWRnnnUDs=;
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
        by smtp.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1mZXDN-0002uh-Pr; Sun, 10 Oct 2021 13:42:01 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH 2/2] parisc: add support for TOC (transfer of control)
References: <20211009213856.3326-1-svens@stackframe.org>
        <20211009213856.3326-3-svens@stackframe.org>
        <d2fd6be4-c76e-6be4-924f-484549883aa0@gmx.de>
Date:   Sun, 10 Oct 2021 13:42:01 +0200
In-Reply-To: <d2fd6be4-c76e-6be4-924f-484549883aa0@gmx.de> (Helge Deller's
        message of "Sun, 10 Oct 2021 11:13:25 +0200")
Message-ID: <87pmsdgl86.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Helge Deller <deller@gmx.de> writes:

> On 10/9/21 23:38, Sven Schnelle wrote:
>> +	load32	PA(toc_stack),sp
>> +	/*
>> +	 * deposit CPU number into stack address,
>> +	 * so every CPU will have its own stack.
>> +	 */
>> +	depw	%r4,18,2,%sp
>
> Shouldn't this be 5 instead of 2, otherwise it limits it to 4 CPUs,
> while we currently can have up to 32 (see arch/parisc/Kconfig).
> e.g.:	depw	%r4,18,5,%sp
>
>> +
>> ...
>> +SYM_DATA(toc_handler_size, .long . - toc_handler)
>> +SYM_DATA(toc_lock, .long 1)
>> +
>> +	__PAGE_ALIGNED_BSS
>> +	.align 16384*NR_CPUS
>
> ^ This align is too big, esp. since NR_CPUS can be 32.
> At minimum a stack needs to be 64-byte aligned.
> I think a simple .align 64 here, and changing the multiplication
> above with adding the offset is better.

The .align was a quick way to test the stack offset, but i agree that
doing a regular add is the better way. Also i missed to align toc_lock
at a 16 byte boundary.
