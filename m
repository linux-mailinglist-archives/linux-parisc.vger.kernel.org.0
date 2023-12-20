Return-Path: <linux-parisc+bounces-311-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAD281AB06
	for <lists+linux-parisc@lfdr.de>; Thu, 21 Dec 2023 00:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C148DB21B0A
	for <lists+linux-parisc@lfdr.de>; Wed, 20 Dec 2023 23:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213384B142;
	Wed, 20 Dec 2023 23:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hROmVzL1"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947124AF6B
	for <linux-parisc@vger.kernel.org>; Wed, 20 Dec 2023 23:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703115057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpHzyetdfnFa+em1B7GLhPjt2d/LNwN97Oht9kcvxy0=;
	b=hROmVzL1O7Cwe3uAAYuEEDuD31bk5FY1aFnMxbEc+eLcSSgXyJlHhcDi3mrgXBYCKqEj69
	zhyNqxHqnoUx7YtFvg7uJcvecJR6/sdpRy6mHXBPR7akTHleBV7D02JXwkTXPa40dQfHXt
	449/R034LxC0C2FFIC3MNwJFyFLkfJ0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-si85M4twNxiIF802LZPQqA-1; Wed,
 20 Dec 2023 18:30:52 -0500
X-MC-Unique: si85M4twNxiIF802LZPQqA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54B173C00094;
	Wed, 20 Dec 2023 23:30:51 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96C10492BFA;
	Wed, 20 Dec 2023 23:30:50 +0000 (UTC)
Date: Thu, 21 Dec 2023 07:30:47 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, joe@perches.com, nathan@kernel.org
Subject: Re: [PATCH v4 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <ZYN5Jy4PVh3ghbxN@MiWiFi-R3L-srv>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-6-bhe@redhat.com>
 <20231219-twitch-many-ca8877857182@spud>
 <ZYJsBW0Y7Y+XhSgf@MiWiFi-R3L-srv>
 <20231220074634.cd736ec567cd7adf1e4c6d7e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220074634.cd736ec567cd7adf1e4c6d7e@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

On 12/20/23 at 07:46am, Andrew Morton wrote:
> On Wed, 20 Dec 2023 12:22:29 +0800 Baoquan He <bhe@redhat.com> wrote:
> 
> > Could you help fix the typo in subject?
> > 
> > [PATCH v4 5/7] kexec_file, ricv: print out debugging message if required
> >                            ~~~ s/ricv/riscv/
> 
> I made that change.

Thanks a lot.


