Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8B8F148D47
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2020 18:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390446AbgAXR7v (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 Jan 2020 12:59:51 -0500
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:40288 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389013AbgAXR7u (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 Jan 2020 12:59:50 -0500
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 4B42B8EE149;
        Fri, 24 Jan 2020 09:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1579888790;
        bh=hPgrSS5YnlOUtCNuI8GwgklA11NYYzD/CN5hBJfeBds=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=aTLhhcfWsa3AymWaW8LLB7mSZ7R3tvkl+Cghw9tN0k7A09EeizqnltmOeX10HzaNy
         F5bnPLip25b08CqprZp9tQ2YDJuYcd0rlnpTWyoIZADcJ0sbpPWc0IjImSssZvcggu
         yU6Xy9s898jY2DUey7EIlhSI6BOfuXYjluZWDaMo=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Eb-lTrOvMaFc; Fri, 24 Jan 2020 09:59:50 -0800 (PST)
Received: from jarvis.lan (unknown [50.35.76.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D762C8EE0D4;
        Fri, 24 Jan 2020 09:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1579888790;
        bh=hPgrSS5YnlOUtCNuI8GwgklA11NYYzD/CN5hBJfeBds=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=aTLhhcfWsa3AymWaW8LLB7mSZ7R3tvkl+Cghw9tN0k7A09EeizqnltmOeX10HzaNy
         F5bnPLip25b08CqprZp9tQ2YDJuYcd0rlnpTWyoIZADcJ0sbpPWc0IjImSssZvcggu
         yU6Xy9s898jY2DUey7EIlhSI6BOfuXYjluZWDaMo=
Message-ID: <1579888788.3001.26.camel@HansenPartnership.com>
Subject: Re: [PATCH v1] parisc: Use for_each_console() helper
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Date:   Fri, 24 Jan 2020 09:59:48 -0800
In-Reply-To: <20200124173846.GL32742@smile.fi.intel.com>
References: <20200124160739.65256-1-andriy.shevchenko@linux.intel.com>
         <1579883942.3001.14.camel@HansenPartnership.com>
         <20200124173846.GL32742@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 2020-01-24 at 19:38 +0200, Andy Shevchenko wrote:
> On Fri, Jan 24, 2020 at 08:39:02AM -0800, James Bottomley wrote:
> > On Fri, 2020-01-24 at 18:07 +0200, Andy Shevchenko wrote:
> > > Replace open coded single-linked list iteration loop with
> > > for_each_console()
> > > helper in use.
> > > -	while ((console = console_drivers) != NULL)
> > > -		unregister_console(console_drivers);
> > > +	for_each_console(console)
> > > +		unregister_console(console);
> > 
> > This is wrong.  The old formulation iterates correctly in the face
> > of element removal.  for_each_console is defined:
> > 
> > #define for_each_console(con) \
> > 	for (con = console_drivers; con != NULL; con = con->next)
> > 
> > So it's not safe for any iteration that alters the list elements.
> 
> Ah, I see. In this case we need to keep a pointer to the next
> element. Though, the original code assumes that console_drivers after
> unregistration will be promoted to the next element. Do we have this
> assumption solid?

Yes, the original code simply removes the head until the list is empty.
 That's a recognized way of emptying any list while letting the remove
code take care of the locking ... it works because parisc doesn't have
a braille console.

James

