Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9971416F1C
	for <lists+linux-parisc@lfdr.de>; Wed,  8 May 2019 04:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfEHCkD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 7 May 2019 22:40:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbfEHCkD (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 7 May 2019 22:40:03 -0400
Subject: Re: [GIT PULL] parisc architecture updates for kernel v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557283203;
        bh=mVQqqor03PsQ/0g49kpj6ZbWX/FB5uKvaXa+qUbqkOw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=XG2iDmuRZ0s6tm0ZE4gLMS3QcbH2VtGaJ9XkJww8yqrh5UtuD8TZrHdNnS5P3yoaG
         oTcJN/eCQK36M4Nd5QfaRdMr1lov17Kebl2CKsSa4MTG40qzLi7aeGRTqSfA/YRNXT
         REtUerIohI7PgFCo95J7FeSEFkvYFTBRdXh/6yE4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190507183818.GA17218@ls3530.dellerweb.de>
References: <20190507183818.GA17218@ls3530.dellerweb.de>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190507183818.GA17218@ls3530.dellerweb.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 parisc-5.2-1
X-PR-Tracked-Commit-Id: 62217beb394e654bbd2bb87c533dadd2d8bf62c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d3511f53bb2475f2a4e8460bee5a1ae6dea2a433
Message-Id: <155728320302.19924.1994029648168846229.pr-tracker-bot@kernel.org>
Date:   Wed, 08 May 2019 02:40:03 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Mikulas Patocka <mpatocka@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Tue, 7 May 2019 20:38:18 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d3511f53bb2475f2a4e8460bee5a1ae6dea2a433

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
