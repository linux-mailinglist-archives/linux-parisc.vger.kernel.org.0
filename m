Return-Path: <linux-parisc+bounces-1735-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E7E91D98F
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Jul 2024 10:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516AF1C20CF8
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Jul 2024 08:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BC641C92;
	Mon,  1 Jul 2024 08:02:16 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5625C614
	for <linux-parisc@vger.kernel.org>; Mon,  1 Jul 2024 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719820936; cv=none; b=Z3OZpekppftGCb/GdkiV4YcANfeTgMtGwAyNnEejOJazdJranfcHNcElM15bvZ5FqY9g6edGxgp0wuRJsvT1NOsfB3pZGqorkvSMEbCc25s0FlE+9/cl4xVFi3PdGeghzbhVUonvFVpV+cEUB9mmPPHnhPqm3JM7/mlfe6gmLW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719820936; c=relaxed/simple;
	bh=CSsYmUBxfHc30L8B6vNlO22F5seUPiAqBtknMmFWbpE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZmNHa5KVkTtAVsqBelYCczG7JACzvmJcC36dILORCb23jT3ti2im4WlYiE30EfraL0DL3w3yBAbm1M3rpbp43K6oQbfAeLXfnrDtrSWlx/iYt65iMyrYeSOoyuedj4+jRJ7F2LBwzp6eY6QlWLVoc1vPenYk6cnRLjNqozVCnc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4WCJRM2nzfz4wyGW
	for <linux-parisc@vger.kernel.org>; Mon, 01 Jul 2024 10:02:07 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1c8a:3990:9784:a231])
	by xavier.telenet-ops.be with bizsmtp
	id i8202C00D4bcH3801820MT; Mon, 01 Jul 2024 10:02:00 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sOBz6-000l3a-9Q;
	Mon, 01 Jul 2024 10:02:00 +0200
Date: Mon, 1 Jul 2024 10:02:00 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.10-rc6
In-Reply-To: <20240701072703.2941315-1-geert@linux-m68k.org>
Message-ID: <bb1acd5b-1a20-646-8d99-12dcfa899c3@linux-m68k.org>
References: <CAHk-=wgQMOscLeeA3QXOs97xOz_CTxdqJjpC20tJ-7bUdHWtSA@mail.gmail.com> <20240701072703.2941315-1-geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 1 Jul 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.10-rc6[1] to v6.10-rc5[3], the summaries are:
>  - build errors: +1/-0

   + /kisskb/src/include/linux/syscalls.h: error: conflicting types for 'sys_fanotify_mark'; have 'long int(int,  unsigned int,  u32,  u32,  int,  const char *)' {aka 'long int(int,  unsigned int,  unsigned int,  unsigned int,  int,  const char *)'}:  => 248:25

parisc-gcc13/parisc-allmodconfig

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/22a40d14b572deb80c0648557f4bd502d7e83826/ (132 out of 138 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/f2661062f16b2de5d7b6a5c42a9a5c96326b8454/ (132 out of 138 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

