Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7F33FEF20
	for <lists+linux-parisc@lfdr.de>; Thu,  2 Sep 2021 16:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhIBOHv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 2 Sep 2021 10:07:51 -0400
Received: from mout.gmx.net ([212.227.15.18]:50067 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233793AbhIBOHm (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 Sep 2021 10:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630591593;
        bh=iv0nS71Sf7lOrxO5VrVbRqiH9D6xAHfduMEe/ajOLho=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=KGJKJa/lQjU/su+OaNEWlC9GcW3dlciffD/g1AuHuiN1b8a5NH7XjUjOnVUMBEVhJ
         UXKQIkgqGmI29pL1VIrPtkMwpC2Qixvj7q4Z1HR/wPGLc01z6Y/5MWUxHiAfaYQxDd
         6CyHAs6LbSySWbpG5ZJKlFJRx5wvuvl95wrIIDag=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.158.38]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzOw-1mcCge3PfY-00PO4n; Thu, 02
 Sep 2021 16:06:32 +0200
Date:   Thu, 2 Sep 2021 16:06:28 +0200
From:   Helge Deller <deller@gmx.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2] parisc: Fix boot with kernel v5.14
Message-ID: <YTDaZAMvAipdvkaB@ls3530>
References: <YS6VGsZ7fZtZeu/i@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS6VGsZ7fZtZeu/i@ls3530>
X-Provags-ID: V03:K1:h0AyGNG9WYoXrsVFIIHYs5jLsNGG89ySDMU/0l9fwYOYl9/C1DM
 cDePvzRlugW+uMZ04ghy0fxX2jeIl46HkSrKlrcM+etCTkTPt4J0Qcvzfm/l3T8lK9r8nHk
 ENYghO7nET24GZkT3SdhpGoyE82uksZDB+XYCQ/NN/ZxPjzbRktd1uktdIokqtvrvRqbloB
 KrNogZBCgOddQ2qjNTR6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f7swG4OpvjY=:323dJKI+F0jCmf9EHqe8T5
 LfEXYu+b3GfrEk+T7dGbfBQeYmWbnqzNR9GbBGTAxYfofbegHUboVe6WfNKPGV4OKFFBPsrrk
 qbvm9ScMaIokgPheNW2kXKK/N4vnbR7gJgH3VM25qOd+YfeKke5IWb7DepmVV4npfoZXS/309
 lny9ctrJG4Gzt/IVwY1d+IZr1mmHTLaTeTI2G0B2a09pXbXaGPHLQLRgP2KvRg1fcFJDZmgR5
 ekzN2TCeo315TTaSnqzMA4jBmCLYBcgP7ikCMemEebeVFKbhSG7QQuaVhmiyqf4Sydhkr1kK6
 5Dkg/7iEdtUfKI9SV38qtTyg/+3KARkmMK/uu95QqMaWpWpQv32UweF4+SUSPrlJBANsY9Rez
 WRSCw2hQWcmsEQftyy4hXPAWjAge50R3Eu3/R8nyg0X0IbI+l7iXS9MjQ3F+aNuO3+NUTtbhj
 qSJBV53NhGgqIdC2Sw3lyqoUabUg4YEGoSwh+3HBCRkaMLkj1Dt9Luqwey58Z5XYzZAzP9hvH
 H3U1eOZOY+TNVV71pqr2CupZRILxue+2RMpyJkpLLg0eqr54NisCXXDVJNfnitM2zd32HLJ0u
 6sPFmnzC9SwdQL0dbdADhC3hBlVBf/IIlJG8HG6gaSQlGNTQit/lUhERxHZ0/0h291UDI4vpk
 I8xDmT/EI1j4NSu4+ZrSDqltaq7jmWa4jMS5eODy6yKwfH5/ReZSYMXBcnsUeKOxy4VXAMSE5
 PyfWrEsLKQJ5I3nchfdIVDmOjIkqfu+F0B/XphxUtUSJhdKLxY9ajk02K9dllVZuVmm6Ewii2
 shO1g1PSLULnK0HzJi/v/VkTOL3gDWoDyQlPmPVjAXIJX4vnmpPzRiKO3MoS7gl4qmYNvb556
 pKRwk3qlX04QS+gHf9bPRTUvPGC+9k/fVwpRuxE1emGKEDll9fmVKChWN/G0yzJIPSuds1995
 oScLiSHAtw29jgwCxrYif+hQ4nmE3zzf15xKSYXjjD6XDUEXzxyu2xN1Uwp7cNpbbyIxPRcDk
 x0gn2e5+4WKWFbxlI2Vok+0OI+cdPRgjfqyC53RDtPibI2NCRJa4Z8gPVRnQyW2xAJLoi2gRN
 Cfo9nzkRPf+cVynldJ8RLR60T2EkBLGPVWS
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Kernel v5.14 has various changes to optimize unaligned memory accesses,
e.g. commit 0652035a5794 ("asm-generic: unaligned: remove byteshift helper=
s").

Those changes break the bootloader and other places in kernel for parisc
which needs byte-wise accesses to unaligned memory.

Here is an updated patch/hack which fixes those boot problems by adding
a compiler optimization barrier. More info and background can be found in =
BZ:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D102162

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/include/asm-generic/unaligned.h b/include/asm-generic/unalign=
ed.h
index 1c4242416c9f..fdb6864514b1 100644
=2D-- a/include/asm-generic/unaligned.h
+++ b/include/asm-generic/unaligned.h
@@ -11,11 +11,13 @@

 #define __get_unaligned_t(type, ptr) ({						\
 	const struct { type x; } __packed *__pptr =3D (typeof(__pptr))(ptr);	\
+	__asm__ ("" : "+r" (__pptr));						\
 	__pptr->x;								\
 })

 #define __put_unaligned_t(type, val, ptr) do {					\
 	struct { type x; } __packed *__pptr =3D (typeof(__pptr))(ptr);		\
+	__asm__ ("" : "+r" (__pptr));						\
 	__pptr->x =3D (val);							\
 } while (0)

