Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772FC2BAA2
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 21:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfE0TUM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 15:20:12 -0400
Received: from mout.gmx.net ([212.227.15.19]:45973 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfE0TUM (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 15:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558984803;
        bh=s4uB0exCyv5o3mXE9NXphAU5472EpQ86zQA/QKLMGxo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=SL4V3nkqyE7XHJ745M+QEG0sJn/LVj0OGuOPFH0830LepHxubrAOdF/3It7NQp6lR
         bUsC/6/ReSQgLfeERQvR6GWYwDARMz8Fm+nt3HgdW12EDGnHxlOL71w6ZDrTSux0bQ
         Uxe3k2u7cOm4TcbpDnDBNO4lmTu0gsAchH0YfJPk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.141.183]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LpcBS-1h07U513pu-00fWMy; Mon, 27 May 2019 21:20:03 +0200
Date:   Mon, 27 May 2019 21:20:00 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        Carlo Pisani <carlojpisani@gmail.com>
Subject: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <20190527192000.GA17551@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:WdOkO4Ql4abKZVi/pKUF1qquRnQcyvbnf6Zm2xCJztiykhYz6I4
 QgRrHOEorKzdWaz7zEZNUqUCX+H+GvMxtPvJxXREHEiVIp+/zgOb9XTDtI1V2AXJKs5rp+r
 xHCF3FT5eqO1RpoKnI+jaL9xaj9BFwbZ1gj1cEg6XYU+uoEhTS6WO88VFrmAVGdxmh3Quse
 aFn7uBIp3hKYmdeLzrzKQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mf8+8hz61mk=:spH7OORyW4xLr4tgvV1klf
 ADpIbt+zFkAlGfc2iyRC9KlXAYTw0AfXpMcopgWALjzSM6nxlCueD8m354qiwmTl1n4BO1Rem
 SNF4eWNV69xroKapmDLOwsO28eJcmsO7GRjzDD79N8lwMmbK2SVGbuTAgrlxXiK+7E2046S4A
 iJERMIpi+ZRaOYo12TDUFNPIt1LaHKPZ260D4nrqr3FwLnJHIBUrMMuz8Bi3+NUuhLNg8qLVr
 XsMFP0KlEaGvMe1CEZOjt6UgBLkUh6/lYEVLQdTAEA+0rkvaCqTJ4KLQJ1pUkD2Qs12y88GM0
 J9F+uk35rtErxnnapt/a5rj2lpYmuieVxBsga0BU/nelpFR3w417sFWBPSDT88hLV/LoFnHMn
 8DC5792riMSCErKcuC3h5ZiykEFVsEJcpcTB5hnc4zshd/tJz4l01ICGSL2lYySm6dPUSFrWU
 gpJWl61XbeIU3KKb7sEs0UqiyS9ish7p2qiXRbkP0ygNgQkjeZTQzmXPLdT6xvfRhaC7oZPND
 5Ow9ryZxrgmuFfjgYHAnHu1f3hWQZZUvkFQOwkC1jqMFKWXb2DrDDk7k3Kdgw7btaqfV1CvXt
 9B5+AN0VKA96pPCGzsJf13uQ8qvdoVoWSO4fk6CqpSwslwSp79trwhfCrMz1HEfA851tG/SLz
 8pOcWG7LhwnpCippzxR3qUMTVLSOUXbfMyyUZ6t77zaVEDp8wCtY6IseRE3Zldq29L/Ap/GfK
 c/w3EN2ME9QKX+HnqGMkZBzMWEWxEvOGRQKyalcpHrlUwPkwwJqjCLRSWek9CL6yV/5CWgHnF
 dI7qf3EA8zAQye8Uuh0Q9D+iOlWYhgXTwMlWV8AXGNODtYCDizUnB84DrplG8V7OxDxAdpuBi
 4dslJrFs9pLt1imyuw6Z/VtkZlpiiQ/3D+D6BJ8VaCG8q7Ip5oUjH8f/GdJOgG4kN1AQD1EmF
 H7tM/bE8zyOHAqDI7EKCB4BsZ0Ga8JmU=
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

According to the found documentation, data cache flushes and sync
instructions are needed on the PCX-U+ (PA8200, e.g. C200/C240)
platforms, while PCX-W (PA8500, e.g. C360) platforms don't need those
syncs when changing the IO PDIR data structures.

We have no documentation for PCX-W+ (PA8600) and PCX-W2 (PA8700) CPUs,
but Carlo Pisani reported that his C3600 machine (PCX-W+) fails when the
fdc instructions were removed. His firmware didn't set the NIOP bit, so
we assume it's a firmware bug since other C3750 machines had the bit
set.

Going forward, let's not replace the fdc and sync assembler instructions
by NOPS if:
a) the NP iopdir_fdc bit was set by firmware, or
b) we find a PCX-U or PCX-U+ (PA8000, PA8200) CPU, or
c) we find a PCX-W+ (PA8600) CPU.

This fixes the HPMC crashes on a C240 and C36XX machines. For other
machines we rely on the firmware to set the bit when needed.

In case one finds HPMC issues, people could try to boot their machines
with the "no-alternatives" kernel option to turn off any alternative
patching.

Reported-by: Sven Schnelle <svens@stackframe.org>
Reported-by: Carlo Pisani <carlojpisani@gmail.com>
Tested-by: Sven Schnelle <svens@stackframe.org>
Fixes: 3847dab77421 ("parisc: Add alternative coding infrastructure")
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # 5.0+

diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alterna=
tive.c
index bf2274e01a96..1ac3b4ac73c0 100644
=2D-- a/arch/parisc/kernel/alternative.c
+++ b/arch/parisc/kernel/alternative.c
@@ -56,7 +56,9 @@ void __init_or_module apply_alternatives(struct alt_inst=
r *start,
 		 * time IO-PDIR is changed in Ike/Astro.
 		 */
 		if ((cond & ALT_COND_NO_IOC_FDC) &&
-			(boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC))
+			((boot_cpu_data.cpu_type < pcxw) ||
+			 (boot_cpu_data.cpu_type =3D=3D pcxw_) ||
+			 (boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC)))
 			continue;

 		/* Want to replace pdtlb by a pdtlb,l instruction? */
