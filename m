Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC8E78A1FB
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Aug 2023 23:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjH0VmU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Aug 2023 17:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjH0VmF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Aug 2023 17:42:05 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8072C5
        for <linux-parisc@vger.kernel.org>; Sun, 27 Aug 2023 14:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1693172516; x=1693777316; i=deller@gmx.de;
 bh=m7dlaCbtyScB3UlhUvJWGKUtU7vUv1ucFb/rML5iJI8=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=FkefP/c+1M611NIVpLyoLfRyvxqciJ8e/jFWY05AEN/E7+xLyX4r/ZzcAW3eEWVP1jZuspE
 kymhVNglJpVKcKI7+KEHD/ESKcs63k1fD5s+oUBUyxhowZlE5kKl/dNcZ9J2uxu7jJrnWpz0R
 8HMPWHa0Him+yO1njwlZWQ46rnE1HHOK9F9m0QtDV92qkIp8ddycdTIzqiclQOk5ZIorgchYG
 4ne9Btot0kZBF+DpcAlqfAulqiIMrMpH7u/2vAnE80Yt4TBMK9Hm2sW1Z1H5mYz5r8EBKRuF5
 d8+O+caYo2YxZPe7dmmDWhKeU+GTbAvN6R+MPKHVSDPSizuf0/Xg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.139]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryXH-1pxWWP00Rh-00o2Nb; Sun, 27
 Aug 2023 23:41:56 +0200
Message-ID: <d27ecc12-c507-f691-7be5-8344b72f713f@gmx.de>
Date:   Sun, 27 Aug 2023 23:41:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>, Vidra.Jonas@seznam.cz,
        linux-parisc@vger.kernel.org
References: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
 <7ce98f53-d80d-fc78-1bff-419eedaf8e36@bell.net>
 <f8be4af4-725a-902f-60a5-0f18c198b130@gmx.de>
 <d52e26aa-0c46-498b-0586-1fea2f94c58d@bell.net>
 <13c75691-ac65-93be-c217-89e7cfbed10e@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <13c75691-ac65-93be-c217-89e7cfbed10e@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5/9B5ps3w8fOnX5ubFUmLpzFdzDBnOEFojknfWf+3oECnjxH+mE
 Y51LFMhf+ViKg2OjCrCEPPR5gloFAyL9SJbH8Vde0uqnoS84tmk8s/f3Zxn8U73zI3Tu1J3
 BpT/N2Szgp+FpYYi446law4hgOdQWq6eg89PkUn0p22qiGZJQ9R1R4ywsfakbYtlmXTAM+9
 juek4akjenK1cWxoXBEqw==
UI-OutboundReport: notjunk:1;M01:P0:CVkBJ+ykc/4=;StSGawa9cvU829yB6LhQXtv7Ppv
 e/mfUdqJ/AFhrvsjoWua51KKlcan6qDZJcd0cIglUYqyaY9uKZBOz89kw9eADz2BVzGjNMqzp
 I/sXvoUM2/dChL6kYtftIhqXkc1w4gLecUTeO0ASZbHrH+SONgc1hOSOI5inDt+w6qcOXp+wW
 0US+1MwTmsmangTW9HohZO5j9bPjZEC7dbukPUBioHUTQz06icDllaJYyCNJJyWEvtjOEyRGM
 Cv9RowPdUCC0EFHadNwiOMV9MPyHrysneUuyTO5DT+vSUMx8r1OEIqlBpCNdNJgHvlCHcbV0X
 p2ZOy3OzrenDCE64xa+LR2gh7AkMKV3292jcMov5UjETtdl+U6mPOHCmhIOq0beP0e9MNYljB
 9qe2KitVZu9KeiAOufpB1qR85ShsgKxsqTZq2AgoYTb2wqZvYuItYkRqoXMwV3jll8yqXV0oK
 PibyKb828LvwO59Mc/H3EwLa0CtHl0PICgtE7OdhamJBoCdLJxwH+3uQM3PdNHJnZSWILiOHZ
 0+wG0bPbk7pQ7DBgZ4B+fYWIePPT+KtbPEXLQtGcwM+f/vfe/uuUVu4MyNnCrAldn7qbXAXfC
 y2eMnORi9FSKcD/IXRJa9oI1f4sKAA0UlXsk0+DqKLCZ0twJ3o2+D6F9rTS94N8ueIpLadDLH
 e/OCIZaJMRDEK7TOzRYhFXZnLsRFvDqxoa8ceYRDArA83cK3Rh83a9wEuBEvyR214IZRy68oT
 roi8jzAmF7vzle35Zb7SF26nflma5KvoCzidJ6VfJpIV5qq4BYDPdGhy9ED2asFCpCgetcoab
 +TF/vpbB4eapQ04FpSmeOVKQ6BL4dnpv8aE38NVGNCjn6w3j2HlgqilVZjaIHpQtTO57C9iTb
 nMywtog6wqRuxO/m7UJugJ3EacDUwGjZ2OVVZB6+OGcRHSyKFJ4pvhQB1203VSUa17TJn0vs2
 KrJ1aA==
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/27/23 23:31, John David Anglin wrote:
> On 2023-08-27 5:01 p.m., John David Anglin wrote:
>>> Did=C2=A0the=C2=A0libuv=C2=A0check=C2=A0failed=C2=A0on=C2=A06.1.46=C2=
=A0for=C2=A0you?
>> No.=C2=A0It=C2=A0was=C2=A0successful.
> I ran the testsuite a few more times.=C2=A0 Sometimes metrics_pool_event=
s times out:
>
> not ok 179 - metrics_pool_events
> # timeout
> # Output from process `metrics_pool_events`: (no output)
>
> All other tests are ok.

That's strange. For me all "plain" > 6.1.45 kernels fail, often even HPMC/=
crash
the machine.
I did not tested your patch (yet).

Anyway, my git branch "6.1-stable-buildd-6.1.49" is 6.1.49 plus some io_ur=
ing
patches (and others) backported:
  https://github.com/hdeller/linux/tree/6.1-stable-buildd-6.1.49

With that one, all libuv checks run OK, I tested a few times.
I think we should ask for backporting some of those patches, but
we should be clear which ones...

Helge

