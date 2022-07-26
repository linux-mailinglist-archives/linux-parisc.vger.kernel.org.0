Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50469580F1A
	for <lists+linux-parisc@lfdr.de>; Tue, 26 Jul 2022 10:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238048AbiGZIeI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 26 Jul 2022 04:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238389AbiGZIeC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 26 Jul 2022 04:34:02 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A5930557
        for <linux-parisc@vger.kernel.org>; Tue, 26 Jul 2022 01:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1658824433;
        bh=1aUukBfoaQBW3C5xZnU4Aa8SdI6gP0ldiTYOfS/XUJs=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=IwUkW4hDOjXsWG1XHLJ9RGSwFFx0Cd1/0Ed9ReFA2ibpD6+ATW6OzHVekrWFs9uK3
         oDSgRrne7h6CdxvdfRk/tbrLfsh3glTyB+/SAY47Fwsj5PcEZ55QnS0VMuzdkM2Lf+
         fa0QEvSsIIzJvPZxxjLlMzWOkoDSCl9Ek6M35rSQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.181]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0G1n-1nJ4uk03BX-00xIqH; Tue, 26
 Jul 2022 10:33:53 +0200
Message-ID: <cc4bdf5d-3dbc-c8cc-8b36-b667acb735de@gmx.de>
Date:   Tue, 26 Jul 2022 10:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] parisc/mm: Remove the static variable initialisations to
 0
Content-Language: en-US
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     linux-parisc@vger.kernel.org
References: <20220723092341.6885-1-wangborong@cdjrlc.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220723092341.6885-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fMDxZleImoqpxZXKv0fhEX4JysCci9cyB1grT1uha5GJu694liJ
 wGkIlenY9IIk4UptbUndHGamUUgzI6RglI7CRn0kDZrRDhAhfC27qqQAErEMdbeCGUvlB0Q
 4jQmbDjV6acrbZkPpPJTNuasqXn4zBd27KkuZFIsVWoza/oqUptmhJFhNDjfmJJ55A7vs2o
 BBZJU7WBtGKx3sGoDI5ZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sKWzVTqBrxU=:XrOV634wfe6CKdD2T2GpnI
 Nagmpec7g3Fu4nHdFHMZ7KBjDiJ8pn/31dvdHkS6zCKnc4KME89coB/d4dEc5hw8HsYHujfB/
 Y807wQ9s74p+wUu4YSEOSr5xP8DCCZew4y9JZW+JfvQ0V6Vr67ox/ZkjtJHYU16CS0UoL+E1w
 ZBNopByDjJ1EI/39FqDKPDFOq7MxUpyf0mm6KHooS2V4kIenPVMNYqJ8cmfU8fPBp/GzByaHJ
 qoB/GpeqVdE4PVGqk+z5R+xtM9FNJ9lcyKeLaJHmlWtpDuVg9igbamAtCUGFHRcUsBmUwPiId
 g2fHE4epx/i6hv7tTkj3TrxdIrPdK3TbqZyUbHT6JkZY9u9PnB+keNR3YDz1OXsR7g0wLv4DO
 KNfh1uul76q7UWy8Jr7PDRSxHjxbSta1U0ij3fN/VazICORJ+XGRCFVIQoSmEtTJ+K/Ub7WxA
 AAFovyXUVv5isd4E6FsdC3Ql0sSoOiVO5jcjbFJBAvy3zzGqTNXAeOFu7lw2/roTG6YTn3GxY
 oL1qiwEa5RvGh/xW2O9Vm6P6OpM+gbHOCnhyVvPfbRF9X+KBjzgFKg/H3jQfxmcX4vXd+iN/I
 x2lfyZVe/cgn29HP4VPtULfptU9NrTw7qiv4tvkg7owS0fy0RnXLTk617/I+9ekRAXVhTLXqi
 gVLUswqOWVYVOjBqaWSudKIQFF6ny8d9aQyqQGCLLq7tLohq/+a6CzVcpy9G+JDacocL00VEb
 Z/+BOG/kZVxlXbpwxnuDV3Ng2FCR9J1bdTiFc9qDpamAX/QaLmJ50OZWEGQf78J66Qs0bLTWN
 zZBR0lDxcqFUSQu9FF82zlWLQA+jDQY3ryd/wqoJiAKtB75KOSm5G+kKoX8qPVV3vLRyT5msM
 ZUGZ7JrySlcu8YAp3rJxnXTLA3psjebwiNo3cJ3dNSbcRhNUSzN7pP2M1MpS1cy2QaDpYhWJT
 kSo0RBZ+S+s3cg6qUQUTa6rs+vjUMfAjVTrVZfKLu/Zx59Hn+kSkSiv57sucIYPY3azm+FXDB
 gLC0Pbv1O+GV8W41fhTYn7XinlNYcGkq/Us5OiuuZC/+ifPQ6iXHAbh/dgrvEKHxYm1qrXG4A
 zFExS3JWyUBllbhzLcC6flhqJI7IF5QZ8oTMV7Xp5jgZ/11k8hxsvu3HQ==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 7/23/22 11:23, Jason Wang wrote:
> Initialise global and static variable to 0 is always unnecessary.
> Remove the unnecessary initialisations.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

applied.
Thanks!
Helge

> ---
>  arch/parisc/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index f03e0961fa25..b0c43f3b0a5f 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -722,7 +722,7 @@ static unsigned long space_id[SID_ARRAY_SIZE] =3D { =
1 }; /* disallow space 0 */
>  static unsigned long dirty_space_id[SID_ARRAY_SIZE];
>  static unsigned long space_id_index;
>  static unsigned long free_space_ids =3D NR_SPACE_IDS - 1;
> -static unsigned long dirty_space_ids =3D 0;
> +static unsigned long dirty_space_ids;
>
>  static DEFINE_SPINLOCK(sid_lock);
>

