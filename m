Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28F8296B83
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 10:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S460777AbgJWIxR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 04:53:17 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37673 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S460776AbgJWIxQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 04:53:16 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud9.xs4all.net with ESMTPSA
        id VsozkRlbnjIEMVsp1k9xRb; Fri, 23 Oct 2020 10:53:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603443195; bh=2mkyXwFAiSNQtLX5QTE3AvZ6rTtGfMBznZR4SI7vv3I=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=wHZmVyFMhWNZLusCRtOSI2MPAwKbJuavfAio8cpzFRKW4Z+lVhtZMxqIrelY/I9DG
         jPe0kxdOVtLjIQgJNO5qZd4vh3vZB0nVHHFlpTN9DwMRVXj+X9eM93aLa4nERPVIf6
         EnGRKGjpLlE5ru/QMnGxYxnhvY4AMSbgyYXigETERZGrrjrCCyr+h3iynV6u14j/uH
         pGfIYcR2u/ec6anhvvnoUCFVTiglewqif3eQCKliimRBPguJ68O7JXAgVC6+rP2fiG
         XU6/Vaq3mRe90XLKcakJTjdj/BrEraygcqHi4ZT37IUIU7eywYBzg7okpM9lgip7kV
         p9mxl2ZyBIFUQ==
Date:   Fri, 23 Oct 2020 10:53:12 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag
 usage
Message-ID: <20201023105312.5266bce7@wim.jer>
In-Reply-To: <20d34af2-7c5b-b9af-b4b7-062e2689c092@gmx.de>
References: <20200829122017.GA3988@ls3530.fritz.box>
        <20201020192101.772bedd5@wim.jer>
        <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
        <20201022173824.49b6b7f5@wim.jer>
        <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
        <20201022164007.GA10653@ls3530.fritz.box>
        <6f58641f-d4d3-ea28-3863-83a227aeff1a@linux.ee>
        <b187505a-2ca1-c385-3b4e-16ae49f5c1ce@gmx.de>
        <20201023090232.3b56d308@wim.jer>
        <20d34af2-7c5b-b9af-b4b7-062e2689c092@gmx.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNL8pBOrhGPQSFSWJ5vgVes9+tYebSo2+IqQ22VIzAjuVkeeNzGI6Yopnu0P0oZ+ECHgFiurxsCWecRsudgUCts+Ao/+6qUQ+Z8p1szhtqP8e7xrFGrv
 m9xDr7ci+4YLFXp/yFYrQuYfB6DomVLXqGxi+z0pKIaryNvqCU9LiJfGKkZ0gWcmQcOVe/8U7SmDnf7lPqbTPaUpzuWNwSU9hyWMZrja5YCHKQ2KpMLZ9Cxq
 nIUtfNdvQIY8GfcNRzsLwXAOEJcWRTRjouRLspuGrcLxBtF67N1SUS7dG0SaPnuFXc+gDUFPNhnSuaOdYxbCvw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 23 Oct 2020 10:35:34 +0200
Helge Deller <deller@gmx.de> wrote:

> I think it makes sense to keep at least one warning.
> Rolf Eike proposed a pr_warn_once() which seems the best compromise
> as it keeps us at least informed which packages needs updating and
> how relevant it is to keep those wrappers....

I agree that if we are to keep the warning, pr_warn_once is a better
choice.

In the rpc.idmapd strace I still see

4635  inotify_init1(IN_NONBLOCK)        = -1 EINVAL (Invalid argument)

so maybe you want to wrap around inotify_init1 as well?


Regards,
      jer
