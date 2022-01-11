Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3600348B0A5
	for <lists+linux-parisc@lfdr.de>; Tue, 11 Jan 2022 16:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbiAKPRe (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 11 Jan 2022 10:17:34 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.184]:17875 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239582AbiAKPRe (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 11 Jan 2022 10:17:34 -0500
X-Greylist: delayed 662 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Jan 2022 10:17:34 EST
X-KPN-MessageId: f6eb069d-72ef-11ec-b71a-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id f6eb069d-72ef-11ec-b71a-005056994fde;
        Tue, 11 Jan 2022 16:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:mime-version:message-id:subject:to:from:date;
        bh=NAt/bkryUQexiQD4AoSO+7wBlnk7iNvH5YuAenRAh9c=;
        b=JkKTZBxMVrb3kpvnTB77SNfkz9/M1psYsL5uAKEMjWo1bCYEfPsAGIfq7/CgOouwn9AA1PanyoY3+
         XSIqJyBxlMvfRVJ5RjAY8dk3PV3FRh5Psshj7Ae3oYKwvQaAqYcsuoAFUHPqQgnQ9wtmzpo1AZkcES
         V4Xv1v0yi+SOXrcJ0z3QOjxuLL+eJeGNIlU5uJiOIalVevJE1zGf1sL2zMzjxfqlDa9j9rPhr4aPUi
         DkNHdmqLC2vUX3OFh7mAK0ljTvfNOUvOOrO98H8qCtAxDc/e4BDHgv8sdQfLfk5z5+jT4yVvEGnGYH
         fryx3Z2DBtxeHF2/UBII8MQhD9KsBsw==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|LznT3JB+hdImDYj3NWJDfyA0QauYtzs1hVD+uq1hShZ15nVFo74EU1NOCKTWvF2
 rOJE1WyA8DTksMwRjwVHGmA==
X-Originating-IP: 212.238.182.54
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 0d282062-72f0-11ec-aee6-005056998788;
        Tue, 11 Jan 2022 16:06:30 +0100 (CET)
Date:   Tue, 11 Jan 2022 16:06:25 +0100
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH 1/2] parisc: Enable TOC (transfer of contents) feature
 unconditionally
Message-ID: <20220111160625.5fb21b59@wim.jer>
In-Reply-To: <20220107131850.737880-1-deller@gmx.de>
References: <20220107131850.737880-1-deller@gmx.de>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

     Hi,


On Fri,  7 Jan 2022 14:18:49 +0100
Helge Deller <deller@gmx.de> wrote:

> Before this patch, the TOC code used a pre-allocated stack of 16kb for
> each possible CPU. That space overhead was the reason why the TOC
> feature wasn't enabled by default for 32-bit kernels.

Referring to the message subject, shouldn't that read
"TOC (Transfer-of-control)", or similar? See [1] and [2].


Cheers,
     jer


[1]
https://parisc.wiki.kernel.org/images-parisc/1/18/HP_C8000_Manual.pdf
, page 1-9: "Transfer-of-control (TOC) button"
[2] Ibid., page 3-4: "Transfer of Control (TOC) Button"
