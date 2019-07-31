Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C05887C53F
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2019 16:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387566AbfGaOpc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 31 Jul 2019 10:45:32 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:55160 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387553AbfGaOpc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 10:45:32 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id A63C68EE12F;
        Wed, 31 Jul 2019 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564584331;
        bh=ULp6jSfvy/xePH0VCJHyvElCFr7Y3Xmb+EQBvJIVPrc=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=WfocbgPltlv2+vBi73Mj3/MeMjmQ6OytzwiOb33k6VNRYabKgmGsSygoTY/DMEmiA
         RHbJLQW6cpqYXQ/Dk8Z5ZvEIbKdOOJVtLmGIx6XmY2fg7/pJFt/aY0JsSEX+dNl8om
         +vq9OFNdLOAcRiA21LUWFDUth/GTV4Hj95oE5WOQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SPB4gBtHhsKR; Wed, 31 Jul 2019 07:45:31 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 42D2D8EE10C;
        Wed, 31 Jul 2019 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564584331;
        bh=ULp6jSfvy/xePH0VCJHyvElCFr7Y3Xmb+EQBvJIVPrc=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=WfocbgPltlv2+vBi73Mj3/MeMjmQ6OytzwiOb33k6VNRYabKgmGsSygoTY/DMEmiA
         RHbJLQW6cpqYXQ/Dk8Z5ZvEIbKdOOJVtLmGIx6XmY2fg7/pJFt/aY0JsSEX+dNl8om
         +vq9OFNdLOAcRiA21LUWFDUth/GTV4Hj95oE5WOQ=
Message-ID: <1564584328.3319.5.camel@HansenPartnership.com>
Subject: Re: Do NOT upgrade to palo v2.10
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Date:   Wed, 31 Jul 2019 07:45:28 -0700
In-Reply-To: <a9b20c26-d334-5626-5c59-8942879e374c@gmx.de>
References: <bff56161-3d9c-d4f1-c1cb-fd04de28eb59@gmx.de>
         <1564522225.4300.39.camel@HansenPartnership.com>
         <1564523273.4300.43.camel@HansenPartnership.com>
         <a9b20c26-d334-5626-5c59-8942879e374c@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 2019-07-30 at 23:54 +0200, Helge Deller wrote:
[...]
> Thanks for the patch below, I'll test tomorrow...

It passed my test bed.  Just FYI, the code in question is never
exercised unless you see the message:

load extent tree[%d] block at %d

Somewhere in the boot.  The reason is that if you keep a separate /boot
partition, the chances are it has very few files, so those files it has
are very contiguous and ext4 doesn't need to build an extent tree so
our IPL code handles everything in ext3_extent_leaf_find().  The way to
build a fragmented /boot is (starting with an empty /boot):

mkdir /boot/tmp
a=0; while dd if=/dev/zero of=/boot/tmp/block.${a} bs=16k count=1; do a=$[$a+1]; done
a=0 while rm /boot/tmp/block.${a}; do a=$[$a+2]; done

And then copy the kernels in.

James

