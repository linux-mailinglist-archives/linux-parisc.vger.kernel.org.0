Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD7502917D
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 09:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388891AbfEXHGo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 03:06:44 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:34030 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388869AbfEXHGn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 03:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=9/lHKo7D+ODLju5llatY+9LBZizGJPsZ1cA2uZTPwSk=; b=clKy06zbyPi5xr4uJxwl/BdBkC
        rQkk8okHb/2jDYriBFnMHqhme44Y5ALEh5tgccjiMkHVzTzB5YpiI2IXpzJ/xRpVOo8nXh9C/GaMo
        wDsThMeboTlOfKrPjKQDsYiPzxU5sbxHKnZbrbyxViy+qozuC+EeJRGOLi8PjiyXr4yA=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hU4Hq-0003OM-2D; Fri, 24 May 2019 09:06:42 +0200
Date:   Fri, 24 May 2019 09:06:40 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     John David Anglin <dave.anglin@bell.net>,
        Grant Grundler <grantgrundler@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: HPPA problems with the PCI
Message-ID: <20190524070640.GB9849@t470p.stackframe.org>
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
 <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
 <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net>
 <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+QBN9A3Cajm8vYSQ9rm-iZyGjtMBSfmDXqGgrUc5F3pOziEVQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Carlo,

On Thu, May 23, 2019 at 02:16:39PM +0200, Carlo Pisani wrote:
> > Carlo, are you testing with UP or SMP kernel?
> 
> Kernel without SMP.
> I am recompiling with SMP just right now

I think you've seen that problem also with older Kernel versions, but i have
some trouble with my C240 (see my other post), so it might be worth a try to
take the latest kernel and disabling alternatives patching (add no-alternatives
to the kernel command line)

To check that alternative patching is disabled, check that there's no message like
this in your dmesg output:

[   33.419615] alternatives: applied 158 out of 183 patches

Thanks for testing Linux on PA-RISC :-)

Regards
Sven
