Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23299EB5F0
	for <lists+linux-parisc@lfdr.de>; Thu, 31 Oct 2019 18:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbfJaRQq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 31 Oct 2019 13:16:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:44788 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728547AbfJaRQq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 31 Oct 2019 13:16:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 21002B88F;
        Thu, 31 Oct 2019 17:16:43 +0000 (UTC)
Date:   Thu, 31 Oct 2019 18:16:41 +0100
From:   Torsten Duwe <duwe@suse.de>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        amit.kachhap@arm.com, catalin.marinas@arm.com, deller@gmx.de,
        James.Bottomley@hansenpartnership.com, james.morse@arm.com,
        jeyu@kernel.org, jpoimboe@redhat.com, jthierry@redhat.com,
        linux-parisc@vger.kernel.org, mingo@redhat.com,
        peterz@infradead.org, rostedt@goodmis.org, svens@stackframe.org,
        takahiro.akashi@linaro.org, will@kernel.org
Subject: Re: [PATCHv2 0/8] arm64: ftrace cleanup + FTRACE_WITH_REGS
Message-ID: <20191031171641.GB11684@suse.de>
References: <20191029165832.33606-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029165832.33606-1-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

After yesterday's testing, now

Reviewed-by: Torsten Duwe <duwe@suse.de>

for the series. 

Executive summary: where I used x28 as scratch register in ftrace_regs_caller
which I had to save for that reason, you switched to x10, which is so obvious
that I failed to see it. Then the PLT initialisation on module load, and
finally the ftrace_init_nop() hook that got you started initially. The rest
I'd call more or less cosmetic deviations from my v8. IOW: fine with me.

	Torsten

