Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB14837EA5
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Jun 2019 22:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfFFUUC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 6 Jun 2019 16:20:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:56274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726238AbfFFUUC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 6 Jun 2019 16:20:02 -0400
Subject: Re: [GIT PULL] parisc architecture fixes for kernel v5.2-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559852401;
        bh=Wh4GqJ1QrWwH3h82KZyFsR/7ezT9IgfqAPS0MThe3Yc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Z+qQ3KUA2rM06nWeKJr5cuRZWCQ71rwOCAwI7xcnC2pxPK0wvK51lZR5WXNz24dPm
         fDGtxPNfw1K6Fhc8zBWNjKZ6cvRHN/84ujGY7Twef9ReX4edxUxk7TWpWAAb/Bc3q6
         hOUsbV6mJ+aw94tXK5zZE6+2+hMyj7naYCAeyN0s=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190606154015.GA13868@ls3530>
References: <20190606154015.GA13868@ls3530>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190606154015.GA13868@ls3530>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 parisc-5.2-3
X-PR-Tracked-Commit-Id: 527a1d1ede98479bf90c31a64822107ac7e6d276
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 16d72dd4891fecc1e1bf7ca193bb7d5b9804c038
Message-Id: <155985240168.29387.12528687456834222878.pr-tracker-bot@kernel.org>
Date:   Thu, 06 Jun 2019 20:20:01 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Thu, 6 Jun 2019 17:40:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.2-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/16d72dd4891fecc1e1bf7ca193bb7d5b9804c038

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
