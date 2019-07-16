Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6698B6A90F
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Jul 2019 15:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfGPNB2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Jul 2019 09:01:28 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39508 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGPNB2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Jul 2019 09:01:28 -0400
Received: by mail-pl1-f194.google.com with SMTP id b7so10091888pls.6
        for <linux-parisc@vger.kernel.org>; Tue, 16 Jul 2019 06:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SG8qhDoSHsba/3+8ydf3MEjCtTI+ImMVXa2dK2oO2GU=;
        b=DERN6gnAqU6qZsCxFBTIvVBRLyd5i/7+JTlCdHdaL1YeKZyAe5Ps2055kZSWs0DmP1
         tJyltUKEeWsUM60c1clDMuCnY282koILWR+2hmjJxQI3klcoDIiXS+85fGlX4aa7l6Wa
         iNFJFHLkAXJAvl/vzkuUd7dKuwk6V/8+o2k/Z4fxiJk/9OHQc0whLFv1vX2iXxlOB5nU
         CrKyY+Dbt/iRgTqQsNdHWHEIfgGoSpVu2jRjleGOubzE+TMuKRXITwtyYwLXcSO3Tdt5
         Mlh0o/80xwbBoeNk9XGwAi7Osp/t+rkB7UQ4YHe43WjYXHXYXBZrKGkVeGZH0I1csK39
         8RWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SG8qhDoSHsba/3+8ydf3MEjCtTI+ImMVXa2dK2oO2GU=;
        b=UUDv17HTfyLFBDJxcUy+WB47FDxtPeMi4c0son9PUt4gyCnCARvfU++tVnNb5IW912
         QregF5Gb6fT0+hUUJtKldEovJ71RttiuTY+KhQabz+Yg2205BYJT28PSk1ER2Ka1j96G
         UmXRczigyzfY8qDa1Ri4sRNp9Rp5ZFuRB8Rf2k1q5lyXktDp7iIww2GLGqhhqD5AGo7C
         GyEKeAL62OdMKU02zI7un2LAHsqkq1OivPC98B53WlYURXpGn0FbzV6+BqvEVRlvfy3B
         Kw4+F7aCgJprxKSFwwkeuTR2T1au2bEa2X+Pj2ZfWPaTSnK7JBdaJ38iwP1ieSSi81Oq
         0jIw==
X-Gm-Message-State: APjAAAUOVQEhT08CGJe1ydD8n8FC21zqogA6JoNTsRPLVEOrz5jWRhRT
        xF7Jsho8z3+QBqACO2+g/8w=
X-Google-Smtp-Source: APXvYqx2aTBLkVodX0y6eeF1FDB6532cd2sE9xR5CLMwb5is+eFuQ4ahI8HjMk/oniMhNCnCNNcn0w==
X-Received: by 2002:a17:902:9689:: with SMTP id n9mr35717349plp.241.1563282087577;
        Tue, 16 Jul 2019 06:01:27 -0700 (PDT)
Received: from brauner.io ([172.58.30.188])
        by smtp.gmail.com with ESMTPSA id k25sm14356979pgt.53.2019.07.16.06.01.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 06:01:26 -0700 (PDT)
Date:   Tue, 16 Jul 2019 15:01:21 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, arnd@arndb.de
Subject: Re: [PATCH] parisc: Wire up clone3 syscall
Message-ID: <20190716130118.dlu6hz4mpek6s7nc@brauner.io>
References: <20190715203326.GA25932@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190715203326.GA25932@ls3530.fritz.box>
User-Agent: NeoMutt/20180716
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jul 15, 2019 at 10:33:26PM +0200, Helge Deller wrote:
> Untested patch to wire up the clone3 syscall.

From what I can see from your entry points the treatment for fork and
clone the relevant bit is:

	.macro	fork_like name
ENTRY_CFI(sys_\name\()_wrapper)
	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
	ldo	TASK_REGS(%r1),%r1
	reg_save %r1
	mfctl	%cr27, %r28
	ldil	L%sys_\name, %r31
	be	R%sys_\name(%sr4,%r31)
	STREG	%r28, PT_CR27(%r1)
ENDPROC_CFI(sys_\name\()_wrapper)
	.endm

Which seems to be identical for fork(), vfork(), and clone().
So parisc doesn't seem to have to muck with any clone-specific args. If
that's the case things should be fine for clone3 on parisc. I only
expect issues for arches that need to shove around specific arguments
for clone.

> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
> index b0838dc4dfee..cd438e4150f6 100644
> --- a/arch/parisc/include/asm/unistd.h
> +++ b/arch/parisc/include/asm/unistd.h
> @@ -166,6 +166,7 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5)	\
>  #define __ARCH_WANT_SYS_FORK
>  #define __ARCH_WANT_SYS_VFORK
>  #define __ARCH_WANT_SYS_CLONE
> +#define __ARCH_WANT_SYS_CLONE3
>  #define __ARCH_WANT_COMPAT_SYS_SENDFILE
> 
>  #ifdef CONFIG_64BIT
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index 3e430590c1e1..d9d3387f7c47 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -1732,6 +1732,7 @@ ENDPROC_CFI(sys_\name\()_wrapper)
>  	.endm
> 
>  fork_like clone
> +fork_like clone3
>  fork_like fork
>  fork_like vfork
> 
> diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
> index 5022b9e179c2..670d1371aca1 100644
> --- a/arch/parisc/kernel/syscalls/syscall.tbl
> +++ b/arch/parisc/kernel/syscalls/syscall.tbl
> @@ -431,3 +431,4 @@
>  432	common	fsmount				sys_fsmount
>  433	common	fspick				sys_fspick
>  434	common	pidfd_open			sys_pidfd_open
> +435	common	clone3				sys_clone3_wrapper
