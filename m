Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263CB2959FB
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Oct 2020 10:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894372AbgJVIRY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 22 Oct 2020 04:17:24 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:34705 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2443831AbgJVIRY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 04:17:24 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud7.xs4all.net with ESMTPSA
        id VVmikoNIx4n8PVVmjkaXXQ; Thu, 22 Oct 2020 10:17:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603354642; bh=0fd4Cc2cFWTI6+hu5dU4dSExiM7TnzQlqU76NZ67UJg=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=lE7uvtByDItjYJ7bHw+N3GUcPa39AhCkj+YoABH6s3VKsGg7+qaFC8n195HuP0Scn
         dR6JHrOwq/SBhj3c5K2X3+S1+V4Wq+r1M0AuMgNhjoe1Vd5sXDO0JTvqj3LP/MClso
         fcX/xi3F2fdWZ95Rn/H0aO53V9WKDO+Z0KiMsDTQ77VHqsNMJ1MFD6bwL8x04XgfBj
         T6c267v4+AP59KDfYWZTynwAxOXve8ITRI7RyjJv2MtLXqlY35L8nxLAs3GFtjIlD2
         s7Ah7EjwraExCLlKDk+L02rRodorT/6N4roZP2UiSaRhhIfRKwLFbsczlVpRvfInWJ
         aiAHaj6wwfDjw==
Date:   Thu, 22 Oct 2020 10:17:19 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Meelis Roos <mroos@linux.ee>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: problems in 5.9+git (no network initialized, systemd complains)
Message-ID: <20201022101719.0fd6d520@wim.jer>
In-Reply-To: <914a9d98-24be-c022-e371-2a5674908168@linux.ee>
References: <914a9d98-24be-c022-e371-2a5674908168@linux.ee>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDmm1am/78xmn0+AWlvGsExHPH6CS7ww4Xot4njrfR3BhwQx6rwbTdw+23UjvCi6sHehR+UA4eHWPOeT4eBF6oV4QBEAXCOlUV7Of/UKDU3MYy3YkiiD
 xEcyncx9z63UOavyHIXTYNOXEZUZGUNbIwYRRd9fEriEg9xueho52vuuHKahzk6qeyJar7+Y4ld2pNrPGkCTO7AawKovfM1N+hA=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, 22 Oct 2020 10:29:55 +0300
Meelis Roos <mroos@linux.ee> wrote:

> After testing if 5.9.0 worked on my rp2470, I comiled yesterdays git
> (v5.9-12462-gf804b3159482) and it boots up partially - no network but
> there is console login on serial.
> 
> Noticed in dmesg:
> [   14.403317] process '/sbin/init' started with executable stack
> [   54.239069] systemd-udevd[460]: Failed to create SIGINT event
> source: Invalid argument [   57.338167] systemd-udevd[673]: Failed to
> create SIGINT event source: Invalid argument [   59.641694] ext2
> filesystem being mounted at /boot supports timestamps until 2038
> (0x7fffffff) [  161.131316] systemd-udevd[1494]: Failed to create
> SIGINT event source: Invalid argument
> 
> 
> As to why there is no network:
> * There is dhcp client process /sbin/dhcpcd -q
> * tail -n 50 /var/log/messages gives lines for syslogd startup each
> second: Oct 22 09:51:54 rp2470 syslog-ng[6109]: syslog-ng starting
> up; version='3.26.1' So it seems syslogd dies and is restarted in a
> loop. And there does not appear anything else in the messages for
> this boot, only shutdown of previous boot.
> 
> Is it something that might be known already?

Did you see the discussion about "parisc: Define O_NONBLOCK to become
000200000" yet?

I am using openrc but we may be looking at different manifestations of
the same problem.

> If not, I will try to bisect it if I get some time. 

Try reverting that before you embark on a long git bisect.


Regards,
     jer
