Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8152C2C650
	for <lists+linux-parisc@lfdr.de>; Tue, 28 May 2019 14:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfE1MSr (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 May 2019 08:18:47 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:43913 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726592AbfE1MSr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 May 2019 08:18:47 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190528121845.GBWT4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 28 May 2019 08:18:45 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by torspm02.bell.net
          with ESMTP
          id <20190528121845.YPYC30132.torspm02.bell.net@[192.168.2.49]>;
          Tue, 28 May 2019 08:18:45 -0400
Subject: Re: [PATCH] parisc: Use implicit space register selection for loading
 the coherence index of I/O pdirs
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <f267f3ce-9baa-5e2f-1f0a-c08e59a53a7a@bell.net>
 <7f0bb17e-79e1-5718-9bcd-d4eaf57c3a77@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <e84e6a7d-aeb1-ab7c-82aa-e4f4930091b6@bell.net>
Date:   Tue, 28 May 2019 08:18:42 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7f0bb17e-79e1-5718-9bcd-d4eaf57c3a77@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_d a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=UAhQizcGVVUNT4i-JTUA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfDAlpO0CD/XelZxO7vNQVFdgiM3oAIkFwWDwjtoCQdL24q/hKswaTBV8pAHLaGClH2WBdPaDtnjbd1pPlecptsXXL4BdEwK8SkCCPMF7EdYS9fczfBU2 gVaAdqTMVu2uDUqqloMzN0d65vQDgqANXhE3IZEm0tPYsBgkOMnfGg/2W7N9o+8AcUW32EAEYzVrew==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-28 1:01 a.m., Helge Deller wrote:
> Fun part is, that I had prepared exactly the same patch two days ago too.
> In addition I added this:
> +       /* We currently only support kernel addresses, and sr0 is always 0. */
> +       /* BUG_ON(mfsp(0) != sid); */
>
> and explicitely mentioned "%sr0" to make it clear:
> asm volatile ("lci %%r0(%sr0,%1), %0" : "=r" (ci) : "r" (vba));
Personally, I prefer not to mention %sr0 in instructions that use 2-bit space id.  The special
case where s=0 causes the selected space register to be determined from the %1 operand.
The selected space register will be %sr4, %sr5, %sr6 or %sr7.  These are all 0 when running
kernel code.

Dave

-- 
John David Anglin  dave.anglin@bell.net

