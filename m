Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6914148C55
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2020 17:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387781AbgAXQjG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 Jan 2020 11:39:06 -0500
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:39082 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387687AbgAXQjG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 Jan 2020 11:39:06 -0500
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 677BA8EE1FC;
        Fri, 24 Jan 2020 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1579883945;
        bh=DJc3zWhwSADRdgH9xOyDbGWqjFSCfY3g1ARgwmllc0s=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=OhtxGL2ClzTkO7cEcgTGmj+K+VjzeT3XDLcw/67ePzMLOIcE9+WblL9dNcF2sjKtp
         uHynheuAaczomFEpjvGpNPYeCUiIOu98gSmXXrwTSU1aDT9RY7YwVYJ2IptzMdkn0T
         cDCp14SR8YE81F6yZvOcJlW7BFKzt8KzaBuvibbs=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id la8zdzq37gC7; Fri, 24 Jan 2020 08:39:05 -0800 (PST)
Received: from jarvis.lan (unknown [50.35.76.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6A0808EE14D;
        Fri, 24 Jan 2020 08:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1579883944;
        bh=DJc3zWhwSADRdgH9xOyDbGWqjFSCfY3g1ARgwmllc0s=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=rClwVGSvNrDu5JqLWAo52PK3TmfZhYVf2w4cb9YhrVl5xRvPSfaxl6zDu/Ht1fW4f
         shiqfFlI2vbLyS5l0R9pftUForvtbveezM7I50IT4blmcvncsOUGq766MuhZrTPt3C
         F8IED42GT0s0vFakrTvhsga8fL4BgGf1EtlFj68I=
Message-ID: <1579883942.3001.14.camel@HansenPartnership.com>
Subject: Re: [PATCH v1] parisc: Use for_each_console() helper
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Date:   Fri, 24 Jan 2020 08:39:02 -0800
In-Reply-To: <20200124160739.65256-1-andriy.shevchenko@linux.intel.com>
References: <20200124160739.65256-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 2020-01-24 at 18:07 +0200, Andy Shevchenko wrote:
> Replace open coded single-linked list iteration loop with
> for_each_console()
> helper in use.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/parisc/kernel/pdc_cons.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/parisc/kernel/pdc_cons.c
> b/arch/parisc/kernel/pdc_cons.c
> index 7ed404c60a9e..aa01448f377c 100644
> --- a/arch/parisc/kernel/pdc_cons.c
> +++ b/arch/parisc/kernel/pdc_cons.c
> @@ -259,8 +259,8 @@ void pdc_console_restart(void)
>  	if (console_drivers != NULL)
>  		pdc_cons.flags &= ~CON_PRINTBUFFER;
>  
> -	while ((console = console_drivers) != NULL)
> -		unregister_console(console_drivers);
> +	for_each_console(console)
> +		unregister_console(console);

This is wrong.  The old formulation iterates correctly in the face of
element removal.  for_each_console is defined:

#define for_each_console(con) \
	for (con = console_drivers; con != NULL; con = con->next)

So it's not safe for any iteration that alters the list elements.

James

