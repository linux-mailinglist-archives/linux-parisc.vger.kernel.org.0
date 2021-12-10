Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2BB470C4C
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Dec 2021 22:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbhLJVRv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Dec 2021 16:17:51 -0500
Received: from mout.gmx.net ([212.227.17.20]:51245 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232957AbhLJVRv (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Dec 2021 16:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1639170850;
        bh=QxmfonkN7D2KlArFy0Uix8oXFK3H5XaR1w8zTn+SQh0=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Qcw3uEjRu/J/hQua43hTfzGK7sB700+ulTMxZqlSBy11FzQ7XqYC6wUgeqHmc+pyZ
         nfEcgfzQHxOkyOWxEEAgtrtFpNV2IPFD+H5RnZAzmOLzPk3TzDyQSBdL4L6mMIIVke
         uLVKaUw7CaLZ3/kjpWgqon3iIMegKzWVWC1fTq7Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.53]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeMt-1mzLbG3ZX1-00VhsJ; Fri, 10
 Dec 2021 22:14:09 +0100
Message-ID: <970b7b0a-eef9-df91-e474-e68dbcc3ae25@gmx.de>
Date:   Fri, 10 Dec 2021 22:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Your System ate a SPARC! Gah! in map_pages()
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
 <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
 <a5eef9c4-8e0d-95e8-0c3d-0d0052d8edae@bell.net>
 <8a56f234-1126-e068-a70c-3b333320ef14@gmx.de>
 <87fsr0s0cc.fsf@x1.stackframe.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <87fsr0s0cc.fsf@x1.stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nlPB7M1wvBly2nrLDAhFyNBxTpb/qP7WN2nx5QIPphhC6RbtsNb
 YQFTghGQJe5a2jyouFh64HXmYnCWgwhtW1ESwk+v5AvYMLzGIQgHbgbb0gY5jX0xmcRouzR
 AKvwNj3Wxv6VaIwVJepCcGC2OPQmKkufp4ogWKcVNAXRL9ot1dytXXEExZw5blRFuENVxSY
 9EoNODvsby+vNkdjUDpIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bn8Wb79RzJ4=:QOX+ZbppJMP7Auuvk1zVFp
 XOQ8F82G4VQ+hr2LLtZ70MYUscR+sJMdIVW07r/jw/CxmJni1Bu74VLuj5+4WOowKErjqcnpa
 Lz+Lw+mgJoXZXzzJOOlynyeH5SvRxU7gMjeVHE1NkAGGcwKBVRr6SLEZIXidEG/G+1NF4LXyY
 EPV0LhgjEaK+aWYZ2eoqHjAPpYsWLlGRpljhls4Ld/DZZnJMPJNlnpnyrEZGSrC8vvtlHbNQi
 PLR+u9Hcly+taSMUUeR3sk3vF5iCAWbxJdigHA0xvJ3CqVmA+Skm6vNn7XmmyrjHVhBkddvfb
 gdwjNtNVQYy9MNG5oqKDOotrh5J8JwIIKmiyKKWaH+3FXHdIJWaZp/mzRaqGv+G9KFrAg+kc+
 srFiYZZMD8PWkPSvtAjKppTnqQSOalo/t22qCTH8r1EIr+/bNY6vtvSR0SddjtSFzFhP9Y3ep
 ONjft/pP1gD6k9vRlL4R3bMRqde9cPFmtsibc2mafiI7oyr0WozxD4b4SzYw6umnoO8+1Mdwn
 oUjur/CawY8b1SFDA84QN9da3X0AtsKJW8bMLTFuZP7FXR6DFxhuhIYzmtFMtEL5CJyNA6oqG
 t+jMU/uHP8Mj1Z483XSlmu6SGZonBEeGeh80U56WeOfyrbwJmRD7OXoeiZy1tNBuIAqvylXon
 WJbv4TlEiBhmQX4/4tfob4ViZuSsnOOxdsaVC5Q5LRP5e9q7CEkZkc1vt6OifLCbGenTS+Vwq
 hlkIWh1VsEwvGvkzWATANA/OzmCsq1e/uiOr1mb6+vVSICo9ul4IhydMwGwAriVzhantdzjt0
 r/5d1+JXkVzbdS77aK0mbTlYVfF8NDvCR4EeizO0L7deScMsz7KTZs4C6kQsRTUKRr/zkfN2C
 VfgrBJok0xneRzpReYVSwlufe/27ttKL8NNSgXgAfULQ/Q3pMdT6rH0tsWZvOFqU9VA5kX+pp
 aRBglfnU/NzFURCoPSXerFIpNIRyELII/9/7SKFjFSbICvZf+Y6YPY94sqDUJYLkIJ5r1s7dS
 yxrOwwnC2SOEhFh4wH2cy9Qx0uElKwWUUFE6PkTYPdzjzS3WBpk7tFHfm42+4QexXKbZ8Ydgj
 gQZp0RozB2I7UM=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/10/21 20:53, Sven Schnelle wrote:
> Helge Deller <deller@gmx.de> writes:
>
>> On 12/7/21 23:07, John David Anglin wrote:
>>> On 2021-12-05 3:46 p.m., Helge Deller wrote:
>>>>> =C2=A0 10574:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43 ff ff 40=C2=A0=
=C2=A0=C2=A0=C2=A0 ldb 1fa0(sr3,r31),r31
>>>> This IIR is strange. We most likely don't touch userspace at this sta=
ge
>>>> when the kernel boots, and...
>>> I'm thinking IIR is sometimes unreliable.  I see the same value
>>> printed for the tst-minsigstksz-5 fault yet the actual fault
>>> instruction was "ldi 1,r25".
>>
>> Good finding.
>> It seems to be at least always unreliable if we get a trap 7 (Instructi=
on access rights).
>> In that case the CPU couldn't execute the instruction due to missing
>> execute permissions. I believe the CPU simply didn't fetched the
>> instruction and as such has stale content in IIR.
>>
>> I'm sending a patch to the list which marks IIR with a magic value in t=
hat case.
>
> The same might happen with ISR and IOR - i wonder whether we should take
> a few bit in struct pt_regs, store the interruption code there, and only
> display the fields that are valid for a certain code? pt_regs has an
> unused pad0 field (at least i think it's unused...) which we could use.
> What's your take on this? I would prefer this over some magic values in
> the oops output...

It's a good idea, but do we really want to see such errors often?
So, I think it's not worth the efforts. Showing some magic "baadfood" is o=
k for me.
But if you like you can code it...

Helge

Btw, it seems I currently have vDSO (32bit) working with signal return cod=
e :-)
