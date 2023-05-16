Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAE17045CE
	for <lists+linux-parisc@lfdr.de>; Tue, 16 May 2023 09:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjEPHJ2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 May 2023 03:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbjEPHJ0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 May 2023 03:09:26 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9193C3D
        for <linux-parisc@vger.kernel.org>; Tue, 16 May 2023 00:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684220959; i=deller@gmx.de;
        bh=Qd1Q+TLs9o5df4idaoVcKfzE9+gvb7pIxhYHZtU6Z68=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=k4bWwsJz45r93eHO602eGVqwTjJuvwkk7ONJikpaeRaonk2pCO3Q/XC2oaScibT3o
         0uyRn8LF2QOE7k3oc4FkulugTnMHomAMJPEK/6Q4uuP814l6ZyAIKTBy4seumkgP2T
         T5x2tjlagGR9EMhYSUY3DSAf/ftNbIPT5FEeNyBXxD/m4rws/t8FoytZGAPVJ1G2dx
         2+bRGbYMcSDcjXYcGtGuyog4VlB2G+YV8MhdA6i5w0ThdYmOcYbkkhK9Jy1UNGF7gU
         G46gMvMfKhleXvQAeiHk/hwjkaw/igohOO+h5Xcc5avxIqtLgfNoka6OkzLnLrngmp
         AoOyuXvQlX98w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.150.20]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVHe-1pjToV2Lnc-00JrhI; Tue, 16
 May 2023 09:09:19 +0200
Message-ID: <7bcc14b4-408a-d884-a78c-b0436789e58d@gmx.de>
Date:   Tue, 16 May 2023 09:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] parisc: improve cach flushing in arch_sync_dma_for_cpu()
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
References: <ZGJ8ZcPZbckX7VNB@p100>
 <4664024c-1312-64b5-5150-e60bf3fc49bb@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <4664024c-1312-64b5-5150-e60bf3fc49bb@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZAz7S7mX1i71y8tY4aJYbLvsQUsOQ2S64r1JPAJl/cxfSMjoi+Q
 dtQqaa7BeTD071Lc1EovzvDawiV/hZ1/EzdUHeajMULf/soiGBC/Z+9l45GA5+3naLFmGNd
 qIUviVgcTbh6QMmpGjRBBbQCfqj8IUW1HXBA5bxVsrqlhOATKNJqunT7s+g6kTHzAp85szW
 W43T8Gwxi8O/WzEExMnew==
UI-OutboundReport: notjunk:1;M01:P0:B8O0BYQiR4M=;Pw/5qJexUS4jjoSoVod/84PSOhq
 DiS9f152+YTjyMuoivdNxSxr7ovM2o8339PELE5a9TMK8w5+qfynEcXXcyrLAWhhvs/kf0MhI
 vQMxY6PMdWmiIh82PuWr+hmnAb+cMpoJ5lFOH2kUp2v2Mom/rvQ5W0aZPlUH/pnk6PKb+Nugz
 86GhptzrLKaPylNVEvrUvHM/wHjRzTy12xutO53EYfBPRuOz5kbsR7kbn0XOFY1xCbbODVPdA
 xAIl39doLPgvufWMf+JKUB308CC3jaPe1te08rmUxRUk1Kdnhe5gxcclXXXEtX/SyQj3gfj10
 8pInHclbw+MeQNbHMDkTkQf6fQ1zUF58Puf+3sSwjIrbM0Mybk7fpX1c4Y8vYG4elrZr/fmr0
 cmd+hgbhpuP4qsvH54y2enfp5NilyhOmG2WyMZvU8TtcuNdakGGWcpOYEavYfd8YFNS/EGnuX
 lbrBTPjZ3b4GjJ+4O3pF6jMonQqyY+qBGn6aL1Nb5cJrBH168KaniYTDX4XGlV3zkQQRT7TY5
 iha7/Q46pz19kf+ekY36qFf4dJcWMY87QGOqTcfA/3kipy6XFS9ZOwroaILWHiMWuX8HaGhqJ
 2SXCSsyzXo8tkTWMxLMr/42UWLN0vAz7oWihesF2diq7EzriFs8bOC/HoicicV7zgOyGK2XP4
 9Zm9hVdyhlcjR5iZx/AhnuCCSFVj17FWSurZ7CDr+kk2F8pMhNkmS1lrn3q0XWv14bWet7mT1
 9XmXuSG+fzmO3jUii1fni9nnpDIjLs+uSPKDlIaBRKAG7DsQbG1wJlJOLAHwgjOrkcVzACbQZ
 CFB+2j4Q6CVl6+5paWA7Gopb27dXCtaw3Thwe0kCO218gpDYsXpRaEC5RRxnuE1OqyYuxY91A
 kiP/96PlynxjCejKcXM1t+Dw4F+dWDjmjeLQh/+8DTPby77p/w0Eozb/LDsNDojo4ps2ost99
 ZSzCu6eY/Sglij+5paraplIglw0=
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/16/23 00:28, John David Anglin wrote:
> On 2023-05-15 2:39 p.m., Helge Deller wrote:
>> +=C2=A0=C2=A0=C2=A0 case DMA_BIDIRECTIONAL:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_kernel_dcache_range(a=
ddr, size);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 purge_kernel_dcache_range_a=
sm(addr, addr + size);
> I don't think flush and purge are both needed.

I'm not sure...

Just to fully understand it. Is this short summary correct: ?
- flush_kernel_dcache_range: flush cache back to memory, but keep data in =
cache.
	Next read fetches the data which is still in the cache, thus the next
	read doesn't checks if data in memory has been modified in the meantime (=
e.g. via DMA).
- purge_kernel_dcache_range_asm: ignore currently cached data & drop any c=
ached data in that range.
	Even if cache has dirty memory which hasn't been written back yet, drop i=
t and don't write back.
	Next read will fetch data from memory, thus return what DMA could have st=
ored there.

Helge
