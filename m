Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E77EC1C923
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 15:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfENNBz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 14 May 2019 09:01:55 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:53307 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfENNBz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 14 May 2019 09:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=Fhu9FV2W6saxeloa6DFNr0rFNB/c1p8l2pELI2TQG30=; b=fM0jYuqB/z7ombsC5RDHiQqMl2
        3Nx4L4wKdkEmgbp+NkTxahvHehOUb1ej70pjCuznGWhoTVa2nIiatMtyrw6VaDaBZ/Z0ulG6SPZBn
        +JwMF5paYYPiG2kXXhhJvY1l1nX3HUwmN16q7oVw5LPdpdPmT1Fcv0I4B/AqGOd7P+rQ=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hQX45-00005N-0Z; Tue, 14 May 2019 15:01:53 +0200
Date:   Tue, 14 May 2019 15:01:51 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: C3600, sata controller
Message-ID: <20190514130151.GA530@t470p.stackframe.org>
References: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net>
 <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net>
 <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
 <CA+QBN9CPdm2q9FMzo0nOq__XZ=0Rf98pnXSG9fUjpXaUbq0skA@mail.gmail.com>
 <3fd05da8-3601-a0b3-a212-2c72710520c4@bell.net>
 <CA+QBN9CgMRFmv+isvH-Y=FCCFwKhmD5_5s5u32xg+wk-gTLK5A@mail.gmail.com>
 <44c01dbf-4b6c-c37d-d5cc-844e5679dea5@bell.net>
 <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+QBN9BqufJM+8Jm-x_zMgMo0cLHKxHCxuYPrLgbvGsbdQofvw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, May 14, 2019 at 02:29:07PM +0200, Carlo Pisani wrote:
> > I had listed these cards because they are PCI64 and the Adaptec site didn't say Intel
> > architecture was required.
> 
> So, if you put the Adaptec AAR-2410SA SATA-card into a non-x86
> computer ... the BIOS extension is not expected, [..]

I think the ATI FireGL card in the C8000 Workstation is a normal x86 graphics
card and PDC just emulates the stuff required to execute the VGA BIOS. Would
be interesting whether it would also execute a BIOS on a PCI-X card, but i would
guess not. So a x86 BIOS in the C8000 is not always unexpected.

Sven

