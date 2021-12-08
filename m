Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F332246CEBB
	for <lists+linux-parisc@lfdr.de>; Wed,  8 Dec 2021 09:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244704AbhLHISX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 8 Dec 2021 03:18:23 -0500
Received: from mout.gmx.net ([212.227.17.20]:39073 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244669AbhLHISX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 Dec 2021 03:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638951288;
        bh=7K49l1Qu1HU7e0b5Cy7NTTYBaOfcTfCW7oqSNTMze1I=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=Zd5nAH1CJqmQRgB95t4vhx57bivL5wAlp+a/zNt3w86Y1lNdRy/Sh+QikVho9kZen
         9rIdJpm1JEg7zcIo8R6uQMrSXdbfzX59rsPBbHNXDDP16AzWS5iN9z4hlOt+8qZij/
         undJF5U+XFG786LvZgoC1jfDGp8uR6jTsTf4cN/g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.170]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYPY-1mJcX22G1g-00g28E; Wed, 08
 Dec 2021 09:14:48 +0100
Message-ID: <8a56f234-1126-e068-a70c-3b333320ef14@gmx.de>
Date:   Wed, 8 Dec 2021 09:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Your System ate a SPARC! Gah! in map_pages()
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
 <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
 <a5eef9c4-8e0d-95e8-0c3d-0d0052d8edae@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <a5eef9c4-8e0d-95e8-0c3d-0d0052d8edae@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dq9jpjxP0ZYBeVXgVI07hZiCUysklkDst3YPfDhcLwVqtr4Doed
 OFwFaNH6RMqtwD21ByuORVUbOzk2FdD5OrVDWVosfpoBabMBRUDN3Er3QSWB00E2xdky6Ny
 5zFtI3PwlFxgVdSKAhHvQHkvtdep9i7+DVgvzSxKwl04FFgtzU6GM+Ym/vhvi75e2msZfXG
 NuCHyUVRUrUTUX0trWQqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x0L7lCB8e7I=:NhIJEozlidyOaco9BrV/eb
 3Fbl6zrYpC2RBl1+qrOmIg3R9OFPawA7aTUgxr9/FsKo2b/3Gf8kqYeta/5+6db0CJ7d2Xstp
 JQD3uPt+UoG2Gp6UTV0qGLZzyCBWKvogx8evr467cES/1ddm87ats2nS7s2UjbSJWmfHGzu3r
 bs+X0Zdl9l9PWWviJ1ouuObXP+7kPmxptxcdqYVlP46nTotyu986HXk/BHKHIoyNoZssDYwBW
 hW6TiSUkYXOj8LCf2utWTUfapdV5X2mTe9iEAX5sOSekWn4AvCIgc06U78cSEmRzy5wiL+B94
 UpWpZkqLYbJzaYIIhwC/na96ANism4jsmLgdPIeoznhUdb+kABathJPZFwqtmcz6jx4rtWnqE
 9DtY9+H9D1/CAkdqBi4aiX6gGld0WI1BGQ5yVuXWYJvoS4VBGFyAB3DiPC4swMZYR8s88Rhal
 YaOWGDsIlUPKY75lHTQj2wEtudWfCnXaPk0z0dualI7AcaG2z/8ez9e2j3tXUKcc1ztK9F6JA
 Xu/eZ4v8KHBnsXj4VpFEOwsPHk9MDDAjZvzXsfL7eBz2ZnyDr1BoqxBwaI6ZuClZ7U5/1VJoC
 rdzeLfWCm/LJSEcotMJv6Zte9P7nqzNH6B8XDLDNzsctauwLrFS8YpdIIY+aIZRfDHWIvdtU1
 iMZZ7z1Zu1Nv6Z+uy1OnWcstS3o7y/P6SGk879JwUQ0OgzJwfJEchJ05C5C0yzaukUOWHdn3m
 D5YGdaKc5L8yT1R+DnIJLqa43kIDkkoq1FIxDHghjrCstzb28zv8xoGujg9Dkk7qmRDlrRmcs
 TlFkC82PMrTVB3pB6Pkum4mQIKSkWuhHpUhoNC3nMgQ6fa3nh3zJd5XwtXH8L02nL3Zfk3ypV
 OO8qaXR9gkEztdmVoWSzXXrDmTBiVtw9+mxGVssPo7xFm5JKR59FzAA3+t306o+JoREtE5xU2
 o+ilQNRdBruUhs3/p/VflOfAtOklW8Af5DSKX7momQS9eK3BRIJysJiAf5ircsON0rEGPsCIt
 Fm0ZfYlBhLvrvPG2pBpva3oo8n/+d2yVozYgdUH6fAPF+zSXpJHKOEVcu95U0yghliUjG5dT6
 3uC346Ejzml7lg=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/7/21 23:07, John David Anglin wrote:
> On 2021-12-05 3:46 p.m., Helge Deller wrote:
>>> =C2=A0 10574:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43 ff ff 40=C2=A0=C2=
=A0=C2=A0=C2=A0 ldb 1fa0(sr3,r31),r31
>> This IIR is strange. We most likely don't touch userspace at this stage
>> when the kernel boots, and...
> I'm thinking IIR is sometimes unreliable.  I see the same value
> printed for the tst-minsigstksz-5 fault yet the actual fault
> instruction was "ldi 1,r25".

Good finding.
It seems to be at least always unreliable if we get a trap 7 (Instruction =
access rights).
In that case the CPU couldn't execute the instruction due to missing
execute permissions. I believe the CPU simply didn't fetched the
instruction and as such has stale content in IIR.

I'm sending a patch to the list which marks IIR with a magic value in that=
 case.

Helge
