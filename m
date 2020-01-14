Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84DBF13B1FE
	for <lists+linux-parisc@lfdr.de>; Tue, 14 Jan 2020 19:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgANSZC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 14 Jan 2020 13:25:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:36336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgANSZC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 14 Jan 2020 13:25:02 -0500
Subject: Re: [GIT PULL] parisc architecture fixes for kernel v5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579026301;
        bh=GhelCozmoOvzdAm+79QDaXuEsB22I9mgI/ivW7JwT+s=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jNTUIa1V/qTH6rgwG0XJGA50NZFkkIQX1LrWqdXc4HOK39MR2h5u0KA8dLFR5xc6h
         i4zZiTVSRagXMNlFw7mdlc+3zg7Wt92CyRAjgwe/yEfGzuVEYKHDJfkViH7yhUnZnC
         KZfEHqEwSVhzdI/B0zRsdGcwarX5UCr6wV7QiM/w=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200114181912.GA30159@ls3530.fritz.box>
References: <20200114181912.GA30159@ls3530.fritz.box>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200114181912.GA30159@ls3530.fritz.box>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 parisc-5.5-3
X-PR-Tracked-Commit-Id: 8b7f938e0a03776124781f19fb22443dfb519cff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 452424cdcbcaf6a2ebaae4301da5a4e1850a941a
Message-Id: <157902630173.24051.6409474907657354162.pr-tracker-bot@kernel.org>
Date:   Tue, 14 Jan 2020 18:25:01 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Tue, 14 Jan 2020 19:19:12 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.5-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/452424cdcbcaf6a2ebaae4301da5a4e1850a941a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
