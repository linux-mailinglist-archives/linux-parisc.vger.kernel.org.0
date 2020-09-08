Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08CB0261E4F
	for <lists+linux-parisc@lfdr.de>; Tue,  8 Sep 2020 21:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbgIHTus (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 8 Sep 2020 15:50:48 -0400
Received: from foss.arm.com ([217.140.110.172]:56350 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730802AbgIHPuk (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:50:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D2E1692;
        Tue,  8 Sep 2020 08:12:27 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C50A03F73C;
        Tue,  8 Sep 2020 08:12:25 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:12:23 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     Peter Collingbourne <pcc@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        David Spickett <david.spickett@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v10 2/7] arch: move SA_* definitions to generic headers
Message-ID: <20200908151223.GS6642@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <f5b9b91e7401d82c899fb6d1bb7fb2158103e5f3.1598072840.git.pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5b9b91e7401d82c899fb6d1bb7fb2158103e5f3.1598072840.git.pcc@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Aug 21, 2020 at 10:10:12PM -0700, Peter Collingbourne wrote:
> Most architectures with the exception of alpha, mips, parisc and
> sparc use the same values for these flags. Move their definitions into
> asm-generic/signal-defs.h and allow the architectures with non-standard
> values to override them. Also, document the non-standard flag values
> in order to make it easier to add new generic flags in the future.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>

While this looks reasonable, I've just realised that you strip the "U"
from some arches' definitions here.

So, on powerpc and x86, this changes the type of flags other than
SA_RESETHAND from unsigned int to int.

While I can't see this breaking any sensible use of these flags, there's
a chance that there is software relying on this distinction by
accident.


I wonder whether it's worth doing something like

	#ifdef ARCH_WANT_STRICTLY_UNSIGNED_SA_FLAGS
	#define __SA_FLAG_VAL(x) x ## U
	#else
	#define __SA_FLAG_VAL(x) x
	#endif

	#ifndef SA_NOCLDSTOP
	#define SA_NOCLDSTOP __SA_FLAG_VAL(0x00000001)
	#endif

	/* ... */


Mind you, the historical situation also has issues, e.g. because
sa_flags in struct sigaction is an int, assigning

	struct sigaction sa;

	sa.sa_flags = SA_RESETHAND;

implies an overflow and so isn't portably safe (at least in theory).  I
guess we are getting away with it today.  Preserving the situation by
keeping the "U"s where appropriate would at least avoid making the
situation worse.

[...]

Cheers
---Dave
