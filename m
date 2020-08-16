Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F99245746
	for <lists+linux-parisc@lfdr.de>; Sun, 16 Aug 2020 13:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbgHPLQr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 16 Aug 2020 07:16:47 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:48191 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728594AbgHPLOo (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 16 Aug 2020 07:14:44 -0400
Subject: Re: (bisected) parisc boot crash in post-5.8 git - pgalloc changes
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-parisc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Pekka Enberg <penberg@kernel.org>,
        Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Joerg Roedel <joro@8bytes.org>, Joerg Roedel <jroedel@suse.de>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
        Stafford Horne <shorne@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <820716ab-0c6d-5154-0789-072b01011313@linux.ee>
 <9f2b5ebd-e4a4-0fa1-6cd3-4b9f6892d1ad@linux.ee>
 <20200815184200.GA17456@casper.infradead.org>
 <20200816073406.GD969206@linux.ibm.com>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <144818a1-83c5-9595-00c0-ebbab3d9b526@linux.ee>
Date:   Sun, 16 Aug 2020 14:13:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200816073406.GD969206@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


16.08.20 10:34 Mike Rapoport wrote:
> Hi,
> 
[...]
> You are right, I've missed that parisc has PMD_ORDER != 0 and the
> simplest fix would be to revert changes to parisc pmd_alloc_one().
> 
> Meelis, can you please try the below patch:

It works on top of current git 5.8.0-13249-ga1d21081a60d - thank you!

Tested-by: Meelis Roos <mroos@linux.ee>
