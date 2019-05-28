Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD1DC2C12D
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 10:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfE1I0w (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 04:26:52 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:43565 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbfE1I0v (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 04:26:51 -0400
Received: (qmail 13315 invoked from network); 28 May 2019 08:26:16 -0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69]:57126 HELO webmail.sf-mail.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.35dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <svens@stackframe.org>; Tue, 28 May 2019 10:26:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 May 2019 10:26:16 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org,
        linux-parisc-owner@vger.kernel.org
Subject: Re: [PATCH 6/6] parisc: add dynamic ftrace
In-Reply-To: <20190527190450.14988-7-svens@stackframe.org>
References: <20190527190450.14988-1-svens@stackframe.org>
 <20190527190450.14988-7-svens@stackframe.org>
Message-ID: <e03e68c1b6e3d3bf123eaeec08bd6294@sf-tec.de>
X-Sender: eike-kernel@sf-tec.de
User-Agent: Roundcube Webmail/1.3.8
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Am 2019-05-27 21:04, schrieb Sven Schnelle:
> This patch implements dynamic ftrace for PA-RISC. The required mcount
> call sequences can get pretty long, so instead of patching the
> whole call sequence out of the functions, we are using
> -fpatchable-function-entry from gcc. This puts a configurable amount of
> NOPS before/at the start of the function. Taking do_sys_open() as 
> example,
> which would look like this when the call is patched out:
> 
> 1036b248:       08 00 02 40     nop
> 1036b24c:       08 00 02 40     nop
> 1036b250:       08 00 02 40     nop
> 1036b254:       08 00 02 40     nop
> 
> 1036b258 <do_sys_open>:
> 1036b258:       08 00 02 40     nop
> 1036b25c:       08 03 02 41     copy r3,r1
> 1036b260:       6b c2 3f d9     stw rp,-14(sp)
> 1036b264:       08 1e 02 43     copy sp,r3
> 1036b268:       6f c1 01 00     stw,ma r1,80(sp)
> 
> When ftrace gets enabled for this function the kernel will patch these
> NOPs to:
> 
> 1036b248:       10 19 57 20     <address of ftrace>
> 1036b24c:       6f c1 00 80     stw,ma r1,40(sp)
> 1036b250:       48 21 3f d1     ldw -18(r1),r1
> 1036b254:       e8 20 c0 02     bv,n r0(r1)
> 
> 1036b258 <do_sys_open>:
> 1036b258:       e8 3f 1f df     b,l,n .-c,r1
> 1036b25c:       08 03 02 41     copy r3,r1
> 1036b260:       6b c2 3f d9     stw rp,-14(sp)
> 1036b264:       08 1e 02 43     copy sp,r3
> 1036b268:       6f c1 01 00     stw,ma r1,80(sp)
> 
> So the first NOP in do_sys_open() will be patched to jump backwards 
> into
> some minimal trampoline code which pushes a stackframe, saves r1 which
> holds the return address, loads the address of the real ftrace 
> function,
> and branches to that location. For 64 Bit things are getting a bit more
> complicated (and longer) because we must make sure that the address of
> ftrace location is 8 byte aligned, and the offset passed to ldd for
> fetching the address is 8 byte aligned as well.
> 
> Note that gcc has a bug which misplaces the function label, and needs a
> patch to make dynamic ftrace work.

This changelog entry _really_ needs a link to the gcc bugtracker so 
tracking
this when doing downstream toolchain patching isn't driving other people 
mad
trying to find out what you are talking about.

Eike
