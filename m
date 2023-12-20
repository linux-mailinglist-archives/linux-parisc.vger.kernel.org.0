Return-Path: <linux-parisc+bounces-304-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A75EE8197BA
	for <lists+linux-parisc@lfdr.de>; Wed, 20 Dec 2023 05:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4271F26059
	for <lists+linux-parisc@lfdr.de>; Wed, 20 Dec 2023 04:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E405C20B06;
	Wed, 20 Dec 2023 04:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MJUj1EE+"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E63E208CB
	for <linux-parisc@vger.kernel.org>; Wed, 20 Dec 2023 04:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703046159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G45CImyqsOOmdqDD2eGP+r9BP7+mm5bd9KiBb8nBAIM=;
	b=MJUj1EE+tej8fVKvtTdE17KbEjDQmBhwD5m/CidJHLOQOX94GotyhB8QL9J6BOn745Ta5g
	ZBK/YYgNYUW1yiLK5BMIz7X+0iPm9/POXTTY9gFSD1hXSoP7K+6dQ1aJH71V/MiN3B/q9a
	Mitc2Dw6vFiLxOlhc6UhkAt7kQcw8Mg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Tu1M_nxTPP6L7Ts-3ewPyw-1; Tue, 19 Dec 2023 23:22:34 -0500
X-MC-Unique: Tu1M_nxTPP6L7Ts-3ewPyw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B6FA832D62;
	Wed, 20 Dec 2023 04:22:33 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83323492BE6;
	Wed, 20 Dec 2023 04:22:32 +0000 (UTC)
Date: Wed, 20 Dec 2023 12:22:29 +0800
From: Baoquan He <bhe@redhat.com>
To: Conor Dooley <conor@kernel.org>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, joe@perches.com, nathan@kernel.org
Subject: Re: [PATCH v4 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <ZYJsBW0Y7Y+XhSgf@MiWiFi-R3L-srv>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-6-bhe@redhat.com>
 <20231219-twitch-many-ca8877857182@spud>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219-twitch-many-ca8877857182@spud>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

On 12/19/23 at 02:44pm, Conor Dooley wrote:
> On Wed, Dec 13, 2023 at 01:57:45PM +0800, Baoquan He wrote:
> > Then when specifying '-d' for kexec_file_load interface, loaded
> > locations of kernel/initrd/cmdline etc can be printed out to help debug.
> > 
> > Here replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> > 
> > And also replace pr_notice() with kexec_dprintk() in elf_kexec_load()
> > because loaded location of purgatory and device tree are only printed
> > out for debugging, it doesn't make sense to always print them out.
> > 
> > And also remove kexec_image_info() because the content has been printed
> > out in generic code.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> 
> I'm sorry - I meant to look at this several days ago but I forgot.
> Apart from the typo that crept back into $subject, this version explains
> the rationale behind what you're changing a lot better, thanks.

Thanks for careful checking. I forgot the typo fixing you have pointed
out in v3 reviewing.

Hi Andrew,

Could you help fix the typo in subject?

[PATCH v4 5/7] kexec_file, ricv: print out debugging message if required
                           ~~~ s/ricv/riscv/


