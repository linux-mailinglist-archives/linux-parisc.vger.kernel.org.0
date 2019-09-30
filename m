Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6DD5C1B62
	for <lists+linux-parisc@lfdr.de>; Mon, 30 Sep 2019 08:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbfI3GUp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 30 Sep 2019 02:20:45 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:35634 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbfI3GUp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 30 Sep 2019 02:20:45 -0400
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jer)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 1DEAE34B6EF;
        Mon, 30 Sep 2019 06:20:42 +0000 (UTC)
Date:   Mon, 30 Sep 2019 08:20:26 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH] parisc: Fix vmap memory leak in ioremap()/iounmap()
Message-ID: <20190930082026.6ac087ff@wim.jer>
In-Reply-To: <20190909133856.GA32746@ls3530.fritz.box>
References: <20190909133856.GA32746@ls3530.fritz.box>
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, 9 Sep 2019 15:38:56 +0200
Helge Deller <deller@gmx.de> wrote:

> Sven noticed that calling ioremap() and iounmap() multiple times leads
> to a vmap memory leak:
> 	vmap allocation for size 4198400 failed:
> 	use vmalloc=<size> to increase size
> 
> It seems we missed calling remove_vm_area() for ioummap().

That patch seems to work (tested on a C8000 for a couple of weeks). I
was surprised it wasn't part of the "parisc architecture updates for
kernel v5.4" pull request.


Kind regards,
     jer
