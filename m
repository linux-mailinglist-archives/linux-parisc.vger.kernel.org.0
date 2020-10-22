Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813FD295CE9
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Oct 2020 12:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896693AbgJVKrj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 22 Oct 2020 06:47:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:56268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896574AbgJVKr3 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 06:47:29 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BA392177B;
        Thu, 22 Oct 2020 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603363648;
        bh=xBsbKD5SBQCcLeBR2tpUTrjFtW93i8KwvEiKlew6y/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=feiTNY176OhJVWL6CnkF4kiU6NigFm/VD3Ui4E+wpATVknPWx7I4BQqdiJv/sMgNJ
         H4Eb2Bc9W6InfW+morvNSQUtX8ZVPuBvKSpQrb3i+BcForuB10ZbuKl1VEpEEP0vUn
         prey8EZuMSul8lL3YVDZeBuHUKxl2I6g/LFzXfXQ=
Date:   Thu, 22 Oct 2020 12:48:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     David Laight <David.Laight@aculab.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Christoph Hellwig <hch@lst.de>,
        "kernel-team@android.com" <kernel-team@android.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-aio@kvack.org" <linux-aio@kvack.org>,
        "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201022104805.GA1503673@kroah.com>
References: <20201021233914.GR3576660@ZenIV.linux.org.uk>
 <20201022082654.GA1477657@kroah.com>
 <80a2e5fa-718a-8433-1ab0-dd5b3e3b5416@redhat.com>
 <5d2ecb24db1e415b8ff88261435386ec@AcuMS.aculab.com>
 <df2e0758-b8ed-5aec-6adc-a18f499c0179@redhat.com>
 <20201022090155.GA1483166@kroah.com>
 <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Oct 22, 2020 at 11:36:40AM +0200, David Hildenbrand wrote:
> On 22.10.20 11:32, David Laight wrote:
> > From: David Hildenbrand
> >> Sent: 22 October 2020 10:25
> > ...
> >> ... especially because I recall that clang and gcc behave slightly
> >> differently:
> >>
> >> https://github.com/hjl-tools/x86-psABI/issues/2
> >>
> >> "Function args are different: narrow types are sign or zero extended to
> >> 32 bits, depending on their type. clang depends on this for incoming
> >> args, but gcc doesn't make that assumption. But both compilers do it
> >> when calling, so gcc code can call clang code.
> > 
> > It really is best to use 'int' (or even 'long') for all numeric
> > arguments (and results) regardless of the domain of the value.
> > 
> > Related, I've always worried about 'bool'....
> > 
> >> The upper 32 bits of registers are always undefined garbage for types
> >> smaller than 64 bits."
> > 
> > On x86-64 the high bits are zeroed by all 32bit loads.
> 
> Yeah, but does not help here.
> 
> 
> My thinking: if the compiler that calls import_iovec() has garbage in
> the upper 32 bit
> 
> a) gcc will zero it out and not rely on it being zero.
> b) clang will not zero it out, assuming it is zero.
> 
> But
> 
> a) will zero it out when calling the !inlined variant
> b) clang will zero it out when calling the !inlined variant
> 
> When inlining, b) strikes. We access garbage. That would mean that we
> have calling code that's not generated by clang/gcc IIUC.
> 
> We can test easily by changing the parameters instead of adding an "inline".

Let me try that as well, as I seem to have a good reproducer, but it
takes a while to run...

greg k-h
