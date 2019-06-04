Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4309935079
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2019 21:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfFDTyC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jun 2019 15:54:02 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:38295 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725933AbfFDTyC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jun 2019 15:54:02 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190604195401.BULE4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 4 Jun 2019 15:54:01 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by torspm02.bell.net
          with ESMTP
          id <20190604195401.UXVN30132.torspm02.bell.net@[192.168.0.183]>;
          Tue, 4 Jun 2019 15:54:01 -0400
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <5d53371f-d918-0333-08a7-ad0d04eb3b26@bell.net>
 <5aaedf55-97bf-8d38-da37-bdafa54b5e9f@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH] parisc: Use lpa instruction to load physical addresses in
 driver code
Message-ID: <99ef56f8-4814-93ca-4c33-71ccbad5dd61@bell.net>
Date:   Tue, 4 Jun 2019 15:54:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5aaedf55-97bf-8d38-da37-bdafa54b5e9f@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=dq6fvYVFJ5YA:10 a=FBHGMhGWAAAA:8 a=euGNDiAxCOXpII1mdLkA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfPYRxMxiPvOQVZBeHzhZ+yoVThIB7a3EdvIBruBBnW9rvyr3HIYWWoj0630hOyDg0W8SnVaJBEpLgBPX3ogdxjrZS2Aew1Q0Faj3Brm4W1vvX1ot1ZgP ELmSQEWlEMQBB/2EnP6nrMY1r44xnrQHYihJzyY5lHHMJqDXQNJ1B35TRoyGendkc2DOD0A+Hf2i1g==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-06-04 3:36 p.m., Helge Deller wrote:
> Actually, I think it makes sense to push the drop-sr1/use-lci-without-sr1
> change backward to the stable kernel series.
> After that, in the second step, we could add the code to use lpa(), which
> I don't think should go to stable series.
> Would it be OK for you if we split it up into two patches?

No problem.  I didn't have an easy way to separate changes.  There's a possible
race in using %sr1 so doing a stable backport makes sense.

Using lpa() is slightly slower than virt_to_phys() as it may generate a TLB miss.
On the other hand, it handles any mapping.

dave

-- 
John David Anglin  dave.anglin@bell.net
