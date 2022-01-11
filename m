Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C84A48B07D
	for <lists+linux-parisc@lfdr.de>; Tue, 11 Jan 2022 16:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238115AbiAKPKm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 11 Jan 2022 10:10:42 -0500
Received: from mout.gmx.net ([212.227.15.15]:58143 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231876AbiAKPKm (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 11 Jan 2022 10:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641913835;
        bh=KJspO9Y7hgfp/0K1qaVTIz6HeftxHsNQEPKbO6/K+7s=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=ScLdxnb6UjrcEqxP32LK3sitrdvbkx/vnQLHtN0HuNTVAd9vyONftVXkVm7BVizwN
         n4z+6CkSElZeZ5F2kUUhRFh1kGM7lt0QiiMd9dqFsZISbCjED0HJ50ODEwraPJBtCi
         cN0gaPDi4D1AklNhoHenteQN2CrNqG8cXj65w5K4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.189]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOGa-1mDfvw3b1K-00uqhC; Tue, 11
 Jan 2022 16:10:34 +0100
Message-ID: <e1949af8-0d5a-baac-4017-1c25a7412aaf@gmx.de>
Date:   Tue, 11 Jan 2022 16:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] parisc: Enable TOC (transfer of contents) feature
 unconditionally
Content-Language: en-US
To:     Jeroen Roovers <jer@xs4all.nl>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
References: <20220107131850.737880-1-deller@gmx.de>
 <20220111160625.5fb21b59@wim.jer>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220111160625.5fb21b59@wim.jer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WuOD/4zwajjw+i+1J8x+6LQAKBdbmA4equxTFh8/kR6CGXAmLRl
 dtptCLiuXdGBfIIsk34VF4LToXNfzW4Ghy2SeVvfMj3HNzXkeVlcbjz3D42fhlBQqa98RWw
 pbyKZLt2aN7lK3BCxpUqWIYeEemot4dW3hLRNr07+3hvmMFslFgqOa4ueyhoAeS3Z7Yh0qX
 ZdWwAQAEWImX/S9FTuFTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/px3S+Q8Hrk=:XTFA5wc+FMz4rm8hB1H0a/
 QPQiKiZquNecR+FQS7kTb6HgaLkYoRDUYRYSklwJusadgcHR3ReyPz1HlUEjTTnpW7aHH210w
 z9cpJLqinyUm+OkSk6NBxWg4Nz9TQ3nsEZB+nuQIi8yGvLgzoP6myYv5YIn7yDU1K50UwOoik
 YdUUCw46BqjsaeoQ1fDEA4zk/ZFuv/f9/XrMQBySIB47IOW/OzKtP3vel+weDFLV3/V4dJ2vl
 tjuSUjiTCT2X59qJ4Dehlb4XPsq0wq1kDfL89eaD9Fj53sF+jNxxwqO/tOywY9s3GZLDD8Z0v
 hwfshCEvfUoq81FlSZj5daktJPTP6ObKvciyOlpoEpMm4wgIQWDSZEGCCFeyks5Kcj7pJ7T7E
 HVm7/szBB66ZsehMdC3iYt/FqOWWwPvH6Bm7dm6QgptYrV8XeZ6h2yh6D9d99Mh7WY/SHACBZ
 qRKj33Pm+is1dLb7C0sAq6NDSdt4hYwSNN/BqVsWKi4iLRtU3xAQgdI479+glD10G96GbECGN
 BUSImAW6HFadsctNDo7m85UkD13FPZArOZtRi/v7nkqgZXwR0RZ2utYGffyhtGF6D7G2b60Xg
 oS5lXBVWxRC7VrY4f2qlmZSPyZ/yjAoBXrdaq0rKQ3ryefOh1+x88i75yX8IgzVB8x9aiZDiv
 Zsn3jkh1rLSJygB92zQTTecvu5j14ROLTID+bVfnwsUR5wZc7vHANu9XsDLmr5YZxK8/ExDSJ
 bnIvUnW8zYOXDfHGk5gzku0T+NhixKDdTcXMVt08kRPBX8s/66OpjwtlY5fNqz6NbHtY3bzpI
 wEs78XI0XLGBrdc0zLfSd/WTKbe1ZQvdaNts3Ylr1LwfFNbj85o2T6jTWQafjUdNlAcwH58v+
 wBiFB4N+TZ0l4lc1AeIBhCW68xAvkQu5Acmz126YhwOskahyAwjAs6I+kTATWZnYBi6/Z+Fnl
 aHH/QFLAwt3/zl/qY+jaJHoAIDavuYkO6Kk4aV7ToIIShilrhVWiliTJjWspH6ZKIE57FDXd0
 s9ffgCM5qpVm5ujZhuo4izZi6bJyozk75xXAzI7PpHqI8a0xEOAhi3xnbWFwqevUfTLTfejW3
 GPWE0YKdjm7Ew4=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/11/22 16:06, Jeroen Roovers wrote:
> On Fri,  7 Jan 2022 14:18:49 +0100
>> Before this patch, the TOC code used a pre-allocated stack of 16kb for
>> each possible CPU. That space overhead was the reason why the TOC
>> feature wasn't enabled by default for 32-bit kernels.
>
> Referring to the message subject, shouldn't that read
> "TOC (Transfer-of-control)", or similar? See [1] and [2].

Uh, yes.
I've just pushed it. Fixing that typo isn't so important IMHO, so I leave =
it as is.

Thanks for noticing!
Helge
