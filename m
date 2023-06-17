Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB8E7341F7
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Jun 2023 17:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbjFQPhM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Jun 2023 11:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235902AbjFQPhK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Jun 2023 11:37:10 -0400
Received: from out-33.mta0.migadu.com (out-33.mta0.migadu.com [91.218.175.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC08F3
        for <linux-parisc@vger.kernel.org>; Sat, 17 Jun 2023 08:37:09 -0700 (PDT)
Date:   Sat, 17 Jun 2023 11:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1687016225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gkXjdfOcfNeiSkHnMLeI301HhtsXBRoYstWMSEINMeY=;
        b=bYJe9WRiSRM7w/M47iLquWHHUju4li/dPcwoEprDi3YlwcaYBjxpWs1nL0UujvT6xyWL/M
        S2Ghsqn2fpzAD+9R1F0Wx9PyfySyz0oJLdRx0TD6TfwLRge4cekLdS4qLEUtsEWtm6ack0
        XRAL5F0yJ/NulC1WuvN1fyiNm3tO1UM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nadav Amit <nadav.amit@gmail.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Puranjay Mohan <puranjay12@gmail.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-modules@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
Message-ID: <ZI3TGhJ2y5SBWmnA@moria.home.lan>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-8-rppt@kernel.org>
 <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
 <20230617065759.GT52412@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230617065759.GT52412@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Jun 17, 2023 at 09:57:59AM +0300, Mike Rapoport wrote:
> > This is growing fast. :) We have 3 now: text, data, jit. And it will be
> > 5 when we split data into rw data, ro data, ro after init data. I wonder
> > whether we should still do some type enum here. But we can revisit
> > this topic later.
> 
> I don't think we'd need 5. Four at most :)
> 
> I don't know yet what would be the best way to differentiate RW and RO
> data, but ro_after_init surely won't need a new type. It either will be
> allocated as RW and then the caller will have to set it RO after
> initialization is done, or it will be allocated as RO and the caller will
> have to do something like text_poke to update it.

Perhaps ro_after_init could use the same allocation interface and share
pages with ro pages - if we just added a refcount for "this page
currently needs to be rw, module is still loading?"

text_poke() approach wouldn't be workable, you'd have to audit and fix
all module init code in the entire kernel.
