Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704C22DD6F6
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Dec 2020 19:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgLQSI0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Dec 2020 13:08:26 -0500
Received: from mout.gmx.net ([212.227.15.19]:56071 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727543AbgLQSI0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608228410;
        bh=kJJClh+idMsfHpX6Jf4Qa+RZdSSzyMtNjPnd6PkgVa4=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=FLC1oVOiHJpa4xibTjGQbBfZW8NdFpq34k/VOnRORwrgEbQkKdhNR3h4KJ9myIcWp
         9WY5Wt8mHcXqORLZSu8A4xroq/YmXQ0JiNZJ4Zi9YxDXUipyvUweb5RdQia+DAif9c
         r4rd9EKgMmWeoycizUiPOhizg9XDa6aB1mu4uPyk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.140.151]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQXH-1jzv1I42Bp-00sOPC; Thu, 17
 Dec 2020 19:06:50 +0100
Subject: Re: [PATCH] parisc: Drop out of get_whan() if task is running again
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20201217165754.GA5561@ls3530.fritz.box>
 <b8e63e02-ef42-2c88-ead4-4a6188b8dd8a@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <e7f39cd9-83b8-b14b-fb4c-effa08627559@gmx.de>
Date:   Thu, 17 Dec 2020 19:06:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b8e63e02-ef42-2c88-ead4-4a6188b8dd8a@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OedQlmyTCf+6asF21EujORBCJfhVIGMOCLpdIEh5h1DNq4bUlFS
 Jng9jVrjh53vBxEVHMx3aFbxd3B44LF6xp1t4EG0dJ2B6VC+wZhZJmDBnBcxqBVtbK6W2cd
 kERwbnemlfewuW1jpGrLNCrwM+V/fxgKBmQn1O5hRgalTE1wG8u4hNQLcNYCx7eARGoUrU2
 V2g8hRcntz9vzqZojQ75A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zsk4sGro2Ms=:x1/756U+hchh9SXa8Hwqnh
 PELvxHH66NxX+QDEX7j8uN7+vtwRmfVszVNM5DQYikz3XnwPBt57RAc7+BLAu7huJEC3Ek/PZ
 PhebgXQF0ksVgPN82Q6DoPVxzd+URgGQDbIEqGKCPdj8CUVW+a/CtU4YvnsCDiqO6WrbYoD6l
 8oJ7KhiKdjEpKK08yAnJU/6rTAyoffAOxwo+om/HJY3Z7l57jHsX3rp4+yowkliS9/AsXDG7T
 3yYzAmF6vpJrdCWp7PHzLjTUG7OC2V32y/ytp8Rda/YOtvobmEWsWbZjc/KKR30lwJMisrhkF
 mWjIedGkK+KNIrLA0u/m2lLiCVh6FhExKn5CeTtFydhxisivFYMgyITnIf/aMShpHSfWJfEyY
 zcdWvHQThlj3pAaUszL4xi9Ri9jKOoX15U8fV+T9IAb5J+6YbEkvMnCxdRwjFN9G2/7xHMfCv
 xQ/C1cJuoXpr/hArPR1tnfdzeUBHkj2YyxnvpTjp8+X0whE5LmKvMsL4KSz1iCQXejc7ZH400
 CwvXpfa59ewIAqf5+WQinaNEOW4H4Ljdi/h65UNUtegpz9sASr8Cbgqmv0th/dLLFce2xu/SD
 KRHswAcaAFoyEXQD3Gm6O5b6hW62BMsVAT53H9DeW1LByuMX4UKUtGAHfm1uf0yihgk5pa8b9
 QSfgJWpMB5nSOch0lpPK9v6lgQc9U71l/Rn59E9b8e/8kHzfPD2/zCtdiAMrOGdOaOnG8QXoR
 tkUahQ/tn08QOhuD7kBFzIrAmlPWXplpN9j36mGnZUW4ySeiD/cJExkRSoXVXzmJjuVIeHZo/
 DmMVyZABHSkBET4mvb5bGGRvblZnwwEUp02D0V/mI5Hc39PPeAnX7PT/7uC6GOyoDZgISzv21
 Bx+DnJ3gLQTnj/4+rJjA==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/17/20 7:04 PM, John David Anglin wrote:
> This seems to be a hack to work around a race in p->state.=C2=A0 Don't s=
ee this check in other implementations.

In arch/x86/kernel/process.c:
} while (count++ < 16 && p->state !=3D TASK_RUNNING);

But I think we should implement CONFIG_THREAD_INFO_IN_TASK
and thus try_get_task_stack() too..

Helge

>
> On 2020-12-17 11:57 a.m., Helge Deller wrote:
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.=
c
>> index a92a23d6acd9..fda1c1a6a444 100644
>> --- a/arch/parisc/kernel/process.c
>> +++ b/arch/parisc/kernel/process.c
>> @@ -260,6 +260,8 @@ get_wchan(struct task_struct *p)
>>  	do {
>>  		if (unwind_once(&info) < 0)
>>  			return 0;
>> +		if (p->state =3D=3D TASK_RUNNING)
>> +                        return 0;
>>  		ip =3D info.ip;
>>  		if (!in_sched_functions(ip))
>>  			return ip;
>
> Dave
>

