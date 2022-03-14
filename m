Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 816164D8C72
	for <lists+linux-parisc@lfdr.de>; Mon, 14 Mar 2022 20:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiCNTda (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 14 Mar 2022 15:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234713AbiCNTda (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 14 Mar 2022 15:33:30 -0400
Received: from outbound5f.eu.mailhop.org (outbound5f.eu.mailhop.org [3.127.8.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FEC3B3E6
        for <linux-parisc@vger.kernel.org>; Mon, 14 Mar 2022 12:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647286276; cv=none;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        b=c7ZIavyV+JE/zATvCJPYpmPaemyRhiv8LNF902z/ZO62xp4nP6WKiM3PPExTInlzZWWElqqXFu7BU
         1aeLpexZuiefok+xRmtlRwMp0SmAFSp36LPT/P8sr2BYIUxi6GaKSW2wO333/ySdxMHRLEverU3ZaX
         pSUT4Jk2ZyGPmOb9klnWvW2zLarHsXAJiCCefPZIgCbNWDk8ob5tbMrdEP0MY5WZar/AqPYTyZF2C1
         ZnRkuaMMNkW103DxwHydD4h2S8QI+uH03hikcJDRKWYQ7RHcEloQO8MMmRO36xiuzMBCElbIH4SVxs
         8IFKuLPrilVBoRi87RFS0saGwhgXxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=arc-outbound20181012;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:dkim-signature:dkim-signature:from;
        bh=kyp+Owf05CXyILPnGgrKMmzJC3i4g9GqdGayXhcX37Y=;
        b=G6oxolMPPC6GIRlrOMkOPgh3AtOfxsqyMHncrzX0uob1+/qQ+SZzXv7lKe1Que47vJFnn5ZpD5ejI
         xGH1mhiTxMttx+E89011KFD4eO0QzgMYrUgjOcCQ859/ClZ5f0ls92oxu5fHG5nRz6G/3MiwpvjHk9
         CBXUXJtq0iidBbN7/SPBLpzYJzB0/7XkrjGhw9KgA1U/vm+lw2yJ1hxbcR89qOgEkk/S1J04lfVhH2
         zLHP/FiOowMceSzCIxQ+pgK54seDdEW+XBOQWuIuRHVS/d0r5WLlte1lo9Uh7rJyntD/SAqsqc9w0O
         J19427VVZEjpc5te0A2QeZt09QoldkA==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
        spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=130.180.31.158;
        dmarc=none header.from=stackframe.org;
        arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stackframe.org; s=duo-1634547266507-560c42ae;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=kyp+Owf05CXyILPnGgrKMmzJC3i4g9GqdGayXhcX37Y=;
        b=FUkxJlDpqp3dHc/gnMxe9Ooe+5SqbsSaCn3ZNCxTpsb7wpqdPbStabADLt0auJSfZoXHEXIZ/i9KM
         TL1xyttaFw54EYB6sjJzpkTSdGDqMPQvnvOc8z8IHuGk11FmqKUVI/PZHUnzH4PLxkcpMfL5b4MwnB
         231RhdPm/0sLtNwE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=kyp+Owf05CXyILPnGgrKMmzJC3i4g9GqdGayXhcX37Y=;
        b=gfneBe73mXhdcRLk9PfWLD6kk5uzuEeSnXWq0y+vf2RSxuacg0ESjr2bsLXbGWryVC8MtsEQEg3uY
         D2pd6Tn9ZW+5xRbq/hSOfX3kHce0iMQMcotAgzPileKbHRcDesPY2GPpOY3zIsAN/ry/LBhlt8gHNl
         M4lO5Z4Vtuncvhaj86iAfN3cVWt+57uF37V6tVpKm+JI+WpuEJncIu48Odgr4jNXKyd3gdQODWstRE
         zxlkhb5MCFcwLyEb8Ut7oLqPe1GKm0bKQud+R6hnZ8jC6GvL26gtyzn3VISsinq37UXMxbDauVjJqP
         uzTp9vKnIzfyx1uZhqTc6FJSZZRPMpA==
X-Originating-IP: 130.180.31.158
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 4d3b609d-a3cd-11ec-bc05-4b4748ac966b
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (ip-130-180-031-158.um40.pools.vodafone-ip.de [130.180.31.158])
        by outbound2.eu.mailhop.org (Halon) with ESMTPSA
        id 4d3b609d-a3cd-11ec-bc05-4b4748ac966b;
        Mon, 14 Mar 2022 19:31:12 +0000 (UTC)
Received: from ip-046-005-169-013.um12.pools.vodafone-ip.de ([46.5.169.13] helo=x1.stackframe.org.stackframe.org)
        by mail.duncanthrax.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <svens@stackframe.org>)
        id 1nTqPS-0005K7-DP; Mon, 14 Mar 2022 20:31:14 +0100
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Avoid calling SMP cache flush functions on
 cache-less machines
References: <20220312200533.74209-1-deller@gmx.de>
Date:   Mon, 14 Mar 2022 20:31:08 +0100
In-Reply-To: <20220312200533.74209-1-deller@gmx.de> (Helge Deller's message of
        "Sat, 12 Mar 2022 21:05:33 +0100")
Message-ID: <87y21cs54z.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

Helge Deller <deller@gmx.de> writes:

> At least the qemu virtual machine does not provide D- and I-caches,
> so skip triggering SMP irqs to flush caches on such machines.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

Not sure about the real performance benefit on hppa, but maybe use
static branches?
