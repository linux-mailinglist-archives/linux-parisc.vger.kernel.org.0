Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17011A99C
	for <lists+linux-parisc@lfdr.de>; Sat, 11 May 2019 23:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfEKVlx (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 11 May 2019 17:41:53 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:34605 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfEKVlx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 11 May 2019 17:41:53 -0400
Received: by mail-yw1-f67.google.com with SMTP id n76so7750815ywd.1
        for <linux-parisc@vger.kernel.org>; Sat, 11 May 2019 14:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kslLq1HdRpn/Bl+/gHpimzVAvV0p4CrVLtoYUhFbRNU=;
        b=pZwaeW2UCDkvU9AmOBAS/qaHCV+VvD77NSNFdjM3sskCyaV6OBT0IaFjdzBUtTzh2T
         qGexCVC2H/cH5nw0pnQc1hXrMIG+TnN85mpPb94EMjICCxq5OeTOuFz2ePsKR5npp7s3
         VnvFXN6ze0UcVXcoNPZv7UYfvXDD8PyD0FY8/rpW2qqKGlfKBMR+NXs5Do3yHl9lOht6
         6YK3dPOf7/YRVvgx90ACqV4jUxMSqaYA5UuIpFQ9CVjufZjF0Sa3nDgOQhUsMyWVHEVq
         wIUqpzqSWJzr/ZR9gi+/RvlgqlGQxAYrO/CoSFiIRuYlXjfUZv7Ddnrpjof8AdY4Ut80
         70XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kslLq1HdRpn/Bl+/gHpimzVAvV0p4CrVLtoYUhFbRNU=;
        b=h2WPQJQ6+LO1YWhaZrHA4Y6w2EXfnHKzcGbRx5e+DvXlh3wl5/WQS7ZM1W8JqziET4
         lTpg9kPyz+BRWob1q7hkoPt4jDhC2onHmJxPzFba0EhMIGnLZsI/hZwD8dFKEs2OyCUf
         t+lLqnsJRj82xZdmss1/xyvjbAccqMUPAglfGY8fibajdwchvImFU44GgKm3t7hVvIGz
         aQv0x92Ct9k3h2VcrOHHczmfsM4/uDoBNnBlt8fIoOKUH9XN8+KjDLh6llW3W68yMENl
         2aZDPuiZMJbnTuDQsNncW1QEjR+fVfnv2n695DTO4wbHzcDIV2MoJoqRjDl4heW7uo/p
         7aDw==
X-Gm-Message-State: APjAAAW4cSCxSyxCPEmSQL8gqf//Sy+Sl4m0ltuJKgHom+QKQLoTGPyL
        Q7oOtSRGpLCFF9XAtDSrprvVKjZVbisAH1ZTsgc=
X-Google-Smtp-Source: APXvYqxcGbI84OWY4OD7Q8XC8YBw2jqxRTAEiAKQQv0e1+PkQFEVacm/ICL93D/HT/zFDC3/lWBlyfiinHjEBQwuVp0=
X-Received: by 2002:a81:ad20:: with SMTP id l32mr2169371ywh.62.1557610912885;
 Sat, 11 May 2019 14:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee> <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
In-Reply-To: <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sat, 11 May 2019 23:41:25 +0200
Message-ID: <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Helge Deller <deller@gmx.de>
Cc:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

guys, bad news!
as described here (1) we are testing several sata controllers by a script that
1) copy a very big file cp data_16GB.bin copy.bin
2) compare the md5sum for checking the integrity

we have a couple of SIL24 controllers, and they both work but only
with small files <8Gbyte
trying to copy a big file, 16GB, results in the following HPMC error

A Data I/O Fetch Timeout occurred while CPU 0 was requesting
information from a device at the path 10/6/2/0 (PCI slot 2).

I have uploaded a ser-pim-log there for more details, it's related to
the Marvell MV88SX6081's sata controller, but I have the same behavior
with a Silicon Image Sil3124 controller

I am on the last kernel v5.1 from the git repository.

Performances are, in both cases, very low: something about
10Mbyte/sec, which is ... really too low

Tomorrow I will try the old 4.16, which I remember to be more stable
with the SIL24 controller.

(1) http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&p=1618

p.s.
has anyone ever tried an FC adapter on an FC-bridge?

Il giorno mer 8 mag 2019 alle ore 21:15 Helge Deller <deller@gmx.de> ha scritto:
>
> On 08.05.19 16:23, Meelis Roos wrote:
> > Just tested v5.1-5445-g80f232121b69 git on A180c, rp2450, rp2470,
> > rp3410 and rp3440 and it seems to work everywhere for me.
>
> Great!
> Thanks for testing, Meelis!
>
> Helge
