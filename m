Return-Path: <linux-parisc+bounces-317-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C321E820104
	for <lists+linux-parisc@lfdr.de>; Fri, 29 Dec 2023 19:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47D1B282ECA
	for <lists+linux-parisc@lfdr.de>; Fri, 29 Dec 2023 18:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E0B12B7C;
	Fri, 29 Dec 2023 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="UvbX9WJk";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="wzEpX48Y"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A429412B8B
	for <linux-parisc@vger.kernel.org>; Fri, 29 Dec 2023 18:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
ARC-Seal: i=1; a=rsa-sha256; t=1703872974; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Fxb+FTk1e9s8enEO+uTViGlHHFHhqgqsosQk7RiRbbFAcuHGONmk5ZnbyYygfbzEv+
    1aHgd1Ws4/UNTD34Xfqjo9cO7rWePxeovSbpfeyIi14szcb3Ud2a6HeK2Ql39LXkFe0S
    ugJ2MNXCVWPDJ46qP812/MEVo91SKFGlprlZS/3kEUlDt+Q80vdSmli+r+XdJxgWkd6z
    KyQh2oMcxHRovAtX0hzl6I5qE0Y+ZfVlCspQ8zJxy9mw/VM95iIS2eNTZXPVOhLRgcdP
    OGi8z8eVM0+KuT2v1PIpEF7nX8/N5xsYg0QeFrojA9UAe8VMH7A4eCVpikr/7jMjeWCR
    ZgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1703872974;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pE1GNabDHzSzdZEXaQc+TsOg0mt1nW/b0wTWP2gZGpc=;
    b=VU4ODd4q+VGxnlx/TQ91UT2PUxnXhROjewETdleXcIPadgmBAPk5nr6k+RFSrlHAwt
    ElfZLfwvespWtYxhN6gQN7pQu70ovkMz20n/NUOXfLgXem1MapeX4vxyDM4KkmlsHX5c
    NWSh3MGfJYkP9Z63FkZY/AoDd0UbhByLCjY2d4WDXG3d4VvtRCt191EvIi5G1Cq0aFoM
    u7Y+jVYAPj2kvxJ3nERg0uauC9eR4X6n1pdi0grIJJPogpKLHEaRxs1QU0DYoTvUXu+x
    8yo/XNrPCrP3bH1zzETIZWZWTDeGEGKFpIWA4vVLVXz8dNveslErp3Q7vW1ZA4vW1apM
    BA5g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1703872974;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pE1GNabDHzSzdZEXaQc+TsOg0mt1nW/b0wTWP2gZGpc=;
    b=UvbX9WJkKgFnUL5hKpWGm8oENS5Q0SJ8Cg6gWjXsc39ttmbHNF+vDpf9I0jGhuNjeO
    S0uZ1uPNqnbVeKUE1+A2Eu/dn25f/67qU5+6NxA7UK+jbhYmDrtS7miSnrUvGtx+ZVoL
    z6ruHYF0mbXHccWLWnn0xaPCeNLYXHKU++3c0XwUd2W0ZcfqxAx2ytHFTR6M2iyqd/9c
    No4GSBZAGSpihK7qjcFt8xS+UUVadYWMnoyA+Pz2P1x82tDaHwJI9urptq85676QJKVI
    okrBTnWhVEAIu8jR1NyOE26ME8nfICm6vxJSTg9BOmA1MSUBYDymfWXoGzTcA3oc3XwP
    LotQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1703872974;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pE1GNabDHzSzdZEXaQc+TsOg0mt1nW/b0wTWP2gZGpc=;
    b=wzEpX48YQIKgpBbZcHvO3Jx69pnh4eLN2xWg+lw3Rz6iC3Auqi3YaBKK/h/ku3Gd+s
    xQbO4/2D5sYlqQuLmZAw==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpOe1fMLSEJpAPK5occtGbNUq/tJxg=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.10.0 AUTH)
    with ESMTPSA id j4bcadzBTI2rUVN
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 29 Dec 2023 19:02:53 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: "Nelson H. F. Beebe" <beebe@math.utah.edu>, Helge Deller <deller@gmx.de>
Cc: =?ISO-8859-1?Q?Ren=E9?= Rebe <rene@t2-project.org>, linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: hppa64 Linux in QEMU
Date: Fri, 29 Dec 2023 19:02:53 +0100
Message-ID: <3045651.VLH7GnMWUR@nimes>
In-Reply-To: <27c830f0-36b9-4e7d-8540-dbf2fe415b5c@gmx.de>
References: <CMM.0.95.0.1703805969.beebe@gamma.math.utah.edu> <3574571.ElGaqSPkdT@nimes> <27c830f0-36b9-4e7d-8540-dbf2fe415b5c@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> > handle_break: 2925950 callbacks suppressed
> > handle_break: 2923203 callbacks suppressed
> > ...
> > ---------------------------------------------------
> 
> There still seems a problem in qemu when running a 64-bit kernel.
> This shows up when kernel modules are used, esp. e.g. with ext4.

I see; thanks for explaining.

Bruno




