Return-Path: <linux-parisc+bounces-2699-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7747D99D6E6
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Oct 2024 21:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25FC5283FB1
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Oct 2024 19:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE171CACE9;
	Mon, 14 Oct 2024 19:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRi4lSTp"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24A81C876F;
	Mon, 14 Oct 2024 19:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728932404; cv=none; b=dKNZa07E66INaxn9S+Y717gWN20N9jV7DBv/G5KI/BggyxJHQygm+1PuR6oGQVN36OyesrwXn+Tt5LG8IM1eWDded9+Cd0vdjXAfAwN+Y3iEDgFrgMDG/RJzHD4KyvwjOt0M9HfXBa4BvBoiDLYPZI/7/ddNFrbGaVAdBxAXPCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728932404; c=relaxed/simple;
	bh=8hvrdxu8RGfaKAbqDPtekYUWxLzhBHuc4+/i36zmOjQ=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=G+D0VZW6Nv0PA7rYpNHXXEn6trYIISrlQPMP9xyMS38YcXNVi/Ex2B2OwSEOC2hy/MKR+SKMQI2WNV24iaclkY5P7OEVI1dctMU4SbNeMn4aVSmZjeQ+ciGSt4ohGcdhrnU05UphfV7qmRrlV9pIBfuSuKcQFvbtO+1u03Ee3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRi4lSTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4D0C4CEC3;
	Mon, 14 Oct 2024 19:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728932404;
	bh=8hvrdxu8RGfaKAbqDPtekYUWxLzhBHuc4+/i36zmOjQ=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=TRi4lSTpxe4wvFUIbJTBM/61Jdj5z7J1AyNLhUHduQKHTcFLSSM8NvweVP+19eUGw
	 Xg18arKbQrtIqzQRVHMepaxpLjkGjSRYyQK+cQ4x8XKCptt5Kjyf5QgIcDpY8sslIs
	 6EKsNpa/7WxpeC8Kozoq+abZ5sQJ/kUeMU+5au9r8G1TfSEl80ETK3mbfa2ncmvlEa
	 HHzBgJW/LlX342YQzqOXb1oE/Qyo6YMYWhwNj1mYXPoUP1/5Ower7EEkP5qBMsiwWu
	 sUpfZQkzT56LbvTbeS7Hd0JsxO6j75LRJDcpb0y9lOCFoGXEOFwXvE0gbTV0UmMuML
	 m2D1sBDQiHULQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7A9653822E4C;
	Mon, 14 Oct 2024 19:00:10 +0000 (UTC)
From: Helge Deller via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 14 Oct 2024 19:00:11 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-parisc@vger.kernel.org, bugs@lists.linux.dev, deller@gmx.de, 
 James.Bottomley@HansenPartnership.com
Message-ID: <20241014-b219339c7-43930f42ff48@bugzilla.kernel.org>
In-Reply-To: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
References: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
Subject: Re: calling getcpu with misaligned address causes kernel panic
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Helge Deller writes via Kernel.org Bugzilla:

This is now fixed in git head of qemu and can be closed:
https://gitlab.com/qemu-project/qemu/-/commit/99746de61262fd5cf80eacfdb513e8d40e9107e8

View: https://bugzilla.kernel.org/show_bug.cgi?id=219339#c7
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


