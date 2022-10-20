Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1158D606A10
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Oct 2022 23:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiJTVIa (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Oct 2022 17:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiJTVI3 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Oct 2022 17:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03DA21CD59
        for <linux-parisc@vger.kernel.org>; Thu, 20 Oct 2022 14:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666300107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2A5U7TgGw17FmjrMZwAMuIV6v8ycLR82x3yDuTFSo9c=;
        b=OEEWBXtFmngODbuw3nzkrsykCeEm3qfaTYOuEiKnKi07Zsdst636J7tHvb9Xue1Ww++gHQ
        oDtARpgOUcdFDW59YxnfN6haOK3REi7zlqPcZ9Yx+i8QqG2XKF5W5XNVFxGYQq8fhK2voY
        37PoDlHxUEeFIW4tOsBs/lPUo45kdy0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-C0xKKEH6MpeQzXKatemROg-1; Thu, 20 Oct 2022 17:08:26 -0400
X-MC-Unique: C0xKKEH6MpeQzXKatemROg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2F4F85A583;
        Thu, 20 Oct 2022 21:08:25 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B8161111D3C6;
        Thu, 20 Oct 2022 21:08:25 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 29KL8P4a031657;
        Thu, 20 Oct 2022 17:08:25 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 29KL8PTN031653;
        Thu, 20 Oct 2022 17:08:25 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Thu, 20 Oct 2022 17:08:25 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: the patch "Convert PDC console to an early console" breaks the^M
 console
In-Reply-To: <fe739cd9-509b-13ec-fe9d-810a226ae316@gmx.de>
Message-ID: <alpine.LRH.2.21.2210201703350.31480@file01.intranet.prod.int.rdu2.redhat.com>
References: <1MhlGq-1pGSQJ2Koq-00dm3N@mail.gmx.net> <alpine.LRH.2.21.2210200917320.31339@file01.intranet.prod.int.rdu2.redhat.com> <430864f0-da89-cc2b-e357-d7aaf41f31fa@gmx.de> <4011ff49-294a-aa08-e087-d60995649e00@gmx.de>
 <alpine.LRH.2.21.2210201552400.9506@file01.intranet.prod.int.rdu2.redhat.com> <fe983997-22c9-a58b-136c-15e2303350d8@gmx.de> <alpine.LRH.2.21.2210201626280.28324@file01.intranet.prod.int.rdu2.redhat.com> <fe739cd9-509b-13ec-fe9d-810a226ae316@gmx.de>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

> On 10/20/22 22:34, Mikulas Patocka wrote:
> > 
> > 
> > On Thu, 20 Oct 2022, Helge Deller wrote:
> > 
> > > On 10/20/22 21:57, Mikulas Patocka wrote:
> > > > 
> > > > 
> > > > On Thu, 20 Oct 2022, Helge Deller wrote:
> > > > 
> > > > > On 10/20/22 20:01, Helge Deller wrote:
> > > > > > On 10/20/22 15:26, Mikulas Patocka wrote:
> > > > > > > On Thu, 20 Oct 2022, Helge Deller wrote:
> > > > > > > 
> > > > > > > > Your serial ports don't seem to be detected and thus
> > > > > > > > missing...?!
> > > > > > > 
> > > > > > > It seems to be so. Does it work on your C8000? - if it does, send
> > > > > > > me
> > > > > > > your
> > > > > > > config and I'll find the difference.
> > > > > 
> > > > > Works for me on c8k with serial console (parameter console=ttyS0):
> > > > > config attached.
> > > > 
> > > > Thanks. CONFIG_GSC=y fixed it for me.
> > > 
> > > Good.
> > > 
> > > > Maybe you should update the help text for CONFIG_GSC. It says that it is
> > > > "not found in B1000, C3000, J5000, A500, L1000, N4000 and upwards" - so
> > > > I
> > > > turned it off when making my config.
> > > 
> > > The help text is actually correct.
> > > Your C8000 does not has a GSC bus, so why does CONFIG_GSC=n disables your
> > > serial ports?
> > > Needs checking..
> > > 
> > > Helge
> > 
> > There's drivers/tty/serial/8250/Kconfig:
> > config SERIAL_8250_GSC
> >          tristate
> >          depends on SERIAL_8250 && GSC
> >          default SERIAL_8250
> > 
> > drivers/tty/serial/8250/Makefile:
> > obj-$(CONFIG_SERIAL_8250_GSC)           += 8250_gsc.o
> > 
> > drivers/tty/serial/8250/8250_gsc.c contains this device table:
> > static const struct parisc_device_id serial_tbl[] __initconst = {
> >          { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00075 },
> >          { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008c },
> >          { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008d },
> >          { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x000ad }, <---
> > this matches the serial port on C8000
> >          { 0 }
> > };
> > 
> > So, perhaps it should depend on CONFIG_PARISC instead of CONFIG_GSC.
> 
> Right, I just came to the same conclusion.
> Do you want to post a patch here on the list?
> 
> Helge

I think you should do it. It would be best to rename that file from 
8250_gsc.c to 8250_parisc.c and I don't know how to make a patch that 
renames a file - you should rename the file in git and send a pull request 
to Linus.

Mikulas

