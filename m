Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75FAE457897
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Nov 2021 23:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbhKSWY1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Nov 2021 17:24:27 -0500
Received: from mout.gmx.net ([212.227.15.18]:38375 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235417AbhKSWY0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Nov 2021 17:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637360478;
        bh=78Otr5FCWbI0v6xHgo/FU6liYj1r3nl3GwYib82mtbw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=aMmuGfRnQdOX8wg7sv2zZUbF+ir08xgNdaNjGXWGw6Fg+To7jdfX7JiKBuHIayg94
         yvJ6tqqcj+dOfun/beNq+1d3Fht3+TS1Q7JvS2UI84QLmfl86IyBsQfGUuhIo9bXgH
         c86Qj64QuVR64XmiSfwaPwmdlSm/vLP+cj9phw7U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.164.19]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9X9-1mxEgJ0Avh-0099cF; Fri, 19
 Nov 2021 23:21:18 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/4] parisc: Provide an extru_safe() macro to extract unsigned bits
Date:   Fri, 19 Nov 2021 23:20:40 +0100
Message-Id: <20211119222042.361671-2-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119222042.361671-1-deller@gmx.de>
References: <20211119222042.361671-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jEPfaIQdJ/5gYVi8IDSiHto1522m4bxIOiDUTIbj24AlDGA4KI2
 r1cFA32WDCEBYYysTJ02ERYi8y3uWK9vH+xsnRZ6FRLyky4PhMAreXpfRFcCa9ZjUjg7vGB
 SiuvkdtdRqVp/L1EJM2dfNEmfyZP/tAVnYmQwz5zZFnnxe6Y2HqRHdYPS2kxFuoBPkjRy9o
 6oBDsU04UGhl6JBlFkyQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bq7Xp4rK55M=:6undbuksX2bE35hy0heSVS
 6soTNyx829C7+Rf//QKP9UVqPeGK3WIc9i5G/GyhUIck1c1rCxeNUCwJLhWYpbRMsDXChnLPl
 RgQs5OLWXH+RJYS4qMknTDbMzPHL99i81tkl8JwTb1CxbCEf/I5HGL1GUk1q+EqhiGhnX8Roi
 jtlEJnIgFfaI1xHoC0LJu98ZfXG6sbTw5QeqmPJBhBYU49dfi1DUVBf+5UL1OW1fk4A0NWD3M
 8BW+XKxILoETwlUJnF20NgiEtzhXSjU+k5q6FgkR2a/sx/lKl+Ml0ETRpbYjddZ2fFP9ZAH7h
 iv+cWDqp5JxP+bQ4v8g42em7XUfkrx6ZELEh77Ru8KEcV9rx6blGp1SV/jaHIjXddcw1ac9Bq
 v2sMmxdm6rjX0Fkn66sfHtUX2U+2Yq+0hdyIslfZLaB/TuMrZ03abodBxoP9D3kqoywwk7hlL
 0cRhHrfQcAzmN6UdujNkND0TlpQ2mgryuwlN8GR87q9p0MSpS885fv6uJ/U/UgRdczsdImP1z
 M6quS+QkC+n7+4xSfOtUtsLr/VFgUwRXyq0zwW3ECOU8eIO4NbXAesmTzlSByeuZEr91yuC5L
 E8BCPuPHwSQ6kRs8tLO7Tmr+zc2qCsA+IY79luX+B12rUQQ8xkQK5m0Nv5ZibiexJEZTzCj8v
 CZ8VKPEmZlEqksbWDkafnubf93DabtG2IZu3KscdCWZbKqcZ2ZlNk/FJaiOLjhR5iGIJ6NPce
 EGOVcvi2IG+P0xLu//oK5CHwYbz3XoCedvE/NEg0qyUkCWPHfhL/HYa7ZJ6L5UfR8V7VdSATM
 StcezpVWMiWPW/6x0WBo1Qp6ZcQIjMM2laQvbeQnKFdZSH3TUln/G8/HYDAqQzx0+jPqswt4a
 SRMCESIEb1iiw4CilvJz1T5UJd8ckHSSV2F52/oonFdUE5TQ2PHZ0RinBUVcBus5ftOds2/5F
 RNlbI5GV4CxKvFZTrM04XNBei52Gg+3vU+bySHgqe7k0ELDjENNgFGaHNQzkGG/ZlVNy7p5L7
 eOMrPgFgeJnALgEKtgWgmhXC2IuekZXlI2yRlmL4bHjyvTx1+8NJK2iweQRhVZz39o3l93bVJ
 2PXmGGflNODZlk=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The extru instruction leaves the most significant 32 bits of the
target register in an undefined state on PA 2.0 systems.
Provide a macro to safely use extru on 32- and 64-bit machines.

Suggested-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/assembly.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index 39e7985086f9..6d13ae236fcb 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -147,6 +147,17 @@
 	extrd,u \r, 63-(\sa), 64-(\sa), \t
 	.endm

+	/* Extract unsigned for 32- and 64-bit
+	 * The extru instruction leaves the most significant 32 bits of the
+	 * target register in an undefined state on PA 2.0 systems. */
+	.macro extru_safe r, p, len, t
+#ifdef CONFIG_64BIT
+	extrd,u	\r, 32+(\p), \len, \t
+#else
+	extru	\r, \p, \len, \t
+#endif
+	.endm
+
 	/* load 32-bit 'value' into 'reg' compensating for the ldil
 	 * sign-extension when running in wide mode.
 	 * WARNING!! neither 'value' nor 'reg' can be expressions
=2D-
2.31.1

