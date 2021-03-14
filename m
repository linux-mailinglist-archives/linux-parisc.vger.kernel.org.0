Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B04733A486
	for <lists+linux-parisc@lfdr.de>; Sun, 14 Mar 2021 12:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbhCNLR1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 14 Mar 2021 07:17:27 -0400
Received: from mout.gmx.net ([212.227.15.19]:58295 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235115AbhCNLRC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 14 Mar 2021 07:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1615720593;
        bh=SUPmWCtuh0yjnQfAJn8q88caDuLHyt/axn1UyiS6pDA=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=KDmWHZwmIvbh3rRHLhVq7a3zFfDFpogpRG1TkjKP0tpjC8xboQypPAkYSRggiF7A5
         zc5i4ST99cTIZ93/vzybQ49lGVRs+HDwHEmsy8987G6c44plfZB/QVy9Il97qkIiXk
         2hgM/7pzv9VdBM5MfwLDcTOElKPxpNd7WRK+4vtg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.28]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeQr-1lH9lL41pr-00VcyH; Sun, 14
 Mar 2021 12:16:33 +0100
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's
 max_cycles value
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de>
 <2570738.mvXUDI8C0e@daneel.sf-tec.de>
 <69833c49-2eb4-5f6c-fdb6-a1e01d105a8c@gmx.de>
 <2573804.mvXUDI8C0e@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Message-ID: <dc93df38-d2c4-362e-0e22-b8885509c2ea@gmx.de>
Date:   Sun, 14 Mar 2021 12:16:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2573804.mvXUDI8C0e@daneel.sf-tec.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HSF2RMJNhkfz/qFSS7vv56XK1qc89BGsIL6JG9b1Z3Sdc6MEPXb
 t4mC+06pfKYuWDnCjKpWShHO7NMQOvQMe0sw0WtPNuvd9owumm+U5+RE4SuRsaXExSs86D4
 sLr5XiRsCiEsEu2zg7DgYCwqyLk9cHy33CdVQrj9ZUij4D235+5bXI8uGvMXX2FOFhW0tRm
 ztvYNR1YytRf58F+WzAXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QWVoEcvBR0E=:AEk5kkkrvNjpCiqT4YqVeQ
 naaIQjAaAWvZGJ3xFXbdjOo5ZQJbQRpboOyXXVNC2BwkdYQ8tpKAyYnNk/f6xxNOD0TcI3kzp
 cAa7wvHvh+fhjxvzTBcqL4p4OJnywh2TRIucH7v/xQ7gLokORUbnXRzAnWxKlCQNGsaR9XIJN
 SOnsEFPoLezxdxTbq/NCd2WkLHNdiF8xIC1O+s5bn/MOa7Jp+7C4aQ14mF7DPf4PCbM5wqL9L
 s2oHk/b5uj/TiKfzmC46wGWnBX5uGzRLWTpciIT0hysMou4iu5JOfodLP7X9MSeADai1axUgq
 XWoy+U3qHqfXhQPRtmukvQkBMD9oTPRQfbHbe2PhgZk7VdIUZ54hWXRisMPzJbfqoKBwOJZuh
 xEuO2zsDSGQVQFPOD0y2sQhAMPMuxYYuFIoLrBHixf7GuAqyVwXhCyaf4dRyhDQn5b+DCG1kv
 8gDrmIqTSbDPEXZ2cAWxRIGVHAo6RqHdUzg+3GwVYTKwL99/Ja/y0VSKaEdeZ4zj0AJEqCgaj
 wPoYa/1HakhQaiT/1jwhIr/96HfnAB7ETWWDqfxtGfHendoxRE3iHCJeXLgyyS5QV7Tfei6xq
 jujF2OozPPHc35mg8/aTA6x5vALSViH2/ynYUj10sJX/SxhROFBy8m/PuBQZ1k7A7vC+brab9
 OWbiRyMiNciqDersSgkzRUI3OOl28GjctzGUu+YgW4GUc5yzhcPRwpJiJU2v3+ZaVFHqyR14T
 JWUcvQw554qpLUS+wBEdBhOBHf8lrGPdi6JiHW6vDQ6wSmxDWOCKiBME/zqaY46oxrrNjeANf
 SpPACFpmikjKE2ESbm9gk0eVpzsqMqIa6f+c/oNbJ6VMx905LxGhkUkyEwPCf5RpXS2cZOdvf
 iZuz19dzX6ac/2P2zF4A==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/14/21 10:47 AM, Rolf Eike Beer wrote:
> Am Mittwoch, 3. M=E4rz 2021, 15:29:42 CET schrieb Helge Deller:
>> On 3/1/21 7:44 PM, Rolf Eike Beer wrote:
>>> Am Montag, 1. M=E4rz 2021, 17:49:42 CET schrieb Rolf Eike Beer:
>>>> Am Montag, 1. M=E4rz 2021, 17:25:18 CET schrieb Rolf Eike Beer:
>>>>> After upgrade to 5.11 get this multiple times per second on my C8000=
:
>>>>>
>>>>> [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger tha=
n
>>>>> allowed by the 'jiffies' clock's max_cycles value (10): time overflo=
w
>>>>> danger [   36.998705]          timekeeping: Your kernel is sick, but
>>>>> tries
>>>>> to cope by capping time updates
>>
>> I know I have seen this at least once with a 32-bit kernel in qemu as
>> well....
>>>> Not 5.11, but 5.10.11. 5.10.4 is fine. It could be a bad upgrade atte=
mpt,
>>>> I'll retry once I have built a proper 5.11 kernel.
>>>
>>> Ok, it's there also in 5.11.2:
>> You don't see it in 5.11, but in 5.11.2.
>> Sadly none of the changes between those versions seem related
>> to this problem.
>>
>> Do you still see this?
>> I'd like to get it anaylzed/fixed.
>
> Me too. What do you need?

I actually don't know.
First of all it would be great if we could reproduce it.
Right now I don't see this issue any longer, so I have nowhere to start fr=
om.

Helge
