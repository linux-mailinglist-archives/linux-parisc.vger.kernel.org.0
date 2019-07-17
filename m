Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 915796C263
	for <lists+linux-parisc@lfdr.de>; Wed, 17 Jul 2019 23:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbfGQVAf (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 17 Jul 2019 17:00:35 -0400
Received: from mout.gmx.net ([212.227.15.15]:39969 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726063AbfGQVAf (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Jul 2019 17:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563397203;
        bh=lbP5TJW7MnckQAfFQUkMeoQUjfES7ZHOxL8cNrMploY=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=ektFhzBNMOGItAKX/muu3nJ5VYyOECS0VpmYtZ/3UYwRm59mOjCmysVKLDu6VSU2y
         zOxZjD4ZkAjN5HVrkwfg/XUPTsqp0SJOZ/0jtg12L+ToeMoxIBWwvxo99+oksRBddJ
         g1cuVjv0cCwWXT8OcCq80fH6pO5s7u9HhlaECvv0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.44]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LwZtX-1iW6GK0o51-018MP0; Wed, 17
 Jul 2019 23:00:03 +0200
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11946948.1Lt8Nslq4k@devpool21>
 <029de4f5-62db-7d74-7619-3c7888ce4f9c@gmx.de>
 <5e2ad677-7062-98d2-a6c5-577df02132d4@gmx.de>
 <1957442.0sSArhqTEx@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Message-ID: <f6f584a9-3bab-a020-9dc8-71cbfe65d716@gmx.de>
Date:   Wed, 17 Jul 2019 23:00:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1957442.0sSArhqTEx@daneel.sf-tec.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ue0JJQgmN1Gq6Aat/bYA5MKAWUVrV3K5p53qFY2GLXs2v14MJrB
 Pyxo8DtL/ZmnI6FxaUxg2R6mS7u9P+yziY72pQ0lACQolaR6CQXkKcHmlTvg45LOZHgcQCI
 kHNyhj62C+9fp369tZw/CzV5JYpbvd+ICg2lrA3AgPhw/EZLSvRIY17mUgNc028+z9bvWVh
 hiOCeca3NwIdr3EIAru9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uGjeeg5cAVM=:qRhCla2rB+ikmLDJL9rXMn
 E0dyyWMOXCxqo/0rX77dFz+zso2fUaFzStsN0PJLH2C+kOBmu06Dka+TAd0fmJzYOGFJ1alTg
 /kUvn/m/RkqBjpe/wEmFHhdoWPRSbTWx68JAZuyltfPYjt1NLQ+9d/MlHCShKCfLw3t/96Gdg
 j3aMU0prz3MvN60FoMt6j99sbv5771+wh3qFJTdn+CpMRzTCNB03171WC2VCDnc+AuZD7TfUf
 cXn4vYSlYdt0lGh2LUgtTvW9XeL/YjRoDzh5kqtdUyc1/Sw+IQh2oarZHZBKq2Unnr0G0XxgH
 CFerpDo2v6puxhUACZ59g9dbSFDwpW4CdtJ2d7rKQc40Zw7pAL0RWHW1sF41GArg/dvL9EfTO
 VzqW2RmDCnn5co4Nv1BqZTezEJN9/a10Ggb0/pQXI/OkMgJ3lnYy+EHjGg7DwE8pSck1MlNNx
 dRCdd3b+SguGDcx7lMJB4rnkIesYl3plIs0KEHqdCS/uzV5BCP3O2GG5pOBGy7VOeatSvrr3E
 CNkbt70ApTfgFiYLplJ1suz5M40fd9cuR8ztPI3Zxqz1hEEeDL1Gzm6sDb4HYPP4ilGCOrtcS
 A6vS0hyckwQvRsAD1uV6loyv9xWD4jbSrsY+vwNwoN/i72eHfNrgNMuJiVwi7zjuM8yPLjOtp
 8oCMEnSh3bFvdrpXorxvlSVc7sUprRsdxZu2tKFKw4juRfFwusviKjlkoD1xc+hSbwPzyMaZA
 Bt6yTykgFYRnLzA71LP9NJgevmDUDIXPX+9NsVfW/wXpOzA8xOEsgZY3fE409x3kCmp+4MZk6
 l6x47lLYcg4I5fBYaoVZaAg/4IwF/dCfh3igamWWNr+ivYw+7oQ46+tGEGnamBJ+Q8ZKI9E4y
 DmyYD69D4wvlFqbLKNduvn2Z0LcbOsOH1QQzyCKoA/ybKRjMZnBkJcjNAhRnQyP3qvvVAx95b
 KqfYyEgZW2FsWEbhly0Pi4nnRhO1nye16ORJtqBfeN3skSECpksWwh6g+hsIXkidb2cqCDnrh
 koEw2guFVEQ+aApXqXgEytjBZUu50/0pGUFG+gSgB4/5FNeTRfYVGVcj3HX1e+d/diyP4ZQ3b
 Shs6WyT6Qvnq24=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 17.07.19 19:52, Rolf Eike Beer wrote:
> Helge wrote:
>> Hi Rolf,
>>
>> On 02.07.19 17:59, Helge Deller wrote:
>>>>> This seems to be a minimal reproducer:
>>>>> https://481768.bugs.gentoo.org/attachment.cgi?id=3D361728
>>>
>>> That's a REALLY nasty bug!
>>
>> I think I finally fixed the issues for 32- and 64-bit kernels.
>>
>> Can you please test the three patches in my ptrace-bugfix3 git tree?
>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git=
/log/
>> ?h=3Dptrace-bugfix3
>
> I applied them on top of 5.2.0 and tested it on my C8000, it survived th=
e
> whole gdb 8.1.2 testsuite.

Great. Thanks for testing.

> The results are horrible, but the machine is still
> up and running, just a couple of these:
>
> [ 4481.730278] INEQUIVALENT ALIASES 0x41000000 and 0x42e81000 in file ki=
ll-
> detach-inferiors-cmd
> [ 8944.224759] INEQUIVALENT ALIASES 0x41ed2000 and 0x4171c000 in file mu=
lti-
> attach

Usually those are uncritical.

> So feel free to add my Tested-by.

I'll do.

Helge
