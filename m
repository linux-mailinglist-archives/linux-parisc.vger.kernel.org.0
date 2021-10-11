Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3624B429804
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Oct 2021 22:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234825AbhJKUP4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 11 Oct 2021 16:15:56 -0400
Received: from mout.gmx.net ([212.227.15.19]:39013 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231926AbhJKUPz (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 11 Oct 2021 16:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633983205;
        bh=A+LPIfa0+ivfYDfPRx24UKIMEs8GqrK5vAS+87XHnL4=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=CD7Vlg0M7gEuIlrTq09LmSjj+/ygmwk41EKIzPLZ+8bVUvlV1QmUbHLBAGtm7sylh
         r1MmZdTWJlOEBXvR6Av59Ob3R9FgnAHkGZ2gvF6n7cIxPhPNRexlZKeRAIob6ozjKE
         msWm0J0fXchATD1aW1gVXxcwQN9SY1Rbf5XukjJs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.125]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH5a-1nABJ31Nc4-00cfLI; Mon, 11
 Oct 2021 22:13:25 +0200
Message-ID: <9567f761-5100-b367-32f9-a6b39094d630@gmx.de>
Date:   Mon, 11 Oct 2021 22:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] parisc/firmware: add functions to retrieve TOC data
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20211010183815.5780-1-svens@stackframe.org>
 <20211010183815.5780-2-svens@stackframe.org>
 <11844080.O9o76ZdvQC@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <11844080.O9o76ZdvQC@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+kbJL0gnIHhCzJKw0qG58/yyOhSrGMPogbOW46T9uVZarHfeFuq
 NaG2hRH2Ktoz4kVEmHZiZBOAjbXnqIkNyrML+7PGLFLVWUPFRizhU8h9UPVfBmkeZNNzzZG
 4BvXHdVT/BkBFeS/u2ybwd+p0BfRy9i3DOZvIg4HxNtqKKZ85t5o3FABbUW6PPyM6PZEtq+
 VRznxuwuAQ63pZbXkl4ZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pLmLKyMcCjk=:Y1Hv+we7OTTN3zD3S4Qk4n
 R5OHL/F7HjTQrCU8huKVG4Au18IOskG9Qh2Lqfs/m6aa26g/WjFZJnalZIvXTj+pL2cMlxZEL
 vAF66CXZqyEq7MNlnotqIe29ZjYmPb5hoiCKDz8ZXUl32ZJk6PBjMkxtZI1toQtEKif/ZxpfM
 ATT1ecq6fu2kjJHJJaMWKQvl55xiqnFVrD6mRKTlk03jOepl41BoXcFZ/n0VOw8v6qSHED/h5
 ukdn00l3Xzl3cNX47r7BNZwGS1PYcG5kPSh6PNBuCor3F7RGrmmlTnkF12STeI/eR/LY/odL7
 wDC83yu5tLJISbUp5VGVyhJrAfvyKQQoauGP3UbeYzCECQYtA3tfVUMNArSaCZeZBKjPGdBUO
 9HS62oqgWcZkzoG208Itw0bi1oDhawGdJnzQHYjNjks1aMPw9QNgzWd65gKJAZT62N62Izt5g
 U1f23K/MbgzL9OWNvbGkz9nW7OX4HG0961YcEyDna0V6hgjBBrPG/HuvezDGVC3CDWVcGgidB
 Rl3d+DwZTK3uspEUtzS9v3xV0Q4iQkEtD59gs0k+/JmHgbc3kcJkBGo7RGIGSNAn4HWmbyLw7
 mKjoR1DJpYN+Y0v5H7kNYFUxaFEmvfy6EVTLsw0/X1W09v8R8m0Bk4mKqeZuDQChNdmuiNmjc
 0CvsEQvHODUCVIhMY1WcxVGBTYzC2Nue9QQeUCQYprU/kTdRG0PFVHSkpKi+0jutlerkFIn1F
 MES3ic75rsApozqtj9yrB5cf02IZlQhIVTrygIFvW2wY8cnpMLMfZV5f+fSqKhilLg/RfVgf+
 E3PTic7IhB/txq3LEaxRGrC6hEZJPiNAb5uE2HxutxSRRpyLYBS99aGNkXgYariPDCw/eVirH
 Yedjvk61N3oycLKyyJLx66fwD87121GGfdhW/qVmNBwvGPXPEZ3qrNqFqpBins97SbInVYX+6
 Hosa0Q2DKsu9rvbF/ozA9+am7r1babKsfClxqBVeus+dCaNV4um6kK4Y1AoiRDNamH94GKF7m
 ZrLu88TU+BTsONwGupkZ0A3QFunfiVmRtWJspNgzVW49XRc9+8aDO95s+Na+qd1VaUNVn5Ydz
 xv2wFeI9cwtdjA=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/11/21 17:05, Rolf Eike Beer wrote:
>> --- a/arch/parisc/include/uapi/asm/pdc.h
>> +++ b/arch/parisc/include/uapi/asm/pdc.h
>> @@ -689,6 +689,28 @@ struct pdc_hpmc_pim_20 { /* PDC_PIM */
>>  	unsigned long long fr[32];
>>  };
>>
>> +struct pdc_toc_pim_11 {
>> +	unsigned int gr[32];
>> +	unsigned int cr[32];
>> +	unsigned int sr[8];
>> +	unsigned int iasq_back;
>> +	unsigned int iaoq_back;
>> +	unsigned int check_type;
>> +	unsigned int hversion;
>> +	unsigned int cpu_state;
>> +};
>> +
>> +struct pdc_toc_pim_20 {
>> +	unsigned long long gr[32];
>> +	unsigned long long cr[32];
>> +	unsigned long long sr[8];
>> +	unsigned long long iasq_back;
>> +	unsigned long long iaoq_back;
>> +	unsigned int check_type;
>> +	unsigned int hversion;
>> +	unsigned int cpu_state;
>> +};
>> +
>>  #endif /* !defined(__ASSEMBLY__) */
>
> Since these are defined by the hardware and have a well defined size I s=
uggest
> using u32 and u64 to cover this.

You're right.
But in the whole file we use "unsigned int" for 32bit, and "unsigned long =
long"
for 64bit, so this change is consistent with the other contents.

Helge
