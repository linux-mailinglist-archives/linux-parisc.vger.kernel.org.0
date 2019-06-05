Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEBB3654E
	for <lists+linux-parisc@lfdr.de>; Wed,  5 Jun 2019 22:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfFEUVo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 5 Jun 2019 16:21:44 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:35489 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfFEUVo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jun 2019 16:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=lOSViPXewPWlc3O+e2FkTO3EH+rfsDpLHNTJNP793Wg=; b=kvPlytekgY/uDoOA1V861QR71s
        gyU04WjRvc+Tg2waS9YwY1CmVriMczLP9MaWERD9eltqFkvyzQqTrwq0xpa9ju8Bwg0bZfdoTwcAB
        +mod6qX/MKJYYVOVEeKP3ibPn9xE/4Yl1Zc5GXGXQnNmVj0EQNaUYoIM36kDQcnHB6pg=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYcPl-0004PR-Mt; Wed, 05 Jun 2019 22:21:41 +0200
Date:   Wed, 5 Jun 2019 22:21:40 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] parisc: add support for patching multiple words
Message-ID: <20190605202140.GB779@t470p.stackframe.org>
References: <20190604183435.20175-1-svens@stackframe.org>
 <20190604183435.20175-2-svens@stackframe.org>
 <3798054.dHnqrmMtG0@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3798054.dHnqrmMtG0@daneel.sf-tec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Tue, Jun 04, 2019 at 09:21:34PM +0200, Rolf Eike Beer wrote:
> Sven Schnelle wrote:
> > +	while (len >= 4) {
> > +		*p++ = *insn++;
> > +		addr += sizeof(u32);
> > +		len -= sizeof(u32);
> > +		if (len && !((unsigned long)addr & ~PAGE_MASK)) {
> 
> if (len && offset_in_page(addr) == 0)
> 
> This is a bit more obvious to me. YMMV.

It is. I'll update the patch and send a v3. Thanks!

Sven
