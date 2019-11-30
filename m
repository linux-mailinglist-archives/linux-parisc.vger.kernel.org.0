Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D1D10DFC0
	for <lists+linux-parisc@lfdr.de>; Sun,  1 Dec 2019 00:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfK3XFF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 30 Nov 2019 18:05:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:49310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727025AbfK3XFE (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 30 Nov 2019 18:05:04 -0500
Subject: Re: [GIT PULL] parisc architecture updates for kernel v5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575155104;
        bh=b12ZFmGiWVFFBDg0ZRtOhVaglcch9/vJdXIY6PfCqrw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=qsm1O/682UDUS93DlfrHOnuisdui5KVwQr4xn4MF0EhiVt05yAz2GuzT3K+sFZIF1
         avN7rlI5UUofb58sSaGR8whb1G30GwHu03WLzzcN9JE5Ljk30NSDkKcdtmv/MKQQ8D
         SFDuaeC8auojERgI3knWmyoxzODCoOwvbdlotVfU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191130220520.GA12883@ls3530.fritz.box>
References: <20191130220520.GA12883@ls3530.fritz.box>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191130220520.GA12883@ls3530.fritz.box>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 parisc-5.5-1
X-PR-Tracked-Commit-Id: e9c837c6ab07127b02357efcfe1a23d030db1aca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 738d5fabff864a6b4a8b67f589a8f28f6cca808f
Message-Id: <157515510436.27985.3092447520093659366.pr-tracker-bot@kernel.org>
Date:   Sat, 30 Nov 2019 23:05:04 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Sat, 30 Nov 2019 23:05:20 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.5-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/738d5fabff864a6b4a8b67f589a8f28f6cca808f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
