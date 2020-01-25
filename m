Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44F94149453
	for <lists+linux-parisc@lfdr.de>; Sat, 25 Jan 2020 11:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgAYKZe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 Jan 2020 05:25:34 -0500
Received: from mga06.intel.com ([134.134.136.31]:18162 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgAYKZe (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 Jan 2020 05:25:34 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jan 2020 02:25:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,361,1574150400"; 
   d="scan'208";a="400894449"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 25 Jan 2020 02:25:07 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ivIcm-0003eG-Hz; Sat, 25 Jan 2020 12:25:08 +0200
Date:   Sat, 25 Jan 2020 12:25:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v1] parisc: Use for_each_console() helper
Message-ID: <20200125102508.GQ32742@smile.fi.intel.com>
References: <20200124160739.65256-1-andriy.shevchenko@linux.intel.com>
 <1579883942.3001.14.camel@HansenPartnership.com>
 <20200124173846.GL32742@smile.fi.intel.com>
 <1579888788.3001.26.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579888788.3001.26.camel@HansenPartnership.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Jan 24, 2020 at 09:59:48AM -0800, James Bottomley wrote:
> On Fri, 2020-01-24 at 19:38 +0200, Andy Shevchenko wrote:
> > On Fri, Jan 24, 2020 at 08:39:02AM -0800, James Bottomley wrote:
> > > On Fri, 2020-01-24 at 18:07 +0200, Andy Shevchenko wrote:
> > > > Replace open coded single-linked list iteration loop with
> > > > for_each_console()
> > > > helper in use.
> > > > -	while ((console = console_drivers) != NULL)
> > > > -		unregister_console(console_drivers);
> > > > +	for_each_console(console)
> > > > +		unregister_console(console);
> > > 
> > > This is wrong.  The old formulation iterates correctly in the face
> > > of element removal.  for_each_console is defined:
> > > 
> > > #define for_each_console(con) \
> > > 	for (con = console_drivers; con != NULL; con = con->next)
> > > 
> > > So it's not safe for any iteration that alters the list elements.
> > 
> > Ah, I see. In this case we need to keep a pointer to the next
> > element. Though, the original code assumes that console_drivers after
> > unregistration will be promoted to the next element. Do we have this
> > assumption solid?
> 
> Yes, the original code simply removes the head until the list is empty.
>  That's a recognized way of emptying any list while letting the remove
> code take care of the locking ... it works because parisc doesn't have
> a braille console.

By the way, consider this code from register_console()

  for_each_console(bcon)
    if (bcon->flags & CON_BOOT)
      unregister_console(bcon);

It works based on assumption that next pointer of the just unregistered console
is not damaged. So, My initial patch will work in the same way.


-- 
With Best Regards,
Andy Shevchenko


