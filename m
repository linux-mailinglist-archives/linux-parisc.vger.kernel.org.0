Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B416297BC0
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Oct 2020 11:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758804AbgJXJ7w (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 24 Oct 2020 05:59:52 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35691 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1758792AbgJXJ7w (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 24 Oct 2020 05:59:52 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud7.xs4all.net with ESMTPSA
        id WGKyk57lk4n8PWGL0k7Lfr; Sat, 24 Oct 2020 11:59:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603533590; bh=K9Wi8CzsfCzf3q7+eSZOrxktChMW1LR5/7m39g8qobM=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=B2KFJLf4NGXg5aua3Y4ffpTmxA3L84sI6tZkLIbvQWi1Ovx/EM9/liO1FG7zQuUZ6
         78yxhxbR0kITgbL3wvA1GQx49WXbTDfmCfb8oZo+PiBwWCcAJi7eSW6h9oEHglERFg
         b3RQCiLnd2uFNvYoRkIAAgt4bMtc6LsDRjRX0cLc40+fe5pOYUMtH6+ChEwbw6ErZh
         RbLi9O2F58Z4SGilKSwjt343SDA/lDx9KZ9Cu2SnH0yEncjFQNTMSrLPJ/193dkSly
         BOfiYSX1pGMmdefS69S5OLWZNRU0okHvkeVe6yJrAq5kPcjzQxT0rkXhkbIBmbsJzv
         xm4M3glpMnhXw==
Date:   Sat, 24 Oct 2020 11:59:47 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH v3] parisc: Add wrapper syscalls to fix O_NONBLOCK
 flag usage
Message-ID: <20201024115947.600835af@wim.jer>
In-Reply-To: <20201023181847.GA6776@ls3530.fritz.box>
References: <20200829122017.GA3988@ls3530.fritz.box>
        <20201020192101.772bedd5@wim.jer>
        <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
        <20201022173824.49b6b7f5@wim.jer>
        <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
        <20201022164007.GA10653@ls3530.fritz.box>
        <20201023181847.GA6776@ls3530.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBZ4MDYOlaX16DuftwYQ4OApOBfl4gv2K7YTTnpzV7nx6U6Y7Lm+Ww8kqYShUiOARk9dOPHhIl6TIIdbK03nfl/W2qT09xVHopt+uhZMIZr+n6koCOfL
 nL2xnShRkU5JiC1n0sWgrgZdHA0sqBggBHX+QUq7xG9DLeAwubIS3YPoLDXX3CSfdLK6IAy4QcX1K0ro76ZbYH8PbwUL9WcGFDg+OLztwiyzf0asEFfJbqDg
 AS+mBNFX6f6XtkpR/AS6GjD76k9ZXrbgjhROfBnuOZGCYO/X39rHb5xSbja1NLcjWeZhTRELw3FJHO8FX4QozA==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 23 Oct 2020 20:18:47 +0200
Helge Deller <deller@gmx.de> wrote:


> v3: Added inotify_init1() syscall wrapper
>     Changed warning to pr_warn_once()

I do not know how pr_warn_once decides when "once" has already
occurred, but with this patch I do not see any warnings at all.


Regards,
     jer
