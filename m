Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF8BC273D0
	for <lists+linux-parisc@lfdr.de>; Thu, 23 May 2019 03:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfEWBJI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 22 May 2019 21:09:08 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:58809 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727365AbfEWBJI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 22 May 2019 21:09:08 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190523010907.KTID4444.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 22 May 2019 21:09:07 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20190523010907.GARN21689.mtlspm02.bell.net@[192.168.2.49]>;
          Wed, 22 May 2019 21:09:07 -0400
Subject: Re: HPPA problems with the PCI
To:     Grant Grundler <grantgrundler@gmail.com>,
        Carlo Pisani <carlojpisani@gmail.com>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
References: <CA+QBN9Cg6QAe5W3vS3dere=K53NAHDrMb9FN5StEfNkC=RTGqg@mail.gmail.com>
 <CA+QBN9B7B39NARTNYan2wrhRLSEAhxukTy0B6yWRMUxgLJmuNA@mail.gmail.com>
 <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <21dcf273-929a-6fb1-7978-37145ea62301@bell.net>
Date:   Wed, 22 May 2019 21:09:06 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAP6odjiqDyVB3VyavSHniShe3Mq3KWGdNOWeTmxQ-5q-NrOjbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=5ypQrAzGAAAA:8 a=FBHGMhGWAAAA:8 a=O4yEl_ip1VOUU7Kt_xsA:9 a=QEXdDO2ut3YA:10 a=1owwN5pLhQMA:10 a=RW6egZ3iF6EA:10 a=QnlTcYk_iZbCEFXf-YqT:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfKo/2aiCind4GgAIMMo6SwPFbk33stq1BZ1SPLNzv1CAjQ4N/NdZe2TdMhkRcynD6LhCPfgkRIlZumL0K4FhybqxBbS/OoDnOw92oPwTiC4OtonfUiJz Q6/ziyIz4OHi29feyU4kv26Lh4qMwIEV+xycesS0PmxLsQgFJi955QbUJKr02HUY97S/hrju7pEyKw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-22 8:38 p.m., Grant Grundler wrote:
> While PCI bus type is the same, most problems with device drivers are
> at DMA Coherency/Memory ordering level.  C3600 has PA8600 processor
> and you might learn more about PA-8600 processor, Astro (IOMMU), and
> Elroy (PCI host controller) from
> https://www.openpa.net/systems/hp-visualize_b1000_c3000_c3600.html
>
> If you can try some experiments, start adding mb() calls after the
> driver adds or removes an IO request from any list or queue.
That's an interesting comment.  On a UP kernel, mb() is currently just a compiler
memory barrier.  On a SMP kernel, mb() generates a "sync" instruction.  We also
use "ldcw" as a barrier in spinlocks.

I'm thinking dma_rmb() and dma_wmb() may need to be stronger.  Is "sync" or "syncdma"
a better choice for these defines?

Cheers,
Dave

-- 
John David Anglin  dave.anglin@bell.net

