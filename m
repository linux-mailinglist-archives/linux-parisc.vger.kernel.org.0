Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973B27B502
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jul 2019 23:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbfG3Va1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 30 Jul 2019 17:30:27 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:39858 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727737AbfG3Va0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 30 Jul 2019 17:30:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5E48A8EE12F;
        Tue, 30 Jul 2019 14:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564522226;
        bh=hFWzuXjfmVFhxpUK9VsXhMR3k+DxA5hFAvMIe5AIcj8=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=loUYw5hQET237rWo7WpbfJXY8DEP1sZyL3Q2x8opjG5aTFW1aWocN7HDrsBEuikR7
         1gV1P+0ljRCuKzfO2gtm8iwqzONw91kKE2liTnJBSMnkcpEyN5lLSMjhohBMQofzZj
         0ljPy4PGtVZ2wG103HtNg88LrOaJHUp3w5ifs3I4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KufzdGr1ng99; Tue, 30 Jul 2019 14:30:26 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id E4E788EE0E3;
        Tue, 30 Jul 2019 14:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564522226;
        bh=hFWzuXjfmVFhxpUK9VsXhMR3k+DxA5hFAvMIe5AIcj8=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=loUYw5hQET237rWo7WpbfJXY8DEP1sZyL3Q2x8opjG5aTFW1aWocN7HDrsBEuikR7
         1gV1P+0ljRCuKzfO2gtm8iwqzONw91kKE2liTnJBSMnkcpEyN5lLSMjhohBMQofzZj
         0ljPy4PGtVZ2wG103HtNg88LrOaJHUp3w5ifs3I4=
Message-ID: <1564522225.4300.39.camel@HansenPartnership.com>
Subject: Re: Do NOT upgrade to palo v2.10
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Date:   Tue, 30 Jul 2019 14:30:25 -0700
In-Reply-To: <bff56161-3d9c-d4f1-c1cb-fd04de28eb59@gmx.de>
References: <bff56161-3d9c-d4f1-c1cb-fd04de28eb59@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 2019-07-30 at 22:58 +0200, Helge Deller wrote:
> PALO version 2.10 was released last week, but it has a bug
> which may prevent that you are able to boot your kernels:
> 
> Entry 000e0000 first 000e0000 n 2
> Segment 0 load 000e0000 size 8249207 mediaptr 0x1000
> Abort: Would overwrite palo 00060000-000f8e30 or data 3faef580 areas.
> ERROR: failed to load kernel

Ah, that's unfortunate.  It must be an artifact of compressed kernels
because my uncompressed one boots here:

Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 508616 mediaptr 0x1000
Segment 1 load 0017d000 size 370864 mediaptr 0x7e000
Segment 2 load 00200000 size 12026224 mediaptr 0xd9000
Segment 3 load 00d79000 size 3850884 mediaptr 0xc52000
Segment 4 load 01200000 size 2690120 mediaptr 0xfff000
Loading ramdisk 24263780 bytes @ 3e8ca000...

which would be why I never saw this.

James

