Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A5328B052
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Oct 2020 10:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgJLId6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Oct 2020 04:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgJLId6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 04:33:58 -0400
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Oct 2020 01:33:58 PDT
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B73BC0613CE
        for <linux-parisc@vger.kernel.org>; Mon, 12 Oct 2020 01:33:58 -0700 (PDT)
Received: (qmail 12892 invoked from network); 12 Oct 2020 08:24:04 -0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69]:53850 HELO webmail.sf-mail.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <deller@gmx.de>; Mon, 12 Oct 2020 10:24:04 +0200
MIME-Version: 1.0
Date:   Mon, 12 Oct 2020 10:24:02 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: PATCH v2] parisc: Add MAP_UNINITIALIZED define
In-Reply-To: <20201012065051.GA3458@ls3530.fritz.box>
References: <20201010215431.GA30936@ls3530.fritz.box>
 <20201012065051.GA3458@ls3530.fritz.box>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <18f8c87e7ebaf020a6c61dfdd0d893ba@sf-tec.de>
X-Sender: eike-kernel@sf-tec.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Am 2020-10-12 08:50, schrieb Helge Deller:
> We will not allow unitialized anon mmaps, but we need this define
> to prevent build errors, e.g. the debian foot package.
> 
> Suggested-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/include/uapi/asm/mman.h
> b/arch/parisc/include/uapi/asm/mman.h
> index 6fd8871e4081..ab78cba446ed 100644
> --- a/arch/parisc/include/uapi/asm/mman.h
> +++ b/arch/parisc/include/uapi/asm/mman.h
> @@ -25,6 +25,7 @@
>  #define MAP_STACK	0x40000		/* give out an address that is best suited
> for process/thread stacks */
>  #define MAP_HUGETLB	0x80000		/* create a huge page mapping */
>  #define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap
> underlying mapping */
> +#define MAP_UNINITIALIZED 0		/* uninitialized anonymous mmap */
> 
>  #define MS_SYNC		1		/* synchronous memory sync */
>  #define MS_ASYNC	2		/* sync memory asynchronously */
> diff --git a/tools/arch/parisc/include/uapi/asm/mman.h
> b/tools/arch/parisc/include/uapi/asm/mman.h
> index f9fd1325f5bd..506c06a6536f 100644
> --- a/tools/arch/parisc/include/uapi/asm/mman.h
> +++ b/tools/arch/parisc/include/uapi/asm/mman.h
> @@ -39,6 +39,5 @@
>  #define MADV_SOFT_OFFLINE 101
>  /* MAP_32BIT is undefined on parisc, fix it for perf */
>  #define MAP_32BIT	0
> -/* MAP_UNINITIALIZED is undefined on parisc, fix it for perf */
>  #define MAP_UNINITIALIZED	0
>  #endif

Shouldn't the define itself be deleted here, too?

Eike
