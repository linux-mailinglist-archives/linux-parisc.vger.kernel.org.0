Return-Path: <linux-parisc+bounces-2366-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C5A97A860
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Sep 2024 22:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48BB01F2454D
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Sep 2024 20:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49FA3BBF2;
	Mon, 16 Sep 2024 20:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YI07iw0c"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8065AF9FE
	for <linux-parisc@vger.kernel.org>; Mon, 16 Sep 2024 20:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726519210; cv=none; b=Ap3MCeAbaMKW73GrkvOXeYqHM/nx9L24O7b/sh4m4pfk8xeLxMMiGXK/Z7VU0+/RT1awfIgmMeHMGqHl/9Z6Rerw+Av1AjPq2cpVeR7hZ6++cXF0JR+jGAzLsdIUb69eWdhJAjTDlzCzRJ2a/yhBiRk1yh8zmP+1YLhF5vmtAKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726519210; c=relaxed/simple;
	bh=q607gZ7bOXAshnrnxWeCn9nyXjUqdJHM08X3Sq7cS80=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PyYjNJu8O8c+qDyL/WFG/pYtvPrRf8FeE9zOqqoINMDCHHVyFtihr+gcwTh1ill//WXx3d+KMYHEFH3wS6t7NASzagBbIBgvF+POymLqKrBTs2zy8IWNKZ7T0FTsbGs3+RHvMp/2Qeo/ZOd2dkmOPwtMKboC+B/DDg5sJXcH8dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YI07iw0c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AAFC4CEC4;
	Mon, 16 Sep 2024 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726519209;
	bh=q607gZ7bOXAshnrnxWeCn9nyXjUqdJHM08X3Sq7cS80=;
	h=Date:From:To:Subject:From;
	b=YI07iw0cs7m/GzJ0z4sf5bsSQlx/KdbtHLMf67VIt20JzlzTawUhpL4R1XWX4tD74
	 VenNQJ8j3JWj9GL7E7H5vFp6uzrmS5EWsf01K2QB9RrxSbhEXeqSGS2W00WkSWR4Ca
	 xtZvNobkEKpeaTgKK4n4YUSxP3WuKkk84UfhWadJpSEX8b/8KwUe0K1FgwZg8BbgNY
	 j1wba9BgGPgmLIWT3TS8S1ZjMMi3xD60N1UsBj8nesYFjZq2xZqYKJyODSM0Sw+BZ8
	 TUEN/PhaiHifliC48/aPFQp/iTtG2glcslYX4YwFhqjzk81u42QORWaRey50CP6ua2
	 TF6iV/LN3sdjA==
Date: Mon, 16 Sep 2024 22:40:06 +0200
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH] RFC: mm: mmap: Allow mmap(MAP_STACK) to map growable stack
Message-ID: <ZuiXpu9l8kXx7Hz9@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is a RFC to change the behaviour of mmap(MAP_STACK) to be
sufficient to map memory for usage as stack on all architectures.
Currently MAP_STACK is a no-op on Linux, and instead MAP_GROWSDOWN
has to be used.
To clarify, here is the relevant info from the mmap() man page:

MAP_GROWSDOWN
   This flag is used for stacks. It indicates to the kernel virtual
   memory system that the mapping should extend downward in memory.  The
   return address is one page lower than the memory area that is
   actually created in the process's virtual address space.  Touching an
   address in the "guard" page below the mapping will cause the mapping
   to grow by a page. This growth can be repeated until the mapping
   grows to within a page of the high end of the next lower mapping,
   at which point touching the "guard" page will result in a SIGSEGV
   signal.

MAP_STACK (since Linux 2.6.27)
   Allocate the mapping at an address suitable for a process or thread
   stack.

   This flag is currently a no-op on Linux. However, by employing this
   flag, applications can ensure that they transparently obtain support
   if the flag is implemented in the future. Thus, it is used in the
   glibc threading implementation to allow for the fact that
   some architectures may (later) require special treatment for
   stack allocations. A further reason to employ this flag is
   portability: MAP_STACK exists (and has an effect) on some
   other systems (e.g., some of the BSDs).

The reason to suggest this change is, that on the parisc architecture the
stack grows upwards. As such, using solely the MAP_GROWSDOWN flag will not
work. Note that there exists no MAP_GROWSUP flag.
By changing the behaviour of MAP_STACK to mark the memory area with the
VM_STACK bit (which is VM_GROWSUP or VM_GROWSDOWN depending on the
architecture) the MAP_STACK flag does exactly what people would expect on
all platforms.

This change should have no negative side-effect, as all code which
used mmap(MAP_GROWSDOWN | MAP_STACK) still work as before.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/include/linux/mman.h b/include/linux/mman.h
index bcb201ab7a41..66bc72a0cb19 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -156,6 +156,7 @@ calc_vm_flag_bits(unsigned long flags)
 	return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
 	       _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
 	       _calc_vm_trans(flags, MAP_SYNC,	     VM_SYNC      ) |
+	       _calc_vm_trans(flags, MAP_STACK,      VM_STACK     ) |
 	       _calc_vm_trans(flags, MAP_STACK,	     VM_NOHUGEPAGE) |
 	       arch_calc_vm_flag_bits(flags);
 }

