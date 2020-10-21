Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36B729506D
	for <lists+linux-parisc@lfdr.de>; Wed, 21 Oct 2020 18:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502851AbgJUQKz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 21 Oct 2020 12:10:55 -0400
Received: from mout.gmx.net ([212.227.15.18]:33269 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502848AbgJUQKz (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Oct 2020 12:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603296646;
        bh=AEPD5Z5MbcCK65yWad5BCFwERYzscaoOQCPFU5EnekQ=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=WGVZVjne3KJ8jk5QpUxC+WMAMdmrqqjLzdCXgI3SQTNaJrBDdYAjMv9ZZ3uQ91yYS
         nGw319sv9WEQe8XgOf6wu43imwWpvZ+2pQF0RoftHwPcU3P/rmtibIef1QxKCYWV19
         0WbISU3aXqQ1OitOIjNmhjSw3kH+N4HVk4rsMlzE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.237]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKBc-1keedI23fu-009Sc4; Wed, 21
 Oct 2020 18:10:46 +0200
Subject: Re: Kernel 5.8 and 5.9 fail to boot on C8000
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
 <37ee0636688c782a59e8b50eae5c41b96926e7ab.camel@HansenPartnership.com>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <bbdfecf6-b13f-561f-82f6-1f5e594e02b2@gmx.de>
Date:   Wed, 21 Oct 2020 18:10:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <37ee0636688c782a59e8b50eae5c41b96926e7ab.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YiMakezp/AgNtIgpw5kEx7OAk094fi5jQXjj+9vGAOkuWhQCPfd
 1b5q6sYfOt4rdjsF3pkQBg8BvIkkgP7YOYbRV5vo2zRmLxJ7UDg2nj4IGbt6Ekfojly5etR
 whN2XD7MyXRV++dtTO5HJ5m/H7DJw/7S/mR4MQDFdoSVgekeWxXW8o5amTw/Q6ZPrqJiAl/
 UP1k8d70Uh3eyUk2+uaag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:47w1Z/RE/uU=:Mh3SYhkfXinAVIs9xJXY7o
 V1+kVfDz0mbGwlguOroj6wD08SHD+JUGhg3Z4X7KTYRokdP6ag9RM8iOaCCcOGQ5tkl8e2Zxf
 l4J62nV5y9h6RFunTT3nxaTXSyoMw5jEaIHrhX3c5PYksv/8lUAw1jPITzC05BbP/3DXmonTJ
 wec+gFJiggZpPVPykO/0/No8Uv5TRzz/aVuUGCNMUQqgDlLVHQwM+4LfNF6/WeN6M0DnOC4mf
 1H+FxfaRSQcpl/ygTmb5IxpVekJfoNaH374gTvtDKt0BskVQtXcLoIR5LIk2eOXkJFbq3yaBE
 aquousXtDZM5KwdPOlkihTxSQSE5IL0H9dEvv7gaOvBUMqwdcZhqTHx+UyeANRBr/ZiLP3FLa
 9xSDy6RwQLDKk7twJyS7Yeqj2fTxaqG1gTMEWdgTZVhNJZORY9ZNTVVj16xu/Y639GwdcRhZW
 PdY59onx27rJOmql5YbTNMmadR+dvr2TlAyZTLUaMeYW6J13UryYgoO4FnyPHIpGLSiwhXJbp
 FqC2v00HjKEtgWFY5inMjphzkvFR2lEUfcDAycJDcL+ixgGW6w+xOTmARfotpcZe3nfO1Ta9/
 DaeHIJAztRp7znBPSQ2pqXKTjXc40A9lDnOh6soEATY+GkxFt3nsVhxpwrNJ6vWXcSGUTv08X
 8hIgyBKVpNhiQMddghfS0fvKqcaJBLmVbZ0ZEnNOFmL4G6d4G7JvN1oL/GMXT3ioqK7oIODNX
 fwob06aO+LUq5D7cW8httX/1p2a7UxKkedxJRo5Qa29Q0FgIT3USTfh7GRiZ5xkh/v9cECbKP
 9rL6zfYX9ccsSdxivyLOAPf8VmtZAIp1Fl/r7chxpzILTthYyoY+uHarqGPD0yobDXoizOati
 EkuoFY5mGBT22RqRYAOg==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/21/20 5:52 PM, James Bottomley wrote:
> On Tue, 2020-10-20 at 15:45 +0200, Helge Deller wrote:
>> Latest Linux kernels v5.8 and v5.9 fail to boot for me on the C8000
>> machines with this error:
>>  mptspi: probe of 0000:40:01.0 failed with error -12
>>  mptbase: ioc1: ERROR - Insufficient memory to add adapter!
>>  mptspi: probe of 0000:40:01.1 failed with error -12
>
> I think you've already figured out that this is an allocation issue.
> However, it does seem fishy, the code is
>
> 	ioc =3D kzalloc(sizeof(MPT_ADAPTER), GFP_KERNEL);
> 	if (ioc =3D=3D NULL) {
> 		printk(KERN_ERR MYNAM ": ERROR - Insufficient memory to
> add adapter!\n");
> 		return -ENOMEM;
> 	}
>
> And MPT_ADAPTER should be just under a page which looks like a very odd
> allocation to fail so early in boot.  The memory subsystem should have
> also printed out a trace explaining why it failed the allocation.

I think there are a few issues here.
First, the allocation issue as seen above is from a current git head,
where it seems memory allocation is somewhat broken. For now I would ignor=
e it
until git head stabilizes...

Then, in my machine I have two U320 drives, one "SEAGATE ST373307LW", and =
one
"HP 73.4GMAW3073NP". It seems both drives start to fail, because
even in the firmware when running "search for boot devices", they sometime
fail to be detected.

The good thing with bad drives is, that with those it's now possible to
debug error code paths in the drivers. In my case the last syslog
looks like this (I'm currently testing with Linus plain v5.9 kernel now).

+[ 1126.041880] ioc0: LSI53C1030 B2: Capabilities=3D{Initiator,Target}
+Begin: Waiting for root file system ...
+[ 1127.069515] scsi host2: error handler thread failed to spawn, error =
=3D -4
+[ 1127.069515] mptspi: ioc0: WARNING - Unable to register controller with=
 SCSI subsystem
+<Cpu1> 78000c6201e00000  a0e008c01100b009  CC_PAT_ENCODED_FIELD_WARNING
+<Cpu1> 76000c6801e00000  0000000000000520  CC_PAT_DATA_FIELD_WARNING
<XXX: here is something missing - serial port is often not fast enough....=
>
+[ 1127.069515] Backtrace:
+[ 1127.069515]  [<000000001045b7cc>] mptspi_probe+0x248/0x3d0 [mptspi]
+[ 1127.069515]  [<0000000040946470>] pci_device_probe+0x1ac/0x2d8
+[ 1127.069515]  [<0000000040add668>] really_probe+0x1bc/0x988
+[ 1127.069515]  [<0000000040ade704>] driver_probe_device+0x160/0x218
+[ 1127.069515]  [<0000000040adee24>] device_driver_attach+0x160/0x188
+[ 1127.069515]  [<0000000040adef90>] __driver_attach+0x144/0x320
+[ 1127.069515]  [<0000000040ad7c78>] bus_for_each_dev+0xd4/0x158
+[ 1127.069515]  [<0000000040adc138>] driver_attach+0x4c/0x80
+[ 1127.069515]  [<0000000040adb3ec>] bus_add_driver+0x3e0/0x498
+[ 1127.069515]  [<0000000040ae0130>] driver_register+0xf4/0x298
+[ 1127.069515]  [<00000000409450c4>] __pci_register_driver+0x78/0xa8
+[ 1127.069515]  [<000000000007d248>] mptspi_init+0x18c/0x1c4 [mptspi]
+[ 1127.069515]  [<0000000040200f18>] do_one_initcall+0x74/0x314
+[ 1127.069515]  [<00000000403528c0>] do_init_module+0xb4/0x640
+[ 1127.069515]  [<0000000040356a24>] load_module+0x3a48/0x493c
+[ 1127.069515]  [<0000000040357d58>] __do_sys_finit_module+0x120/0x1bc
+[ 1127.069515]  [<0000000040357e84>] sys_finit_module+0x30/0xa0
+[ 1127.069515]  [<0000000040210054>] syscall_exit+0x0/0x14
+[ 1127.069515]
+[ 1127.069515] Kernel Fault: Code=3D26 (Data memory access rights trap) a=
t addr 00000000000007d0
+[ 1127.069515] CPU: 1 PID: 94 Comm: systemd-udevd Tainted: G            E=
     5.9.0-1-parisc64 #1 Debian 5.9.1-1
+[ 1127.069515] Hardware name: 9000/785/C8000
+[ 1127.069515]
+[ 1127.069515]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
+[ 1127.069515] PSW: 00001000000011101111111000001111 Tainted: G          =
  E
+[ 1127.069515] r00-03  000000ff080efe0f 000000413a6a4d60 000000000c1f8be8=
 000000413a6a4e00
+[ 1127.069515] r04-07  000000000c1f7000 0000004087ce3000 000000007f41e000=
 0000000000000000
+[ 1127.069515] r08-11  0000004087ce3000 000000001045e500 000000001045e6f8=
 000000004158ea68
+[ 1127.069515] r12-15  0000000000000002 0000000000000000 000000413a6a44a0=
 0000000040f92680
+[ 1127.069515] r16-19  0000000000000cc0 0000000000000002 000000001045eaa0=
 0000000005c47000
+[ 1127.069515] r20-23  000000000800000e 000000004c2ce5ae 0000000000000384=
 0000000000000000
+[ 1127.069515] r24-27  0000000000000143 000000000800000e 0000000000000000=
 000000000c1f7000
+[ 1127.069515] r28-31  00000000000005c8 000000413a6a4e70 000000413a6a4ea0=
 0000000041430aa0
+[ 1127.069515] sr00-03  0000000000002800 0000000000000000 000000000000000=
0 0000000000019000

The string "WARNING - Unable to register controller with SCSI subsystem" i=
s
from drivers/message/fusion/mptspi.c: mptspi_probe():
        sh =3D scsi_host_alloc(&mptspi_driver_template, sizeof(MPT_SCSI_HO=
ST));
        if (!sh) {
                printk(MYIOC_s_WARN_FMT
                        "Unable to register controller with SCSI subsystem=
\n",
                        ioc->name);
                error =3D -1;
                goto out_mptspi_probe;
        }

so, the kernel jumps to:
out_mptspi_probe:
        mptscsih_remove(pdev);
        return error;

Somewhere inside mptscsih_remove() the kernel crashes with a "Data memory =
access rights trap".
At first thought I assumed ioc->sh had an invalid value, but debugging sho=
wed that it's 0UL.
Do you have an idea what's going wrong in mptscsih_remove().
I'd expect the kernel to free all memory, ignore those drives and continue=
 booting (and fail
later in the boot process because the root drive isn't found then).

Any idea what I could test?

Helge
