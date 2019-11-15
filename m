Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54120FD748
	for <lists+linux-parisc@lfdr.de>; Fri, 15 Nov 2019 08:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfKOHqK (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 15 Nov 2019 02:46:10 -0500
Received: from verein.lst.de ([213.95.11.211]:43297 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbfKOHqK (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 15 Nov 2019 02:46:10 -0500
Received: by verein.lst.de (Postfix, from userid 107)
        id BAF9F68CFC; Fri, 15 Nov 2019 08:46:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on verein.lst.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,BAYES_40
        autolearn=disabled version=3.3.1
Received: from blackhole.lan (p5B0D82C7.dip0.t-ipconnect.de [91.13.130.199])
        by verein.lst.de (Postfix) with ESMTPSA id E2D4A67329;
        Fri, 15 Nov 2019 08:45:45 +0100 (CET)
Date:   Fri, 15 Nov 2019 08:45:38 +0100
From:   Torsten Duwe <duwe@lst.de>
To:     Itaru Kitayama <itaru.kitayama@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        James.Bottomley@hansenpartnership.com, amit.kachhap@arm.com,
        catalin.marinas@arm.com, deller@gmx.de, duwe@suse.de,
        james.morse@arm.com, jeyu@kernel.org, jpoimboe@redhat.com,
        jthierry@redhat.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
        svens@stackframe.org, takahiro.akashi@linaro.org, will@kernel.org
Subject: Re: [PATCHv2 7/8] arm64: implement ftrace with regs
Message-ID: <20191115084538.1bf2612c@blackhole.lan>
In-Reply-To: <CANW9uyug8WKN2fR-FmcW-C_OO_OQ_AvukM+BR7wqiJ9eFQMO9Q@mail.gmail.com>
References: <20191029165832.33606-1-mark.rutland@arm.com>
        <20191029165832.33606-8-mark.rutland@arm.com>
        <CANW9uyug8WKN2fR-FmcW-C_OO_OQ_AvukM+BR7wqiJ9eFQMO9Q@mail.gmail.com>
Organization: LST e.V.
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 15 Nov 2019 07:05:39 +0900
Itaru Kitayama <itaru.kitayama@gmail.com> wrote:

> Is this feature avail even when building kernel with Clang?

If your compiler can ...

[...]
> > compiler insert a configurable number of NOPs between the function
> > entry point and the usual prologue. This also ensures functions are
> > AAPCS compliant (e.g. disabling inter-procedural register
> > allocation).
> >
> > For example, with -fpatchable-function-entry=2, GCC 8.1.0 compiles
> > the following:
> >
> > | unsigned long bar(void);
> > |
> > | unsigned long foo(void)
> > | {
> > |         return bar() + 1;
> > | }
> >
> > ... to:
> >
> > | <foo>:
> > |         nop
> > |         nop
> > |         stp     x29, x30, [sp, #-16]!

* insert e.g. 2 NOPs
* record all those locations in a section called
  "patchable_function_entries"
* stick to the AAPCS

then: yes. So far I only implemented this for gcc.

	Torsten
