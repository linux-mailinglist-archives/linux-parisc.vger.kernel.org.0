Return-Path: <linux-parisc+bounces-2592-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB9995845
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 22:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CA7A1C21180
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Oct 2024 20:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A364F1E008B;
	Tue,  8 Oct 2024 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="an+BPEgD"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DBF9C0;
	Tue,  8 Oct 2024 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418804; cv=none; b=iCCk82WWH6VE0ItqZKgcCj8iq5KNk4haYh17Y0tL1uW6SoLsHjDcGZPn6raLXaSTi0sBoy5FKR8Od9j8cjxgf8+c+mi0UwvunczvtOJI/T271FHntbMj7Bt1/btDgCQdCRoROqVwrCH485ipSI0WX4+TuItFk+D/1kXGJZwJ5rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418804; c=relaxed/simple;
	bh=tKuDaBHAY5bS/Mvk8poPZIufDQpu9v0AUIyS0vCRI3k=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=HmK36Srz46rXJMOfRpCLJky3IxaDTjFpBSiIxRzdGEbh30TzsL/LM40Vf6qBwcImHWyicznBANmXjVyXAanm8zl+xgToIw8aIzvhT62Wi+NyYJM2glhWj94V9V0y2yFvH7EUMaPqUVg8sUWMa8D6GI/aqUzHK3I8R7HxZPquRiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=an+BPEgD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2133CC4CEC7;
	Tue,  8 Oct 2024 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728418804;
	bh=tKuDaBHAY5bS/Mvk8poPZIufDQpu9v0AUIyS0vCRI3k=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=an+BPEgDq2KKgMRUmyBMfHze/Ua4a2WwnPaEi0BbDcBIHcPchCQr3HvtRXwmF9iL2
	 7FdN2l3spZngaDLI8YxSwll8uNrDKJU2ikYrG7Zg8XMi7GRlIsns2JU1wXaOfoc1ks
	 UnKl4xaUg/JL7YJownSX7d5PRxzMnSy1UcxEYoW9lg+VijXAwXQwQ8sE2OWNE4Qv6Q
	 CYLMIi0faVONQKnlV7kdhznA/vkbD5DhGpPKoYeOjmjmQAjgW271fQZ0aJ+2+KFGa7
	 KHxNrZTOZ4cEQ3Ph/3fG0MPTsnmOhEE3qZvxIEnsn4oZ9Cy+d8ZaMv6U2SP1eQA/1U
	 ThQNwe8nyCptA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7699E3A8D14D;
	Tue,  8 Oct 2024 20:20:09 +0000 (UTC)
From: Helge Deller via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 08 Oct 2024 20:20:10 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@HansenPartnership.com, linux-parisc@vger.kernel.org, 
 bugs@lists.linux.dev, deller@gmx.de
Message-ID: <20241008-b219339c6-954abcc8dad2@bugzilla.kernel.org>
In-Reply-To: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
References: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
Subject: Re: calling getcpu with misaligned address causes kernel panic
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Helge Deller writes via Kernel.org Bugzilla:

Richard Henderson posted another series of patches:
https://lists.nongnu.org/archive/html/qemu-devel/2024-10/msg00919.html

View: https://bugzilla.kernel.org/show_bug.cgi?id=219339#c6
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


