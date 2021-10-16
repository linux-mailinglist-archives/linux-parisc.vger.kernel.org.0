Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8B24303D8
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Oct 2021 18:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243304AbhJPQ7c (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Oct 2021 12:59:32 -0400
Received: from mout.gmx.net ([212.227.17.20]:40177 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243146AbhJPQ7a (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Oct 2021 12:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634403412;
        bh=beWsah0wQ+JCwwGz36wA6K8zwDBEKxgFdmTwwu2F4Xg=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=jyP3LHJ+TNyHrc7tcfKooW5yDv6iqN8J7bbTZaZCjIb+36KXv8K7PViH3TeH7WeEt
         nSYvA1q4Io8ovXKt7vHlN5HW+XQ15z84vLOtWCUDKdFr0uT+yGdE97BmzzhhB1Xiqe
         c9I17MaM/niM9TnWPghkn+F570+ZI/g57R0q6U8M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.170]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1n6EGE0aLC-00n8lg; Sat, 16
 Oct 2021 18:56:52 +0200
Message-ID: <312371f5-e2e4-8044-9898-5be8258927ac@gmx.de>
Date:   Sat, 16 Oct 2021 18:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 4/4] parisc: add support for TOC (transfer of control)
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20211014194916.13901-1-svens@stackframe.org>
 <20211014194916.13901-5-svens@stackframe.org>
 <2081016.irdbgypaU6@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <2081016.irdbgypaU6@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8RtUdtwIVbDc4GTB4FTNjIbn7XtUx8M8zjCWi88oMBV/hoj72xa
 rBZ2LAmGszxTWTcPzWoNdqM23yvOswD1S8ALz5PmkahsDTbrVjhSAW0rRs1uRP3qoZwljrN
 IBGqf16ysN6IPzrsVvKUIWNHxFmJRiFiHsd2lWSPSqDvtN7jeQsbML05FfblJoZiRhC8xMT
 m8EXAphWEb9iaNjarqZWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yh4qTWO/low=:dpkfH+HLoa8XThfh6NVfmy
 2/I3ObYcfrsMiN+aAHOygTk3ljEgyIcEHG40RIecPEal+qSdRFqhjQduows35qGTfxurEAZ56
 b/vwJdv7wcqHyhuumRdewUHQNAb/aigP7n45DxVC6GbzMFMOlHmuTUFR/wVL6oz9lSOf0ygsv
 9qVsMeylRnFm4tmHbpoAhYnXA8/m2PkRGK2gswQSpX5D2BegUepvoQkniSVCxI3c/rT3pBSfg
 YP+hDtgP0tzQ9/waD3SFUMF2xsodvrXFWCBGx5tDCICtwUapqbcpEFOhv/C0paZtlIOVWcNbD
 DcODq9vXHiVPYOhjvOhkflsL0m0h3Bv3c8lLdjycT3GtYyEcOUA9cuZyhW83gcgbASOEADXMY
 pZs+bGM7f/pbaYYCsBFeH/UnhgD4LMEIiiVm3ZnRx0/FPimpBKUOHszVnt9fQAzUPOZPYNTSp
 Aex7oHXUJTZgguRiB8DKtZYICXgMfev8+QvbH4ri2R5Kklpcp2o2rRPDC2vQcUsfAYRacVzmG
 EW4PXShPlpy8PsBLyJyJsnlt6yFSm14KTm+y7kQPY1X/TOihy7DQ9iziQVOF78rOpQOsu+l5I
 Jrup/+WMP3QDGpVNiFSbcOqmpDmRDbLK0p01Q2VYsfEqlzSQJsM3CCMkDg/ZJscCcf7ojDFdC
 JI+QEL+jesrjZmKl7BPx37wjjpqnGxehfPGGdFns/bHM55VuTvQxI1wc0j9U9YgQJx9JCNTnT
 h+nSr3TE4RznKPH2htxH59PlEjJjrujm1oICP3mrR4lqtVSn4+eI5wxT+U7/IOq9zaOAJtxf6
 Os29cuU61l6fAV9Mmn5vRaHKkQU5srFQiDWM3nHpN0TCFWSUTtRk4dR1SP9i1RS92l7xTCWH1
 jiKb9aojp13njuRcu76k0VaNHO6phgA6b87+WRbkofaFgu4mTOTW6re0DKf6FsFAUevd5WeEa
 43X4Q5TTxzEj5ri5d/snbUJWjxDu6ytbMUn43rA41fZcZ6fhOEGGnI44eiUMifgABuww2ulgM
 T5ZhZA+E69yVWZnfiNkbOSebnZodiXf+qftty1ZVC81y9m6PZDhQdoQJibPRI3R3GvcQt9sAH
 URP5hkhFmWIZr0=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/16/21 18:49, Rolf Eike Beer wrote:
> Sven Schnelle wrote:
>
>> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
>> index 27a8b49af11f..97a889eaffe1 100644
>> --- a/arch/parisc/Kconfig
>> +++ b/arch/parisc/Kconfig
>> @@ -288,6 +288,20 @@ config SMP
>>
>>  	  If you don't know what to do here, say N.
>>
>> +config TOC
>> +	bool "Support TOC switch"
>> +	default y if 64BIT || !SMP
>> +	help
>> +	  Most PA-RISC machines have either a switch at the back of the
> machine
>> +	  or a command in BMC to trigger a TOC interrupt. If you say Y here
> a
>> +	  handler will be installed which will either show a backtrace on
> all
>> +	  CPUs, or enter a possible configured debugger like kgdb/kdb.
>> +
>> +	  Note that with this option enabled, the kernel will use an
> additional
>> 16KB +	  per possible CPU as a special stack for the TOC handler.
>> +
>> +	  If you don't want to debug the Kernel, so N.
>
> so -> say?

Yes, I fixed that before I applied to my tree.

>> +void notrace __noreturn __cold toc_intr(struct pt_regs *regs)
>> +{
>> +	struct pdc_toc_pim_20 pim_data20;
>> +	struct pdc_toc_pim_11 pim_data11;
>> +
>> +	nmi_enter();
>> +
>> +	if (boot_cpu_data.cpu_type >=3D pcxu) {
>> +		if (pdc_pim_toc20(&pim_data20))
>> +			panic("Failed to get PIM data");
>> +		toc20_to_pt_regs(regs, &pim_data20);
>> +	} else {
>> +		if (pdc_pim_toc11(&pim_data11))
>> +			panic("Failed to get PIM data");
>> +		toc11_to_pt_regs(regs, &pim_data11);
>> +	}
>
> As I said elsewhere because I had missed v3: move the variables in the i=
f
> branches.

It won't change anything, the compiler is clever enough to optimize it.
Another option would be to completely move the pdc_pim_toc* functions
into the toc*_to_pt_regs functions, maybe then renaming them to
get_tocXX_pt_regs(regs);

Helge
