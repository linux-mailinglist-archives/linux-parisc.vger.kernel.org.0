Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C9A224BA0
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jul 2020 15:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgGRNsU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Jul 2020 09:48:20 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:36471 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726569AbgGRNsT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Jul 2020 09:48:19 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20200718134818.JSNN5779.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 18 Jul 2020 09:48:18 -0400
Received: from [192.168.2.49] (really [70.53.53.104]) by mtlspm02.bell.net
          with ESMTP
          id <20200718134818.YZRE16482.mtlspm02.bell.net@[192.168.2.49]>;
          Sat, 18 Jul 2020 09:48:18 -0400
Subject: Re: [PATCH v2] parisc: Fix spinlock barriers
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
 <7e4fa270-7fb7-d726-da01-7da04f109747@bell.net>
 <d5d093f1-8e7b-24bc-2f72-215381821043@gmx.de>
 <6257f3f4-d5a6-5a70-0152-80156470bb10@bell.net>
Message-ID: <7bf9267c-1151-ea8e-bb86-fa846f3a7d4e@bell.net>
Date:   Sat, 18 Jul 2020 09:48:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6257f3f4-d5a6-5a70-0152-80156470bb10@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=htCe9XT+XAlGhzqgweArVg==:117 a=htCe9XT+XAlGhzqgweArVg==:17 a=IkcTkHD0fZMA:10 a=_RQrkK6FrEwA:10 a=FBHGMhGWAAAA:8 a=aIBOTmsfwc008hv56m0A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfMQ6OsCWhXwVasoh7AvAp5tUnzzhVjNMk59WGbYdcoNYef7ayaejB4l+hlWLyhnf6ztQPttNyxYUHlb58LOfD1LNBI0TG2zG9cnsV0STtJTflcN41A2S BGHiZi8g36ezXevdmsFR4bz/e0qZShucHAsRmFOdKu/OR6kDBRMIXV2xKOtfry43ltHfnkhsDjEnfA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-07-18 9:08 a.m., John David Anglin wrote:
>>> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
>>> index f05c9d5b6b9e..4ba43a3c7c67 100644
>>> --- a/arch/parisc/kernel/syscall.S
>>> +++ b/arch/parisc/kernel/syscall.S
>>> @@ -659,8 +678,15 @@ cas_action:
>>>  	/* Error occurred on load or store */
>>>  	/* Free lock */
>>>  #ifdef CONFIG_SMP
>>> -98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
>>> +98:	sync			/* Barrier */
>>>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
>>> +	nop
>>> +	nop
>>> +	nop
>>> +	nop
>>> +	nop
>>> +	nop
>>> +	nop
>> I think you should put those nop's before the 99:ALTERNATIVE() instruction above.
>> That way they all get replaced by one jump instead of multiple nops (when
>> there is only one CPU in the SMP system).
> Okay.  I'll test.  Thought the replacement was just nops.
Do we know that a jump is faster than 8 nops?

We need ALTERNATIVE conditions for the barrier defines.

Dave

-- 
John David Anglin  dave.anglin@bell.net

