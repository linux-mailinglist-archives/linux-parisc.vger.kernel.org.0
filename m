Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E563D5E95B0
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 21:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiIYT1f (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 15:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbiIYT1e (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 15:27:34 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC672C640
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 12:27:33 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.58.43]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 631B5D650724EFAE
X-CM-Envelope: MS4xfJ0yZwA9meA0eKMYiOV3ImQbIa6UUYeRXEALiDI7fPOmuIbzghtQ8S5IeBqg32DagIztwGakPDfAPQJVU4K30C1BY2Prmew1JrlCvQTy1s4nKZQ+dPEB
 Oedh1RIrkj0H5B1GiOXZbPMN89ZV+CxofZAYBzO/Lqa5P4Gt17LgP4lp8qgxnQvTBAgMB5VK1M17a3MTvRa57R0rKMuxrnhIjnIXW//EYj2VJwrA1AC0evEQ
 BjluXhVMnhiqZBiumHXwPsESpK1YCPpQy0/rnkm50HRBPz6TvIlTbpvc+HFPjVZTrbW6MdmCCcEXf1V0TtMHOSYoQjGZgTJsK9f+xsK/DbE=
X-CM-Analysis: v=2.4 cv=XfXqcK15 c=1 sm=1 tr=0 ts=6330aba1
 a=oiJDitmlNOPgVxj52MZyFw==:117 a=oiJDitmlNOPgVxj52MZyFw==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=moNMYcEZHYgSOVpPxZMA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (174.95.58.43) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 631B5D650724EFAE; Sun, 25 Sep 2022 15:27:29 -0400
Message-ID: <67ff767d-5db9-384b-f144-1cd34d9f4f86@bell.net>
Date:   Sun, 25 Sep 2022 15:27:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on UP machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yy/7g0NzOi/igNi7@p100>
 <d195aae3-b76b-1365-6e53-28c6791c77e3@bell.net>
 <92a8b235-7d04-9931-a153-440adbc8802a@gmx.de>
 <bffa9fac-a6f6-fc7e-0e66-5df215aef2ba@bell.net>
 <e2ffc031-0e62-8e2b-82eb-aac0460a453c@bell.net>
 <114efb2d-7f09-6a80-43d7-2a132146774f@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <114efb2d-7f09-6a80-43d7-2a132146774f@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-09-25 2:58 p.m., Helge Deller wrote:
> On 9/25/22 20:44, John David Anglin wrote:
>> On 2022-09-25 2:19 p.m., John David Anglin wrote:
>>>> One goal of that patch was to drop the CONFIG_PA20 ifdef case,
>>>> because a 32-bit kernel could be compiled for PA8000 in which case
>>>> the "pdtlb,l" will burn the machine.
>>> Don't think so.  "pdtlb,l" is available on all PA 2.0 machines. It's not 64-bit specific.
>> There is some difference in implementation between PA 1.1 and 2.0. 64-bit register
>> values are used in the PA 2.0 implementation.
>
> That's right.
> But if you build a 32-bit kernel and choose to optimize for PA8x00 CPUs,
> the CONFIG_PA20 is set and the local-purge is used unconditionally.
> That breaks e.g. when running such a kernel in qemu (which is 32-bit only).
I don't think that's a valid kernel configuration for qemu.  It only supports the PA 1.1
instruction set.  PA8x00 CPUs always support the PA 2.0 instruction set even when running
in 32-bit mode.
> See my just-posted patch.

Dave

-- 
John David Anglin  dave.anglin@bell.net

