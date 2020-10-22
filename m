Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099F0296595
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Oct 2020 22:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370511AbgJVUAw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 22 Oct 2020 16:00:52 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59167 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S370510AbgJVUAw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 16:00:52 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud9.xs4all.net with ESMTPSA
        id VglTkOoaKjIEMVglUk8zQL; Thu, 22 Oct 2020 22:00:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603396850; bh=Smud9Ohl/mTAa9hK/fvNMZ8pcIvAGQuNNVbfEi9nO3w=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=tYQNvfo50BL4TvpphW7mPB+8lA/6We9lRqI7W/aeoYZXbM2AOc1UrkOsljHo1EYBV
         sb5lfK49Qc1GI5viZ4XkHEB/RfVIQi5PJH6tg/sPihyqYG5+RyNPf2CSG046B7q5W3
         JKB6bpmfx8i0zfU0cBgGBEOv4sez4qwC3v6ZiC4trCJE+b9jnr8l4eSabKRVikjheQ
         RIQxfoxAnGeziQ9UIQ4++DJJI6eSobOImkQ036EoRnGT+pNG93jyzpyRwaZPw6zyhN
         nD9qZMyX4Wi2RcP6CKlocAJa2GpwDMUvY51lwqr1ILSX20uFHB6e1qaYZcVZFbLikQ
         pOtGI4gYkKYWA==
Date:   Thu, 22 Oct 2020 22:00:46 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag
 usage
Message-ID: <20201022220046.2db7dfc5@wim.jer>
In-Reply-To: <20201022164007.GA10653@ls3530.fritz.box>
References: <20200829122017.GA3988@ls3530.fritz.box>
        <20201020192101.772bedd5@wim.jer>
        <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
        <20201022173824.49b6b7f5@wim.jer>
        <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
        <20201022164007.GA10653@ls3530.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNCWuuqbHJFJsPWdqv+MZnhIqOb0g2U0wyxhJA+xmuUNPbrX5oAUptmLeOH0ZbCWpxmGadustDb6DleBVaa3GdaHauya9hsHtNgOReynClWipIP55/09
 SimFvmlm24feJ0J8mWiOlrYxp0JgwiX3qfVyynbyCB9vptdn0IG5GsctyUyUts/9NDGH6/s3rTXWHrsiuQmPjAxJ4zO7KbNYtqxJKdx6Rm6Ff2hVpQqoJC6B
 LaX9dIu1Lj0gXKrXMx0AR5UL16HVFytG3ioMlM0cW0VMIf5lSw+ZQXz8kSU5XgeiN9SBicaVznDZ+mZvK2eLeg==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, 22 Oct 2020 18:40:07 +0200
Helge Deller <deller@gmx.de> wrote:

> The commit 75ae04206a4d ("parisc: Define O_NONBLOCK to become
> 000200000") changed the O_NONBLOCK constant to have only one bit set
> (like all other architectures). This change broke some existing
> userspace code (e.g.  udevadm, systemd-udevd, elogind) which called
> specific syscalls which do strict value checking on their flag
> parameter.
> 
> This patch adds wrapper functions for the relevant syscalls. The
> wrappers masks out any old invalid O_NONBLOCK flags, reports in the
> syslog if the old O_NONBLOCK value was used and then calls the target
> syscall with the new O_NONBLOCK value.
> 
> Fixes: 75ae04206a4d ("parisc: Define O_NONBLOCK to become 000200000")
> Signed-off-by: Helge Deller <deller@gmx.de>

That fixes all the previous problems.


Regards,
     jer
