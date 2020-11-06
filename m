Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF8A2A8D17
	for <lists+linux-parisc@lfdr.de>; Fri,  6 Nov 2020 03:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgKFCnu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 5 Nov 2020 21:43:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:42350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgKFCnu (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 5 Nov 2020 21:43:50 -0500
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BDF320782;
        Fri,  6 Nov 2020 02:43:48 +0000 (UTC)
Date:   Thu, 5 Nov 2020 21:43:46 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: ftrace: get_kprobe() must be called with
 preempt disabled
Message-ID: <20201105214346.2d142cfc@oasis.local.home>
In-Reply-To: <20201106111758.8b4d6d0197acec6ca4be9a2c@kernel.org>
References: <20201103074244.GA5615@ls3530.fritz.box>
        <20201106111758.8b4d6d0197acec6ca4be9a2c@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 6 Nov 2020 11:17:58 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> On Tue, 3 Nov 2020 08:42:44 +0100
> Helge Deller <deller@gmx.de> wrote:
> 
> > As noticed by Masami Hiramatsu, get_kprobe() must be called with preempt
> > disabled.  
> 
> Doesn't parisc ftrace implementation preempt off? Then it is required.
> 
> Steve, can we expect that op->func() is called under preempt off always
> on any arch or is it arch dependent?
> 

Currently all kprobe function callbacks are called with preempt
disabled, because it doesn't have the RECURSIVE_SAFE flag set. And for
callbacks without that set, it goes through a helper function that
disables preemption. My current patch set (which is not upstreamed yet)
is changing that, and I just posted a new patch series that does the
preempt disable before the get_kprobe() function for parsic and other
archs, to handle the new code.

Thus, parsic is currently OK (without my new patch set, it's called
with preemption disabled).

-- Steve
