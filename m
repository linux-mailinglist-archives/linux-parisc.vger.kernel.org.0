Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44A7C5674B7
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Jul 2022 18:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbiGEQq2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 5 Jul 2022 12:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiGEQq1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 5 Jul 2022 12:46:27 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D0313DE4;
        Tue,  5 Jul 2022 09:46:27 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2637168AA6; Tue,  5 Jul 2022 18:46:24 +0200 (CEST)
Date:   Tue, 5 Jul 2022 18:46:23 +0200
From:   Christoph Hellwig <hch@lst.de>
Cc:     linux-parisc@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: flush_icache_range in the sticore driver
Message-ID: <20220705164623.GA14566@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MISSING_HEADERS,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi all,

flush_icache_range is supposed to flush the instruction cache, which is
something no driver should be doing.  It was added in commit 03b18f1b2afe
("[PARISC] Clean up sti_flush") but the explanation in there looks odd.

Can someone shed a light what flushes this tries to flush and why it
can't be done behind a proper API?

