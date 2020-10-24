Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B62297B73
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Oct 2020 10:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1760038AbgJXIYL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 24 Oct 2020 04:24:11 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51779 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1760037AbgJXIYL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 24 Oct 2020 04:24:11 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud7.xs4all.net with ESMTPSA
        id WEqOk4dVO4n8PWEqPk6IZZ; Sat, 24 Oct 2020 10:24:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603527849; bh=olJJZMqSBnMv7754oWQ69ZWDHD9mBaaNIfIQpT/flbA=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=FfzyCVCfOcbbYYDiU76p6CwL6n6SRV7MGc1aHX3vsphhbiJuMX9uSOIPr3ufkF7JK
         PMpk6ZuvWbndXeOZclfRaqUz9ucy0m6fQWXIP4D62dOSAUCheK721vVN1KJKXz/4lE
         KNNvZPEQaUK70CYfzpI/LcC6hPUb9HVuamuU+tngyfudhJzyKypoaEXL78lIleM1UI
         LXWjWDjTNzJ2IqCZ6BodJ2H7lb4skyQWsGDzGPXcWYjklkRnMPIN3KLW6u9OAPXaUi
         nsPTobZmOMMSA18geqqK82aUQww25bXArJJaJtLAPudHVr1qrf+XWjuAhn9kKLgmTY
         n2pMuoCF4F4nQ==
Date:   Sat, 24 Oct 2020 10:24:07 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH v3] parisc: Add wrapper syscalls to fix O_NONBLOCK
 flag usage
Message-ID: <20201024102407.2d90b6b2@wim.jer>
In-Reply-To: <20201024102218.72586ac5@wim.jer>
References: <20200829122017.GA3988@ls3530.fritz.box>
        <20201020192101.772bedd5@wim.jer>
        <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
        <20201022173824.49b6b7f5@wim.jer>
        <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
        <20201022164007.GA10653@ls3530.fritz.box>
        <20201023181847.GA6776@ls3530.fritz.box>
        <20201024102218.72586ac5@wim.jer>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGfvYLulMRfLr/+6Q8qIZII8UWHWAi4fXNRLv9yi3ERziJTXfTOYnNgTaX/NggF2ikADwmQu2x+IlRth9IzQfjdIEf9OJZ54Pd7H/A1wwykIp8/5d9ky
 DYHYbSCLmgaEfqJyeAkbN8Va9HsWCs1tree3LFR0NtbxSCR4XbORWnbbWr3UnIYOTkYZUJg1VjdGjUZ3Z8YB81mjl9uYgT77iutMWmCmIJTP6pwHZ6JGOg48
 cpbIyCbjQkkreSfS6VKv9MBdLBFZiU5L9+2p8GQAikA2v2RLDidjPDc1pZQ2on4hYMVH60H1yP7unwvJ5aSeeg==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 24 Oct 2020 10:22:18 +0200
Jeroen Roovers <jer@xs4all.nl> wrote:

> On Fri, 23 Oct 2020 20:18:47 +0200
> Helge Deller <deller@gmx.de> wrote:
> 
> > +static int FIX_O_NONBLOCK(int flags)
> > +{
> > +	if (flags & O_NONBLOCK_MASK_OUT) {
> > +		struct task_struct *tsk = current;
> > +		pr_warn_once("%s(%d) uses a deprecated O_NONBLOCK
> > value.\n",
> > +			tsk->comm, tsk->pid);
> > +	}
> > +	return flags & ~O_NONBLOCK_MASK_OUT;
> > +}  
> 
> Would it be interesting to additionally report the calling function in
> search for other syscalls that might not be covered yet?

Wait, that doesn't make sense, does it?

Regards,
     jer

