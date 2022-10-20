Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27A560693F
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Oct 2022 21:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiJTT56 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Oct 2022 15:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbiJTT55 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Oct 2022 15:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A87213443
        for <linux-parisc@vger.kernel.org>; Thu, 20 Oct 2022 12:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x08gAurwKK41jj6h8u5Daq14vgNIWdeKU/B0qk4UvvU=;
        b=QHxRT5Bh2PHFTCm4R8yLEIqLNATmO/XHKnDVtiKI2ipuA+mY4MOKbxMnegNmGG938GWT2E
        c5L2JwBqaLnrGkUt7vqmM5SfW/fHFKhjsSibHtDIpNte4MHNTSX/i1z4Z+hsPhaHof58DR
        nHItQEKdxB5+bd1kxmKAtLZkiGrrMPs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-vjVnbS2IOJaM8FYJLOd-gw-1; Thu, 20 Oct 2022 15:57:52 -0400
X-MC-Unique: vjVnbS2IOJaM8FYJLOd-gw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BAC6101A54E;
        Thu, 20 Oct 2022 19:57:52 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id F17E917593;
        Thu, 20 Oct 2022 19:57:51 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 29KJvppf026547;
        Thu, 20 Oct 2022 15:57:51 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 29KJvp2M026543;
        Thu, 20 Oct 2022 15:57:51 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 20 Oct 2022 15:57:51 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: the patch "Convert PDC console to an early console" breaks the^M
 console
In-Reply-To: <4011ff49-294a-aa08-e087-d60995649e00@gmx.de>
Message-ID: <alpine.LRH.2.21.2210201552400.9506@file01.intranet.prod.int.rdu2.redhat.com>
References: <1MhlGq-1pGSQJ2Koq-00dm3N@mail.gmx.net> <alpine.LRH.2.21.2210200917320.31339@file01.intranet.prod.int.rdu2.redhat.com> <430864f0-da89-cc2b-e357-d7aaf41f31fa@gmx.de> <4011ff49-294a-aa08-e087-d60995649e00@gmx.de>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Thu, 20 Oct 2022, Helge Deller wrote:

> On 10/20/22 20:01, Helge Deller wrote:
> > On 10/20/22 15:26, Mikulas Patocka wrote:
> > > On Thu, 20 Oct 2022, Helge Deller wrote:
> > > 
> > > > Your serial ports don't seem to be detected and thus missing...?!
> > > 
> > > It seems to be so. Does it work on your C8000? - if it does, send me your
> > > config and I'll find the difference.
> 
> Works for me on c8k with serial console (parameter console=ttyS0):
> config attached.

Thanks. CONFIG_GSC=y fixed it for me.

Maybe you should update the help text for CONFIG_GSC. It says that it is 
"not found in B1000, C3000, J5000, A500, L1000, N4000 and upwards" - so I 
turned it off when making my config.

Mikulas

