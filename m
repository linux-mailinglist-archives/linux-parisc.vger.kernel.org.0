Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E05A28B9AD
	for <lists+linux-parisc@lfdr.de>; Mon, 12 Oct 2020 16:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgJLOCo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 12 Oct 2020 10:02:44 -0400
Received: from foss.arm.com ([217.140.110.172]:46658 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388681AbgJLNhp (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 09:37:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B528D6E;
        Mon, 12 Oct 2020 06:37:44 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 961343F66B;
        Mon, 12 Oct 2020 06:37:42 -0700 (PDT)
Date:   Mon, 12 Oct 2020 14:37:39 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     Peter Collingbourne <pcc@google.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Oleg Nesterov <oleg@redhat.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Kostya Serebryany <kcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        David Spickett <david.spickett@linaro.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>,
        Evgenii Stepanov <eugenis@google.com>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v10 4/7] signal: define the SA_UNSUPPORTED bit in sa_flags
Message-ID: <20201012133738.GD32292@arm.com>
References: <cover.1598072840.git.pcc@google.com>
 <f37a8b86c53be4cc440a73be4123e0419deefe5f.1598072840.git.pcc@google.com>
 <20200908151306.GU6642@arm.com>
 <CAMn1gO6rNqb-_Rm=7zXaRdP-QvcO5JfnUSBqj3E1uYe2T+YAiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO6rNqb-_Rm=7zXaRdP-QvcO5JfnUSBqj3E1uYe2T+YAiw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Oct 07, 2020 at 07:21:25PM -0700, Peter Collingbourne wrote:
> On Tue, Sep 8, 2020 at 8:13 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Fri, Aug 21, 2020 at 10:10:14PM -0700, Peter Collingbourne wrote:
> >
> > Nit: no statement of the chage being made (other than in the subject
> > line).
> 
> Will fix.
> 
> > > This bit will never be supported in the uapi. The purpose of this flag
> > > bit is to allow userspace to distinguish an old kernel that does not
> > > clear unknown sa_flags bits from a kernel that supports every flag bit.
> > >
> > > In other words, if userspace finds that this bit remains set in
> > > oldact.sa_flags, it means that the kernel cannot be trusted to have
> > > cleared unknown flag bits from sa_flags, so no assumptions about flag
> > > bit support can be made.
> >
> > This isn't quite right?  After a single sigaction() call, oact will
> > contain the sa_flags for the previously registered handler.  So a
> > second sigaction() call would be needed to find out the newly effective
> > sa_flags.
> 
> You're right, this is unclear to say the least. In v11 I will reword like so:
> 
>     In other words, if userspace does something like:
> 
>       act.sa_flags |= SA_UNSUPPORTED;
>       sigaction(SIGSEGV, &act, 0);
>       sigaction(SIGSEGV, 0, &oldact);
> 
>     and finds that SA_UNSUPPORTED remains set in oldact.sa_flags, it means
>     that the kernel cannot be trusted to have cleared unknown flag bits
>     from sa_flags, so no assumptions about flag bit support can be made.

Seems reasonable.  We'd need to make sure we're clear about which flags
this applies for, though.  The pre-existing flags can be assumed to be
supported irrespective of whether SA_UNSUPPORTED remains set.

Cheers
---Dave
