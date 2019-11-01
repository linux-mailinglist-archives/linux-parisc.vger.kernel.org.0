Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB86AEC044
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Nov 2019 10:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfKAJIJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 Nov 2019 05:08:09 -0400
Received: from foss.arm.com ([217.140.110.172]:33044 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726979AbfKAJIJ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 Nov 2019 05:08:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8AD81F1;
        Fri,  1 Nov 2019 02:08:08 -0700 (PDT)
Received: from blommer (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9788D3F719;
        Fri,  1 Nov 2019 02:08:04 -0700 (PDT)
Date:   Fri, 1 Nov 2019 09:08:01 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Torsten Duwe <duwe@suse.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        amit.kachhap@arm.com, catalin.marinas@arm.com, deller@gmx.de,
        James.Bottomley@hansenpartnership.com, james.morse@arm.com,
        jeyu@kernel.org, jpoimboe@redhat.com, jthierry@redhat.com,
        linux-parisc@vger.kernel.org, mingo@redhat.com,
        peterz@infradead.org, rostedt@goodmis.org, svens@stackframe.org,
        takahiro.akashi@linaro.org, will@kernel.org
Subject: Re: [PATCHv2 0/8] arm64: ftrace cleanup + FTRACE_WITH_REGS
Message-ID: <20191101090801.GB3508@blommer>
References: <20191029165832.33606-1-mark.rutland@arm.com>
 <20191031171641.GB11684@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031171641.GB11684@suse.de>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Oct 31, 2019 at 06:16:41PM +0100, Torsten Duwe wrote:
> After yesterday's testing, now
> 
> Reviewed-by: Torsten Duwe <duwe@suse.de>
> 
> for the series. 

Thanks! I've folded that in and pushed out the updated branch.

Since the only change this time around was only a trivial change in the linker
script, I'll hold off sending a v3. I'm hoping I can get acks for the ftrace,
module, and parisc bits soon...

> Executive summary: where I used x28 as scratch register in ftrace_regs_caller
> which I had to save for that reason, you switched to x10, which is so obvious
> that I failed to see it. Then the PLT initialisation on module load, and
> finally the ftrace_init_nop() hook that got you started initially. The rest
> I'd call more or less cosmetic deviations from my v8. IOW: fine with me.

Yup, that sounds about right. The other thing I did was expand the comments on
the ABI details, as that can be quite subtle, but I guess that's arguably
cosmetic, too.

Thanks for working on this, and for bearing with me on this rework -- I hadn't
intended that to drag on for so long.

Thanks,
Mark.
