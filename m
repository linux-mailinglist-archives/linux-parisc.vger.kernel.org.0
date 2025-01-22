Return-Path: <linux-parisc+bounces-3240-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B464DA19A53
	for <lists+linux-parisc@lfdr.de>; Wed, 22 Jan 2025 22:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E545F16B40F
	for <lists+linux-parisc@lfdr.de>; Wed, 22 Jan 2025 21:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA9A1C5D7A;
	Wed, 22 Jan 2025 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+8EejQU"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D971C5D74
	for <linux-parisc@vger.kernel.org>; Wed, 22 Jan 2025 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737580831; cv=none; b=ItOrCKtHLG7sEyRxUAhr1DEx/LZQIYgQG8I6/r1SWnb7u8QxRCPLr78NnrLAFH/cqESuHqVmFhpQMwaZ0yNLFjy2WBgFc86cRsdHGVDgXFvmvq4fW1cQGTTgaToufqcGNZVvl3qz3XHJaY1577tydSizdu64N5z2vky2K/O859U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737580831; c=relaxed/simple;
	bh=Bl/q/A7gkrSKc73DKlkSo8lPVvD0GN8eoIkREP3mRsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRAGGw6eyNZ/ppOeX+Zd0Z2Bv2IIR/AWFEhW4Dynu/RUptR06fCu9wiQyK7CcrjWZ7T/zkhjQOtBFFFmWUlnZYXKGU0AVD0TkyLaBPe4188vZxo3iBj2Js745+IHrEURnzINsRjqG6Hz65iELHOM62mdoVBvfnFGSXKEFN4DMag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+8EejQU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD3EC4CED2;
	Wed, 22 Jan 2025 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737580830;
	bh=Bl/q/A7gkrSKc73DKlkSo8lPVvD0GN8eoIkREP3mRsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+8EejQURMYN/GMCKUXWc12RAOdojjk+15orhnx4ZEFjJaHAgEjaOHklr6Dqr1qaF
	 a1yTNsVOb5LsjNGrLfo+mmDuBSqTkhu7gRirBCWZ/cHezyHQrzL+aRbF4tdoMgC1wo
	 O4UKOdueXUCHAglLA4OvA/GtsNK0OQE98xAXUA2lj7ZY3Xgj0MWzaFewcREGOsYnPy
	 V2uiZo7PiEZXKlUQ4cclL9POnos1TF0uBGDKy9LPYj8mPBEEd4DPGGgApV+/liQ/bm
	 aXrdrbBh4+tvm24haMmY+k3LxzIC0whiQsZ83/Su6GvadmBlImkLWrhN+nTwrwXlPO
	 FGVe46JA1SQew==
Date: Wed, 22 Jan 2025 22:20:26 +0100
From: Helge Deller <deller@kernel.org>
To: Laurent Vivier <laurent@vivier.eu>, linux-parisc@vger.kernel.org
Cc: Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
	deller@gmx.de
Subject: Re: [PATCH v4 1/7] linux-user: netlink: Add missing IFA_PROTO to
 host_to_target_data_addr_rtattr()
Message-ID: <Z5FhGi9HD0GzLbjQ@p100>
References: <20250120213340.359195-1-deller@kernel.org>
 <20250120213340.359195-2-deller@kernel.org>
 <fa016fb1-1f24-4e03-876e-58b4a0296962@vivier.eu>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa016fb1-1f24-4e03-876e-58b4a0296962@vivier.eu>

* Laurent Vivier <laurent@vivier.eu>:
> [...]
> It would be cleaner to replace all the IFA_XXX by their QEMU_IFA_XXX.

Thanks for review, Laurent!

Below I've merged patch #1 and #7, as suggested by you.
Is this OK?
Can you review?

Thanks!
Helge
________________________________________

From: Helge Deller <deller@gmx.de>
Date: Mon, 20 Jan 2025 22:20:41 +0100
Subject: [PATCH] linux-user: netlink: Add missing IFA_PROTO to
 host_to_target_data_addr_rtattr()

Fix this warning:
 Unknown host IFA type: 11

While adding IFA_PROTO, convert all IFA_XXX values over to QEMU_IFA_XXX values
to avoid a build failure on Ubuntu 22.04 (kernel v5.18 which does not know
IFA_PROTO yet).

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index c04a97c73a..2e714c8e56 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -31,6 +31,22 @@
 #include "fd-trans.h"
 #include "signal-common.h"
 
+enum {
+    QEMU_IFA_UNSPEC,
+    QEMU_IFA_ADDRESS,
+    QEMU_IFA_LOCAL,
+    QEMU_IFA_LABEL,
+    QEMU_IFA_BROADCAST,
+    QEMU_IFA_ANYCAST,
+    QEMU_IFA_CACHEINFO,
+    QEMU_IFA_MULTICAST,
+    QEMU_IFA_FLAGS,
+    QEMU_IFA_RT_PRIORITY,
+    QEMU_IFA_TARGET_NETNSID,
+    QEMU_IFA_PROTO,
+    QEMU__IFA__MAX,
+};
+
 enum {
     QEMU_IFLA_BR_UNSPEC,
     QEMU_IFLA_BR_FORWARD_DELAY,
@@ -1138,20 +1154,21 @@ static abi_long host_to_target_data_addr_rtattr(struct rtattr *rtattr)
 
     switch (rtattr->rta_type) {
     /* binary: depends on family type */
-    case IFA_ADDRESS:
-    case IFA_LOCAL:
+    case QEMU_IFA_ADDRESS:
+    case QEMU_IFA_LOCAL:
+    case QEMU_IFA_PROTO:
         break;
     /* string */
-    case IFA_LABEL:
+    case QEMU_IFA_LABEL:
         break;
     /* u32 */
-    case IFA_FLAGS:
-    case IFA_BROADCAST:
+    case QEMU_IFA_FLAGS:
+    case QEMU_IFA_BROADCAST:
         u32 = RTA_DATA(rtattr);
         *u32 = tswap32(*u32);
         break;
     /* struct ifa_cacheinfo */
-    case IFA_CACHEINFO:
+    case QEMU_IFA_CACHEINFO:
         ci = RTA_DATA(rtattr);
         ci->ifa_prefered = tswap32(ci->ifa_prefered);
         ci->ifa_valid = tswap32(ci->ifa_valid);
@@ -1398,8 +1415,8 @@ static abi_long target_to_host_data_addr_rtattr(struct rtattr *rtattr)
 {
     switch (rtattr->rta_type) {
     /* binary: depends on family type */
-    case IFA_LOCAL:
-    case IFA_ADDRESS:
+    case QEMU_IFA_LOCAL:
+    case QEMU_IFA_ADDRESS:
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "Unknown target IFA type: %d\n",

