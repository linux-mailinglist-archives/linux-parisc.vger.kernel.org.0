Return-Path: <linux-parisc+bounces-2908-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278979B1846
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Oct 2024 14:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53F22813A3
	for <lists+linux-parisc@lfdr.de>; Sat, 26 Oct 2024 12:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560B81D63FC;
	Sat, 26 Oct 2024 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rr0HF2A4"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222591D63E6;
	Sat, 26 Oct 2024 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729947262; cv=none; b=MTHFPzP74UiMpxl2rV/SiBJej347zxJRP6L66mqzw1kCC7upnQtdx6MBn1HfsLzFU6cEQvZK2+d6mq6O+bKD/Jf4NNW8gTnmSq1S/WcV3Y9M54TGGqhCJZSUdp7pgRoL9iqxcKj2RkjtazLxF2kOlvejEvGLhZTgoWFbNWTY6ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729947262; c=relaxed/simple;
	bh=iKa9bcxI6W9fsHF/fh/13PtU+WQ5xvNEzWBxiNVZ7eU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GZWuMPkG97wRnRyHxYLOMo5CS9D8Ko8KTDs5I0cJwqAKcNg9Q84mlwSAYOBUKbu37oHj7Xw1QcmIulGZtYB+uM2Sl45eOCjcCxJ7MdIwKbvnWIVYOcqDIUVSu1KiLryL1lYxApEI8CS5/YBwB6/u6pye5sEbjCgoBgsuVMRGdiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rr0HF2A4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425CCC4CEC6;
	Sat, 26 Oct 2024 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729947261;
	bh=iKa9bcxI6W9fsHF/fh/13PtU+WQ5xvNEzWBxiNVZ7eU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Rr0HF2A4OHxPVLkG66zIsA8D6iwuAPYLezAGVOe/LUIHoNOkc7djYPSo/4eVX6vhM
	 KZO9ycMHcppjPtg5UFEHlnpWavhEMZfStN9lFTBq61LrrJKX+S2aC9O/wfTk8q4QEM
	 bHvqgX6KwJlR7NgqtT2XZEgZMhjYnrqNtM8KxPI1v+MhHGRb+KOTVRCgRUmlX4uhr/
	 2w83yfInFhGYwKGAjNG+lhqxaRUL2RxRtWSyR8zQ+ywIaK74PRt5gZ6BC8tbgA0VJL
	 t+jAu+jZpKkdFqawZb7PfXODUJOXJNrOLy5zbXX+lFlbUVm3ROekitz7DtYgsJDHJO
	 HbV0NDFvPIhbg==
From: Puranjay Mohan <puranjay@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Hao Luo <haoluo@google.com>,
	Helge Deller <deller@gmx.de>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Mykola Lysenko <mykolal@fb.com>,
	netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [PATCH bpf-next v3 3/4] selftests/bpf: don't mask result of bpf_csum_diff() in test_verifier
Date: Sat, 26 Oct 2024 12:53:38 +0000
Message-Id: <20241026125339.26459-4-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241026125339.26459-1-puranjay@kernel.org>
References: <20241026125339.26459-1-puranjay@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bpf_csum_diff() helper has been fixed to return a 16-bit value for
all archs, so now we don't need to mask the result.

This commit is basically reverting the below:

commit 6185266c5a85 ("selftests/bpf: Mask bpf_csum_diff() return value
to 16 bits in test_verifier")

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Reviewed-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 tools/testing/selftests/bpf/progs/verifier_array_access.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_array_access.c b/tools/testing/selftests/bpf/progs/verifier_array_access.c
index 95d7ecc12963b..4195aa824ba55 100644
--- a/tools/testing/selftests/bpf/progs/verifier_array_access.c
+++ b/tools/testing/selftests/bpf/progs/verifier_array_access.c
@@ -368,8 +368,7 @@ __naked void a_read_only_array_2_1(void)
 	r4 = 0;						\
 	r5 = 0;						\
 	call %[bpf_csum_diff];				\
-l0_%=:	r0 &= 0xffff;					\
-	exit;						\
+l0_%=:	exit;						\
 "	:
 	: __imm(bpf_csum_diff),
 	  __imm(bpf_map_lookup_elem),
-- 
2.40.1


