Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85DD852B2F9
	for <lists+linux-parisc@lfdr.de>; Wed, 18 May 2022 09:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbiERHKb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 18 May 2022 03:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbiERHKY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 18 May 2022 03:10:24 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92EDEBEA8
        for <linux-parisc@vger.kernel.org>; Wed, 18 May 2022 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652857816;
        bh=niUe6EjYHTv4BcyaIEaYeFWxWYQyVH0Ljt7XFXMZpwc=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Oi6FsqLbzHmgbaRhU4qHg18ZtHa1Dim2P5w8ms5JloKctsBWqGq0mo2RXlVk7EKx9
         EBQ1LhUQEFvVqZuFnSfYQLzPjU63cVxbEls/aeowOvm8lGT/G4iRbAbGAO4BLgmwYe
         vXcYQagTDB7gnLLmcuzY/ZKKqL44l7vkynoY6sSE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.138.233]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPokD-1oE5rA3Ljn-00MpKU; Wed, 18
 May 2022 09:10:15 +0200
Message-ID: <25c5c394-64a5-b14f-7c22-cc5f3a06994d@gmx.de>
Date:   Wed, 18 May 2022 09:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] parisc: Prevent using same register as soure and target
 in extru/shr
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <YoOZy3A3R0i0DUWB@p100>
 <8b5c308a-f3ea-e07f-053a-ad086ce75c43@gmx.de>
 <87zgjfl44f.fsf@x1.stackframe.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <87zgjfl44f.fsf@x1.stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/6+LXnR1P7LeH8phelrqFQ3SkKWp8ClvjOWPKCqoeG0FmRjqfiy
 BKzWwlFfABOzDR0evzNlQ0uFU5CoVw7dBgcCN7aIPz+vJW0WLA67Uv1dsiSHaa7atdNSpM+
 SFNczxLqEu7U6IFyRQA9eLmvlXkOGOp1hlbqkD8BBycRTmddpjg+HQkSRysuEHpyEeQiqbM
 HhGGcjFQ3U6oiWMXLN+tA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qkLZD9jN0GU=:UbA7LBdi0QTkpCNyilAv4P
 iPAnmfAm/8p9Upj4T0mTvzONI6ZbSwsT3rVbCEgqMXjr9to69cWpJaHTVOUGPrmCjlewvVNdq
 8nUQ/4dUwOrDwOGV5YKig1NYyXdIv9IgfJD87r7mf4v99ulEKIrKCOPrMtBcKkJ29jGWnZAPK
 8cdpX9PLuwSS0N3d7BgkHoJ7kCSv3BUDtHrZcpMxMFlHnnRw8BINCneimrzMq6xVY/w4Zg617
 AswQevN9yWPawM+qa+3CrEzvSBsAi7vciAAE9UL+cpXldUqX5pe+F/YRgxip/AN2YMkwy/Xu1
 aClP0mPk2xpq7Qj4+12x63WHokCHAS1JfUXMioW2CM3aplSWrNK9Lti+q5LDEV+au+TIIMCQC
 DmsKNKN7iXTElHZZu423wQqn/nVxc8QStqO5r3a0vGt5y6w5+WbbP46bcmH3JQC0W9U2h6Kjp
 lVBLNZ4YWB+Rk3ywIKAx47N2PZFioZD7Lsr1c/4OJPBSRn5gCwrdBOk/hT3qDTHoZEBUnbLLy
 UwfdtLk/EDrcR73WtUR8gGsCBWO2ZGHEHSt6CO76hxO5/6V24fqgVro5aRAUTi1A9V4Gy9uNI
 sZqJGvOtQOvO+RCZ8mLPLsU5Rg3RxAqjO/xPDsV5Zbln6mBKVX2xAoudY2w7L+sRSCQ3pLYc6
 botflwp3sy8YbhcjUgsoqJg6uSMSYKX8D2mB5xJ5SPZPen2usepvT65Hrf5QcfKyHdw9lKCcB
 D8ysVGUhoyuCUcZsMJqOj7+OS9U9N1of/ytaLd+Dww1U2yCJKJqGrE5UiFbs81Jin99mgMGJw
 Xya1GgBqU41nF1C4Qm2JFqfcTxbnffZzERnVj9K05TNkRjFocuQYkVvwOJLVwT2wRxlspnbwB
 pYaetP4jQwkO/MTElijbSUzq5DKIXK1baFpf0UWYUFIplXoSLNgzaBRf43BfdIR13UI/xMANQ
 NqNVVG4lbqmlX8WYHariF24/7/BAqJtlMYh315x70K48m4j942Tar4o+sd018qQWV1idP1im5
 HQCifFqRsW6tcaUsDiKgEOJgtB+kmju2g6jpHoEwd9T1tsa6rQ7ZyggmHzUi4VNEI5qZ91lqu
 PzwX7cFzxrwQcAN+N7OBDqQCUVfCYgC0rBOJyAFHvbmaN65Kjqct5OoWg==
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/18/22 08:57, Sven Schnelle wrote:
> Helge Deller <deller@gmx.de> writes:
>
>> On 5/17/22 14:49, Helge Deller wrote:
>>> In 2004 Randolph added the shr() assembly macro and noted that the
>>> source and target register could not be the same.
>>>
>>> I did not find any confindence in the docs for this restriction. Maybe
>>> it's related that on PA2.0 the upper bits may be clobbered?
>>
>> Looking at the generated kernel code from C-files, I'll find all over u=
sages of
>> 	extru source, x,y,  target
>> where source and target are the same register.
>> So, at least for 32-bit this restriction can't be true.
>
> I did a quick objdump on the 64 bit HP-UX kernel and that one also uses
> extrd/extrw where target and source are the same register. So i don't
> think that restriction is true.

Thanks for checking!
Maybe it's meant that it clobbers when running *32-bit* code on PA2.0?
Just a thought...

Helge
