Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B9B6B011
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Jul 2019 21:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfGPTuO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Jul 2019 15:50:14 -0400
Received: from mout.gmx.net ([212.227.15.19]:49537 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbfGPTuO (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Jul 2019 15:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563306607;
        bh=5z8n8m2QjkvAR7CMhL/V993t3mkn3dwYnicO2mlCJ1g=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=gBATGOR/U8MilyY98qrSVLYtRp3jS0Oqht3/hcpWnRUymPEV53Fb5ZB9rgQyHy7Ly
         QfhMqw5WOXJWzkdGAKlK6W+vy7yAqpWO+5/4A0Df/gJc369VOYm/a0NMgJS21EnZ9e
         077bkOVlfuq7lZ54AgOnvxMxcmB7ec9N1LoZRIbM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.176]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lug4m-1iVdx12BeK-00zlBf; Tue, 16
 Jul 2019 21:50:07 +0200
Subject: Re: [PATCH] parisc: Avoid kernel panic triggered by invalid kprobe
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20190716191626.GA6959@ls3530.fritz.box>
 <20190716193110.GB12537@t470p.stackframe.org>
From:   Helge Deller <deller@gmx.de>
Message-ID: <604e39d2-e9c7-52a2-0746-58ac6f845341@gmx.de>
Date:   Tue, 16 Jul 2019 21:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190716193110.GB12537@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:81Q00G8NPOsOT9KBKuuOZ+osm8/Y0Ir2DZFErNPWFA/TEGtoHqP
 MFmQZyc4aQGdk/JlzqQ1BrLbIAB1v+q6mNTgy/ursqLJYdN3jOARzqFFeSiJwtYycrNeG/w
 14kUIvg7Cx7uA4S/afivtdmsNDe37sGhCIyUeLAqOgpCPv4hDNeTGCoqEIqWwrwwCMGFiqn
 GFH3auJW/WfBgDiMuanvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vt6KeTmvATE=:pWO1Zny3rLn/TuYgAA2Bzc
 A7euFyyUH5gfkxYdKLmCwrOwk5m7ZjgBN7mbusuasuzxuV+4mK0R0d8qNZ85Mf/a8PTFJmawA
 HHzxmWpEogj9Hb5bDrxUaJUeV7Q7hDGV/DhBEloX62NkrimXLyR+SRE9uVoer4nDtFgNBWbde
 14vwcolkf1r+WsyLidAVkuv64spDk3cjP/Cd1OANqALERfKCiR4gnWY+QxJ3oo/qu7yTm7Y53
 DjWuPspwJezhlaqMDONx9Xpesfi1gWcHDwOsBCXRG3AQxncVjR6tq5bfrx39VHuXu34D0lt9i
 tcsf283hOH2PfyRYRtQ2OO9x73Imt9eFYDT094457KixM0dA9XjI7N8fND+rXvoo1UbVN0fIz
 LxZRAeGr5XxZinnXUSWuERfdqGJHL+GSZ5pky5bKUamTLqSSn+qNtQ4vtDxUTlIJYslJIHros
 VcM+IhXERWrtAyrknxo7cKTD7RuUefWKMNldmIM6R+0JYG2xr7WOJ/P6UUY/BZi6proyWoP17
 fjLCQUVuaK2WQ8uY/IjsDaGzh1dai0Ikqe2UqepeORGRhZm2Z2wSmh9XtJRc7YUOsZ6HcMA6K
 w7FPo+u+v4/KUAe61gv8PlC+CVg6arc/vDgU7igvuBn3iqHHDjnSKL9GYJ+AK/gBTdTCbaplx
 UxpKExGE7SayrYaP3POWrQrCUrNn6u+ys9PiHQ61NPQzu/oripRQIrkCGSySeLJcjtaKppslo
 WPIblifo6/56D3cIxeAsDKo5ltfZUERFZNSn9cABzfYyGFZk7yzTuh50EoQwgSLZtliqPRM7L
 qdcs+obTSZP8bnLbJojoahBQpCwy1D6rBLL4M/gIHWwiUnoYR/OosqT2YOWpJj7jVz2siHWoJ
 lsFEwnevHrlAcba4hZdmCRVziqEE2EbmFnvuNuL4KS0pXpG1Hwg2Ab4hLIdhHLNrXRnFeE5TP
 rlTYOgINdAwZ78kwjciCDB4hdhJRvfZ9dXHviUA79yrS04RC8Sok5/t0Aa/8TkcXy4Xm2gZmf
 WOovXKZYSoN7Zh/JGNkC2jkSMmpZl7Z7LkgxbprRTs4YqcIYD6l41UMkfLr6VLZESMFsWhMg2
 ZDmwDN9pP8RwnY=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 16.07.19 21:31, Sven Schnelle wrote:
> Hi Helge,
>
> On Tue, Jul 16, 2019 at 09:16:26PM +0200, Helge Deller wrote:
>> When running gdb I was able to trigger this kernel panic:
>> [OOps]
>
>> Avoid this panic by checking the return value of kprobe_running() and
>> skip kprobe if none is currently active.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: <stable@vger.kernel.org> # v5.2
>>
>> diff --git a/arch/parisc/kernel/kprobes.c b/arch/parisc/kernel/kprobes.=
c
>> index d58960b33bda..0385a8fd74aa 100644
>> --- a/arch/parisc/kernel/kprobes.c
>> +++ b/arch/parisc/kernel/kprobes.c
>> @@ -133,6 +133,9 @@ int __kprobes parisc_kprobe_ss_handler(struct pt_re=
gs *regs)
>>   	struct kprobe_ctlblk *kcb =3D get_kprobe_ctlblk();
>>   	struct kprobe *p =3D kprobe_running();
>>
>> +	if (!p)
>> +		return 0;
>> +
>>   	if (regs->iaoq[0] !=3D (unsigned long)p->ainsn.insn+4)
>>   		return 0;
>>
>
> Looks ok to me. I assume this happened during single-stepping?

Yes.
Can be reproduced with the testcase in this bug report:
https://bugs.gentoo.org/481768

> Acked-by: Sven Schnelle <svens@stackframe.org>

Thanks!
Helge



