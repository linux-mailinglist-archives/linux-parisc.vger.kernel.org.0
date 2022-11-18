Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A8D62EDD6
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Nov 2022 07:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241283AbiKRGof (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Nov 2022 01:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241293AbiKRGoX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Nov 2022 01:44:23 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D387E8FE58
        for <linux-parisc@vger.kernel.org>; Thu, 17 Nov 2022 22:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1668753755; bh=FErtSEwuD/Lho6M5L74EtBKmjJbjwMRmeKrYklfqGOA=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=iP/iW3b2ToCtLUO+3eWzY6lptXBPSh5jHew3x1GlRw9AZad5i3+mExO5FwPue2d0a
         TeKaDBsA4bt/6FzLtCRUiaJ+EjQlHX96KTgO5sePcwJba19jUZOCAQF/m9WiW4PHW7
         gceO5oOFkFG99RYczbvWyd164MHbUHxxTE8eaQzOB5DUjO6qGUQ2A9RI/f0DGu7p3Q
         xgN1Yg6x6mQ/jJMUg3Z9yKSBZ6v93uecpq2hCEmWRvKMcMGFAiE2nWtIexAopTjnrj
         VC4JewJr7969pOZ5weisS1F5k642+Wa4/UnpNrZVH3spPBdtMtq7dQv5WbUhOc4Ifv
         UR6+uq9jSUCSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.164.156]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fMe-1otBFh2id8-007CCZ; Fri, 18
 Nov 2022 07:42:35 +0100
Message-ID: <c8ff1b4a-485a-94c9-a488-ed323e12c165@gmx.de>
Date:   Fri, 18 Nov 2022 07:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] parisc: led: Fix potential null-ptr-deref in start_task()
Content-Language: en-US
To:     Shang XiaoJing <shangxiaojing@huawei.com>,
        linux-parisc@vger.kernel.org
References: <20221117024514.3620-1-shangxiaojing@huawei.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20221117024514.3620-1-shangxiaojing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e1PtjI3v9GUwpXNrAziLlddoLaiUTH5fE7bC22ASy8da6QiGz1O
 tm2heA5cGvbFroxdg5N7o8T74syvFQ7jcNItx27yAvmhJrvHKcBMBq5u+NzN940myHgvdtD
 NX6KyCvwuahzOLgIfNmd7+Qqx4FmEciQABWAknKkjPbRceQGZE1azjcPRHy+CChs49P4b4i
 SGYy4sZsQYQ1EUer+VDcQ==
UI-OutboundReport: notjunk:1;M01:P0:6/hZLQyl8vo=;nHZGKwhb1tBIhSN7M7FhncreNNh
 TwxjUhx0edmqdQHeiiDHx4rB42jGm1Uzo6Nw2t8iuwjIhsTOWyg5RU+ZCb7Y+zCRCoya0QMcx
 +jJE3iS2nRmEs5LyLsZuXYB+p/ofzkIAVF24ov0w4VshmKML6727AUr0Tpv1aKjUdFnf9FZoh
 YUG6BVcCRUEGRs2nW53FOiWldNM81GccSbwuymQGjkTNqJ9v7npiakkG/6C5QpdegpU0b1lRp
 B0G9hpMROpnwknPUGQHSu8pAQlOe0Js3JtHRujTUlbDg7djY/wP/+pIOB4hTcC2VMiiaL3YXf
 dSFmXBT02HDHlwsDZa0Z8A+ggZop2xqhvBtBYFwG1kqHrypQxJ4+Yx7cM0mztIxAkI4zYaI9Y
 h7TeEqbEj4sY2BVU3cG4DgP+8+gsu0uv3vXwx+93XfvhVj/3xiS7nYTNg+znBb+jvXZHkmBZ0
 PVDEPWLinbYgyWQ/6AZ+5861vvht8NxKV7TG+PKsNg1ZtmQWGjndg5+yqHTSarbHFmtfIKhWk
 kn2TWMlY5hBaIdOh/Y/qgAXUoSxQ3TrElQL53rKUAgXQ7BrtWziYvtB7rbhyO5k9Y2jPqzoYw
 D6n1tFjIo7z3eM64+qAp2f+OJQV+0/wHi/4mzLX+S69dncIOQVMq9jYmcx3/BFnNr5+603GVm
 an0X3u8XHEq2q4KE1mbseo7T2oi4QH4LoYcTUDM9OoLhJgM/sZj23yhI4T+1EHvpwf4q1jLNC
 uNX0EEDTZtOiLMH505TN+nyySHK448NpnLcD816Io9QDM8S6L/SSONcJBMje9kdf3kfyLP+X2
 4ceVnLt4I/WzPpituHhLgfYTKz7qRYFvsEMAHYMzwnZ9uM1bdHu2K8Oz4m8F6JNEGf14rYPo+
 Phz2gvpAYR5UTrfjA4znMmIAXJ22NUHPPjUiY6jpTYyxxLSnCGslfWlxmbwKFUyHRd5iBuaP6
 twY4bg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/17/22 03:45, Shang XiaoJing wrote:
> start_task() calls create_singlethread_workqueue() and not checked the
> ret value, which may return NULL. And a null-ptr-deref may happen:
>
> start_task()
>      create_singlethread_workqueue() # failed, led_wq is NULL
>      queue_delayed_work()
>          queue_delayed_work_on()
>              __queue_delayed_work()  # warning here, but continue
>                  __queue_work()      # access wq->flags, null-ptr-deref
>
> Check the ret value and return -ENOMEM if it is NULL.
>
> Fixes: 3499495205a6 ("[PARISC] Use work queue in LED/LCD driver instead =
of tasklet.")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>

applied.

Thanks!
Helge

> ---
>   drivers/parisc/led.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
> index d4be9d2ee74d..8bdc5e043831 100644
> --- a/drivers/parisc/led.c
> +++ b/drivers/parisc/led.c
> @@ -137,6 +137,9 @@ static int start_task(void)
>
>   	/* Create the work queue and queue the LED task */
>   	led_wq =3D create_singlethread_workqueue("led_wq");
> +	if (!led_wq)
> +		return -ENOMEM;
> +
>   	queue_delayed_work(led_wq, &led_task, 0);
>
>   	return 0;

