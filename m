Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFCD27C84
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2019 14:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730404AbfEWMO6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 May 2019 08:14:58 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:44550 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728309AbfEWMO6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 May 2019 08:14:58 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20190523121456.IUP4947.mtlfep01.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 23 May 2019 08:14:56 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm01.bell.net
          with ESMTP
          id <20190523121456.HSSW87666.mtlspm01.bell.net@[192.168.2.49]>;
          Thu, 23 May 2019 08:14:56 -0400
Subject: Re: HPPA problems with the PCI
To:     Grant Grundler <grantgrundler@gmail.com>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
 <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
 <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <483d54a6-cbf4-e366-60b3-ae84d025d0e6@bell.net>
Date:   Thu, 23 May 2019 08:14:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAP6odjh2-HhbPYhFqc40cVCrVc6E689CM65WqbiTOnTRgeQojQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bJBo382Z c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=P-IC7800AAAA:8 a=FBHGMhGWAAAA:8 a=Ee0XXquR6zLEhv_HWvgA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfFnz3/P3rSYXGgewbthJ6co0Njp7xvcTULwfwzO91jl2TSYB6Xo+WBxwB6K80ZNyiEf3X3i9ObsKAJuy9vV09DEiXcfLKSBJXMFYCS+so7RLruLeC3Q2 8vmxwc2yELVlIknQSdKw9I28GHfy4zFPHTxaRMBJTLeGEHP8WAkAWMAI8WwGEn1EqOF5fl/r/cCWkg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-23 12:37 a.m., Grant Grundler wrote:
>
>     If you can try some experiments, start adding mb() calls after the
>     > driver adds or removes an IO request from any list or queue.
>     That's an interesting comment.
>
>
> I was also being very lazy and imprecise. :)
>
> More specifically, I was thinking the mb() should be placed AFTER adding any IOs to data structure in memory the device will read but BEFORE
> the driver tells the device more IO requests.   I didn't look if such sequences even exist in the drivers mentioned. If the devices use "mail
> boxes", completely different issues around ordering can come up.
>
>       On a UP kernel, mb() is currently just a compiler
>     memory barrier.  On a SMP kernel, mb() generates a "sync" instruction.  We also
>     use "ldcw" as a barrier in spinlocks.
>
>
> Yeah, I'm not sure how strong the mb() needs to be and maybe I'm giving the wrong advice: use dma_wmb() for the case I've described above. 
> Then use dma_rmb() before reading data structures updated by the device. See examples in the existing code:
>    https://elixir.bootlin.com/linux/v4.20/ident/dma_wmb
>
I brought up the issue because PA 2.0 processors do out-of-order execution of loads and stores.  This
will be visible to I/O processors even on a UP machine.

Carlo, are you testing with UP or SMP kernel?

Dave

-- 
John David Anglin  dave.anglin@bell.net

