Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1C21477D0
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2020 06:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgAXFCb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 Jan 2020 00:02:31 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55372 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgAXFCb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 Jan 2020 00:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ov31A6tYKcczbAgX5V+K/86bJ5Mzf/GVps9NpBV92oA=; b=MwrTy9e7zWFtY+ARjOGY0FjNXH
        XHKtTGNYClFWFRLZh1KzO2E6mrNLhwzW80c/Pm15BcjbBYcBYBQpvKWdL26Y4F9pvsSsj/mXHLwvD
        DNuDftcC/mCDNRo4klh7c8mt1ywyIaBLlhraNWuDfJ8DWnpiKXG8o5satL11AZWjbocO0XmeqvWUe
        xIQKvRapY1sPTLkj549d6W+gciGXO+lYVOo0tFIHGZN9XFiMTwuSKVxI1hfdYSelKPjjgtruuxYLC
        f6OUy/Mm6Lb6QNOCpl+PiOrlMkjI9O0xTijyh9icTzEAxZ/lK/oeH+kjwI+kvKZVLY++oTDHoCiv4
        oCbLVLhg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iur6Y-0004ub-AN; Fri, 24 Jan 2020 05:02:02 +0000
Date:   Thu, 23 Jan 2020 21:02:02 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Qian Cai <cai@lca.pw>
Cc:     Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, paulmck@kernel.org, tglx@linutronix.de,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>,
        linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2] sched/core: fix illegal RCU from offline CPUs
Message-ID: <20200124050202.GJ4675@bombadil.infradead.org>
References: <20200121103506.GH14914@hirez.programming.kicks-ass.net>
 <A72A7F42-A166-4403-B12C-32B2D7A662C4@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A72A7F42-A166-4403-B12C-32B2D7A662C4@lca.pw>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Jan 23, 2020 at 11:21:35PM -0500, Qian Cai wrote:
> > On Jan 21, 2020, at 5:35 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > Something like this; except you'll need to go audit archs to make sure
> > they all call idle_task_exit() and/or put in comments on why they don't
> > have to (perhaps their bringup switches them to &init_mm unconditionally
> > and the switch_mm() is not required).
> 
> Damn, I am having a hard time to motivate myself to learn all about those two “dead“ arches from scratch. I suppose the first step we could put a dummy finish_cpu() for alpha and parisc if they don’t call idle_task_exit() in the first place anyway, so if it is a bug there it is another issue that could be dealt with in a separate patch later?

Or you could consult the maintainers of those architectures?  There are regular pull requests for parisc still, and alpha still gets odd fixes.

It would have helped had you not trimmed the context so aggressively.
For those seeing this thread for the first time, try:
https://lore.kernel.org/linux-mm/A72A7F42-A166-4403-B12C-32B2D7A662C4@lca.pw/T/#t
