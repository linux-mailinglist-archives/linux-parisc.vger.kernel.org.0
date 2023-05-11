Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 321E56FF89D
	for <lists+linux-parisc@lfdr.de>; Thu, 11 May 2023 19:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238035AbjEKRhE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 May 2023 13:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238452AbjEKRhD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 May 2023 13:37:03 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAB165B4
        for <linux-parisc@vger.kernel.org>; Thu, 11 May 2023 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1683826546; i=deller@gmx.de;
        bh=APZhjLF9mod3j9ntIwszQATnZm6cFG6DYbfw9hK+sU0=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=IiK2VMXImZmPPBRoEUUg0QzZ4NCo1mZumA3WfF+GliGjr22Oty7zZ/DQEaDD87eNS
         MZXC9F/xPQU8UPPO3PYfCKxVIU/RQWhXZXN1+14Gt+i2xTW/9PLic3rpWErVwWAPbX
         ViH/bc6++1AQvLp1YhHNPiLZaP2AafXtS5f+aekV/NxjzMC8Qi0ACJE02xHTgvH5+I
         ERd7sqVl0QXNRhFHerzEw62XQWbjg2sxNZHXLRjuBay9uvUZMJ9mNL1fqBAlU4W7L6
         G5PvCv/fftA6wxfbjCojLKYhsln4964KxmP6J/L0tlB4YAL++f1wC50kzsHNsGYHEI
         0cTZpJ7i8hOsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.253]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6qC-1qby862Jxc-00lRN3; Thu, 11
 May 2023 19:35:46 +0200
Message-ID: <85aef102-8407-68c7-2dc2-87e5a866906b@gmx.de>
Date:   Thu, 11 May 2023 19:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
Content-Language: en-US
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-parisc@vger.kernel.org
References: <1683740497@msgid.manchmal.in-ulm.de>
 <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
 <1683825030@msgid.manchmal.in-ulm.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <1683825030@msgid.manchmal.in-ulm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9gmnXuGyjsk//qiXVWwpQQNW1BI5X/1u3gISjGwIoySeLAiNkX1
 l79kAEEyfRX7BhdIagKJY6Dkz2K9Thz7WIIX5qnZxQvQpeR81PSmgYswraJvYIrK2O++5va
 k0O0qHBI1EMnSo0HsqHdHHe4i0cK/lvNAjMafb2rt5U9mmmUDICrKO8JCrFidCqAeEsPoRO
 2bdPoMbM4ykDBVa4e88ew==
UI-OutboundReport: notjunk:1;M01:P0:TLkSCZxgoK8=;iRaKV3DXG5oY0sM10+ZZTYNHY76
 lD3nGIOIQtf+UsDLDDT3IZBlxjxglT1CNVfldCMKP3IKC5KZ8t3sr1BA7DBLkRfCFj0U7OjX4
 rqvhFALab2I4Os4LcVSQGWUjaqS649uoiz4BwR/b4Sxzd+1FKIIX7r/MKBuZW7HMXJ8B8Phxs
 SNEtL43SbZJWvnfBhOiwRJDyJs26ers2KjiMnsHazWeBZwOGHrNd/EuxRB6tp5O5C1vKZxVi4
 OC7JlB8FeJmkXxkDOpVd0wtLXHt0pUsBhIEIswNcwUdGahA0UDrTR4yQ72Bw8ot/WkXLbfiN7
 +sySS65oOGACMEhX1jbpA9lKQs7Wet9hV628iJ3HV+mlwW+rUGBBDyfDxBl0CAVqSY1zWYzW1
 vMH6Yvu8e9e0mGEM6pmJ7t8pPDoDV5wE0oioBD5sVLjLyaUawGLlDIrW5W4eoM6RcVLg8ytZg
 KKdGuD5lDVoOA+nrdso6nKAlEot20IpiD2xTCzxU9Tk2QQLRTj1jUxnHSU+Ve7zRsK5rXqw2f
 sjK2YINeBuNdMsNSfBWitMmh2gVGM9uNjTCjTAWy5KA/VX+2XBiJA8kWI8hSqbs0X57Q19e2S
 5osEywB/QQR8oDxihgqfKvgkFU0yn2OTWXtyQvtsjFcF4hVSiaQXOuYDxRMzyln2dZbK0ROWl
 6Sfx4aFRMfqM5aDCqn000MIY1qqD8tSn0YPmkIyyYUTDclDrOLraEIUTNWzyzwV2UqHgLD2zS
 wqfigntdnZy1mWkT5WtodlP0Y2A0+ok6OfUKzjueS4IeIBaftHr4ksJNQO3hyWmFtiA4zKRlO
 g3znQg7aeO+VWUIT0DrsRsYUUScskChZUOJwCNOvePAHvRZAZXqodGy3Mpat+k1xyI17oWtnB
 dV8kzZkbQncWqPi5YebK/sHA+ZMWHs873Ml406pWViv3PVErdPAIPq5IZZZSOgj350tmR1nI8
 sddRSw==
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/11/23 19:22, Christoph Biedl wrote:
> Helge Deller wrote...
>
>> I haven't used kernel 6.3 much yet, but the kernel BUG below seems
>> to be triggered by CONFIG_MIGRATION.
>> You could try to disable that config option first to verify if
>> it fixes your crash.
>> This might help to narrow down the problem....
>
> Looks good, still have a running system after 45 minutes, never got that
> far with the initial kernel configuration.

Good!

> In the meantime I realized only some 16 commits between v6.2 and v6.3
> affect arch/parisc. Do you think it's worth check right around those?

Don't think so.
Very unlikely is this one:
commit	88d7b12068b95731c280af8ce88e8ee9561f96de
highmem: round down the address passed to kunmap_flush_on_unmap()

> Also, if you can think of a way to trigger the crashes, that would ease
> the testing a lot.

Since you run the 32-bit kernel, huge-pages are not involved as they
aren't available in the 32-bit kernels.
So I think swapping is triggering it.
You could try to find a test program which triggers swapping, e.g. LTS tes=
tcases?
Another test could be to enable CONFIG_MIGRATION again and disable
all swap spaces and see if it survives.

Helge
