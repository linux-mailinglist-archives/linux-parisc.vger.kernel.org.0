Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 465EB296510
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Oct 2020 21:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369943AbgJVTKy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 22 Oct 2020 15:10:54 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:58313 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S369878AbgJVTKy (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 15:10:54 -0400
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag
 usage
To:     Helge Deller <deller@gmx.de>, Jeroen Roovers <jer@xs4all.nl>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20200829122017.GA3988@ls3530.fritz.box>
 <20201020192101.772bedd5@wim.jer>
 <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
 <20201022173824.49b6b7f5@wim.jer>
 <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
 <20201022164007.GA10653@ls3530.fritz.box>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <6f58641f-d4d3-ea28-3863-83a227aeff1a@linux.ee>
Date:   Thu, 22 Oct 2020 22:11:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201022164007.GA10653@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


22.10.20 19:40 Helge Deller wrotw:
> This patch adds wrapper functions for the relevant syscalls. The
> wrappers masks out any old invalid O_NONBLOCK flags, reports in the
> syslog if the old O_NONBLOCK value was used and then calls the target
> syscall with the new O_NONBLOCK value.
> 
> Fixes: 75ae04206a4d ("parisc: Define O_NONBLOCK to become 000200000")
> Signed-off-by: Helge Deller <deller@gmx.de>

Works for me on RP2470 - boots up in full functionality and logs the recompilation
warning about systemd-udevd and syslog-ng.

Tested-by: Meelis Roos <mroos@linux.ee>

-- 
Meelis Roos
