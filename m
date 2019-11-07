Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A259DF2D77
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Nov 2019 12:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbfKGLby (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 7 Nov 2019 06:31:54 -0500
Received: from foss.arm.com ([217.140.110.172]:54514 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727437AbfKGLby (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 7 Nov 2019 06:31:54 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AA6C31B;
        Thu,  7 Nov 2019 03:31:53 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DECE3F6C4;
        Thu,  7 Nov 2019 03:31:50 -0800 (PST)
Date:   Thu, 7 Nov 2019 11:31:47 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        amit.kachhap@arm.com, deller@gmx.de, duwe@suse.de,
        James.Bottomley@HansenPartnership.com, james.morse@arm.com,
        jeyu@kernel.org, jpoimboe@redhat.com, jthierry@redhat.com,
        linux-parisc@vger.kernel.org, mingo@redhat.com,
        peterz@infradead.org, rostedt@goodmis.org, svens@stackframe.org,
        takahiro.akashi@linaro.org, will@kernel.org
Subject: Re: [PATCHv2 0/8] arm64: ftrace cleanup + FTRACE_WITH_REGS
Message-ID: <20191107113147.GB16965@arrakis.emea.arm.com>
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

On Tue, Oct 29, 2019 at 04:58:24PM +0000, Mark Rutland wrote:
> [2] git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/ftrace-with-regs

I pulled the latest on this branch into the arm64 for-next/core.

Thanks.

-- 
Catalin
