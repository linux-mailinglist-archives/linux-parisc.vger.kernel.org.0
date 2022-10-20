Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F319605FD9
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Oct 2022 14:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiJTMOH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Oct 2022 08:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJTMOG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Oct 2022 08:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A4D15B126
        for <linux-parisc@vger.kernel.org>; Thu, 20 Oct 2022 05:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666268044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=RhaEWCVb7beYPLh0M+6Qdk3kEQCDM/iVhvPFleehmDs=;
        b=WUFY1FgjHyY9RTemLBleiVRqS2k4bQ+KK8VWKk0pjZ15JiLP9+ZSUJ8QQc517l6Z7Y3d+w
        6/GpG3GoQealcg1pXlLVEjO2MJY0S12TC2oZmeIx61ywWKI6KFE4ga5K96su0hrhZUxWPl
        dUaJyLldSy9Rm7TvUiQNHZp9ThfIRbc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-p9iO2ZjVPoOJoKvtiSV3BQ-1; Thu, 20 Oct 2022 08:14:00 -0400
X-MC-Unique: p9iO2ZjVPoOJoKvtiSV3BQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FF3C857D1A;
        Thu, 20 Oct 2022 12:13:59 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7133440CA428;
        Thu, 20 Oct 2022 12:13:59 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 29KCDqtL026941;
        Thu, 20 Oct 2022 08:13:53 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 29KCDltp026937;
        Thu, 20 Oct 2022 08:13:51 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 20 Oct 2022 08:13:46 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: the patch "Convert PDC console to an early console" breaks the
 console
Message-ID: <alpine.LRH.2.21.2210200744340.25125@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi

The patch 027c3d345e2a1ea61d6e4506a250eb392e6e7b18 ("parisc: Convert PDC 
console to an early console") breaks the console for me.

I have C8000. I boot the kernel with "console=ttyS0", I can see the kernel 
messages on the console, however access to the console from userspace 
doesn't work.

"echo hello >/dev/ttyS0" produces
"-bash: echo: write error: Input/output error"

"cat /dev/ttyS0" produces
"cat: /dev/ttyS0: Input/output error".

With the old PDC driver, I could both read and write the console from 
userspace and I could run getty on it.

Am I missing some config option? Or is it an inherent limitation of the 
new driver? I uploaded my config and dmesg here: 
https://people.redhat.com/~mpatocka/testcases/parisc-console-6.1/

Mikulas

