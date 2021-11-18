Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DCF45637A
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Nov 2021 20:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhKRT1u (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 18 Nov 2021 14:27:50 -0500
Received: from mout.gmx.net ([212.227.15.15]:33491 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231738AbhKRT1t (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637263483;
        bh=PCHRp6HKjaHFBXdhsJYUC5fCUZSIW7xrUZewx+paN6g=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=i9ICngPo+jc+wZNCbv8qjffaA0XFoOVLS7EOoUc5Zlxx4JCuF/X9GJvWc8R7irao+
         8Suc5Ty+NU+Wz43NISHWr+tG3rXjnXVIypCyt/kG1/hesKyEqCjYHUgoCW2TYevhM+
         2d6Zu0+a90SxEFG5oqELoqQiWdJ+GL9N6d1FOjiE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.156.59]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4b1o-1mm9883rU6-001jzh; Thu, 18
 Nov 2021 20:24:42 +0100
Message-ID: <bce8449a-1bdb-ccc5-48cf-09a2a06751aa@gmx.de>
Date:   Thu, 18 Nov 2021 20:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: Fix extraction of hash lock bits in syscall.S
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <df51e873-4576-d4c2-7d86-b607cbb714b4@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <df51e873-4576-d4c2-7d86-b607cbb714b4@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QQCmPpkJ/fNVu9X/lB5hHXHuYe+yFxyHXkhJ9jvyglIyebB9rCS
 pY/HD7OI4vMVARFBYDvQ0O5kb9Bqd/MEJLS4GT4ZljU2zEdI0rPseUzXdVqIcVy0LKTpqFV
 Jxlind0Z5ked5YqtY5Cw3BDvYoBMq+rYKkJljc4QOvL8AQrfjDVmcfuGMkeiry+G4jbPTnS
 gZF0UDCSwGjdzWXGRJm7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G1iphrERinA=:n0aF4YM2yQiszpTVpV8UL8
 0sUoRXpiQKaOHABovbL3k6XIptQQM3IDDClWulnaqrMQGBfQolnZRsy6CnSkX4TlCG4HSS2nL
 PO/PC1lPUuvD2EaLhcT4coHVoHlh6F2dq71A1tgi804QTWA/EsnxHUjNrMXObMHF2k9nkLodO
 VfwfkhEC83UUUcnHDhbxVy604FbyJXwK9HAUf+M1kVvcUL8Pq34yBkoQhQIQ4tVhNn5CUTVDF
 7eZGyTIXiKQqf3KDsjuVAYUZsM/daCACh0lQ7yf1Gtakd4ZzS+hHlrVFQzHKs742wuWJXTAKl
 90O10dmMndepBN6QVThxrKYWfbS5ZtIjxtHO5pT1lMXogyQXPJYMW5mf4XhpOJJcq2lphRdA5
 Wr8TWqKGBQgTbjWwJOI8LQe6XTUTzFltCk4GbqEfMwQTgRANFVMI/p1vaqHemrnMUxkowQQKR
 OMN4MmpMpM/AUafBgiM7hnkE81onM4qWC3BfEoeG/j5FaDSJ8+aXXvxFpg0Vf+NFkmqmFXfI/
 1YumNLTk7O/a6Fyfnh6QUrdluYkzIgHl39RtWxJMEYM/2s95KsPlG5LFX1mYmZJn4N9Dst+sC
 aCjH93PTHK8bNihLOhwWyPraMm8EHAQou1wVy8ed9SGOzdn4MCCfiMzUaW3tOSiCaIZQXVWUg
 9RJrC3/ZqUueib7/8DCHCWWXsL3gWHHYTMOmfdu0LF/H1QIgnAchXPM0C3iSlkUnh+wbefNl/
 MAdQGDGz1OQyEeAI+U4Ntb2ymU4m0joRdVCV9OvsZ5dISk9hpoePefoVpneKwsTR2A6YFtUco
 wv3p6kjgueNlBCYuwm2OnOmwDHS570SeZxcD8ytR9UFqtZ1x1hWr/x4zFTEOFsgNeQBJ970FZ
 SHYdsfgsccYhPGONCGpOimjy4pQW8rmraGTdWId0jVgGk8kgYZ7VjpHGVBicUZ+YYTtBN6NGI
 zuFFpnELU6VbhLDaOyWFzCvVcbkJ3VwUD/PNYLprejAMJum5k+tvmMpTwwDZB2f5liWSlKzmi
 Yv5SpmKBicYHXuwBuqPT4DJAORqUdAnb3rDDhbU8RWybZUazb0Lvz7Fi6Vlr4ZoWKDwZDtWWj
 39WjV7Z7kkD8h8fXh/cScIXg4Ekm06PNMmgy7U+EPFKXszHSFAqIOLYea0YqUK/NlmFV78G9w
 j7zUDWyOI0D66meyVSogKmr/Sq
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/18/21 18:03, John David Anglin wrote:
> The extru instruction leaves the most significant 32 bits of the target =
register in an undefined
> state on PA 2.0 systems.=C2=A0 If any of these bits are nonzero, this wi=
ll break the calculation of the
> lock pointer.
>
> Fix by using extrd,u instruction on 64-bit kernels.

Good catch!!
Did you checked if it actually happened that the most
significant 32 bits were non-zero?
If so, could this be one of the reasons we saw strange
issues or even memory corruption?

Sadly I sent a pull request to Linus a few hours ago,
otherwise I would have added this patch...

Helge

> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> ---
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index 3f24a0af1e04..3f70528622eb 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -572,7 +572,11 @@ lws_compare_and_swap:
> =C2=A0=C2=A0=C2=A0=C2=A0 ldo=C2=A0=C2=A0=C2=A0 R%lws_lock_start(%r20), %=
r28
>
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Extract eight bits from r26 and hash lock (B=
its 3-11) */
> +#ifdef CONFIG_64BIT
> +=C2=A0=C2=A0=C2=A0 extrd,u=C2=A0 %r26, 60, 8, %r20
> +#else
> =C2=A0=C2=A0=C2=A0=C2=A0 extru=C2=A0 %r26, 28, 8, %r20
> +#endif
>
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Find lock to use, the hash is either one of =
0 to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15, multiplied by 16 (keep it=
 16-byte aligned)
> @@ -762,7 +761,11 @@ cas2_lock_start:
> =C2=A0=C2=A0=C2=A0=C2=A0 ldo=C2=A0=C2=A0=C2=A0 R%lws_lock_start(%r20), %=
r28
>
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Extract eight bits from r26 and hash lock (B=
its 3-11) */
> +#ifdef CONFIG_64BIT
> +=C2=A0=C2=A0=C2=A0 extrd,u=C2=A0 %r26, 60, 8, %r20
> +#else
> =C2=A0=C2=A0=C2=A0=C2=A0 extru=C2=A0 %r26, 28, 8, %r20
> +#endif
>
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Find lock to use, the hash is either one of =
0 to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15, multiplied by 16 (keep it=
 16-byte aligned)

