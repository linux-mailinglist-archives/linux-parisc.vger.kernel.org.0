Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1AD32C5CE
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Mar 2021 02:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345030AbhCDAYY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Mar 2021 19:24:24 -0500
Received: from mout.gmx.net ([212.227.17.20]:45179 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1445539AbhCCOb7 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Mar 2021 09:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1614781798;
        bh=U3UtW4o8gtjT+0Db6+hSZ5AZOXEcI35D+lDc4j5JuW8=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=FGj+PTvYL68H+IfyPosJads1Ez8OGwMbtAH8DbXAIwomj7xTRfx53P20u/ycdkmO1
         gt9uy/in3D/WLtrTBgMgTmanArFmdsY0xOZqd/0OFNUtMnuxFtmA3eFxlnPWGsrEoR
         GPco4+6bzfj3IuQtc7CisxUsheCUOVyyJKL6GlZg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.179.230]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqs0X-1ld3sV01mD-00mqOa; Wed, 03
 Mar 2021 15:29:58 +0100
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's
 max_cycles value
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de>
 <5693583.lOV4Wx5bFT@eto.sf-tec.de> <2570738.mvXUDI8C0e@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Message-ID: <69833c49-2eb4-5f6c-fdb6-a1e01d105a8c@gmx.de>
Date:   Wed, 3 Mar 2021 15:29:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2570738.mvXUDI8C0e@daneel.sf-tec.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WZ7pV6H25yjnpsOQYIW6a5/ZibVsVR5ouAnqWpFRLRcpDlSbTyx
 jpSOQisEJFMgj7AnTSoECpNthZFO9EeeIAv6ccNJkNwf44Hn3RIi2U4SFJyiGF8lQwLFT70
 cDr1eui+QKnCqzL8QA6/UlBAll0dnr4m9cqzYNSa+Yi+VIbw9s1FLUjve2bwY8S1ynUlES4
 RXQvfnGVxGiXn2dObVMmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Za32oq56P3w=:WaHKYug8EPFfnpQ9kP3rd4
 ShqXmZTwsjDRzdEHXDn8iYqBGwhL49/EsNMnB+GTgAO6x0bDtpXvq6pYTzEbAXt/k3/ZB3bHa
 pqQXI0lpopUQT24F5QufHinzz8cWXurIgyK4HoS3iLpwu2CjPAC22Q/6r6El2zro6c4k5UOTk
 boyn81kLL3W/0t86Xex2JZ1M6/4U0kP1slCUTtyIvU3fyI1dkzkBms6Dyulnl1BSXezRXxJ1n
 X/w81AB3cKuEeWfYjVa7XYkrYTAIeunnTziIf0s9HG4NfYxGRXqM+hv6m5gg66y198ujIScPU
 WMBWh+XPLfz9U17/N+Ixzyf1NhzJ54jJ3eafyLIpV4mgwSFl7UnJhSyM32Qor6tu5MKwFsVb/
 +ES5kMaj/PrQqEbS2x7yJSynL7FK5cuA15DfUt3AQiay7NEW9soKw/S0/GASye6zOoUkVnjLk
 QozspefHgIQqBrDRihyQWbnwk61wHVuEwaqAJHEP0DNg0ATzZXdTKzGXpSz81ekOKq67bpNnk
 xVCqkem6PAGedCdbHUi2sbEzVhgVzOe8xVJLUo9ktMSu6QOgHXFbnL2n70FOLeqZeOvBC6r1/
 RUZsO3VEET/YDd4zpkUJDFNofzeIDJIg/aG/qPQMmHSDm2H6kg8SMih1GtVjleeMnh7KS1ylh
 fZMRSMIZj4hitaamDReRz8bKRTqo7VmOdfEeWH71iQUgLA/q43M8x+JHdhCGLXELYv2Pf+wEp
 lDQDnTlyLpptmu0lLZ5ujVXb1p5LOaNMWYXdo4i5nR19rle8Amwfr8cFglgKnzzj0/uZPvlRP
 H0pNTW4Aw65nbHqzHX8LEz002zH7T1KDhnm8EsUXJ+8PjUryswBwje1l/sabhDkjVfUfuN+Re
 P7DMbr46v9he9Sg4WREQ==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/1/21 7:44 PM, Rolf Eike Beer wrote:
> Am Montag, 1. M=E4rz 2021, 17:49:42 CET schrieb Rolf Eike Beer:
>> Am Montag, 1. M=E4rz 2021, 17:25:18 CET schrieb Rolf Eike Beer:
>>> After upgrade to 5.11 get this multiple times per second on my C8000:
>>>
>>> [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger than
>>> allowed by the 'jiffies' clock's max_cycles value (10): time overflow
>>> danger [   36.998705]          timekeeping: Your kernel is sick, but t=
ries
>>> to cope by capping time updates

I know I have seen this at least once with a 32-bit kernel in qemu as well=
....

>> Not 5.11, but 5.10.11. 5.10.4 is fine. It could be a bad upgrade attemp=
t,
>> I'll retry once I have built a proper 5.11 kernel.
>
> Ok, it's there also in 5.11.2:

You don't see it in 5.11, but in 5.11.2.
Sadly none of the changes between those versions seem related
to this problem.

Do you still see this?
I'd like to get it anaylzed/fixed.

Helge


>
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay i=
s 25
> jiffies.
> [    0.000000] NR_IRQS: 128
> [    0.000003] sched_clock: 64 bits at 1000MHz, resolution 1ns, wraps ev=
ery
> 4398046511103ns
> [    0.106687] WARNING: timekeeping: Cycle offset (26) is larger than al=
lowed
> by the 'jiffies' clock's max_cycles value (10): time overflow danger
> [    0.106698]          timekeeping: Your kernel is sick, but tries to c=
ope by
> capping time updates
>

