Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40F8B7D6FA
	for <lists+linux-parisc@lfdr.de>; Thu,  1 Aug 2019 10:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbfHAIKv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 1 Aug 2019 04:10:51 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:55134 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728900AbfHAIKv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 1 Aug 2019 04:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=S62ZOkcfvuvQ25zJ8APYzomSSDckLKJR+an3Vj2HU+s=; b=bhoWDhDlFb2Y6qvxgpHe7P6ZSt
        HW4/MI4gS6Wl7oePf3O9iU3+/OBoYsU4o6hJIKywMknkuAD/8VOC+VSI7AzjFGdU94bmMCg15z/E/
        glDdQ+tM2SB1+mnp1u+7dfEftSWOll7n88645X1RWszau756GWzOMoUoo8RjLZ3ajIpI=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1ht6Ai-00058u-Am; Thu, 01 Aug 2019 10:10:48 +0200
Date:   Thu, 1 Aug 2019 10:10:47 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Parisc List <linux-parisc@vger.kernel.org>
Subject: Re: Compressed kernels currently won't boot
Message-ID: <20190801081046.GA4638@t470p.stackframe.org>
References: <1564591443.3319.30.camel@HansenPartnership.com>
 <20190731173016.GA23520@t470p.stackframe.org>
 <1564595402.3319.40.camel@HansenPartnership.com>
 <1564602012.3319.45.camel@HansenPartnership.com>
 <20190731194413.GB23520@t470p.stackframe.org>
 <1564606894.3319.72.camel@HansenPartnership.com>
 <20190731210819.GE23520@t470p.stackframe.org>
 <4a79ab9c-c791-0c61-0664-60eab3567125@gmx.de>
 <2bd11097-8de3-6cd8-f158-ec9926e47614@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bd11097-8de3-6cd8-f158-ec9926e47614@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Wed, Jul 31, 2019 at 11:51:16PM +0200, Helge Deller wrote:
> 
> Attached is the revised patch, and it gets the compressed kernel down
> from 32MB to 3.8MB.
> 

Works for me, thanks!

Regards
Sven
