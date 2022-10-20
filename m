Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70463606805
	for <lists+linux-parisc@lfdr.de>; Thu, 20 Oct 2022 20:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiJTSOp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 20 Oct 2022 14:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiJTSOo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Oct 2022 14:14:44 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA27F2558D
        for <linux-parisc@vger.kernel.org>; Thu, 20 Oct 2022 11:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666289671;
        bh=08OfOPIYRiMBiArHiFDodBIQSgRIPuewC13SQNmOcUM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Xv0ha1AP7a2aT+JOuFtqSjuu2JghMH6MUwC01ad3Vx1WmrlFi/aK3TpeQZKSP4vTR
         Txas5HnrkNV8bykluyRo7Lti+f0Oqk8tAYGTE8HQ36ntbSHlH2zq0D3ID1XqSkCWFs
         BQhaf3SGkQjheRiEcTwHDUfUBOdZD0+0LEEK38Xw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1p1C2h08Rn-00yO2E; Thu, 20
 Oct 2022 20:01:40 +0200
Message-ID: <430864f0-da89-cc2b-e357-d7aaf41f31fa@gmx.de>
Date:   Thu, 20 Oct 2022 20:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: the patch "Convert PDC console to an early console" breaks the^M
 console
Content-Language: en-US
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
References: <1MhlGq-1pGSQJ2Koq-00dm3N@mail.gmx.net>
 <alpine.LRH.2.21.2210200917320.31339@file01.intranet.prod.int.rdu2.redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <alpine.LRH.2.21.2210200917320.31339@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:doQdBZQxKWiWAaLEWKsALMrwo0JAwD1HyY+d6bs3ELkPJbCJLlB
 4vCMBeQVYqVkPtjPQpDDFMTO29QEETwq0AgpfKJUldQv2ZqD2hhciwR64P+ra/FhkHbLGm9
 YnpMcohf21x90yiXoK5iYWtDAwokWgdv89pZTDyQP37cLSPBbcsIqKZDiOofJL+1YFQ3UhI
 6YYDPh8FHaWcOVnm75U1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AUaXDSEQ490=:BDmFie4I/+puXniNFMD2EO
 LGfdFIEqj0VhEW8lcwr65EuTf0boFhpHXQB8/lICqPs/xuuvgXDHNCADtl/sdhRt5uqeKkEFf
 W/UPMK5fAe4WrGQLGmFSqdsysIgqHQgM1xCda1S7R75C9Zu9nTXDct3QUEpTlEUP+10G+3xqe
 0gX5LC8h89hRLyibMDSSR2PSmydP+CWDhMFk0sGfBtzLFA/Wd2VACYDRTZ22Z4hSBrkiXXZIY
 6Swc34DoKzQYTyb8LTeu0DxvcpzuT3P49QrPR6aqszzth34mw/hYNcaTVZ0W+qca/yDJ7i8lq
 0bW3BtC/uD/oyqId6lrvafjKrOhrVFXrCt+AJzShPffYrP9p6jcHt/QlDRd0ORTytPEi6UxBE
 A+GORDbfxBbmrfoDi61QlGfQ9a+xd7yhcblqkRhIAXOgHid08MQ9S3pE5YQi0VMM2psOzLeU3
 NmXedN5ZeeWKlgdkrMNxiZZ6mAhFf5FszNuRysvCD5b90BG5UaMuTAnK1mGxrPM39rmTe3dEg
 sYI85eF37lhHOz4INDZq81z1IXpZl331M5BEoOC4wfl/EhEeEOEqDQBaBBRzvTpAeRved1D3v
 wBYvjqPfQDxLdpHZK8nZXGJ8+jPFmrxXRcuDq/C0gFng8MQVLY2K6kSAk4ud64wM/bNulVAu2
 JCYVLly3ZRNDrQicm2q/xOwtHe9dyUmsWExND4dZpENl99M4noeYrM1p2J331z6WbhRFuQj7J
 Xw8nBnUgzYUEKe5+Rpm3JZTCKU3iUibjVqY6bkrtbUuIXz8ToxOqrboR1FLvBjvA17r5N1PSQ
 ry7jHh/4GoHRJbgoBRAIr9hph6nyrYKtaS0jh8S8EamLKjy6Tqj68Z8hjSLy5Kv0hzBO8uzYq
 HzrT2l2bpUhhsPY34tXUrTgS1wn0PFjswrRS2ddIGNkm9cHYA9vzE1JBtPyCU2XYXWRGOlazb
 APTdJe1sMmJyP9wvWspMjVuqjIjHbzCW1fF/is11o1wrUabo9TArXFMRh8v7agGFBrVQBONXr
 SHI0sm9r8awnpF+FoCE5fw7n1PzZ1UGS+xH1URn96Ku15wBCYlZzyljsZ34l+cHoK4nMCNLD3
 5JabNQoEyDUAwrp0079LzVdnERBAHnFadawc4qn3kMdk5p+yG/GZrhFkVQpmCi2ZkqdpYzKvs
 EnHyZVzFZpWmSZaURanyQu2eXbuIwRdkYSJPCDIVJ7VFoJGcsXWdZpt+ktUF3HNfQXZRLk6Fi
 TSGRQyxPIYIIpyLPIbM56NZYGa0DnH2EbtD3J/cIpszYjJgnAOm9HdZLXQ1x68utTaXvJOS52
 5aQuEjcHX/3qz5XK1NuAXoInpDElAukpZtqhf8hH84J47LWQNBs9lFuzYS7h5QZH6EDn8j0oj
 TPrz4GP8DpU37ShNK6oZlMd7l+b3z4ULApnNE8FyZBgNIbiwe50/+Qy1kSkwui7ktgse7L5gK
 KP/GwhLSjJ39p7V3EcO4hJ2h6DQ1gEdGJ1mGmeMl/zcB6P2L0tgkHzeosQbTx1qfIoZM48VgE
 i8UIN3c/p/QNPegGrkrJsK/h4+MiDCVeKUr4kuT/Qi/OD
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/20/22 15:26, Mikulas Patocka wrote:
> On Thu, 20 Oct 2022, Helge Deller wrote:
>
>> Your serial ports don't seem to be detected and thus missing...?!
>
> It seems to be so. Does it work on your C8000? - if it does, send me you=
r
> config and I'll find the difference.

Didn't tested on c8k, but 32-bit kernel in qemu git head works for me...:

CONFIG_SERIAL_EARLYCON=3Dy
CONFIG_SERIAL_8250=3Dy
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_16550A_VARIANTS=3Dy
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=3Dy
CONFIG_SERIAL_8250_GSC=3Dy
CONFIG_SERIAL_8250_DMA=3Dy
CONFIG_SERIAL_8250_PCI=3Dy
CONFIG_SERIAL_8250_EXAR=3Dy
# CONFIG_SERIAL_8250_CS is not set
CONFIG_SERIAL_8250_NR_UARTS=3D8
CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
CONFIG_SERIAL_8250_EXTENDED=3Dy
CONFIG_SERIAL_8250_MANY_PORTS=3Dy
CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
# CONFIG_SERIAL_8250_RSA is not set
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set

