Return-Path: <linux-parisc+bounces-1855-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE7493DEA9
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 12:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676B81F21ED5
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Jul 2024 10:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10FD40848;
	Sat, 27 Jul 2024 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q2JYYPYi"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4AB8F6D
	for <linux-parisc@vger.kernel.org>; Sat, 27 Jul 2024 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722075074; cv=none; b=LiqIPprAVPfam6S0ZlC0MvlyCt0Ptd03dYoNgJyQRXRkrz0n/zAhXx3z8+G/jfGnWbW1p2TNaDwrxsbJSs1TKXkoPEbUCiYcZmjgxNG6uNXMdzDZ/TRPi1e3LQTQAw9TEbZp1tO/RN2QeX6sstpL5BlCtf+ZP0mkNPDX9jNInAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722075074; c=relaxed/simple;
	bh=0IpraM1NzrR5tsTj6oHJYwc1RLUyItBlkiAzbMTzUSs=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q3HTPiqz5rkk3MUuHfDgcGfBf+vFnhA78Wik/hsg6ZEcZ1jWIUEoCfwR0mQAUaS6hleC+cD+amqHc0xXZ9/xlXhEFuC3RKd0ZVDqjX3VAMk4miLydgruLsPTo2QtBGATlNJiktnB14NolkP7j03EswmjSmYnscUUDV4Zz1YBcy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q2JYYPYi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722075071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=jkGf8ZckPPCVdIiK39jJrmOOUULO/ys+8HYOYAnyQRY=;
	b=Q2JYYPYiCk44iylVpAGAx6MgI7jCRme7dMZdh8/GYxpU0zQOMnj7d9z6OVZuHicdjuLMf6
	s06/TMPI7d9YmojJvYp8A5rNL3HCpxDRJmGt+5frD/gCB0wP8dg9SKowpcjO8lVVYKvPez
	eAEhwabiaDwMoAPeyiBlTlQIT/GISC0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-05V1x8ELNDeSKSadxevYiQ-1; Sat,
 27 Jul 2024 06:11:06 -0400
X-MC-Unique: 05V1x8ELNDeSKSadxevYiQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F2CB819560B0;
	Sat, 27 Jul 2024 10:11:04 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0DDE21955D42;
	Sat, 27 Jul 2024 10:11:03 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id E7A7F30C1C17; Sat, 27 Jul 2024 10:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id E6FDE3FD04;
	Sat, 27 Jul 2024 12:11:02 +0200 (CEST)
Date: Sat, 27 Jul 2024 12:11:02 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: John David Anglin <dave.anglin@bell.net>, 
    John David Anglin <dave@parisc-linux.org>, 
    James Bottomley <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>
cc: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: fix unaligned accesses in BPF
Message-ID: <1e96c3f-d45c-b128-907b-ca2fba5f6a2d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

There were spurious unaligned access warnings when calling BPF code.
Sometimes, the warnings were triggered with any incoming packet, making
the machine hard to use.

The reason for the warnings is this: on parisc64, pointers to functions
are not really pointers to functions, they are pointers to 16-byte
descriptor. The first 8 bytes of the descriptor is a pointer to the
function and the next 8 bytes of the descriptor is the content of the
"dp" register. This descriptor is generated in the function
bpf_jit_build_prologue.

The problem is that the function bpf_int_jit_compile advertises 4-byte
alignment when calling bpf_jit_binary_alloc, bpf_jit_binary_alloc
randomizes the returned array and if the array happens to be not aligned
on 8-byte boundary, the descriptor generated in bpf_jit_build_prologue is
also not aligned and this triggers the unaligned access warning.

Fix this by advertising 8-byte alignment on parisc64 when calling
bpf_jit_binary_alloc.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 arch/parisc/net/bpf_jit_core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-6.10/arch/parisc/net/bpf_jit_core.c
===================================================================
--- linux-6.10.orig/arch/parisc/net/bpf_jit_core.c	2024-07-23 20:35:34.000000000 +0200
+++ linux-6.10/arch/parisc/net/bpf_jit_core.c	2024-07-27 11:40:17.000000000 +0200
@@ -114,7 +114,7 @@ struct bpf_prog *bpf_int_jit_compile(str
 			jit_data->header =
 				bpf_jit_binary_alloc(prog_size + extable_size,
 						     &jit_data->image,
-						     sizeof(u32),
+						     sizeof(long),
 						     bpf_fill_ill_insns);
 			if (!jit_data->header) {
 				prog = orig_prog;


