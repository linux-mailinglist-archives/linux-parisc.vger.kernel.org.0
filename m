Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 015DC11C8C7
	for <lists+linux-parisc@lfdr.de>; Thu, 12 Dec 2019 10:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbfLLJBk (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 12 Dec 2019 04:01:40 -0500
Received: from mout.gmx.net ([212.227.15.19]:47793 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728218AbfLLJBj (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 12 Dec 2019 04:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576141291;
        bh=AIAXxZFmgXWQZF0g/X/YsW8YJi0LIpx8PW5Y/uDEzzU=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=EMYGgAgeP2lj2aiVSWKRznHXOVHv2W5edIYHOnTf9dbR2cyEb/8rHEKbq0XZNrf+C
         t8/sbZ6gDPAZubw88nCmyTFSPPGGJOGRCx6w5gnHxoKZ1KDwXETLjvPu2r/2PBBrEN
         I/UuNFaUbRdsJoJDfIbD0CR6tcTsa5vjwoA+3a6Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.20.71.210] ([193.16.224.2]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FjR-1ibm7I1nkt-006Q4O; Thu, 12
 Dec 2019 10:01:31 +0100
Subject: Re: [PATCH][RFC] parisc: Use ldcw,co on uniprocessor machines only
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20191211201634.GA13407@ls3530.fritz.box>
 <63f37f01-6ae1-96e2-815b-aa48eb1f1c31@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <d39df29b-354d-9b07-d382-6250315b1232@gmx.de>
Date:   Thu, 12 Dec 2019 10:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <63f37f01-6ae1-96e2-815b-aa48eb1f1c31@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ax2WC4N2vGBG6x6plDouYQo9dlI1xgT3+B7+N5ORtZSwJzZfJ02
 UYQCSlusTxegw0HHE2BKz9pbVA2sMsqDi3fWq2CsAZ0NJ9XM/ziC5uaKKy5h9HtnZljAYko
 UFMtGHUCA0cjfh8jPyWOEMYfLXSTXvbLoDiCwizFTTYhP4optkPlpWdTn+/gCl25GO1B//d
 b0g0QP9H/zJMi3rDHDy9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bXgwcS6lCFg=:20qeWGzMrdmsayfMbfv9uK
 +GNQtpaXyvUisR4DxOPRbUUo5NCZ+CHnVRdOK78N8M7kmtWFny7j+tmbuJNy0820M1JLJ5qwO
 42PC3DmaVbtrnh0LHoqejnymuv80NA4WxuQ6MNmkmQ5/dKZr/PQ7/A00SXUJFYUTpZg4Qvdz6
 WFdjPZKdnUhJ4ERGKGakZI7wIdnd32B+TxsCFFZgIROxBngW8My/LKwPtetP+arEU3FRQa42W
 VQyw73mwjzRU7pSEtG1eHaBjHGvcN6HUWKC0ZUdLfaVaNIO8FeBy/v8c9t32EyuIZr2Ux+2jp
 z6dVtC7mwDxmeuPmcSBts9aYbz9dfo/PfnmtM0P2SvyVNUGpdM/D9EA3nD9cwdk0BNVlr0APN
 xshGWhwaD1gWihRcj+t7fU/5omoATBZeGUftdgUaTeOgsC0fK5Hh4IZ7JaO5zetg1eiL2X3JN
 +2CK0ih1qil3V9ZDHylEnf0oPAfcH/+tTIHYCbVcBNEYoz0WTdemnj4shmTezv9KduGTS91RK
 thp9LpXlFGmTAJPGXljaThv+A66JjTdcR1pb+EewNNYx9IQ3gWinmSP1ifPskY1fjomjbnbKO
 3FiKkFbBaaMjU7MVSMuwju2QfkMMJfAf/5TDMpL16rsoIjKeeBwR2tm2jLLO1bxTF77hwHS9J
 odQRJESpwXIa6cHaJCu/3sxqvRw9WH/QUDjZpTXJwy6P1C+A8yPiWe0mJbtwID6SNavZQbiRw
 qN4GgTrpPX3QrmEx1JrFCkCXbbAntiVGs4D0KZek3obZsgpDa4YMMJAXn8FA6occI4bxy+T4S
 sPB2960ds/mos/cD/wV5kS2GmyOOusQw6Q9cXUfkpk9X/pRgJxCV2RFuy/5N+ZP+W0cAv3cI3
 cV8NVq3WB/92s+0/zMwqXpGoJ7CDK2bJe618DF8Dcxid35ug0BQz4VoDaCuLO6okMyrqOPPtC
 msqDNlQRzO29V+8oDntbMGMnoQDQZh96QRFXs4MDVzPjpIbc2dQ8fAk74Fraz1hoODyDaNQVV
 TxassoaekFQcd2RAfz1HxqYjlAMXDFD44bwefhxHeH4vQt+hljNqvQkYUOUWT3zBzuEdUkBSv
 x/7jDLmU+zIqRwwAIXhlz3nMcHrmxUyxxF4nTKfGZjt3nGYxOnPg8bIJt9CZu0zT2vegOHHgQ
 aZfXCAjW/7BQVeVg5cBmTiibBdCCEKGMQuVYYgFrEZMNXSg7E8spqN8rF8jspSePDd0UWYnz+
 mdxGW+LlUGyNjfKJurxrpilpk4OqQX0mGyw73qQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11.12.19 22:29, John David Anglin wrote:
> On 2019-12-11 3:16 p.m., Helge Deller wrote:
>> Up to now we tried to optimize the ldcw usage by using the coherent
>> completer of this command, which operates on the cache (instead of
>> memory) and thus might speed up things, and which was enabled by defaul=
t
>> on our 64bit kernel build.
>>
>> But we still see runtime locking problems, so this patch changes it bac=
k
>> to use ldcw for 32- and 64-bit kernels, and live-patches it at runtime
>> to use the coherent completer when running on a uniprocessor machine.
> I'm not convinced this is the problem.=C2=A0 Nominally, every PA 2.0 mac=
hine that we support is coherent.
> Is there evidence that this actually helps?=C2=A0 I did a test where I s=
witched "ldcw,co" to "ldcw" and
> didn't find a significant difference.=C2=A0 So, I left the default assum=
ption that most PA 2.0 machines
> are coherent in gcc.
>
> I'm seeing different behavior for pthread_mutex_lock/pthread_mutex_unloc=
k with different
> glibc versions.=C2=A0 The locking issues also seem to vary from one kern=
el version to the next.
>
> I don't know that we can blame the two build failures of acl2_8.1dfsg-6 =
on phantom on a
> locking issue, but phantom failed twice at the same pwasoint.=C2=A0 In b=
oth cases, cc1 terminated with
> a segmentation fault.=C2=A0 Yet, mx3210 has been chugging away for more =
than a day on the package.
> It also built -4 and -5.
>
> I don't have a clue what's really wrong but I suspect the slowness of ou=
r locking infrastructure
> is what exposes these issues.
>
> I've seen one issue in user space where a pointer to a mutex got corrupt=
ed in apt-cacher-ng.
> If I remember correctly, the LWS locking code was spinning with a pointe=
r value of 0x12.=C2=A0 I think
> the code should have faulted but the thread stuck.=C2=A0 Had to systemct=
l restart apt-cacher-ng.

Dave, thanks for your feedback!
I'm neither convinced that this helps, nor did I tested it any further tha=
n just booting.
My main concern is the stuck kernel threads which happen seldom on the big=
ger debian buildd
servers.
For now I'll not apply my patch for upstream kernels, but will keep it in =
patchwork.

Helge
