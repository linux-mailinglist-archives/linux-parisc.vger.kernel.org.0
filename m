Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E34A72BB64
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 22:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfE0UWM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 16:22:12 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:38126 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfE0UWM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 16:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
        bh=nC2YSdOB1pJArjbwPx7odCrkOvwumdN9MPgTqGLiQaA=; b=Jv1LqYV08yycgRtqWJ56H0YTHE
        OoMQmjOpsjzPnueuBnJfoqggwdt75i+6HFaprR6T9sfUBJmMF66BL7ri4PqEYmqq/YjGyx2AHhow2
        p+VPC1dD7TgHBtShwSicHhsnNmTYziJ0lCqV9UyYSYe2CBOrACTFhzpfe1MOX9lmqxvY=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hVM8H-00076z-4o; Mon, 27 May 2019 22:22:09 +0200
Date:   Mon, 27 May 2019 22:22:07 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <20190527202207.GE29337@t470p.stackframe.org>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
 <7bb12d08-6a2a-11e0-774c-2498c7f8b607@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bb12d08-6a2a-11e0-774c-2498c7f8b607@bell.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Dave,

On Mon, May 27, 2019 at 04:13:02PM -0400, John David Anglin wrote:
> On 2019-05-27 3:35 p.m., Carlo Pisani wrote:
> > isn't possible to burn the flash in the C3600 machine with the
> > firmware of C3750?
> > these two look similar.
> >
> Highly doubtful.  Don't know where you would find firmware for either.

openpa.net has some, and i also extracted a few versions from HP-UX ISOs.

> Firmware needs to put on bootable device (tape drive!!!):
> https://www.manualslib.com/manual/436656/Hp-Visualize-B1000-Workstation.html?page=187#manual

I upgraded my C240 during the weekend with the latest PDC firmware via LAN. I think
this also worked on 712 (it's been ~15 years when i did that, so not 100% sure).
The firmware files are LIF images, so it's likely that updating via 'boot lan'
works on all machines.

On my C240 i had to set the minimum good memory size, if it is at zero the Firmware
update complains about not enough memory.

Regards
Sven
