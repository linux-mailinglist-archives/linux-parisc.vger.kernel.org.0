Return-Path: <linux-parisc+bounces-2712-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4399E297
	for <lists+linux-parisc@lfdr.de>; Tue, 15 Oct 2024 11:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D206280CC9
	for <lists+linux-parisc@lfdr.de>; Tue, 15 Oct 2024 09:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA99B1D9A6B;
	Tue, 15 Oct 2024 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0c/YLcO"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23561D9A5E;
	Tue, 15 Oct 2024 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728983703; cv=none; b=hFXOvdsuGGSideFc/9u/+wUfdquRKD/jMP76cFjulzxer8xhSAVL39KfodiGHIYBhlLnOsHyAAc0n+p8WTL201EZFoeoIJ376UBwLB9CYT1uVGc62jjB4vtrTlVowvYx10cEMuG82LwPovnEVgWoQ8Q/1T4HvwhcQEXaLhffREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728983703; c=relaxed/simple;
	bh=+Bb7emnl3zBNQ2MILv91pY4Xi4hgDbYthSBzdCZZn14=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=grbktTQsmQ5eH5rncl3di2WncymaAorwaoMp5tc/EkO+c2p73uAcIIC6dTFJUdZ2KYzNRut7NehHMW8953d9Hz0kuf05vFpS3YRh4ecbIWU3tm5wdIIzrVpUv3VjTWL/KRzl1ZGJsnpKC7lvfmJvpttdv+XhR9iqE0jIdJYO+Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0c/YLcO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A83AC4CEC6;
	Tue, 15 Oct 2024 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728983703;
	bh=+Bb7emnl3zBNQ2MILv91pY4Xi4hgDbYthSBzdCZZn14=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=l0c/YLcOLS14eI6c9/n2QXnuqDmRiz4tQb9xar0bL2HWpqtp+R4mP6UDsQ/Wb/Zmo
	 UeuPusXJBtXev41p5GKJEYO9xG5iJejRRt6VtE54bRhObrzcfqC8WWvxDMb+YkPzI2
	 2rTUFbndUAczvLZqOak9zxXZTIImUOThTrAVEjujQChjXVk1jxZpG63JLIyRtPuKUG
	 40Kbm0E5qgrW5o5SaxB10OpPG0NhLVb/5F+d/kqw4fXTDGQR1ewPzaqjVIy5plQCuP
	 ems+N02Z1DjdvVMMtPi4Mb8+k3jYvhSDHPOQaA3mb12GCKl13KXYxmboxOXkHIo1Y/
	 3OGDXIKexNrxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7B7043809A8A;
	Tue, 15 Oct 2024 09:15:09 +0000 (UTC)
From: Colin Ian King via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 15 Oct 2024 09:15:12 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: bugs@lists.linux.dev, deller@gmx.de, linux-parisc@vger.kernel.org, 
 James.Bottomley@HansenPartnership.com
Message-ID: <20241015-b219339c8-c30920ebb71b@bugzilla.kernel.org>
In-Reply-To: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
References: <20241001-b219339c0-15109b153aef@bugzilla.kernel.org>
Subject: Re: calling getcpu with misaligned address causes kernel panic
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Colin Ian King writes via Kernel.org Bugzilla:

Thank you for you work on this issue. Much appreciated.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219339#c8
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


