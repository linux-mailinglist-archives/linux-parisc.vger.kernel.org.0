Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF3D714A128
	for <lists+linux-parisc@lfdr.de>; Mon, 27 Jan 2020 10:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbgA0JrX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 Jan 2020 04:47:23 -0500
Received: from mga11.intel.com ([192.55.52.93]:25067 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbgA0JrW (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 Jan 2020 04:47:22 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jan 2020 01:47:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; 
   d="scan'208";a="428932329"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2020 01:47:21 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iw0zK-0001vl-9Z; Mon, 27 Jan 2020 11:47:22 +0200
Date:   Mon, 27 Jan 2020 11:47:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1] parisc: Use for_each_console() helper
Message-ID: <20200127094722.GU32742@smile.fi.intel.com>
References: <20200124160739.65256-1-andriy.shevchenko@linux.intel.com>
 <1579883942.3001.14.camel@HansenPartnership.com>
 <20200124173846.GL32742@smile.fi.intel.com>
 <1579888788.3001.26.camel@HansenPartnership.com>
 <20200125102508.GQ32742@smile.fi.intel.com>
 <310fb56d-8b7e-6dca-f36a-41729ef66e25@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <310fb56d-8b7e-6dca-f36a-41729ef66e25@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Jan 27, 2020 at 09:48:58AM +0100, Helge Deller wrote:
> On 25.01.20 11:25, Andy Shevchenko wrote:
> > On Fri, Jan 24, 2020 at 09:59:48AM -0800, James Bottomley wrote:

...

> > By the way, consider this code from register_console()
> >
> >   for_each_console(bcon)
> >     if (bcon->flags & CON_BOOT)
> >       unregister_console(bcon);
> >
> > It works based on assumption that next pointer of the just unregistered console
> > is not damaged. So, My initial patch will work in the same way.
> 
> Yeah, but that's a typical use-after-free issue, which I wouldn't count on.

I think here is misinterpretation, i.e. unregister != free.
Entire console code is written in the assumption that console is not being
freed when unregistered.

+Cc: PRINTK people.

> Isn't there a way to make both safe?

-- 
With Best Regards,
Andy Shevchenko


