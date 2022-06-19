Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21412550B14
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Jun 2022 16:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbiFSOJm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 19 Jun 2022 10:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiFSOJm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 19 Jun 2022 10:09:42 -0400
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28286B7E4
        for <linux-parisc@vger.kernel.org>; Sun, 19 Jun 2022 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1655647778;
        bh=PhNIzZYPD750UmCI/i0uV73ZhGUlfqsxRt/HIl1hzbc=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=QO/xUH6VMb/pqK3pdwd0VP4uckA1ahA/9QR2iFGZDHdwPNG34w6i3DT1hV1sO7tJu
         I5xxNz0CvNecSAPhOhgqfkg+ciQO832uyPO1jGj8NJYRsmYjrPEd5BlTlquUlskhaP
         sHGOYACqSg5zgS//II02n0LT6sg3ceshsbEZD5TM=
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id E5D4E1280B74;
        Sun, 19 Jun 2022 10:09:38 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DeOKIwe6UK7b; Sun, 19 Jun 2022 10:09:38 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1655647778;
        bh=PhNIzZYPD750UmCI/i0uV73ZhGUlfqsxRt/HIl1hzbc=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=QO/xUH6VMb/pqK3pdwd0VP4uckA1ahA/9QR2iFGZDHdwPNG34w6i3DT1hV1sO7tJu
         I5xxNz0CvNecSAPhOhgqfkg+ciQO832uyPO1jGj8NJYRsmYjrPEd5BlTlquUlskhaP
         sHGOYACqSg5zgS//II02n0LT6sg3ceshsbEZD5TM=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3365B12801E3;
        Sun, 19 Jun 2022 10:09:38 -0400 (EDT)
Message-ID: <3df077ff5f3525d5ef2deb13c29581f34931b82d.camel@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Fix flush_anon_page on PA8800/PA8900
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     John David Anglin <dave.anglin@bell.net>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>
Date:   Sun, 19 Jun 2022 10:09:36 -0400
In-Reply-To: <0956ac5e-64c2-0b15-ed70-dc88dc51496c@bell.net>
References: <Yq3r2qO//NzJGVlO@mx3210.localdomain>
         <12000710.O9o76ZdvQC@daneel.sf-tec.de>
         <9ba8ebca-9d20-85e0-0184-859e08eaa29c@bell.net>
         <0956ac5e-64c2-0b15-ed70-dc88dc51496c@bell.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sun, 2022-06-19 at 09:32 -0400, John David Anglin wrote:
> On 2022-06-18 9:18 p.m., John David Anglin wrote:
> > Shared anonymous mappings only work when the mappings are equivalen
> > t or meet the
> > requirements for multi reader, single writer.  The problem is we do
> > n't in general know what mappings are equivalent on PA8800/PA8900 p
> > rocessors.
> This change introduced the possibility that shared mappings might not
> be equivalent on parisc:
> https://marc.info/?l=git-commits-head&m=139776619924910&w=2
> 
> The shmat() man page describes SHMLBA as follows:

I wouldn't read what the manpage says, I'd read what the code does. 
SHMLBA at page size allows a mapping to start anywhere as opposed to
only on 4M boundaries.  SHM_COLOUR at 4M should ensure that any
additional mappings of the area are all aliased correctly.

However, the theory of that seems to rest on the ability of
GET_LAST_MMAP/SET_LAST_MMAP to stash the mmaped address, which appears
to be broken.  So I'd say rather that over flushing we should fix that,
either by stashing properly or falling back to 4MB SHMLBA.

James


