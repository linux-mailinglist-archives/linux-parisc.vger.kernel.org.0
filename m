Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6441066EF
	for <lists+linux-parisc@lfdr.de>; Fri, 22 Nov 2019 08:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfKVHSz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 22 Nov 2019 02:18:55 -0500
Received: from mout.gmx.net ([212.227.15.15]:51215 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfKVHSz (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 22 Nov 2019 02:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1574407132;
        bh=s27VaHM82b9bbNDFsNULKpOAMOd6DDlDURtNYa1I0ok=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=CkmaJE/HcGj89D+Alp9qNybjIF/Qz01H7VgMsyZOVnqtHqPmAtPaqycxi9a1YxPlG
         M65H3LEdkM688emIvRis1hluhD74+tZi8Uyx7tebWb2NheRMW1egBYAH+3SytRaBjP
         Tvsmg8MV8Au7VHN6zoKrdRZbihP4b/ufUncKlYyA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.191.200]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxUnz-1heiX71vGT-00xpVu; Fri, 22
 Nov 2019 08:18:52 +0100
Subject: Re: tigon3 firmware
To:     Phil Scarr <phil.scarr@pm.me>, linux-parisc@vger.kernel.org
References: <48306AD4-DA2B-4E37-B52A-050A02E9B565@pm.me>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <9c7f06fc-dace-5fe3-dbdb-be12d714fe4b@gmx.de>
Date:   Fri, 22 Nov 2019 08:18:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <48306AD4-DA2B-4E37-B52A-050A02E9B565@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4Tea7JxJJjZ+Vd3ZYuS03PJL6U6XVTqWSIsHXj1Ih4+RYLugR0c
 a8dvn+LPdHzWMopavbRKLgtaPEqrMhR5KpBSklxkeuBSilAF6naZp/NvNAINxfzRG0fiyyI
 AHMPgDljOu1t3GT6Rp7N7qkfkP8Nvl1XoW+hd9znBLeowBBdwwkV8bRnQq2PvPxKUWYmCk5
 gFjaoqY9zTf572VwZujGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ILuARxDuj0E=:xombOT8gl5hIUQ6KON92cB
 NNEA5Q/n+9tPavP5BXVBPUfdrTutYl/d+IVvikZGZRhBTI1r9ky57YeyGrZSUMyklylIpwkCX
 UV8uaNonPQHyTI6tPyrIHiwCSFEboGxrARKAxPYCOoD1zgAJjGOaxZPqjdcTRV6SzQzhdTNxZ
 7KAIW+wEYtnWUgZbRsqn70CaPZKSSZ47OVciHvI152ko1lzCj9JMnaFyaAIWey3WtvHtx7ynk
 LPqiFWLBxIfHkVVdVXl+vomMRvvb1zA8Rupvi7PNS8SD4QNh6n2Mo6j3I7sIfor4FD5++odkB
 XKw8SxNbExcYzwoyr3Yfx2Dr95LX/pZwfS7gRe5btLs9ViXk7TMc7hQi6SxHgGUa5OGa5dhd4
 gSOlxJ6m7TDNiB9ZCLN6fFn39du452GoG+smwHd1iUhYa+mJsVkiaK3fL1CLMFMJyZPbsrast
 8lKqKmrbDtuETsDL4nX3Twopp9ctaLXf0dDz0/jtgb7lWFewAixatMehKQFkm6c3WDwz0THfL
 pDQhg136wnF7bhG0HbwaiKzYRS2cuKQn2VH55zJrADJPf5q5Y2ebw/7l+DowvtA4bsxp2bKA3
 3mX3XfosMvMdUsdMy+Z73wUdcSAARRiU97UmaxPs0vUy3jrbgqbgB6xzsIGcEffKeFaW4wNRe
 lUDqjJOkiDrCKmTOHck/S4BzppjhKNf3NGsWQq1F+doxHznnqFonpQLIp+kBdb9tFYa2REs9f
 5R/UbC2+qzkKa9zwuZKHWr0Ay6QyP/5NwH0xbr4snPUk/m1tvTnkElf+g1FIKmiQcHLIumOMc
 dNb5hZo0yqooE00ktF2RVZbnlHclplQGvnbwQOGn0cFanfq0HXPS4KQohPmxlt5WOiRb9uJCE
 haIJ6HHs1P7q2F9EJO6g8pKk8SefGl0gt4UnsTRSOO4VYpxzUv5jVGVv0sUGYbDRqQ76fyOWO
 L/eGU4hW+um1cRuqBTDkYvLThcPEVd3gnAnnSuFrdDgnKFOnjvaAO5cz4Aye4UGXNLfS2u0aG
 KSEjPn8guQLuL1pcRJZGPhCl/tGR3dxdn5JQFUxBMjPAvt9snIU2sV7yUwKebh0ywHQ4XeEWB
 8cJ3rtHvjm5B22pyb9gUxvfLE22r/iRjj9oSyq6j8SEX3TYnAbaCVcb3vFMh1z0FYZx7+VHc6
 AMNQVExuhLTQY7rH+LPuCEE3PCKbQKoTzZOGcMXdPC/n+HoSClljbkEaIAFTAlYIFl4K4qqIN
 kFA8quZBGjZVh5Oouwcj3dwDlDrj95ixizGOO+A==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 22.11.19 00:30, Phil Scarr wrote:
> I=E2=80=99m getting the following errors when the system rebuilds initrd=
:
>
> update-initramfs: Generating /boot/initrd.img-4.16.0-1-parisc64-smp
> W: Possible missing firmware /lib/firmware/tigon/tg3_tso5.bin for module=
 tg3
> W: Possible missing firmware /lib/firmware/tigon/tg3_tso.bin for module =
tg3
> W: Possible missing firmware /lib/firmware/tigon/tg3.bin for module tg3
>
> There don=E2=80=99t appear to be any nonfree firmware for hppa.  Is this=
 expected?

Yes, don't worry.
For the built-in tigon cards in the hppa boxes you don't need a firmware.

Helge
