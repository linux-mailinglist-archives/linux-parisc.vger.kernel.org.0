Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB31C184DD1
	for <lists+linux-parisc@lfdr.de>; Fri, 13 Mar 2020 18:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMRmJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 13 Mar 2020 13:42:09 -0400
Received: from mout.gmx.net ([212.227.15.15]:33443 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726414AbgCMRmI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 13 Mar 2020 13:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584121322;
        bh=gXWpBZejSVx4KQcGiAtrosu5q9p37K1RKcwpAYxQU70=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Wo/gbLTmhzfpyAJWiaxhzjTjLxNGaCP96O/2cfdrE08p8lnoYnm4KQwYNIq8Sz+VF
         NkWZi+jwUuHKk018mD7SWFuJDljp0HmUL1moUKZq6OKrDEr3P/9VlPYToGpC0E6TTK
         RA6UEguLVJd/g2XBx0GHs/B+5UDGL4er5rQG5O3U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.64]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UZ6-1jCGM406SY-000bBD; Fri, 13
 Mar 2020 18:42:02 +0100
Subject: Re: [PATCH v3] parisc: Replace setup_irq() by request_irq()
To:     afzal mohammed <afzal.mohd.ma@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200304005025.5179-1-afzal.mohd.ma@gmail.com>
 <20200313123924.GA7225@afzalpc>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <e1c95a52-fabc-e595-8cce-199d6d5ee02e@gmx.de>
Date:   Fri, 13 Mar 2020 18:42:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313123924.GA7225@afzalpc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V1zJ71FAmnuYcyjfnZ0xQhKYnN9ESgegXgHpm3UIFSvpKSBe0P5
 eUS78Wg88dqmPmp+fB0iXibibGehee4NBOlQFAA8lIYn/rMY3/b28san1TFx9OpfhcegY29
 sCedJBARIrQWZoMNqccC8nvgtaH2xZIxRtrF4lCSzO9H1xJPZvnkDncRSmP1lPbHIwmRIFq
 day2tFHuldsT2FnMRajtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ijJJRrT1jII=:Munmfmw398iZ88JaWutzS7
 8HDV6IOaW+mMjr3Ulxe7lktPBtilLKm4w/TECM0sgRDUmNj2SAggfyWz4ZMisj5Ja/luV/ILJ
 0Kbo11Q8GhOyzJNhCkaY8c3fvGiVrD8w0KWuQEdFah6xiBcGrITE1/WMUyz4CM7NDHvgKVcdZ
 dlfwJVHPPAIBekyyLUOe1gwmWzuIhW8hESwHPcsUiM5TlyUW2PI6ZJ46cwhQND5A1bE6ZBVtt
 3/vY54ZewDONv+GVw5h5ebI84Fj0WEBW64+W2NLp2dmNbrWstJGaw8L1gNyQ35Z1pUohthi+u
 1jBrSVh4bEBttDYAC50Z4pG5Qv1YMq2iSYv2grNyT36kRlnwVBvKgUimEV5Tc2lQZudulc3zg
 SK7SQdOlakICWor/e2fsMW68YAoSKky1J/wUHVu/TCiUaT7ydox3/StKCGI+pkY7Ztz49S4k0
 3zyOMrcQo26sBFkWZ4K29iCk+fvH0Nv4xa4GfLO8tEdpIXZRa3v8mCgIkBEDGQdU/x/ZqfMWe
 52lJ1ic2OBfbKHXj4Jud4IXU5wKtL7xETO/6uIg9EHOi0s9WtnXyfsanIVGnpJ9EUTVD55QRa
 5Gb3U5mCcwAYSD4nVwrlhXjOtaGjFU/N/pipVKtzWOHpg4h/nnMU+O1utKLqm+0bGRqGGR1q1
 dOxOv72qmoQtAAGJgZXcLEXXaeCC7juDrNofDMhI+G7MR6v11eYky7Dst2uI9XsY83AEf9LN8
 /vhVdwnyl5pce6HoK+mmKT8hRf+AJNvRuot0jsy9/kkkJo/sHv2JebVWdzxl5ltjuw5tc29jX
 bthalbJ8d5tXuBTtn2ji654Groovaj7N0gaMR/oO1LY07pTS1naU5uj6V45nk2kmD16Wtovty
 uMjNNqC9x+MEJn16iSb5SjoS0NkxvKytdsXI0Bp58n02gT5Q7wR4lWl4AgQtCJP4DcH7TQj2n
 5aolFCyBSnaTUxlf+G9SY24MgctpgKD3Z7tY0euC4MgO38yaLAexFFb6rNMuY5qljZXGtSoe9
 advxjLCZ4QGUQJFsXT2DPmmyiDG3s2ONMSEdBQyI8VA6165RMSgn7HXEdm24eHOVeT0s6CbXY
 iGCIKnSYKXWj8Of4tegazBqF9BKBXmakauplzUUHruCRF1N7S+EpS3FBBptL0mlmE7kViAPe0
 LMR16RRnTKMUHRTuYSkZ+UUKyjXaQrkxVHafV/zSAf76YvweEpWZPFL6iPSw5MOaakbBEC8pV
 9N3oZNU3kQrMmDx1+
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 13.03.20 13:39, afzal mohammed wrote:
> Hi Helge Deller,
>
> On Wed, Mar 04, 2020 at 06:20:24AM +0530, afzal mohammed wrote:
>> request_irq() is preferred over setup_irq(). Invocations of setup_irq()
>> occur after memory allocators are ready.
>>
>> Per tglx[1], setup_irq() existed in olden days when allocators were not
>> ready by the time early interrupts were initialized.
>>
>> Hence replace setup_irq() by request_irq().
>>
>> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
>>
>> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
>> ---
>> Hi parisc maintainers,
>>
>> if okay w/ this change, please consider taking it thr' your tree, else =
please
>> let me know.
>
> Seems you handle the pull requests for parisc, if this patch is okay,
> can you please consider for inclusion in your tree.

Applied into my for-next tree.

Thanks!
Helge
