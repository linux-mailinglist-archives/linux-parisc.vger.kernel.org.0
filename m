Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450BC48D643
	for <lists+linux-parisc@lfdr.de>; Thu, 13 Jan 2022 12:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233950AbiAMLBq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 13 Jan 2022 06:01:46 -0500
Received: from mout.gmx.net ([212.227.15.15]:51709 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233924AbiAMLBm (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 13 Jan 2022 06:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642071692;
        bh=BIheFpEg2oz/uN3QfpGYnZi+szyiaS6MFzqWAyncep4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=TkyJMz5ZaICgg/5kAZswFBjsUrQRdZEX7vI9bSVlgeSdv09ghQ75a+IfJZ/g8IG1Z
         IR/AcwAKDq6tUK9SzduTXoNPZ2pOV4Ddsm/GHlKP2EhVnLzvVCBq4iqaSUuVYXUeo0
         mZeRbc5kyBqudhvymLE5yJc0LF1zqGobdZRgTtdA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.168.79]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZktZ-1mo0RX0KsJ-00Wozr; Thu, 13
 Jan 2022 12:01:32 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] parisc: Add visible flag to toc_stack variable
Date:   Thu, 13 Jan 2022 12:00:26 +0100
Message-Id: <20220113110026.27604-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gfSuVMrdBaMufgBBC1pl6+qrdxpJrwy4XIlwcmqliFcEwkmQlIa
 PTcqa6sBLAu330HCyvRXDWiC0hxy5JXemf+n09lnaodDT3KqWROR2WQpNIWeLP0nAWF38ZT
 fV8A6j4ORplrRMEjgYH4aEG2eltokJn7j+ZVbHgyqKWU2mID8MEey+2xySeeNaLzV1r6pH9
 r5eFfVq01om6dA9tRYSiw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n0IM3jun20w=:3WxuV1SypKS1V4bnLkzWhd
 zWiK74/dO5owV7/QlkMyAVMSAVn7s0mXw4UZDEbd83fl0ElBXFmRpjFG50zOiiangS1gNUrMf
 yH5yJz2Ex/zQgG/wXn/UVoHJXGWIqhqfe2ZeYleg3b1/TaufGr9bt4HT+2Dd0a90N+5QODaOH
 mqNmsA+ABr2Qx6HAyaAArcBGYaWIRI2xCgjgXu19Xg82K+hG+mZslH5t0gCIPxZwAsZu9ngW9
 OgEAOCW3KHosnAf/3WVdzvcx+y5OoPcwcvPipFT/AT57dHYqYaLU/Ikg0XTzsAZDaITLOOtIw
 b+IOlkELhL/pudnUzBkmLOzQQwrP0FwU/IJsiHd3qml3lHt78mkoWzvZxgfqGGD1fgIRlySna
 HCnaADqzqsfhx/w6qsjHdQXyW846k/Q4lVfi5QNYus1KkEhbw7yIiZVawM15RDE5IN4dP+peT
 Kzp3bd7lT9VxTeMs4Yke/VINdhbzeob2hAStgUKtQimra35heMY6IcGNU/GFptZ2c8A3UoSsP
 5PyTfX5g98TITIZVbMimMdTbYmhjeNO35s1RM3Tm52sg5Je4H5MFM/s8sScTzj5IjSkXxQjEn
 G70Z2jzS8dQqhXhHIh8ovkeuxOmXDqdYGzTH78NSxIS8i+s058Tzzr7afoAIKxgM5BaSlwZpN
 0e391Yave1v2xtFxgvMAtESiltgePMG5AMFENpFtKQns+IRw/O/07PPL0j62ECPBkPXLJcUYA
 zRucLwFvRABQoXadOniHEWajlJm0zW/dxGTNzHSRw0zyCOvmI4Tm2Ud9bmSW27MXjB3ZHpNIW
 CPVsTlTD/Mb/dhAeeFh/HSRW/WNijivOcUgMV4YFldQu8Ziq6v04GZPsSCedXsK21xKSK0/QV
 CMbWY2gUspYVPkvf8HjiWE9nWqhxIvgoY8dAmzCGJI1jbwpr7OiEXlGFyDKffqMime/gGXX/r
 LIbzHc3GixBaQf9JVIZVfTCpVA9wKo/lQTKi9ds5u7pMnPstHfE8vcIv+4exfGk3vCjqvBruH
 BZdVcwAuf7Fptv7hqoKNxWKcBQ76EcEMWPorWB1qS374YrH0HOtGAOmMmBWOlUzPYSsVTfzPP
 NiKtDx6IPfF+Yg=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add the visible flag to the toc_stack variable to make it visible for
assembly code and to avoid a sparse warning.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/toc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/toc.c b/arch/parisc/kernel/toc.c
index be9a0bebe61e..fa5a10eaf0aa 100644
=2D-- a/arch/parisc/kernel/toc.c
+++ b/arch/parisc/kernel/toc.c
@@ -12,7 +12,7 @@
 #include <asm/ldcw.h>

 static unsigned int __aligned(16) toc_lock =3D 1;
-DEFINE_PER_CPU_PAGE_ALIGNED(char [16384], toc_stack);
+DEFINE_PER_CPU_PAGE_ALIGNED(char [16384], toc_stack) __visible;

 static void toc20_to_pt_regs(struct pt_regs *regs, struct pdc_toc_pim_20 =
*toc)
 {
=2D-
2.31.1

