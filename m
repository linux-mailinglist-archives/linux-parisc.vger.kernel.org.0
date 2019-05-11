Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E424E1A83B
	for <lists+linux-parisc@lfdr.de>; Sat, 11 May 2019 17:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbfEKP2B (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 11 May 2019 11:28:01 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:55003 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728599AbfEKP2B (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 11 May 2019 11:28:01 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190511152759.GPFY4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 11 May 2019 11:27:59 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm02.bell.net
          with ESMTP
          id <20190511152759.CXNK30132.torspm02.bell.net@[192.168.2.49]>;
          Sat, 11 May 2019 11:27:59 -0400
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     Helge Deller <deller@gmx.de>, Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc@vger.kernel.org
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de>
 <CA+QBN9Cuf+O8uKbdhPkfAdpP0YThM4FBkHJV-DdRPYe2M146aQ@mail.gmail.com>
 <dd0ba2b8-4267-9e84-6712-6e6463bd496b@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <3f99216a-a653-3552-a347-9c645d274b98@bell.net>
Date:   Sat, 11 May 2019 11:27:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <dd0ba2b8-4267-9e84-6712-6e6463bd496b@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=-wzH-NF5AAAA:8 a=FBHGMhGWAAAA:8 a=rUqmIX7uYzTr_FCaVvwA:9 a=AMOCet6g9tBRm5vG:21 a=QEXdDO2ut3YA:10 a=toNUCDOfUMIA:10 a=9RLvlc3JR9EA:10 a=FPRfbEX2zZDZeLmPJQYD:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfKdh+xg695scCqeyP29JCxXrfNGSGBNhSy5726hn+0yGKCLe6zeW10TWKaCHNS9YDKY2gpgKPjFaTBWGnGprtsEly1nh1Hp8W2/Raj7bvzW8TRY03u1M qasC9q1+NL8gJSiXAl445pUZBNvDp5WTk+nUrhBeiJG4Rhja/uENg9I1scd56RZSI07RtllK3TQFNA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-11 6:47 a.m., Helge Deller wrote:
>> I am testing a few sata controllers, see here
>> http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&p=1563
> In one of our buildds we use a
> Silicon Image, Inc. SiI 3112 Serial ATA Controller (rev 02)
> PCI card.
This Syba card also works:
00:01.0 RAID bus controller: Silicon Image, Inc. SiI 3124 PCI-X Serial ATA Controller (rev 02)

Dave

-- 
John David Anglin  dave.anglin@bell.net

