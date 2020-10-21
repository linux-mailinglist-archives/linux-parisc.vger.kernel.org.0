Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08E22954DA
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Oct 2020 00:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502399AbgJUWcO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 21 Oct 2020 18:32:14 -0400
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:50890 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437502AbgJUWcO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Oct 2020 18:32:14 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id C45D31285C96;
        Wed, 21 Oct 2020 15:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1603319533;
        bh=hug4/xdZohFsTxNqDV/S4h3AT0KrSaZhXxC1kHlq7TQ=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=wmmYWHDiqD95Or1rW+6EmPWxdjzlipuGDdjX49pxYGxiCn0nXwO+TkGn8uTwi4mXN
         YoYv8fznTOavT0/+zE7fJdyOVk+0Th02GQ3+cDjvs0DkWBrFYhnKTKXWtHapzxeTXk
         9aKpy+3sE6bCFcgv6Kqpm3mXsUef0pcsmc7UUemk=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mTehpra1xL3W; Wed, 21 Oct 2020 15:32:13 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id EE8211285C94;
        Wed, 21 Oct 2020 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1603319533;
        bh=hug4/xdZohFsTxNqDV/S4h3AT0KrSaZhXxC1kHlq7TQ=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=wmmYWHDiqD95Or1rW+6EmPWxdjzlipuGDdjX49pxYGxiCn0nXwO+TkGn8uTwi4mXN
         YoYv8fznTOavT0/+zE7fJdyOVk+0Th02GQ3+cDjvs0DkWBrFYhnKTKXWtHapzxeTXk
         9aKpy+3sE6bCFcgv6Kqpm3mXsUef0pcsmc7UUemk=
Message-ID: <20c93fb33d69d328c2a192d94723d2a9459a9817.camel@HansenPartnership.com>
Subject: Re: Kernel 5.8 and 5.9 fail to boot on C8000
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Date:   Wed, 21 Oct 2020 15:32:11 -0700
In-Reply-To: <35dc2238-cf23-15a5-b214-533133e6bd9c@bell.net>
References: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
         <37ee0636688c782a59e8b50eae5c41b96926e7ab.camel@HansenPartnership.com>
         <bbdfecf6-b13f-561f-82f6-1f5e594e02b2@gmx.de>
         <35dc2238-cf23-15a5-b214-533133e6bd9c@bell.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 2020-10-21 at 13:12 -0400, John David Anglin wrote:
> On 2020-10-21 12:10 p.m., Helge Deller wrote:
> > Any idea what I could test?
> Try kernel a build with gcc-9 or earlier.  It appears there are
> problem(s) with gcc-10.  I'm getting all kinds
> of random issues building glibc.
> https://buildd.debian.org/status/logs.php?pkg=glibc&ver=2.31-4&arch=hppa

This version of the kernel built with gcc-10 is working for me on my
Mako system:

   Linux version 5.9.0 (jejb@ion) (hppa64-linux-gnu-gcc (GCC) 10.2.0,
   GNU ld (GNU Binutils for Debian) 2.35) #1 SMP Wed Oct 21 09:35:50
   PDT 2020

So if it is gcc-10 I'm not seeing the problem.

James


