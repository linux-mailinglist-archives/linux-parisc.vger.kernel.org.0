Return-Path: <linux-parisc+bounces-1774-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E8929E1A
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 10:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FB701C214EA
	for <lists+linux-parisc@lfdr.de>; Mon,  8 Jul 2024 08:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48FF3BB21;
	Mon,  8 Jul 2024 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AtpG6HiN"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548DB39AFD
	for <linux-parisc@vger.kernel.org>; Mon,  8 Jul 2024 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720426432; cv=none; b=JrpjxORIFiGKQvDANqq9WhIzvqlVdchUb+dr8HHvco59FbhWzUI3veHBgVfjb+N7LESuJDuEXUmcjVAGa5820MVoZektVRe4ho4SRljR1u39KB9TE7Y4+bzFT1efV/hAaj1Lr7EWY90+JIA3mkiRiGzL/aWFGtj0Mw8hy0AtzLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720426432; c=relaxed/simple;
	bh=QzLPwH8SzKi30aX05IHkr5SFgm3agDxLSTEhbqJSrSU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hl41XKdMqVFw7TYX1hn0gKhEmMKLMUH9Jym4eBbMBvRMYuXMK8n+wZrOB5IjTubywWMNKzsliP66C4xKve8BX9URCe6lXupEW/Gbq/eqkL19wSr+NA3R0g6STtNX5g0Lz/g7Vk6H+v+FDwm50xpOUJkzXMw/1IwSLg/a8vOBjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AtpG6HiN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720426430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dDLtyhA6tUIP9J/3BlCWm5ah6qeCS+d77E2ZYuYNgcs=;
	b=AtpG6HiNUUt2jetRYnWkNNfCfWLRhwRUYQtQ+FAuVwaQivfOlr/MVL0VWEAVd79J9udmfA
	seXvdOeoE4IYEHsE0Pj2EEMWbZLRNpqXEBl/zQPWAsqjvyIozAFmpdtWxEma/SJFJ3UwGq
	fUCK1qK4DWki+cuNFWwd+JzJFGeBaxo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-255-zECtPaciOQuz_LD20Kuthg-1; Mon,
 08 Jul 2024 04:13:41 -0400
X-MC-Unique: zECtPaciOQuz_LD20Kuthg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D26B119560B1;
	Mon,  8 Jul 2024 08:13:39 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.113])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F1AA61955F3B;
	Mon,  8 Jul 2024 08:13:37 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Helge Deller <deller@kernel.org>
Cc: libc-alpha@sourceware.org,  John David Anglin <dave.anglin@bell.net>,
  linux-parisc@vger.kernel.org
Subject: Re: [PATCH] hppa: Wire up cacheflush syscall
In-Reply-To: <Zos8gVaGUcuaaNaI@carbonx1> (Helge Deller's message of "Mon, 8
	Jul 2024 03:10:25 +0200")
References: <Zos8gVaGUcuaaNaI@carbonx1>
Date: Mon, 08 Jul 2024 10:13:34 +0200
Message-ID: <877cdwfgi9.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

* Helge Deller:

> diff --git a/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h b/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h
> new file mode 100644
> index 0000000000..16e47d1329
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/hppa/sys/cachectl.h
> @@ -0,0 +1,36 @@

> +#ifndef _SYS_CACHECTL_H
> +#define _SYS_CACHECTL_H 1
> +
> +#include <features.h>
> +
> +/* Get the kernel definition for the op bits.  */
> +#include <asm/cachectl.h>

This makes this header (<sys/cachectl.h>) unusable with older kernel
headers.  I think it also results in a test failure with older headers.
Is this a problem?

In similar cases, we use LINUX_VERSION_CODE checks (for older compilers)
and __has_include to support backports.

Thanks,
Florian


