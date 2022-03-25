Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448424E757E
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349429AbiCYO6J (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345512AbiCYO6I (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:58:08 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F60652E42
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648220105;
        bh=P/5+0DvjLOInoJorUuUujouAj6NnWmUcuobHEjOvEhE=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=jGSnpeWkRVNAopfeEng2AkuQnvseduQX9B3znFkJpqaiFqSZajNfJ//Q6xu08VR/0
         QYpTngr93dO/gLFKQNXyzckLfHEidaFtRIgyCTlXNu1F4FdYJHCjtOwxOCFj1o+/fa
         44DAnxMscMxijDjdq4WbCQGyoYgHG7o/NT4BNh7s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3siA-1oFaTB2zSq-00zpyq; Fri, 25
 Mar 2022 15:55:05 +0100
Message-ID: <4cb26ab5-8c11-e6bf-961a-db64add723b7@gmx.de>
Date:   Fri, 25 Mar 2022 15:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 01/12] parisc: Switch from GENERIC_CPU_DEVICES to
 GENERIC_ARCH_TOPOLOGY
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
References: <20220325143833.402631-1-deller@gmx.de>
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:njtK/gGcECpwgrqN/IHd+k/d2YZDtf26SQ5qozNi69/JtsQM64Q
 oXC9aB24pZtO/9Z1iUGWEPbzTzkD2zL9vvWsDwJXUY/evnB6fj65ahH1GC6qd1MrOCqBhwl
 M5SJWry6mjLh5LkmHTUTvWs+DVqgQ2IVaga89oKkscCLR3VmHzFTZj6hiyLOZgzWVPHfUNM
 kYEbrS2OJ0k77ucRsbPjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TxLUhAYjqB4=:+xCyL56vXkYu6eRNNEEFE6
 ZmdDUysnoEJbDFMSZ5cViuyOmaI9ng7kPGOk/pCRzdvB/0JVg4Sc8eAG3qvJRvrnB4MBENLU3
 Bn0/vhTx+xwkjgSGcZAyTnAy7DMrX2nDLoq58Y+Fe2H80cTbkfzt8O0f2ggL31Xz3Pvosnn78
 OOWU9DlgBctXwfuqkS83bjEq/kZGveEvTUR4v4LEG7Lh6EWG/Ra7+FmJbeXSGaYy8PioE826k
 aakoKTYK3wuq0x5PlvYwPVEXOtvQXG0ibq22fMht8j/zXZ1FN/c61oKqmjSgphBFLcpaVHYWG
 /khz8cYdx/prkWqf/JmOXWsd/8dNZLxuCNtMocBKmXmjiZgt5t/VbuDattyi6Oa83uIRQemb8
 KecxPAZ+tO5LjDy8/TfUy8Yd6BnIX3egAkfg6goN9ZRnm4QictQae9NqkLo2Zhi76dXN1Xj9d
 PcL+mb8Ih483ua07pY/Kzy5eayzGoWi7a//1ZSInLMIdvfVtBhAwAfzofCEX8v3dot0sp0Em7
 Qnn4/A7phUHEdVcFSIMgX7JkuwfgQycOSrarNrkg+OClzPqZk2Fhe1V/CKSY1P7mobllcj1lZ
 M5hjq2nytsVqyKiBr67I+vAKB0XzAzWPVni3KXr8FwmKLHDzpTuGLc6C6zxWAR6kl5OgUfe6J
 4P07aqxDrJy/YlFxwHIf0jEBIRk68EetiGdDAs143IUDaCG2YZ4inc59ogRdmjBKpI1UjUDkb
 eNlGu5B/WN7IpmezLdEkdINVPfz2sWZmDGs4V73FNOlkkaJKhLuSKVkpdlMXxnIXxrJMaXt6x
 bO94hOD31GUlkpEcKUbH/D2qthUtkBlywHf0r8D2YBxiY95LKq+T6YMeV///R4c8Snlwfwtnw
 fODIovtz19qoxAgUcj9Oi1LWxoNPPsthuZ97BzzPOSY51Y7GPX2qFCTHqY6z2zpkIYdd6WDbz
 j8Kj9MxHHwjSpmiXdxqPPw3g2Wv/4KuPBhzmHpvv1zF834WPU5fXmWggLHEkKSFN8IhEbNwtK
 kxnA++I9y3LmjpH/1l03aWuRMglbaBILgaN1ICWkhrQ/CFmapxMrw4sOcBxaW87KzyX57m2lA
 OQHl4DEReduTmc=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/25/22 15:38, Helge Deller wrote:
> Switch away from the own cpu topology code to common code which is used
> by ARM64 and RISCV. That allows us to enable hotplug later on too.

With this series I was able to use CPU hotplugging on the PA-RISC machines=
.
I sucessfully tested it on qemu (32bit kernel) and on a 2-way C8000 (64bit=
 kernel).

For qemu the patch I committed today is required:
https://github.com/hdeller/seabios-hppa/commit/5cec13f11d3917cf3bceaf68ce2=
3e9fa5f206a35

There is still some issue with the irq balancing on qemu with the emulated=
 GSC, e.g. in this
example with 3 CPUs you can only disable CPU0 or CPU2, which both don't us=
e any IRQs.
During shutdown of CPU1 the irqs 17-20 needs to be moved to another CPU wh=
ich doesn't
work reliable yet.

Example:

root@debian:~# cat /proc/interrupts
           CPU0       CPU1       CPU2
 17:          0          0          0        GSC-ASIC  parport0
 18:          0       1759          0         GSC-PCI  ttyS0
 19:          0       3572          0         GSC-PCI  sym53c8xx
 20:          0       2359          0         GSC-PCI  enp0s1
 64:        224     148358     128518             CPU  timer
 65:         16       4224        677             CPU  IPI
 66:          0          0          0             CPU  lasi
 67:          0       8758          0             CPU  Dino
STK:       2240       6080       3072   Kernel stack usage

root@debian:~# chcpu -d 2	# disables CPU2
CPU 2 disabled

root@debian:~# cat /proc/interrupts
           CPU0       CPU1
 17:          0          0        GSC-ASIC  parport0
 18:          0       1843         GSC-PCI  ttyS0
 19:          0       3662         GSC-PCI  sym53c8xx
 20:...

root@debian:~# chcpu -e 2	# enable CPU2
[    6.466714] Releasing cpu 2 now, hpa=3Dfffb2000
CPU 2 enabled

root@debian:~# cat /proc/interrupts
           CPU0       CPU1       CPU2
 17:          0          0          0        GSC-ASIC  parport0
 18:          0       1915          0         GSC-PCI  ttyS0
 19:          0       3668          0         GSC-PCI  sym53c8xx
...

CPU hotplugging on the C8000 seems to work reliable.

Helge
