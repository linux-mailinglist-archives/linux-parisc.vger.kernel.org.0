Return-Path: <linux-parisc+bounces-3494-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62011A70AC9
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Mar 2025 20:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBCB0188AF53
	for <lists+linux-parisc@lfdr.de>; Tue, 25 Mar 2025 19:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E851F30C7;
	Tue, 25 Mar 2025 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTwiajyM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE481F30C0;
	Tue, 25 Mar 2025 19:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742932196; cv=none; b=lHnM9DY3qWqCwXOqN7WRor+FVRUbHY5Jw+G3nSE8HyZb3PEDDFc5VCWK9sjaN6iLqjjxwQkPAcU45cy6/nJdz8JLR64H0V4qOpvMkvau9eyaH6xa+oyx0VbL8Gnyl+lPjXoaUVot7GByz+VYxiEw4gdLN6KvOBVLzBloXYW+bc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742932196; c=relaxed/simple;
	bh=ldE76rZNarO/NzomImTR04JN2xo91wsbqKEJjb/Oli4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nj6nn33E28EdSJjLM33KEkC/vjD7sOAEFj+StB2uGR4X0KRWRCbCVL4DHTOxnDiR891T6gRJdtgVos48li+5QH/IvuWYDv1TkhT/zxfN7QZ4/MrM7+4TykB20PWw9ip1iHJjNq3OwV1mjGaATfV6gcXtf/eZ+wxt/dC5843L5ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTwiajyM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE65C4CEE4;
	Tue, 25 Mar 2025 19:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742932195;
	bh=ldE76rZNarO/NzomImTR04JN2xo91wsbqKEJjb/Oli4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bTwiajyM9Km9itT2NtVobulR9Mam5kqlXPz4afTJKiosONHVw8nzY+GkELIKj3OQ9
	 gE89D2jXU1O/n0Tbs5dmryFkb4XJ78p9YEhB/kPwufRJI3awDYz18qN8ySL7p1xa3t
	 Rj2UlUGHH7W2Wgn0A5eDmJT0icxAEVEaQp/IH2csi0v0Oz+pbO+v/4IhJNc6PE92bs
	 TGr+MAN5XFe5dq4gaPnIjiIenbDs1P9RLwdj1WLhuNUojOXnWzoXBv0SS+I+nnoAca
	 az0zl/RdL6+byKlCV5orW+uUgarQDea4OMrOSKapHoM9Al1EZkMggQWueA+e32pvpr
	 2ydmSO06I7ESw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3407E380CFE7;
	Tue, 25 Mar 2025 19:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: Fix the devmem sock opts and msgs for parisc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174293223203.703455.3389350657359621250.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 19:50:32 +0000
References: <20250324074228.3139088-1-praan@google.com>
In-Reply-To: <20250324074228.3139088-1-praan@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-parisc@vger.kernel.org, willemb@google.com, almasrymina@google.com,
 kerneljasonxing@gmail.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 24 Mar 2025 07:42:27 +0000 you wrote:
> The devmem socket options and socket control message definitions
> introduced in the TCP devmem series[1] incorrectly continued the socket
> definitions for arch/parisc.
> 
> The UAPI change seems safe as there are currently no drivers that
> declare support for devmem TCP RX via PP_FLAG_ALLOW_UNREADABLE_NETMEM.
> Hence, fixing this UAPI should be safe.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: Fix the devmem sock opts and msgs for parisc
    https://git.kernel.org/netdev/net/c/fd87b7783802

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



