Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9AB296B46
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Oct 2020 10:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S460678AbgJWIfz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 23 Oct 2020 04:35:55 -0400
Received: from mout.gmx.net ([212.227.17.20]:40717 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S460677AbgJWIfy (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 04:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603442135;
        bh=EuEX0O7o4p/DlaT2/JVcilKE+8LZqMJ3rF9d3ktfghw=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=TP4f0sjJuCk5vZGui9kSptS3wqnH81kIyxjpcSA6ibG5YE1R+FX8r4bGE3O1bPBel
         CBIJkn6F2gqNiMtzNoScCrYcdwHOSZFlMhSdpbmcJhv6Lu8yy58cmFGvq4BmuxeWtC
         reIA2VTbCeD5AhRcyvRbXitnXQ5ri6jmKhJeh3p4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.58] ([92.116.145.200]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmUHp-1k5ePn3cH3-00iUmd; Fri, 23
 Oct 2020 10:35:34 +0200
Subject: Re: [RFC PATCH] parisc: Add wrapper syscalls to fix O_NONBLOCK flag
 usage
To:     Jeroen Roovers <jer@xs4all.nl>
Cc:     Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20200829122017.GA3988@ls3530.fritz.box>
 <20201020192101.772bedd5@wim.jer>
 <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
 <20201022173824.49b6b7f5@wim.jer>
 <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
 <20201022164007.GA10653@ls3530.fritz.box>
 <6f58641f-d4d3-ea28-3863-83a227aeff1a@linux.ee>
 <b187505a-2ca1-c385-3b4e-16ae49f5c1ce@gmx.de>
 <20201023090232.3b56d308@wim.jer>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <20d34af2-7c5b-b9af-b4b7-062e2689c092@gmx.de>
Date:   Fri, 23 Oct 2020 10:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201023090232.3b56d308@wim.jer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RFT7djxVcodLuwWGO3Tjh61Pb10rhU+Ftos9Dj3y3gtonOz0DkB
 TKO6/Zq1g6fE+AbbguRJOTfLRxuY+mby/04iL1eUVVmV6DnLd54RJ2/rTDbMG9uMicHiMGf
 AixPYWQqGMyFc7WKhGnvfL4XSOtTbw8OtJysvIUxQ7arBsE3lDq5vqiFVM1+z1kNNoTEvxq
 SQgvE/1fzCvMWwKY7NWTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ksp12P4hMrs=:7NmuLLhcw4rBDRGg8FNCV4
 N+uF9GQAGUHFrKNtIWmTluR2fUsL45iq0/7ZDHGgaK+cU2z4RT9Q06jAhYoEdiOorWdC8RQtf
 LmzpZ7gT+QRtTshNofqSTC8gRaoOE5BvRm3S9RweR+00I9MMIQMgih3IIw+e8ZZpxcGzDO5aa
 n5JGHN0DBKVbYnI7t9UyJvqSHqqds391ypJVIggvsXiSQpbA281HbRb2uOvmYZnhdCsegGGC0
 KHP6fheMzIvuQCWf+X5o5tdxlx4BKCHwqW+V2ISAmMpMxor6SLUwBpJt+NnBvl+UVxeNrO4qL
 mLtZwwNAlHqnRFr7RFp0xL7FBRv9DsKiNTU1Wp1P1r3p3jdLmdDYz2afnziUVYy+kpsNhOIr+
 LdwmQAvlUXc+kuO8zYnHLsw0tvWXjS3adVw+JWmmXbv2cvRDgnzwQSuWV9LeQsgXckrwtN6c0
 mMjWRwljuqxPHCb3tVcN/k+SaYOk2732O6e0bp8zpl3W49I5jAySg2s0xV6FeWil0ZsB699Ug
 jMsUy/2qFsK0MKlR+tx2gnclWhmHBDNNKbwynFGJ0Yu8x3+WmVs07xh3JP0+UcXY2W0xJDO4G
 dmqJAGjYIF9bBHf1AxP0ECHBRGWufcp1eUTwl6zqqIOGDi9nEKCIoiXtqBFn/XnnQj3H/gcvW
 sp+H4mk81tkI9OGT8uYrz2SlI8L4wjo5GBPFKWHcMtPuarl1DKrzQevWl9XtBJ6G+DejuhzRm
 qy+dReaDpEBqbZLXJcUY3hU4coplQHWbsrJUQjHfBjjPXheLChJ4e3aMR4mHJaFCX2eGSC10W
 X2Fv6EXwAt1rShI7xMlLYB/hKBvkwrzOo2ws/NsxNY0ezyr5T9lXcx3zLz1SlN6KRaTvKIFzV
 Q2oWGi2f7IHFI3szWDOw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/23/20 9:02 AM, Jeroen Roovers wrote:
> On Thu, 22 Oct 2020 22:29:18 +0200
> Helge Deller <deller@gmx.de> wrote:
>
>> On 10/22/20 9:11 PM, Meelis Roos wrote:
>>>
>>> 22.10.20 19:40 Helge Deller wrotw:
>>>> This patch adds wrapper functions for the relevant syscalls. The
>>>> wrappers masks out any old invalid O_NONBLOCK flags, reports in the
>>>> syslog if the old O_NONBLOCK value was used and then calls the
>>>> target syscall with the new O_NONBLOCK value.
>>>>
>>>> Fixes: 75ae04206a4d ("parisc: Define O_NONBLOCK to become
>>>> 000200000") Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> Works for me on RP2470 - boots up in full functionality and logs
>>> the recompilation warning about systemd-udevd and syslog-ng.
>>>
>>> Tested-by: Meelis Roos <mroos@linux.ee>
>>
>> Thank you Meelis & Jeroen for testing!
>>
>> The big question is:
>> We have two options
>> a) revert my original commit 75ae04206a4d ("parisc: Define O_NONBLOCK
>> to become 000200000"), or b) apply and submit this new patch on top
>> of it.
>>
>> The benefit in b) is that we will get long term rid of the two-bit
>> O_NONBLOCK define and thus will get more compatible to other Linux
>> architectures. This comes with the downside of (at least for a few
>> years) added overhead for those non-performance critical syscalls.
>
> The performance issue is resolved once the installed kernel
> headers/libc have been updated accordingly. I think after that the
> overhead should be minimal.

Yes, probably.

>> The benefit with a) is that we then step back again and stay
>> compatible now. The downside is, that in the future we may run into
>> other issues and need to keep special-handling in some other syscalls
>> forever.
>>
>> I'm still for going with b), and I hope we got all corner cases ruled

I meant "proposing to go with option b)"....

>> out. Opinions?
>
> I think the performance penalty isn't that great, but could be
> improved, so I'd go for b) with a small change. The warning that it
> issues seems redundant, because the immediate problem has already been
> "solved", and because the proposed solution does not work:
>
> +{
> +	if (flags & O_NONBLOCK_MASK_OUT) {
> +		struct task_struct *tsk =3D current;
> +		pr_warn("%s(%d) uses old O_NONBLOCK value. "
> +			"Please recompile the application.\n",
> +			tsk->comm, tsk->pid);
> +	}
> +	return flags & ~O_NONBLOCK_MASK_OUT;
> +}
> +
>
> The text assumes that the officially packaged kernel headers are in
> sync with the kernel, which normally isn't the case as most
> distributions seem to either pick an LTS kernel for their toolchain, or
> keep the installed kernel in sync with the installed kernel headers,
> but do not prevent running newer kernels and may even encourage doing
> so. Simply recompiling the programs that use the old O_NONBLOCK value
> does not solve the problem in most cases.

True.

> If you'd remove that if() { pr_warn } entirely, you'd probably be
> rid of most of the performance penalty anyway.

I think it makes sense to keep at least one warning.
Rolf Eike proposed a pr_warn_once() which seems the best compromise
as it keeps us at least informed which packages needs updating and
how relevant it is to keep those wrappers....

Helge
