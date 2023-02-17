Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A18F69AC98
	for <lists+linux-parisc@lfdr.de>; Fri, 17 Feb 2023 14:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjBQNe3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 17 Feb 2023 08:34:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjBQNe2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 17 Feb 2023 08:34:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CBE68E7B
        for <linux-parisc@vger.kernel.org>; Fri, 17 Feb 2023 05:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676640725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=chS9d4alxJTTQ0I6y2eHNvEVBW1ojTXFjGlKthH2/HI=;
        b=QJa+xEmK+Xrp1oc96DGlkHUt23tnudFOj4+nq7CIUMP3Kr7DIVJB5D/9M5AehE5W0RGE08
        sp6SPIOEI87AOAvDQEGwkJweL0O6Gbt8m66n5i+LeA9pgHdTKshUSm3ZLQP6M+6rP5fLV6
        eBi6iXODcCiNCT8u42K7ti7E2pVb2+8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-7EIl6UqeOP2Eu6CZvaXtAw-1; Fri, 17 Feb 2023 08:32:00 -0500
X-MC-Unique: 7EIl6UqeOP2Eu6CZvaXtAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F3272805589;
        Fri, 17 Feb 2023 13:31:59 +0000 (UTC)
Received: from localhost (ovpn-12-99.pek2.redhat.com [10.72.12.99])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 11929404CD84;
        Fri, 17 Feb 2023 13:31:57 +0000 (UTC)
Date:   Fri, 17 Feb 2023 21:31:54 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Christoph Hellwig <hch@infradead.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        David Laight <David.Laight@aculab.com>,
        Stafford Horne <shorne@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v4 12/16] parisc: mm: Convert to GENERIC_IOREMAP
Message-ID: <Y++Bypsg9YCmUEcd@MiWiFi-R3L-srv>
References: <20230216123419.461016-1-bhe@redhat.com>
 <20230216123419.461016-13-bhe@redhat.com>
 <Y+40p3oegc2Of9w2@casper.infradead.org>
 <Y+5Fcc6wsbr0qmoN@MiWiFi-R3L-srv>
 <bff4f286-ccf8-40bc-8fe5-d4041adf89f5@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bff4f286-ccf8-40bc-8fe5-d4041adf89f5@app.fastmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 02/16/23 at 04:18pm, Arnd Bergmann wrote:
> On Thu, Feb 16, 2023, at 16:02, Baoquan He wrote:
> > On 02/16/23 at 01:50pm, Matthew Wilcox wrote:
> > It's not if including asm-generic/iomap.h. The ARCH_HAS_IOREMAP_xx is to
> > avoid redefinition there.
> >
> > include/asm-generic/iomap.h:
> > ----
> > #ifndef ARCH_HAS_IOREMAP_WC
> > #define ioremap_wc ioremap
> > #endif
> 
> I'd change that to the usual '#ifndef ioremap_wc' in that case.

Not sure if I got you. Kill all ARCH_HAS_IOREMAP_xxx in kernel? If yes,
sounds like a good idea.

