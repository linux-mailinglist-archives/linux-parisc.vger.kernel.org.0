Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 046C529F79
	for <lists+linux-parisc@lfdr.de>; Fri, 24 May 2019 21:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391755AbfEXT6e (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 May 2019 15:58:34 -0400
Received: from mout.gmx.net ([212.227.15.18]:36147 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391612AbfEXT6e (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 May 2019 15:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558727912;
        bh=629F0z3RbSfGOGjuZXBo7OtgAlYW+LPtaGDClFAIKRs=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=S+pDtRz6TRjQYa5VsxXQIPEQ9QfTzSgYOKwrQRAHkKFUWZMnHE5tWNFWAVf40SLG2
         vywo8u6xVhJM9vwfAMlN0BHzNKLYVzMYkljNEcMn5QF5bEwujNF8MQd9QA8IV/6xpf
         UHH44g9oaxMpbkcn+oZcms9tLcKsbCiCzu+KdSZg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.183.223]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N7QxL-1gYLgb0Sy5-017pVH; Fri, 24 May 2019 21:58:32 +0200
Date:   Fri, 24 May 2019 21:58:30 +0200
From:   Helge Deller <deller@gmx.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: PCI HPMC on C240 with alternatives Patching
Message-ID: <20190524195830.GA18978@ls3530.dellerweb.de>
References: <20190524065850.GA9849@t470p.stackframe.org>
 <20190524105003.GE9450@t470p.stackframe.org>
 <20190524113241.GA11609@t470p.stackframe.org>
 <20190524153819.GA778@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524153819.GA778@t470p.stackframe.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:9mGCSX+ioQov3gHprXeTMOJtKnDcWiW0OwAnp3HNGrUTyaiadX6
 P7VW3i97h0AkR6E2yE/+3nHDESYkXchCMq9tjImsuL9rQ3HMPY2viTMPwC/NfwVo1PgVg4u
 lfIL7oTCcoUPbD3VSKYYrKKusQtKh6pR1UCipNrFHvGFHT2yWOMMwbST2Z3jM0exEzbtpCD
 NObChGRqCyCwELbNtMUPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uYoRWbPP3rM=:jXCyVYvvNYWU1kD2pLyT45
 Ksrbh+wsVIn8GwyA9wfhE/OnRNfVXvUzC8FMxoHhhrlL2K9t3fdLbXuClggmvL6i4opGd3GF1
 3NHmqWK398hA26yPY+mwbsI/Gsv/F/TDw8v8NFi3mgpE0lt3vFrdxPpJ1ddbqx/mUlXRVG2sI
 endKOU4RMphW29/YiBQqcLDa7q6Yjjdh/aIuTaiYGCVEIVEp33ypYGm4oaU6wHnUtAwcS0rz2
 QSTXBHfwxVLw8dFjiYTlcR4MrE8W2TUdAIMq0OjbibmjKDbP7VtCedpgGzfVuUZHh9G3spN+e
 3az8NQUUd/FZ4EPwo9TvXX1ajJvhiPQu1N/fdBn8Z9sS/bZcscO3DG1l9Vr0RqAjnsoEIFqgf
 Gw7/Ci8bWBOlYReHeGzLlLfcnK+wRQsr18h5vg+OSo+2tMOxkDggRALeLyZq4GdjJLcQf+n09
 EJGZ+xFPbnd/O4FHrwgwyhSI6qm4iIj6d9bycEup2robvz3rYUupeVkSlr+I9NTGBn6CpVJ+Z
 XiCcoVh6eRMzXm7M6REjnqRjXFxTW5QpwmQIS5vwwzHkmF0q3PSjeZKsOqNI8Ao+gcO0hYHEJ
 M4lNK2tu5E+RjYrTiF3QBDGCOydC7vEmW0+PwthHw1rCmk0YkuYhRT6hafk1oX55+lbnjuj06
 AfXshMgL6xXDlbO7d4UI1yFfZTvml6G0jtk+nMXkZanOF/HbxzAmHpudbkXCRRt6++p2YxywR
 2PDiQgvR3YRHX8j/Ei4xUKyr47W9ARS8jmXqWEVv0zleNp+ATxi6tJmr7JAdRBMeGI3Uqxh7O
 DzLVxtWtvmfwzU+8YqMXer7iCibqR6JasM81CAv70itpBM2ktAh7U+qGW+onPGbVHO71jSf/4
 5LX8Q8Rs1d5gjuKj7ic19WXuHCbNp3oFhVZ4D/XaRR5V/Ofqngal9akFl/48UYV47bmYh4Yj2
 nt9slLGBUcpCHSDjVjhrLPsZvmiLcehA=
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Sven Schnelle <svens@stackframe.org>:
> On Fri, May 24, 2019 at 01:32:41PM +0200, Sven Schnelle wrote:
> > > Did a quick test, removing ALT_COND_N_IOC_FDC from asm_io_fdc() seem=
s to fix this
> > > issue. Haven't looked in more detail into this though.
> >
> > Added some debugging:
> > [   25.405365] boot_cpu_data.pdc_capabilities: 2

In case it would have booted, one could see that via:
# grep capabilities /proc/cpuinfo
capabilities    : os64 iopdir_fdc needs_equivalent_aliasing (0x35)

> > So PDC says IO-PDIR fetches are not performed coherently, *BUT*:
> >
> > When this bit is clear, flushes and syncs are not required. This
> > bit is only applicable to SBAs, and does not apply to Legacy IOAs.
> >
> > With my limited understand i would think that C240 has a 'Legacy IOA' =
while
> > C3xxx has SBA? So i think we would need to add some check whether we h=
ave
> > an IOA or SBA in the alternatives code?
>
> I did the patch below to check for legacy IO Adapters. Is HW_BCPORT the =
right
> type? On my C240 both GSC Adapters are HW_BCPORT.

I'm not sure.
Seems to be dependend on the CPU.
See comment in drivers/parisc/ccio-dma.c, line 607ff:

        /* FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
        **        PCX-U/U+ do. (eg C200/C240)
        **        PCX-T'? Don't know. (eg C110 or similar K-class)
        **
        ** See PDC_MODEL/option 0/SW_CAP word for "Non-coherent IO-PDIR bi=
t".
        **
        ** "Since PCX-U employs an offset hash that is incompatible with
        ** the real mode coherence index generation of U2, the PDIR entry
        ** must be flushed to memory to retain coherence."


Can you try this patch instead?


diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index bf2274e01a96..7c574b21f834 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -56,7 +56,8 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,
 		 * time IO-PDIR is changed in Ike/Astro.
 		 */
 		if ((cond & ALT_COND_NO_IOC_FDC) &&
-			(boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC))
+			((boot_cpu_data.cpu_type < pcxw) ||
+			 (boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC)))
 			continue;

 		/* Want to replace pdtlb by a pdtlb,l instruction? */


Helge
