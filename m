Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C04249DB16
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Jan 2022 08:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237027AbiA0HAO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 27 Jan 2022 02:00:14 -0500
Received: from mout.gmx.net ([212.227.17.20]:49595 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229565AbiA0HAN (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 27 Jan 2022 02:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1643266770;
        bh=LB3OOO4btttnzAlzNaX/MAnXGvNzfxTjG9W/uBqI7fA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=JbQGIT8bTXqoK+0Jd4v455H44Lbr5X8TcOzgurR7ntHUphTsdMXdbqLt8YwX8s3Xj
         tPfmtdfqcAOXsgy38h2WceHuHUmENiAXh49qhBhx3AKSgxuiIIveH8kauqP1MLMvXd
         /UF1e3kiW0WUKYaluRyRw+fTrXxVeMJ2mVA9jVVU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.125]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1mACtK0Ami-015FTa; Thu, 27
 Jan 2022 07:59:30 +0100
Message-ID: <09ccdfeb-f76b-41c8-a461-549314463f77@gmx.de>
Date:   Thu, 27 Jan 2022 07:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] parisc: Fix data TLB miss in sba_unmap_sg
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YfGxafKxQdw8GhMc@mx3210.localdomain>
 <11910725.O9o76ZdvQC@eto.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <11910725.O9o76ZdvQC@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:37L7dtV5QDaG+RvBy+uVh2R+O2KXr8AYoKCofoNKEamaCWeRcJ4
 ZWuzfuVsynThn83vGNQps08s4fhqwGmTtsck+K3bgiwlPJgFnyRp7Fo6Amba/XlUbfFt/Af
 /oxKXicNmHB0TSb78uxAWz0buszUYeNKsJpA2otEV8h1gtHsV9STLAZLnxMaPz7U16ATIfa
 t/E2khKwyTM/CvqPai8qg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y/lUXDaeJxs=:57Y2Zi7rp465qIKoMPpv5k
 14Y4POdkJLyciVRDWGZnTb3KxKLhXz3N2heO4GwderImwuIwN7HNnPTvO4W3CS8PwFlurC7um
 Jnhoimpp6+TrqdD0gLdA7aEwe7SF3qa+AjH3z5n4xHTr8zrzb76Ij2RsF6+XfIx6KWyOcshe/
 RaWlHOTWdVkjE9umxF8dD+lCoZjCgS2cWICgENo4JLVj58T4l7NKlxmlJx9D7lTL7yogj7t7J
 PpMTK29qSAjg+QeLvsMbGLuQ6J+je3QjEiMpd1hYYgO1J6aRgywuTPKrcmggplx31E0WpFCle
 A3BOkVN8zp00fc+xxdfbXxp/luLPgGKo6rtJWOpdt3XcTPALRoQlyifk1ZCf4ogZdibiiMxQc
 W+7WFzu/lEqUd0sym2LrkX5YOmJlxsk8BUppi1duZeiCydUns3TgbESpQ5EOg0h0k2QzxTfl2
 6t4OYz3r4q/uGNWWf0Y4AJXuoGqfc11rzjz2DqqD8hHGvs+m/EV73HAzW3/OC+T6yXpfUl71f
 j3cq0BP5sh+NIJ1JL7QOyQ0EYwGa068gNE4mnYHAxXTfQISSWHJVvxZM449tB77JmAng0zaq0
 wHykY+Pl5iiLz6JVUB224WiHZaOrM4LK2L6R85zQEkFeFozSYOLUHhDQ3vYxSYPWavJAcynXf
 AsDr6P6PKlxYvB9WCOrvaIT5poI/J/oMcGr8X+I+6hk0qxWg7Svhz7lCYMUgY9P9eiViZ4APZ
 QqCnEGIYTZZD/4Pev3IhxHMdhrW79IQpXwbtZD42CIKcRH1fR7XsEm/jFpi+7lUF0MBr56jIx
 /9xNofHpMOnxLUo+aBFpwJ9rvB4dw3jL2DF9RGdg52aKmIRGXll++9JkFdufFER5zXQrVJh/9
 RFh90DfW3mV/6+XfVWvnh9BhKe45BQAJomrxi/39mSs4VQp9+3Q8ST/N/XswBU4YhOkhyAh/b
 7UmHkoy2yJf6f5Lwvf3vcb5RRMp8Vj5cuoH+iuqYDL1rrtkNi9vv0fcpgu0/YrDAEFvKYym6b
 3yuYbGhN9O7Fs1LGa4UsOypM55XobYfM7uaWyShu83JA1xsX4DPu6D8wV2ah90mfI58eIqLuM
 hiKJe89ZaXgJu4=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/27/22 07:22, Rolf Eike Beer wrote:
> Am Mittwoch, 26. Januar 2022, 21:39:05 CET schrieb John David Anglin:
>> Rolf Eike Beer reported the following bug:
>>
>> [1274934.746891] Bad Address (null pointer deref?): Code=3D15 (Data TLB=
 miss
>> fault) at addr 0000004140000018 [1274934.746891] CPU: 3 PID: 5549 Comm:
>> cmake Not tainted 5.15.4-gentoo-parisc64 #4 [1274934.746891] Hardware n=
ame:
>> 9000/785/C8000
>> [1274934.746891]
>> [1274934.746891]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>> [1274934.746891] PSW: 00001000000001001111111000001110 Not tainted
>> [1274934.746891] r00-03  000000ff0804fe0e 0000000040bc9bc0 000000004067=
60e4
>> 0000004140000000 [1274934.746891] r04-07  0000000040b693c0 000000414000=
0000
>> 000000004a2b08b0 0000000000000001 [1274934.746891] r08-11  0000000041f9=
8810
>> 0000000000000000 000000004a0a7000 0000000000000001 [1274934.746891] r12=
-15
>> 0000000040bddbc0 0000000040c0cbc0 0000000040bddbc0 0000000040bddbc0
>> [1274934.746891] r16-19  0000000040bde3c0 0000000040bddbc0 0000000040bd=
e3c0
>> 0000000000000007 [1274934.746891] r20-23  0000000000000006 000000004a36=
8950
>> 0000000000000000 0000000000000001 [1274934.746891] r24-27  000000000000=
1fff
>> 000000000800000e 000000004a1710f0 0000000040b693c0 [1274934.746891] r28=
-31
>> 0000000000000001 0000000041f988b0 0000000041f98840 000000004a171118
>> [1274934.746891] sr00-03  00000000066e5800 0000000000000000
>> 0000000000000000 00000000066e5800 [1274934.746891] sr04-07
>> 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [1274934.746891]
>> [1274934.746891] IASQ: 0000000000000000 0000000000000000 IAOQ:
>> 00000000406760e8 00000000406760ec [1274934.746891]  IIR: 48780030    IS=
R:
>> 0000000000000000  IOR: 0000004140000018 [1274934.746891]  CPU:        3
>> CR30: 00000040e3a9c000 CR31: ffffffffffffffff [1274934.746891]  ORIG_R2=
8:
>> 0000000040acdd58
>> [1274934.746891]  IAOQ[0]: sba_unmap_sg+0xb0/0x118
>> [1274934.746891]  IAOQ[1]: sba_unmap_sg+0xb4/0x118
>> [1274934.746891]  RP(r2): sba_unmap_sg+0xac/0x118
>> [1274934.746891] Backtrace:
>> [1274934.746891]  [<00000000402740cc>] dma_unmap_sg_attrs+0x6c/0x70
>> [1274934.746891]  [<000000004074d6bc>] scsi_dma_unmap+0x54/0x60
>> [1274934.746891]  [<00000000407a3488>] mptscsih_io_done+0x150/0xd70
>> [1274934.746891]  [<0000000040798600>] mpt_interrupt+0x168/0xa68
>> [1274934.746891]  [<0000000040255a48>] __handle_irq_event_percpu+0xc8/0=
x278
>> [1274934.746891]  [<0000000040255c34>] handle_irq_event_percpu+0x3c/0xd=
8
>> [1274934.746891]  [<000000004025ecb4>] handle_percpu_irq+0xb4/0xf0
>> [1274934.746891]  [<00000000402548e0>] generic_handle_irq+0x50/0x70
>> [1274934.746891]  [<000000004019a254>] call_on_stack+0x18/0x24
>> [1274934.746891]
>> [1274934.746891] Kernel panic - not syncing: Bad Address (null pointer
>> deref?)
>>
>> The bug is caused by overrunning the sglist and incorrectly testing
>> sg_dma_len(sglist) before nents. Normally this doesn't cause a crash,
>> but in this case sglist crossed a page boundary. This occurs in the
>> following code:
>>
>> 	while (sg_dma_len(sglist) && nents--) {
>>
>> The fix is simply to test nents first and move the decrement of nents
>> into the loop.
>>
>> Reported-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>> ---
>>
>> diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
>> index e60690d38d67..374b9199878d 100644
>> --- a/drivers/parisc/sba_iommu.c
>> +++ b/drivers/parisc/sba_iommu.c
>> @@ -1047,7 +1047,7 @@ sba_unmap_sg(struct device *dev, struct scatterli=
st
>> *sglist, int nents, spin_unlock_irqrestore(&ioc->res_lock, flags);
>>  #endif
>>
>> -	while (sg_dma_len(sglist) && nents--) {
>> +	while (nents && sg_dma_len(sglist)) {
>>
>
> What about:
>
> 	for (; nents && sg_dma_len(sglist); nents--) {

The way how Dave wrote it is more clean, IMHO.

By the way, since you ran into this issue, did you tested it,
if it really solves the problem you see?
If so, do you want to add a Tested-by: tag ?

Helge


> And when you touch that area anyway, please remove the following newline=
 as
> well.
>
>>  		sba_unmap_page(dev, sg_dma_address(sglist),
> sg_dma_len(sglist),
>>  				direction, 0);
>> @@ -1056,6 +1056,7 @@ sba_unmap_sg(struct device *dev, struct scatterli=
st
>> *sglist, int nents, ioc->usingle_calls--;	/* kluge since call is unmap_=
sg()
>> */
>>  #endif
>>  		++sglist;
>> +		nents--;
>>  	}
>>
>>  	DBG_RUN_SG("%s() DONE (nents %d)\n", __func__,  nents);
>
> Eike
>

