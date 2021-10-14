Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505EE42E2BD
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Oct 2021 22:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhJNU3u (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 14 Oct 2021 16:29:50 -0400
Received: from mout.gmx.net ([212.227.15.15]:59145 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhJNU3u (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 14 Oct 2021 16:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634243262;
        bh=JQAx9490f8i7hEPC/Oous6+rDho0gJBsg2kpVntVr9k=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=AbldmG03bW4TrzfmiTg93e0DsYIv32ML6qTiLOszLuO/6eqM2Z952vq5JIFtWgz7N
         QEWJn7sak5F2WIkP0iyN7bMBUQE0arBMwULr0fQ9uE+K3jpwtcscBJ/omXCi7txq8t
         815LDv8CYVxVOcAyIW+L7GWUWf3X8rcBTu7vlS2U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.135.195]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wuk-1mgbV4320a-005aTk; Thu, 14
 Oct 2021 22:27:42 +0200
Message-ID: <98f2e64e-5713-98d5-2fff-0b02d2e25842@gmx.de>
Date:   Thu, 14 Oct 2021 22:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 0/4] add TOC support
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20211014194916.13901-1-svens@stackframe.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20211014194916.13901-1-svens@stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VUsOzoyXXs9Sldy6ammdIhn0ERshpsKJsqFQkQ+RrtChPqt8Taw
 9AvcSLIMWY0Ny7QNiOLB3b8GlKHd9XuQd0mHDWlGzxIaIky7Dd1TdPFUs5iz+/RFlKrqM7t
 c60rI3W1ulCC6hVnPk68TnYGMg2OcoCdOcnyLOb/gWrZI1r6SpP99U+4yip3p5DLecMJyQj
 0dJiBUU42MY6f8QtwCGpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Te/MT7GzTz8=:A4ywX2o43jFNLG103csWpC
 1qfD146i5NmH/j/PZQXWyjRFpWLIhhbpHFYqZiAV8NnJ+ifggBBeKs+mXzBFS7OTr3UZiR53c
 LbPWVP844+2LeMCA2IZ51WBzDbuTcAOSJJJmRjhvhCrUyMIvJKVjh5pgjiJMz38zoz3eHYG2t
 M5FVjTmza3lFYt0kQ1/IwNbhHMw4C3HlM5pPArOXmDS+ZBVEhvAfRU/HzWGNaWpDOUUsCysQK
 3t6/iEfur85d4qMckXIIqFGe5V7GgBJAMIRZL1sLp/E+FCcg7I1z14bg2mqkzk/jvsCxl1Nfk
 KyYJ9vpfJ5t853LYW0gnyDQX/8k4TSocXfbceMJcd0x2Le4v2K5wqwasQMipbAqx2BpSwoMzh
 8SfvROjyOB5unfvwOi9O8cSz9a4V4ApST2I1QUU4jReFUiW9DqrEZx9+iM1N5kvkkdulEkrzF
 MLCmXEslMHsw6F52fDVBYfaSkHHTPD27mncaXI+k0Nrwm9zz14wUU0cJLKyr92WcKM4cKlPnW
 vwiHma0uWbVyzuxpb7ucoLJKi03Y9piuBl39zyH2YK0CBS6FVJ2v8ndJqxeeSTMc9vMytrsah
 7A0ePKuchrr3njsE0pLjJbL0/QxEI9uQYT8KCuuQgCz5NcJ7SgUVOQ5TDSRZeuw0I1Lkb7ntV
 WjsDeW3eMFbHRiRY0QlhrTFvwfQV+obyc8LWV8Qht3YcHJxys62hblic+kOXvicCYfQtZ8KrK
 ULwlEbPrnMfolREs6MkxqO59dl1zUqD4qwgbpKGQVd7a8P2V1/mlFSYdwqf4fiTGjXKzZMg/L
 A1kw2fyufxhETuKrLPW+GYxuUUrKsQTWC99o74xIRyS7jT1OK9/2GFashsUFXK2fea6L31ium
 LtyoPsKCOtac9eV7kOY1e3JI5rCDZLX3PovxDONo6bsF80AX9mim2gBesSUHBHU9ruao/QzRN
 if4HmS6ic9wx+NBbawQ/dtmhQIZaF1V1E8mpho2MfPUEtWVs3idnuJKC/NReSYcMs0/hsUFIp
 oL3QD1uAdYJyyrGHM9XW4Yk0s5Ye8hzmu+lrClsbrEMhFV5TMmTLNZLwsbXCsFp4XSau1fFyf
 VttUuEXR29b9Lc=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/14/21 21:49, Sven Schnelle wrote:
> This adds support for the TOC switches found on most PA-RISC
> machines. I tested this on my c8000 and a HP 16702A, which is
> basically a B160L with some logic analyzer hardware.
>
> Changes in v3:
> - add config option
> - move toc code to its own c & .S file
> - use early_initcall for setup
> - split out struct declarations
> - use sizeof(*ret) instead of sizeof(struct x)
> - move virt_map to assembly.h so it can be used from other files
>
> Changes in v2:
> - fix stack allocation
> - align toc_lock on 16 byte boundary
> - move toc_lock declaration to processor.c
>
> Sven Schnelle (4):
>   parisc: move virt_map macro to assembly.h
>   parisc: add PIM TOC data structures
>   parisc/firmware: add functions to retrieve TOC data
>   parisc: add support for TOC (transfer of control)
>
>  arch/parisc/Kconfig                 |  14 ++++
>  arch/parisc/include/asm/assembly.h  |  25 +++++++
>  arch/parisc/include/asm/pdc.h       |   2 +
>  arch/parisc/include/asm/processor.h |   4 +
>  arch/parisc/include/uapi/asm/pdc.h  |  28 ++++++-
>  arch/parisc/kernel/Makefile         |   1 +
>  arch/parisc/kernel/entry.S          |  24 ------
>  arch/parisc/kernel/firmware.c       |  32 ++++++++
>  arch/parisc/kernel/toc.c            | 111 ++++++++++++++++++++++++++++
>  arch/parisc/kernel/toc_asm.S        |  88 ++++++++++++++++++++++
>  10 files changed, 303 insertions(+), 26 deletions(-)
>  create mode 100644 arch/parisc/kernel/toc.c
>  create mode 100644 arch/parisc/kernel/toc_asm.S

I've just merged into the for-next-v5.15 git tree.

Thanks!
Helge
