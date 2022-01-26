Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD5349D47B
	for <lists+linux-parisc@lfdr.de>; Wed, 26 Jan 2022 22:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbiAZV1H (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 26 Jan 2022 16:27:07 -0500
Received: from mout.gmx.net ([212.227.15.18]:48971 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231665AbiAZV1H (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 26 Jan 2022 16:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1643232414;
        bh=14Tz2byZvly7iM0Fjy/egJFG1Bqz8paxvrOhZQK3nVo=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=MYFZ4+5gDDKvKFAmVdwxyLy9Ty0hYPYrZbxcywWHHNewonywr97+NCe9mTEC0Cyrq
         kxH/bNrX6hem3f8j3d5ZCXaYWg/OAUrdRnf/DoXfdzIpJtFD6GF3IDemyCmwO+a3X3
         +VNm00WyKO0jxFLo73ufvlxbTi59lHT1CPyGLLGQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.57]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zBR-1m8zr32rwZ-0154d0; Wed, 26
 Jan 2022 22:26:54 +0100
Message-ID: <4ba3aa1c-925b-daae-0216-fc344b81af32@gmx.de>
Date:   Wed, 26 Jan 2022 22:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] parisc: Fix data TLB miss in sba_unmap_sg
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YfGxafKxQdw8GhMc@mx3210.localdomain>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <YfGxafKxQdw8GhMc@mx3210.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zZumbbNzscT2mpUEWZBuLcBQ5PFipK8Dfu/kTa2IBaX1rV1OFXM
 yfDxrzwGfQgBi94kdCTypS0iKcVivPeWi9P4ANbAnZeqUjxzOwjvm1yrZIfAGdR3Jhz1986
 UbjAZ1PoVy1Jv0knM+dM0ZVhRQXna9E5c1oxt2casutorr8kMaoPpFryAAJtN/WZZteqYBG
 tZDib8i1MqkrAJUuydnXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5Pg2siUjD9s=:+t1Daut8g3EuG7UkES97G2
 wtSh5xcLVTv7n4gcRGXzOagVLhqdI4IRUbIS0bO9TQCIlMW/NEns+JXT2gXu8LN/kEKiDWUuj
 d6xlS4+nhoRhchgAdA2JiWYzs2hx0m8uLcAznhLHecPMw3K48tkl2WYokba+mdO6fArH3E6s+
 2IRp5KIF7LgSwh7yE/YJhFbilZpethoYwlQe1LhOonFGQfgirwRfiJ5HRqh1/vKzPebiqduaR
 kGiOjUCTw/OEy3cC6pSIlykC8LPkrSDPmzuMk7uNkNHJKI1Szn5uaeTefDOI2//Ld/ekccPMA
 rIMK1jJ6yXdxwSd+SgDLCLg+0x2Za+3KeOeECrWlZNdtd0BMFpzNQUMMuxTrcNZeL0g1jqdvm
 wSmORmHZd2qq9jcJNdhaxm1DC4ItREDpv103tG4JhEzofFmyAQWMlNtcksTsgTSa2euvgzbl2
 qulPg23n7ULYaticlYUq5FyO0tFoNeplNxP6DSZYomv+PbUzaz9vTOZrWLNSsb0W6UA9x4VyD
 PJijOlAwhqYYVj3+RV0DAJS/4ZgZwV2RyEOu2sw6i9umAqeyktKft+0rkJxbA9jb3B6XBEBzZ
 folxONSin4OmetMd5Zr48HN2sIBQZE8/S8QnAS+nef3bPgXx2CUtjCK0XVipDgYuuAAWGgML1
 jiFyd9tSV+x8rqJFwWNTuYHZnk9q9l8Q9eBVQB7E4VlTGN/2ZNH3hh78b5ZbWMPHYNaeuI0Ye
 0+jTgf30ZiSIF3gb+Dq64xLB0+aVacHI+J2ekpaKPmIKhortNiLFv9XemPiBP16OOHsAMdqJp
 kYcyTnGlL6Jp6bpqzMo8w93sz98EKqweSfoaIpbr6BX64ZvibhbToKjAwOw+JxLUSbZwgAS7W
 1K00WwE56kQaa/cSUlQlEkdH2zYiOiXkHGYhZJRrx77DCUfTBb0fqy/sVjcpoSkcVZhX2zP9c
 cFC4H7qAB3BFRoHmVNzQaZ0xH226XboRwlvY5Xv7pzCxkmIvKLOUV6dxH1XunbPxswP7dXv1n
 wH4G/j1IiQ3mDci3Hlsi06V3oqvPn/j4KcbzAiGUoRfNm/k35NAie6Bb6PieAk4krzzj3NSiK
 dAJna3X4mq9sk8=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/26/22 21:39, John David Anglin wrote:
> Rolf Eike Beer reported the following bug:
>
> [1274934.746891] Bad Address (null pointer deref?): Code=3D15 (Data TLB =
miss fault) at addr 0000004140000018
> [1274934.746891] CPU: 3 PID: 5549 Comm: cmake Not tainted 5.15.4-gentoo-=
parisc64 #4
> [1274934.746891] Hardware name: 9000/785/C8000
> [1274934.746891]
> [1274934.746891]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [1274934.746891] PSW: 00001000000001001111111000001110 Not tainted
> [1274934.746891] r00-03  000000ff0804fe0e 0000000040bc9bc0 0000000040676=
0e4 0000004140000000
> [1274934.746891] r04-07  0000000040b693c0 0000004140000000 000000004a2b0=
8b0 0000000000000001
> [1274934.746891] r08-11  0000000041f98810 0000000000000000 000000004a0a7=
000 0000000000000001
> [1274934.746891] r12-15  0000000040bddbc0 0000000040c0cbc0 0000000040bdd=
bc0 0000000040bddbc0
> [1274934.746891] r16-19  0000000040bde3c0 0000000040bddbc0 0000000040bde=
3c0 0000000000000007
> [1274934.746891] r20-23  0000000000000006 000000004a368950 0000000000000=
000 0000000000000001
> [1274934.746891] r24-27  0000000000001fff 000000000800000e 000000004a171=
0f0 0000000040b693c0
> [1274934.746891] r28-31  0000000000000001 0000000041f988b0 0000000041f98=
840 000000004a171118
> [1274934.746891] sr00-03  00000000066e5800 0000000000000000 000000000000=
0000 00000000066e5800
> [1274934.746891] sr04-07  0000000000000000 0000000000000000 000000000000=
0000 0000000000000000
> [1274934.746891]
> [1274934.746891] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004=
06760e8 00000000406760ec
> [1274934.746891]  IIR: 48780030    ISR: 0000000000000000  IOR: 000000414=
0000018
> [1274934.746891]  CPU:        3   CR30: 00000040e3a9c000 CR31: fffffffff=
fffffff
> [1274934.746891]  ORIG_R28: 0000000040acdd58
> [1274934.746891]  IAOQ[0]: sba_unmap_sg+0xb0/0x118
> [1274934.746891]  IAOQ[1]: sba_unmap_sg+0xb4/0x118
> [1274934.746891]  RP(r2): sba_unmap_sg+0xac/0x118
> [1274934.746891] Backtrace:
> [1274934.746891]  [<00000000402740cc>] dma_unmap_sg_attrs+0x6c/0x70
> [1274934.746891]  [<000000004074d6bc>] scsi_dma_unmap+0x54/0x60
> [1274934.746891]  [<00000000407a3488>] mptscsih_io_done+0x150/0xd70
> [1274934.746891]  [<0000000040798600>] mpt_interrupt+0x168/0xa68
> [1274934.746891]  [<0000000040255a48>] __handle_irq_event_percpu+0xc8/0x=
278
> [1274934.746891]  [<0000000040255c34>] handle_irq_event_percpu+0x3c/0xd8
> [1274934.746891]  [<000000004025ecb4>] handle_percpu_irq+0xb4/0xf0
> [1274934.746891]  [<00000000402548e0>] generic_handle_irq+0x50/0x70
> [1274934.746891]  [<000000004019a254>] call_on_stack+0x18/0x24
> [1274934.746891]
> [1274934.746891] Kernel panic - not syncing: Bad Address (null pointer d=
eref?)
>
> The bug is caused by overrunning the sglist and incorrectly testing
> sg_dma_len(sglist) before nents. Normally this doesn't cause a crash,
> but in this case sglist crossed a page boundary. This occurs in the
> following code:
>
> 	while (sg_dma_len(sglist) && nents--) {

Will you check the same loop in
ccio-dma.c:1006 ?

Helge




>
> The fix is simply to test nents first and move the decrement of nents
> into the loop.
>
> Reported-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> ---
>
> diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
> index e60690d38d67..374b9199878d 100644
> --- a/drivers/parisc/sba_iommu.c
> +++ b/drivers/parisc/sba_iommu.c
> @@ -1047,7 +1047,7 @@ sba_unmap_sg(struct device *dev, struct scatterlis=
t *sglist, int nents,
>  	spin_unlock_irqrestore(&ioc->res_lock, flags);
>  #endif
>
> -	while (sg_dma_len(sglist) && nents--) {
> +	while (nents && sg_dma_len(sglist)) {
>
>  		sba_unmap_page(dev, sg_dma_address(sglist), sg_dma_len(sglist),
>  				direction, 0);
> @@ -1056,6 +1056,7 @@ sba_unmap_sg(struct device *dev, struct scatterlis=
t *sglist, int nents,
>  		ioc->usingle_calls--;	/* kluge since call is unmap_sg() */
>  #endif
>  		++sglist;
> +		nents--;
>  	}
>
>  	DBG_RUN_SG("%s() DONE (nents %d)\n", __func__,  nents);
>

