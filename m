Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 954A5EE081
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Nov 2019 13:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbfKDM4q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 4 Nov 2019 07:56:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:59328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727236AbfKDM4q (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 4 Nov 2019 07:56:46 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A3B220B7C;
        Mon,  4 Nov 2019 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572872205;
        bh=DahvUIlMUGAvXZNBwm3AJ9Zsp/qhwnO1waU2i3Z3O2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ANcqbdpcOD+qx5TOZbLJ26nPQKLLmJvFwfi6qYNY1tnbVf9ahc7PM7qVJY2Esv3Fa
         9gBOFp9LjxnfpIs4mMsG3mL8NuMRmG9tcj5Wi2NB54GYcNm38JMAFisbqlEZDo7tPw
         gLo+QIFKVZ/aMCithTya39NboeCucFgc79ZMq1bQ=
Date:   Mon, 4 Nov 2019 12:56:39 +0000
From:   Will Deacon <will@kernel.org>
To:     Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, deller@gmx.de, duwe@suse.de,
        James.Bottomley@HansenPartnership.com, james.morse@arm.com,
        jeyu@kernel.org, jpoimboe@redhat.com, jthierry@redhat.com,
        linux-parisc@vger.kernel.org, mingo@redhat.com,
        peterz@infradead.org, rostedt@goodmis.org, svens@stackframe.org,
        takahiro.akashi@linaro.org
Subject: Re: [PATCHv2 0/8] arm64: ftrace cleanup + FTRACE_WITH_REGS
Message-ID: <20191104125637.GB24108@willie-the-truck>
References: <20191029165832.33606-1-mark.rutland@arm.com>
 <42c113ee-e7fc-3e94-cca0-f05f1c89fdb8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42c113ee-e7fc-3e94-cca0-f05f1c89fdb8@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Nov 02, 2019 at 05:42:25PM +0530, Amit Daniel Kachhap wrote:
> On 10/29/19 10:28 PM, Mark Rutland wrote:
> > This series is a reworked version of Torsten's FTRACE_WITH_REGS series
> > [1]. I've tried to rework the existing code in preparatory patches so
> > that the patchable-function-entry bits slot in with fewer surprises.
> > This version is based on v5.4-rc3, and can be found in my
> > arm64/ftrace-with-regs branch [2].
> > 
> > Patch 1 adds an (optional) ftrace_init_nop(), which the core code uses
> > to initialize callsites. This allows us to avoid a synthetic MCOUNT_ADDR
> > symbol, and more cleanly separates the one-time initialization of the
> > callsite from dynamic NOP<->CALL modification. Architectures which don't
> > implement this get the existing ftrace_make_nop() with MCOUNT_ADDR.
> > 
> > Recently parisc gained ftrace support using patchable-function-entry.
> > Patch 2 makes the handling of module callsite locations common in
> > kernel/module.c with a new FTRACE_CALLSITE_SECTION definition, and
> > removed the newly redundant bits from arch/parisc.
> > 
> > Patches 3 and 4 move the module PLT initialization to module load time,
> > which simplifies runtime callsite modification. This also means that we
> > don't transitently mark the module text RW, and will allow for the
> > removal of module_disable_ro().
> > 
> > Patches 5 and 6 add some trivial infrastructure, with patch 7 finally
> > adding FTRACE_WITH_REGS support. Additional work will be required for
> > livepatching (e.g. implementing reliable stack trace), which is
> > commented as part of patch 7.
> > 
> > Patch 8 is a trivial cleanup atop of the rest of the series, making the
> > code easier to read and less susceptible to config-specific breakage.
> I tested the whole series with my latest in-kernel ptrauth patches [1]
> and graph_tracer/function_graph_tracer works fine, So for the whole series,
> Tested-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
> 
> Also I gave few minor comments in the individual patches. With those
> comments,
> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>

I don't think this means what you think it means. Please read:

Documentation/process/submitting-patches.rst

Will
