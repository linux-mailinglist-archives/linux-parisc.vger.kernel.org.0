Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F72F28230
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2019 18:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730904AbfEWQKY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 May 2019 12:10:24 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:38756 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730782AbfEWQKY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 May 2019 12:10:24 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190523161023.KYNE4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 23 May 2019 12:10:23 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by torspm02.bell.net
          with ESMTP
          id <20190523161023.XKKZ30132.torspm02.bell.net@[192.168.0.183]>;
          Thu, 23 May 2019 12:10:23 -0400
To:     Grant Grundler <grantgrundler@gmail.com>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
 <CAP6odjiwmUXd8m2w-wf7R4t+qT60xiA5bE79RfBMP07xdvCpaw@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: HPPA problems with the PCI
Message-ID: <7d252322-51dc-07ff-8843-b28cdc5a6762@bell.net>
Date:   Thu, 23 May 2019 12:10:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAP6odjiwmUXd8m2w-wf7R4t+qT60xiA5bE79RfBMP07xdvCpaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=P-IC7800AAAA:8 a=FBHGMhGWAAAA:8 a=4sJpZacIUXVo2Wb5O3EA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfGAE5wGpGNOO+8pQ1aKz5vGsABRoWfSiyhVmANGvAL8sMpo6A/Y8RdXkPmwpXqAF2XNvpZnk7P++jmeAY3MchypYaNURPQkmLwD3MdGbGCWuNCXVt6UO NgSUiSMO4OZj5WaZWfHP3hR3b/OjAbM3DUOgRlRkSaeGbJiamYW/016mHW6xNIKW1xX1udUiZkZGLA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-23 12:43 a.m., Grant Grundler wrote:
>> On a UP kernel, mb() is currently just a compiler
>> memory barrier.  On a SMP kernel, mb() generates a "sync" instruction.  We also
>> use "ldcw" as a barrier in spinlocks.
> Yeah, I'm not sure how strong the mb() needs to be and maybe I'm
> giving the wrong advice: use dma_wmb() for the case I've described
> above.  Then use dma_rmb() before reading data structures updated by
> the device. See examples in the existing code:
>    https://elixir.bootlin.com/linux/v4.20/ident/dma_wmb
> 
Looking at arm and arm64, I think sync should be used for mb(), rmb() and wmb().  Possibly,
ldcw can be used for dma_rmb() and dma_wmb() although sync should be okay.  Sync is heavier
than ldcw.  The __smp barriers could use ldcw.

Arm64 doesn't distinguish between UP and SMP.  32-bit arm has this config option,
CONFIG_ARM_DMA_MEM_BUFFERABLE, that enables stronger barriers when defined.  I think we
should use the same barriers on UP and SMP on parisc to ensure we properly synchronize I/O
operations.

Dave
-- 
John David Anglin  dave.anglin@bell.net
