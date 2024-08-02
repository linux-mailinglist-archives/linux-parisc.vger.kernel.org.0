Return-Path: <linux-parisc+bounces-1901-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56A946468
	for <lists+linux-parisc@lfdr.de>; Fri,  2 Aug 2024 22:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E6511C20CB3
	for <lists+linux-parisc@lfdr.de>; Fri,  2 Aug 2024 20:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3D21ABEB3;
	Fri,  2 Aug 2024 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdC72rA6"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A21ABEBB
	for <linux-parisc@vger.kernel.org>; Fri,  2 Aug 2024 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722630627; cv=none; b=Sg/0R5Cjt8be4+Vh2bTWcMEO2s+oZrgiIGRl4lNgeFjajRNRNXoFLaQW77urNtQXyJPuEEVdL1L1ukBu6UzRSZ5q4o52hUeFdadbyG3AkEBXQX5lVS2d4rJvEZowcXXMxnKfYZUvagq/5tKO8sx7FX8RVZtuupzo5niLw50+bZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722630627; c=relaxed/simple;
	bh=UV26H6xzZCol14A68FxXR4WKk28YieyYBsJGfgAJS90=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S53/4VxxGdzlzEEEn4KUYEsQtOmO7sKEJS5n5RUMOSC84Ddj6BFL9/UvUROhAioGMTstEQ5f5Gmvhyf2CgwOn8lkgrZPPXbpkkNdy9NOlWQS2g/+C9CFvJJAjo3xyWVeAdjYiCVC6X+HURhZrVkT+ILAHQKCiq2Gn3hfiTVHELE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdC72rA6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D340FC32782;
	Fri,  2 Aug 2024 20:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722630626;
	bh=UV26H6xzZCol14A68FxXR4WKk28YieyYBsJGfgAJS90=;
	h=Date:From:To:Subject:From;
	b=KdC72rA6e5KiPDTFI1ipEWIE+FhxgPwwoLnfr82EqELduUQZQ5mGVpm1d+cwelvZj
	 BfSWdvvdgpVj2HUeEzSXIhD+H2WxCY0xHKrPhn3vnFeZdOXEOgoC4guX0uUuWgNL6Y
	 3+8QwC2l3aqUpMVb+6S/TWbNCOC9jzchqM19o0fP/QLAm8s/Cq0q2oHEjsbHGbdMFg
	 3EhddXM5QeYMMGX3Mxlyuiwxa5HN5sNNefNuDeB5VN/MJY0ortXL4WYJ9ppUdkQhvP
	 vV0xD1zwsz8SwSsoOLPhPyTDfFwSc0LE1KDLm7p7QERqyl7N2NFKa6jgkb0mir3AcX
	 cEieRQ3V43GCg==
Date: Fri, 2 Aug 2024 22:30:23 +0200
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [GIT PULL] parisc architecture fixes for v6.11-rc2
Message-ID: <Zq1B366giNrrbU3W@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull to receive two fixes from Mikulas Patocka for the parisc architecture for 6.11-rc2.

The fixes avoid unaligned memory access warnings when calling BPF functions
and fix possible DMA corruptions.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.11-rc2

for you to fetch changes up to 7ae04ba36b381bffe2471eff3a93edced843240f:

  parisc: fix a possible DMA corruption (2024-07-29 16:19:07 +0200)

----------------------------------------------------------------
parisc architecture fixes for kernel v6.11-rc2:

- fix unaligned memory accesses when calling BPF functions
- adjust memory size constants to fix possible DMA corruptions

----------------------------------------------------------------
Mikulas Patocka (2):
      parisc: fix unaligned accesses in BPF
      parisc: fix a possible DMA corruption

 arch/parisc/Kconfig             |  1 +
 arch/parisc/include/asm/cache.h | 11 ++++++++++-
 arch/parisc/net/bpf_jit_core.c  |  2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

