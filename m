Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D520776D54
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Aug 2023 03:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjHJBCN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 9 Aug 2023 21:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjHJBCM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Aug 2023 21:02:12 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9BF1982
        for <linux-parisc@vger.kernel.org>; Wed,  9 Aug 2023 18:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691629311; x=1692234111; i=deller@gmx.de;
 bh=SuBmpZoa22nMj934b2LiWVz9Sf/iJbf825WnAV68deE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aamKGhfw5MGQ3rzn1s0MYGmd303OxstMzyvCejDK0j4rGgMWVZrh+jx3RtAoBeKhvrD/5du
 twn1i7RC7PplJTeHw9TG8VwPMovQen7jy44HefGrJ1vGSz1YB3pD90ljCWcW9ylAxoxZiwEQl
 hjylV/0NCxVrEbliH25Q3SErX3hoR3qDfBVjosSHBiMKBXWh33iGMB/pcDnr5ln2011p8JudZ
 887wQUve1KvIT1DLF1FvOdSvcB5PMnW3+eEYNJIOX9uzWTAvjq1JASG4DgPcu4PjNejkvvdSD
 z2xN4qLr6X/n1UzHuBflQK6DHAOZVws4GiCK5jWHD5cfv9+HvgtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.156.76]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1qN48e0Mff-00UcGb; Thu, 10
 Aug 2023 03:01:51 +0200
Message-ID: <4ee0f905-b245-5702-c035-ef02c88e2add@gmx.de>
Date:   Thu, 10 Aug 2023 03:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] parisc: pdt: Use PTR_ERR_OR_ZERO() to simplify code
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-parisc@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
References: <20230809091953.2821517-1-yangyingliang@huawei.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20230809091953.2821517-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KW6qIVivzVV/Ly3yJdHkrf1NdPVZE8DUhxNzNV+PbA2W9khA9JA
 gtDzh31yDbPClkco1MIlnAxUJkbdT4T4SZq+3MQLKkOx278RLHsfijIJYD2hVAnWBLuxKOj
 lKAwLgfVOb3eVOCgCicFGCgTvMtWeMLAWo2v+V9f1ts96a9xLB/cLMeYs3HHUgT+OYTo6zs
 cpiLsSNPsBK4OZ4Zq+50g==
UI-OutboundReport: notjunk:1;M01:P0:/scJ1kxi48g=;JiWPkeLHZR3NhjAhhaJS11gtjjn
 CHEJe8KtCIRXYn/qDHiUrzAz5t2CBNTH71GKxtQq6Q+Mtgrpyph4DIsWTBVxGT4umamfpTuT1
 XhsvZswUjRPKFg1IGHq1FEcgl4JwsJeJ5xgVgf+uaCOUUWv+MoVYTeuiLUjsY0qFmJpraEWfi
 bPt8BekZMISnXtJd2MUnEz9GFCfMqzetSSHu6Km/y2q16nJM1oUF8RXr5wyeO3DcZX7c1YRDX
 +ZwP8ioHJtQz/jQ9mQgILFt3cit7nJXe0t8QciYGT7h+lrA5DquAfe/VqBjNywAOM6LnWcofn
 unWljv4NVRA6zPso4wl6jHb60MKUpNC00t3cpcdoCvpQO/CskwYhMv6D3qWXnvEG04OMytM9I
 qOLh04m2ue9a0zsUeqeo3HW85Fuj8IvTjtfU6L+JIJvU3Pg0IjHHBCQdSO+7gprRqjDGTCd4w
 0BABQu71gqPkMKdfL6ostUSpOQEIVl4CWuy+TZI586VTRNn9pak3OWtoxfxhCHvK+5T7x5q3Q
 EBPtm4Hv7KTjC8QmLg3hbJUQp2FPEpzVxQ0Bewq8Kct/EMLCkeEpF8WeHFuncXaYLoqsplkXd
 5pULxS4+BJ2LI5NvWq7I5IlKRrk22IlTIVWUg6DjWyGw+arOIhH1URGZky0FTPcz2W7ZTQWJm
 JgjnfcKu7yZVt0OtMTG6yusQrZ+nndDQk2Hny21/9yvGsSLYuEETWWwRQMUmu12ny56Ig+kmn
 V3ZkOo5iUzKBLkL6cuZ7QpAYG8RZiOxBWH1OezwMgYe5QgwKsVSXpCgPAkOT3Ev+LfJlFVsBg
 4LyAw2hqZ3CdTLh3SXJjdkIxc9jxG8L1ph5DbNR+aNsD4n/2nl1kNNo9Yd5Tu9nk9v4wJrcRh
 Qcwen6Y3VygvdUouGusqKzDM3OvuvJpOnw+VJ5i0fhmcR3J+DdLmBVSpy+GiyPmnM4FdFfX/t
 5V8xnUhQlTTBfIFzEvBTg5J9n7c=
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/9/23 11:19, Yang Yingliang wrote:
> Return PTR_ERR_OR_ZERO() instead of return 0 or PTR_ERR() to
> simplify code.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

applied.

Thanks!
Helge

> ---
>   arch/parisc/kernel/pdt.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
> index 0d24735bd918..0f9b3b5914cf 100644
> --- a/arch/parisc/kernel/pdt.c
> +++ b/arch/parisc/kernel/pdt.c
> @@ -354,10 +354,8 @@ static int __init pdt_initcall(void)
>   		return -ENODEV;
>
>   	kpdtd_task =3D kthread_run(pdt_mainloop, NULL, "kpdtd");
> -	if (IS_ERR(kpdtd_task))
> -		return PTR_ERR(kpdtd_task);
>
> -	return 0;
> +	return PTR_ERR_OR_ZERO(kpdtd_task);
>   }
>
>   late_initcall(pdt_initcall);

