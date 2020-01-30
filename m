Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A75D14DC70
	for <lists+linux-parisc@lfdr.de>; Thu, 30 Jan 2020 15:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgA3OHw (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 30 Jan 2020 09:07:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:51562 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727001AbgA3OHw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 30 Jan 2020 09:07:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C1B88AC66;
        Thu, 30 Jan 2020 14:07:49 +0000 (UTC)
Date:   Thu, 30 Jan 2020 15:07:49 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1] parisc: Use for_each_console() helper
Message-ID: <20200130140748.ugetnys4vabf6vqx@pathway.suse.cz>
References: <20200124160739.65256-1-andriy.shevchenko@linux.intel.com>
 <1579883942.3001.14.camel@HansenPartnership.com>
 <20200124173846.GL32742@smile.fi.intel.com>
 <1579888788.3001.26.camel@HansenPartnership.com>
 <20200125102508.GQ32742@smile.fi.intel.com>
 <310fb56d-8b7e-6dca-f36a-41729ef66e25@gmx.de>
 <20200127094722.GU32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127094722.GU32742@smile.fi.intel.com>
User-Agent: NeoMutt/20170912 (1.9.0)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon 2020-01-27 11:47:22, Andy Shevchenko wrote:
> On Mon, Jan 27, 2020 at 09:48:58AM +0100, Helge Deller wrote:
> > On 25.01.20 11:25, Andy Shevchenko wrote:
> > > On Fri, Jan 24, 2020 at 09:59:48AM -0800, James Bottomley wrote:
> 
> ...
> 
> > > By the way, consider this code from register_console()
> > >
> > >   for_each_console(bcon)
> > >     if (bcon->flags & CON_BOOT)
> > >       unregister_console(bcon);
> > >
> > > It works based on assumption that next pointer of the just unregistered console
> > > is not damaged. So, My initial patch will work in the same way.
> > 
> > Yeah, but that's a typical use-after-free issue, which I wouldn't count on.
> 
> I think here is misinterpretation, i.e. unregister != free.
> Entire console code is written in the assumption that console is not being
> freed when unregistered.

Honestly, I am not sure if this is true for all console drivers
and if it is by design.

I would prefer to stay on the safe side and keep the original
code. Hotplug practices are more and more popular as everything
gets virtualized.

Best Regards,
Petr
