Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B937F42A1A4
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Oct 2021 12:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbhJLKFz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Oct 2021 06:05:55 -0400
Received: from mout.gmx.net ([212.227.15.18]:58683 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233489AbhJLKFz (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Oct 2021 06:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634033030;
        bh=YmoezngSlXHUZdcw4xyOxVKYBO8zrV5dQyTjBY5u158=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=RyO+jnMqxiX+DcHQy0lWH5N/AEXn9hT61i+Co6F7Ws8X/bKo/2O31IzhdoBW2XXIi
         GY2qG33A7pgN09Dv9JO17g3PJ6kP+wx64e4ngrSNIURi7P7urEwmNshAhnV/FbYnMu
         /VW5XcGaQQQ/EZ58zhG9cPRKt/LCvhJi6KLV7OGg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.128.177]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNJg-1mEjmp48A6-00VTxo; Tue, 12
 Oct 2021 12:03:50 +0200
Message-ID: <7719ee9b-7e8d-7371-a93a-d53b6e992ae5@gmx.de>
Date:   Tue, 12 Oct 2021 12:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] parisc: add support for TOC (transfer of control)
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20211010183815.5780-1-svens@stackframe.org>
 <20211010183815.5780-3-svens@stackframe.org>
 <57e64e6d-88a6-7789-efa5-7e3bdbeae8df@gmx.de>
 <87lf30hdtm.fsf@x1.stackframe.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <87lf30hdtm.fsf@x1.stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kq+yAcxtguUe0yIxWMEZhdhFMF+K9CxAYf7X3vK/LFw4qjMDcp0
 /nR9liWMhmx36wq6Gcn0iqeFFORxcNYshbxt50lDRIc35tOnHZpMITBgNgUl83UqvmLNBti
 pc9a2a56wOohyaCjMKYvsZN7soqN0ltKRD9uaT/COwracccWPohC40zkWrGovjMFsfZtHdW
 2oWzVekw4zGVAbjLKGSaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9dN/hmN2cs8=:Yg+3jDJWumTnjNp2G/cQ67
 1yqPxKnd0yssVPdwgHYXCBRCjE3BNWckh3Y4u1aOmh49RtOkCeiEm5vcCA59Ejooi504vLLkF
 Nb+pZFz7fQo9E384bjwFYkLNPrcF8U6qemQKgNziHhkFZtkKbse5QTBHkLRMQHjcKJchtxWjE
 KRFPGI+BMopho7Pt4EwhWFx09ib5hzRNC9yOLKyOdDKnEaRZOxkLKxFXYhjGNJB0pQmi9rFpv
 p3q01UeeWUYKF2k6gPE5QiHnwKfMSAO6pPxM1VYl3kt792MBgcNQdxGBausFe2ayvWmH8K1kI
 ZCV9gzqg9+YeHVjR5SE/+h3r9dUD3imJxydbGKRFNwxMgsDnjlP3HWck19PtDZxnOyep6rFj6
 /FKFKKLNI7Wl+yjoRbV+VccZwGWDsIj3knjaAG7ftks+wD2BY1Hfd7mKoVa0Nd5TmaojvxUvv
 ofdLsfpzZlNemgwrdzl2gD2B/tlhVPQBQde1CTY6DX3PSvaPJXWkQk9axjWYA/XjhFJ8LCDWU
 hcKwiPkxf37cNpAP2U8ivxug9/fGp+oeEn7vO0n00sTu9iEWtNgfYZL0WMmisTqx7ViI5XFpl
 ukLCCeCDgJQxeDXntiSZD6g6zEAwHMnTp3y5omBsEaHHf6s26WwyhTFl7MjHi76TZvFk1ALj7
 2U1kpeqpMspcY7TnjoWE5z1tO2CuLGfp9CJ/fZhjhE1ADo01N5VVafpXI3B7jFC0neHFkA8w1
 fcZKdVGP4gU1I55awkqPU8vpNSTVr2nDpXJJ20Op+H279KLW5WkxzlpLT90Duiroi0jI9xUki
 9iwhHitBpWdnsItZcq01jnFaqDS3oa/BeQB+cNXZCzx3u0plPbtbEbvwB7pQY65rp2l6EDrSG
 78kD6Lq4vx0dG5X016AG7jiowDKQenmb6uPdsAxhy+QVshVdUUVm2XfC7Qdi6Z8gY7oorunA/
 VNRnvJHenD/eXt0NOMuZ3gbkK1UHbRxxbtcsYjpmrC+LNBHXVbvOVRhC3b+FJcBLLqufr/gYX
 /EGekjXE6IhL88YMHqcyVQNeVZMco6tvKcaaWTlYkE5ds5bR1FlRbQl/6lwDMkAdKlNaOxj2Y
 BbKIYoHIny8HkM=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Sven,

On 10/10/21 21:36, Sven Schnelle wrote:
> Helge Deller <deller@gmx.de> writes:
>
>> On 10/10/21 20:38, Sven Schnelle wrote:
>>> +void notrace toc_intr(struct pt_regs *regs)
>>> +{
>>> +	struct pdc_toc_pim_20 pim_data20;
>>> +	struct pdc_toc_pim_11 pim_data11;
>>> +
>>> +	nmi_enter();
>>> +
>>> +	if (boot_cpu_data.cpu_type >=3D pcxu) {
>>
>> I wonder if this is correct.
>> If we boot a 32bit-kernel on a 64-bit (pcxu) machine, then
>> I think the code below for pdc_pim_toc11() should be executed.
>> So, maybe we need a #ifdef CONFIG_64BIT above...
>>
>>
>>> +		if (pdc_pim_toc20(&pim_data20))
>>> +			panic("Failed to get PIM data");
>>> +		toc20_to_pt_regs(regs, &pim_data20);
>>> +	} else {
>>
>> ... with an #else here
>>
>>> +		if (pdc_pim_toc11(&pim_data11))
>>> +			panic("Failed to get PIM data");
>>> +		toc11_to_pt_regs(regs, &pim_data11);
>>> +	}
>>
>> and #endif here. ??
>
> Hmm, that's what i understood from the HPMC PIM code,
> transfer_pim_to_trap_frame(). If it's running a 32 Bit OS, than PDC
> returns a wide frame on a 64 bit capable CPU? But maybe i have to read
> the documentation/code again.

No, that seems correct.
On a 64bit machine even a 32bit kernel seems to get the 64bit register PIM=
 data:

64bit kernel:
[0]kdb> rd
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.15.0-rc5-64bit+ #1218
Hardware name: 9000/785/C3700

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111001000001111 Not tainted
r00-03  000000ff0804f20f 0000000040c45720 0000000040b6dd40 0000000040f004e=
0
r04-07  0000000040c1c720 0000000040f004b0 0000000040f14608 000000000000000=
4
r08-11  0000000000000001 0000000040c45720 0000000040c45720 000000000000000=
3
r12-15  0000000000000000 000000004111f020 0000000040fc7810 0000000040c3cf2=
0
r16-19  0000000040c3cf20 0000000040f00240 0000000040f00240 400000000000000=
0
r20-23  0000000000000008 0000000000000000 0000000000000000 000000000000000=
0
r24-27  0000000000000000 0000000000000000 000000000000f45c 0000000040c1c72=
0
r28-31  0000000000000000 0000000040f00530 0000000040f00560 000000000000000=
4
sr00-03  0000000000000400 0000000000000000 0000000000000000 00000000000004=
00
sr04-07  0000000000000000 0000000000000000 0000000000000000 00000000000000=
00

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040b6dd5c 0000000040b=
6dd60
 IIR: 503c0b00    ISR: 0000000000000000  IOR: 0000000000000000
 CPU:        0   CR30: 0000000040f00000 CR31: 00000000ffff55ff
 ORIG_R28: 0000000000000000
 IAOQ[0]: cpu_idle_poll.isra.0+0x94/0x100
 IAOQ[1]: cpu_idle_poll.isra.0+0x98/0x100
Backtrace:
 [<0000000040287490>] do_idle+0x1d8/0x290
 [<00000000402877a4>] cpu_startup_entry+0x7c/0x88
 [<0000000040b65ff8>] rest_init+0x220/0x248
 [<0000000040100ffc>] arch_call_rest_init+0x2c/0x40


32bit Kernel:
kdb> rd
CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-rc5-32bit+ #804
Hardware name: 9000/785/C3700

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  0004ff0f 10a03cb0 1079506c 109fd280
r04-07  00000004 10a03cb0 11e01d1a 10a03cb0
r08-11  00000000 10a06cdc 1090ea5c 10aa0cb0
r12-15  1090ea5c ffffffff 00000000 f0400004
r16-19  f0000884 f000017c f0000174 00000004
r20-23  0000000f 00000000 101c0704 00000009
r24-27  84cf5d16 109fd000 10a16f20 109474b0
r28-31  00000001 84cf7ca2 109fd2c0 101b773c
sr00-03  00000000 0000001d 00000000 0000001d
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1079508c 10795090
 IIR: e800001a    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 109fd000 CR31: ffff55ff
 ORIG_R28: 00000000
 IAOQ[0]: cpu_idle_poll.isra.0+0x38/0x50
 IAOQ[1]: cpu_idle_poll.isra.0+0x3c/0x50
 RP(r2): cpu_idle_poll.isra.0+0x18/0x50
Backtrace:
 [<101bd500>] do_idle+0x88/0xd8
 [<101bd6fc>] cpu_startup_entry+0x20/0x24
 [<1078f14c>] rest_init+0xb0/0xc4
 [<10102820>] 0x10102820

Your patch is correct.

Helge
