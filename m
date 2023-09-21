Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 830B07A9B55
	for <lists+linux-parisc@lfdr.de>; Thu, 21 Sep 2023 20:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjIUS5y (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 21 Sep 2023 14:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjIUS5U (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 21 Sep 2023 14:57:20 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F40D8DECE
        for <linux-parisc@vger.kernel.org>; Thu, 21 Sep 2023 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1695322280; x=1695927080; i=deller@gmx.de;
 bh=jKfEXKACgB7F6jA4auEPnmQTNT9EJEiGAQTUjpf/iaA=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=RUSUtzaRz2gh3gBSrLpUIGCKfq9EwQ6xeBDCE+pMVYQcYG0O7S7uFSeJHEDK+EnFN1/Qmx5sjpg
 KHdlXfLFz9Wfi3ya0v7nCdLEbUqW/HOmgnPB9ps3LEawmCb394eXt0Hi9Do5eXvbEDaZLlg6VRqsk
 ClyYgovwRKzCzV9gGj3sQzQNbZ6y9Xm/+PRYcP9jiPhSPxrLSOQg7dQJqJNrN8SyehzGY3wcvTdG2
 0UTXD8Bul2Q/byR7Ud4sQWDZjsS2FHCv6YKvFzbEjh34Pa3H7TLGRstuyBtAIo0wAR9SPifyQc+N8
 koRpK4h7Ba3m8SdLfPIMZaxqAgBYS71jZXHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.147.117]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1qurOT06sE-00Fzed; Thu, 21
 Sep 2023 10:55:55 +0200
Message-ID: <1022a190-0714-562a-9fd7-2bae7dd1162e@gmx.de>
Date:   Thu, 21 Sep 2023 10:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] parisc: Enable HAVE_ARCH_PREL32_RELOCATIONS
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
References: <ZQM0i4lgvIRN/Ptd@ls3530>
In-Reply-To: <ZQM0i4lgvIRN/Ptd@ls3530>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HlIyfa2NDnmpxViFjnakcLKAlmbG9FacA81Z0EzG5lip0LtPVJf
 LW9AP9k2mFf2lC8yZkmyd2qnTaSK3xTnhe9Z0DoRdR84uRlJJ+vZV2/FB+EQzISvWxUzhlR
 PfjXyoRH35i3H+VWgSwqnqjAD71nDGzALB3DqG8N4+QgMFHnLEL1IF6v4A275y3rTt6jPy2
 MOK8RQ0knLYFBSH0v83CA==
UI-OutboundReport: notjunk:1;M01:P0:IJDQTxXBcDk=;JnMx1snWTsJ2i4P1OzvQgmLXX5y
 Scmjqrmt2hJGrYQ9tbDIbh+Fr6DryQAhFeJNCPi1Uo3Su/iZl1AOQ0nn/RQIX4HOeEHqhZ4p9
 ylbcM/iCjKrhfWv1i6k916TNhHN/+kklMlbLjB3GKoO/j02KSbKwkRMtP6mkIW7q8LJaJ8enE
 LwLjl16phHY5Fp+tcIcXwa7q/aMRIAaHyM4HDE+I01ndlaSajn9xEICWYLtRxU2+SofjC0hfK
 WrNrcLxW0dtdkNhnILTrGQdXurRiL920N030Zx0avMMDX6m1H1CZMnyDlAC3Le8iVJl0OH0E4
 yv++CQWUe0JIYv0snilP9dRrLk3smUn7NiwzCyVSqKyUynP+OY5sFM/rTJvKpzw1MEoX5YQi+
 QMvS3Y7BHhI6dvKgpmxhJX6lGwbfviwTbFoTjVy6nNqJYZHUlvftr+38cOjNXL6rI084wDi3d
 mCOOZ7r3q+n08rEOWmgqL7fNDTcAcNlFT6fne+YKjTNc01g+LYLC7Z779CpIj4/be1Gs/4poD
 10JteNj2WSPzHE/HDQNXqrEKVoxFfSDiX5UI/bpAmYCB03cA1P3zzjCJrKfSL9emeRiE2LEDK
 1QejrNGyf11rU0Mg+wjjzARjvdYeC0WJ2IQXufVEtcTvkHPB+U+eUbxr+n1DwTHXuvvRykQey
 OT8bdL0ZLVAiu2cGupHlKeRGZUODAlOwlKGPENwM+tpOrRw5+mGqMuSKVGpxEzy0eSeSsALuo
 R+PzzoKpjGwoaYExrtIG92puUakivOSMGYqsZ6geqwNCNbnKC53xe/pnT0ZUk6xoEYZG4kRTP
 xmFOtpLS5k1Ds2JF1Lfj7+Ktfrix/d+Bw6kVG4b4bU6Jm68Mm24JobvDxCuA9DGjCxN3zFcA1
 v4ynMSY4SeWxZhjVfoI3ZLAj5V/lR5g9Y3QytWqBUlWxfM5rShFNZJ5222KoLsTl2i09YJPWi
 0OIpdRue5D2ug22WfxMxY+5qz8Y=
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/14/23 18:27, Helge Deller wrote:
> Enable HAVE_ARCH_PREL32_RELOCATIONS for 64-bit kernels, which
> will save some bytes in the final binary.

FYI - ignore this patch.
It will not work without adding dereference_function_descriptor()
calls where the addresses are resolved.

> --- a/arch/parisc/Kconfig
> +	select HAVE_ARCH_PREL32_RELOCATIONS if 64BIT
