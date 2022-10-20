Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD7F60619A
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Oct 2022 15:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiJTN0j (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Oct 2022 09:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbiJTN0d (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Oct 2022 09:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9FB12D34
        for <linux-parisc@vger.kernel.org>; Thu, 20 Oct 2022 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666272366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CEVu0MYEVchMbCYjgBPdE2YBOhLIci0Vt3qMGr44Mt8=;
        b=LOLjf9amVJR1WvnpwyBMgoiwCJHG13ENsxijjrXl40iQAUEmXBmOVAXzltfaLt8nwNyruC
        OdUXqNZ0a4eq5mly6WwP/jU70rCTo/bdwnA2vXxOeiBR7I8EaWZSJWS5ha7LJ7s0RXrs0i
        8/gKxzhGDQ57w3nlig5CPVw2kLgPhq0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-EzTS3Ue0OT6JsjO_gGsPmw-1; Thu, 20 Oct 2022 09:26:03 -0400
X-MC-Unique: EzTS3Ue0OT6JsjO_gGsPmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 950CE811E75;
        Thu, 20 Oct 2022 13:26:02 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 85E851415113;
        Thu, 20 Oct 2022 13:26:02 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 29KDQ2lE031734;
        Thu, 20 Oct 2022 09:26:02 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 29KDQ2cb031730;
        Thu, 20 Oct 2022 09:26:02 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 20 Oct 2022 09:26:02 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: RE: the patch "Convert PDC console to an early console" breaks the^M
  console
In-Reply-To: <1MhlGq-1pGSQJ2Koq-00dm3N@mail.gmx.net>
Message-ID: <alpine.LRH.2.21.2210200917320.31339@file01.intranet.prod.int.rdu2.redhat.com>
References: <1MhlGq-1pGSQJ2Koq-00dm3N@mail.gmx.net>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

> Your serial ports don't seem to be detected and thus missing...?!

It seems to be so. Does it work on your C8000? - if it does, send me your 
config and I'll find the difference.

Mikulas

