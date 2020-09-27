Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E2527A2E7
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Sep 2020 21:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgI0Tul (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Sep 2020 15:50:41 -0400
Received: from mout.gmx.net ([212.227.15.18]:52993 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgI0Tul (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Sep 2020 15:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601236231;
        bh=S4aqp1OyAd/ZxjZF3/hNkPffFT8IFkKLEFV3utsgLPI=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=dHREeIKnYZIF/2DJGZWS5soF4J+FgKgcPIIHR553zRKo5JGOvJEeGunuD5wVIORRx
         kvid2cv9CRuJsLLBSQ2fq2w20WoFEQ+nraJ3f5reGMa2N3ogrgV6NiGCzAtkrJXS8W
         tFndFQnPyhfcOfEBo1tjr1jBrgYOFHyfD329WVGY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.189.180]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1kRcRM08mp-014xRK; Sun, 27
 Sep 2020 21:45:23 +0200
Subject: Re: v5.8.x stability on parisc
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <bd1c6298-db1a-79ab-279b-60daad6bed22@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <387e5574-a270-f3cc-d0f2-a26d0383b7e6@gmx.de>
Date:   Sun, 27 Sep 2020 21:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bd1c6298-db1a-79ab-279b-60daad6bed22@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/UAi6UQtFK0MTW1X5WPRfgDkpo2hE+1Gai9sbo/w+NpxuoeTZ4Z
 7ZNM2ndmjFeQNxZcC6VNLSRYz7H+662pNvJWEKuZehMkyl3T4lRLcxufWRt0sxmiTe6RHUI
 0wnsR219Q8d1er1KCm4R4R5hpYH87PiqjHa7J3wNXLhNz+aszTjjAiIsZ2cX4CWqGbbLEHj
 FMdw0OOwgsBnDujEG2kWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jo7jGqJsS7A=:XTKhytMkPCcn1SJlRMYOMQ
 xVvuhAeTuJVKhWkZs3kU/VIJba32a7uWfFVycDreuo/D7v7sVoFWh1hDlq/hCwsqSnj6tF44q
 b/tG196IRNvoLlMGuPMwmpTFsFHsJRKoecY6JR2E0xiIo5/jqO96Sy3K04HytlqFe6MynLkxh
 nch6fBqdTAYASq/H4N+KQxObBdDmXhiSAg4Z+KEg9BTj2bvnJ5DvSgL0eoYoJTgxBT3oc5wAa
 dJD8OccAVK0gCGFIoCmNO+0AtwrUG4SunyAXOqUloCtEnBTjQghThJ8z9egkNxwDiaW/Tv6LT
 UCjYEPTomtBRbLWKRDCUisEP2Z/O/19PExDHiL1juQpg23YUpgNLlfuIAwukioaUm3yLH0rr6
 Stt1JdlVQkIOacr9c0L9s6+B6bT5OePvGURJlzT4n0eBdJw69cME6QYzSSlamhVoll3YfDFcg
 IlvHcJBxZK5065VjR+JDPteUtdybjqkx4Oz9RXLLqMk2CCvZJjzLghWjPsiaqbU7KD3G/yoIJ
 jvV34U6z/cgGMHt3kccIYR6yVlBJ2ErJ0+6i7KNmmmWoJsK8r4m9Fw87kX8D1ZCEAoWiSyn+s
 LLn4vasp2kzIXG+vvSyDzOnf18RimfKc9Ru6h98YCcRpbkaqicAP5Ijc1oh3rJRJyZwCAkDQB
 49JoAgzG1nK0P8hsSNr3y3Tgeiy1JvwIvcLxle2FJk5SDhtc5Ig2f9rmrlEVFtWVe6ZZwdUcM
 ZxWVyAQQ6QzCM4Kh8ggXnjb6m4RZT4IYClspgcO0Juj/m1orNO7xaMSotRtUVjc/Gcac/gmep
 4HAo3YLm0mf94OojrpivV/HA6IQaXCZg1YKhyACuBMHStGb5zOofMq52cJ7jKM0RzlQyNqQKO
 1IzvnhH1xenIMCI9UmYh1/ML71VR/VPMXqvPpJTdO1YJQ2p83r/MWOPxdsfnBydegrW4aB+Dt
 ltDLb5WTIzEUewvkaubuEulPDFfnePJ6DCKcycFT347VsSs5rZy9yiIlChIJPoT+1ZW6IOFwE
 SLfK3npw6w65rrusYL7fWzmjgIYCOKMPsrcw4XuoWta9ex0JZHa1yhvSFivJOTSFkRz5eybx4
 xwiRFmzieO/0LQaYC3hk+F6R5PyT1ag5EaVFqloP/7tYKltSfedr3IIRCeKJM7DSOufH1kdlD
 5eUaKoCDJY5XJe4bzavGgEdOhH6WJA++vy3CCZXO4TRMln1QzCGuo550801ynjxJN8QMbhIeJ
 3fURWm26BoQlf/pHO
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/27/20 4:17 PM, John David Anglin wrote:
> With this patch collection, I haven't seen any stalls on my rp3440 and c=
8000 running v5.8.x.  Further,
> I haven't had any signing failures on the buildd machine.  The rp3440 (m=
x3210) has also been successful in
> building several packages that failed multiple time on the c8000 buildd.
>
> I think this is due to the three changes at the bottom from Linus.

Weren't thos added already upstream (or variants of them) ?

> diff --git a/arch/parisc/include/asm/barrier.h b/arch/parisc/include/asm=
/barrier.h
> index 640d46edf32e..c705decf2bed 100644
> --- a/arch/parisc/include/asm/barrier.h
> +++ b/arch/parisc/include/asm/barrier.h
> @@ -2,11 +2,15 @@
>  /* The synchronize caches instruction executes as a nop on systems in
>     which all memory references are performed in order. */
> -#define synchronize_caches() __asm__ __volatile__ ("sync" : : : "memory=
")
> +#define synchronize_caches() asm volatile("sync" \
> +	ALTERNATIVE(ALT_COND_NO_SMP, INSN_NOP) \
> +	: : : "memory")

I wonder if this has any impact.
If it's an UP system, won't this "sync" just be a "nop" anyway?
Did you ran some performance tests, just to check?

Would you mind to send separate patches for each logical change?

Thanks for your great work!
Helge
