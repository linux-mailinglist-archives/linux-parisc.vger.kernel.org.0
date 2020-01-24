Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F891148D16
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2020 18:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390164AbgAXRir (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 Jan 2020 12:38:47 -0500
Received: from mga17.intel.com ([192.55.52.151]:61416 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389487AbgAXRir (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 Jan 2020 12:38:47 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 09:38:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; 
   d="scan'208";a="400719122"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2020 09:38:45 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iv2us-0002sX-H9; Fri, 24 Jan 2020 19:38:46 +0200
Date:   Fri, 24 Jan 2020 19:38:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v1] parisc: Use for_each_console() helper
Message-ID: <20200124173846.GL32742@smile.fi.intel.com>
References: <20200124160739.65256-1-andriy.shevchenko@linux.intel.com>
 <1579883942.3001.14.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579883942.3001.14.camel@HansenPartnership.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Jan 24, 2020 at 08:39:02AM -0800, James Bottomley wrote:
> On Fri, 2020-01-24 at 18:07 +0200, Andy Shevchenko wrote:
> > Replace open coded single-linked list iteration loop with
> > for_each_console()
> > helper in use.

> > -	while ((console = console_drivers) != NULL)
> > -		unregister_console(console_drivers);
> > +	for_each_console(console)
> > +		unregister_console(console);
> 
> This is wrong.  The old formulation iterates correctly in the face of
> element removal.  for_each_console is defined:
> 
> #define for_each_console(con) \
> 	for (con = console_drivers; con != NULL; con = con->next)
> 
> So it's not safe for any iteration that alters the list elements.

Ah, I see. In this case we need to keep a pointer to the next element.
Though, the original code assumes that console_drivers after unregistration
will be promoted to the next element. Do we have this assumption solid?

Thanks!

-- 
With Best Regards,
Andy Shevchenko


