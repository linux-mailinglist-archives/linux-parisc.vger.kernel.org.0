Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5878530578
	for <lists+linux-parisc@lfdr.de>; Sun, 22 May 2022 21:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243492AbiEVTf3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 22 May 2022 15:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240457AbiEVTf2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 22 May 2022 15:35:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3BD140D0;
        Sun, 22 May 2022 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=BM9rP9CfK+40YgcQJNK83ES+p2xpAf9Q2Y8MuycayTw=; b=dvcV4BNvheY2zc6m/G1EA2b7d0
        qUFlcBuqDZ1hU/pJp9c7NIbldcp0jvNRqxFq5hteS6xXee0OXBe0EBCq5JBriNoXl2OCRQZUGyh7r
        kx4W/fPstSxE+rjSNUWaVjXrLKnwIxqh1FVOCUiCtDq3e/txf2BjhcMlclcSXhIe6TxeIfInC1DvI
        TEv3aC+0jkHgDk9cbVbLrkknSIfbnnKAJfhFze9/LbBX6jXOkXjEC7xGOG/4p11fH6PNm6XHyqe/Q
        rBllxWxppVOnCU03Ez/zG+AGIeBGYAZE3vI34CWQ4RaPMbIL5Auu9tdWY8Xwfmbi/mvWqWza+55Xq
        PfVB6Edw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nsrMJ-00FYvc-R6; Sun, 22 May 2022 19:35:23 +0000
Date:   Sun, 22 May 2022 20:35:23 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-spdx@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: parisc: License cleanup
Message-ID: <YoqQe+sFaqpRwSDI@casper.infradead.org>
References: <165322122487.3770149.883228125657116019.tglx@xen13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165322122487.3770149.883228125657116019.tglx@xen13>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, May 22, 2022 at 04:54:57PM +0200, Thomas Gleixner wrote:
> Matthew!
> 
> As you might know we are working on cleaning up the licensing mess in the
> kernel and convert it to SPDX license identifiers as the only source of
> license information.
> 
> Archaeology found unspecific GPL license references, which have been
> authored by you.
> 
> 1)  licensed under the gnu gpl
> 
>     arch/parisc/kernel/syscall.S
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=9d1ec5d7a336d
> 
> Can you please either send cleanup patches for the affected files or
> indicate which GPLv2 variant you had in mind and I run it through my
> cleanup machinery.

Hmm.  I was working for Linuxcare at the time, under contract to HP.
I _suspect_ the copyright on that file was actually sold to HP.
And you're not going to find anyone who cares.  At the time, I absolutely
would have meant (had it existed):

// SPDX-License-Identifier: GPL-2.0

so it's fine with me if you add that line.
