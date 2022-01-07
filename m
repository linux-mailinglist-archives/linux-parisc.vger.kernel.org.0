Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCC0487814
	for <lists+linux-parisc@lfdr.de>; Fri,  7 Jan 2022 14:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347521AbiAGNT5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 7 Jan 2022 08:19:57 -0500
Received: from mout.gmx.net ([212.227.15.19]:38565 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238787AbiAGNT5 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 7 Jan 2022 08:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641561590;
        bh=AWGzjCMh91ivRwknZ1BunN4mGb98yDXa7jE8NGqD0/Y=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ko5nosqpXvYZntToDaGDooHiIdFWnbx/BSfvwRLDkjTz+ob2SjLeP0PzrALmPcw0c
         WPANREF8Nxc5ThrGFI7KkWVXBcPby1h4+ZdKyJGMB1zsL6fizH/kRRtgCg3axY4Bok
         71Rx5I9vbwOygx/4uH5mELN9WO04/AV76TMJILjA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.182.203]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wys-1n2VEX3Te8-005Yc8; Fri, 07
 Jan 2022 14:19:49 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/2] parisc: Re-use toc_stack as hpmc_stack
Date:   Fri,  7 Jan 2022 14:18:50 +0100
Message-Id: <20220107131850.737880-2-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107131850.737880-1-deller@gmx.de>
References: <20220107131850.737880-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LYaxmNknkwYofCpGFHjw1vBhnE2qphYsZIZY6n/ArQNRpe3cY7x
 t21845+0Z16VV6hJAcDEqXsI0Dupr4tPBocCiF1Qb0ua2ahzJfdUg5XlYGgX2sNfqbzDeIj
 I7NYwBpMqb3DjTm3DPNxvGsJ0RedD+56lBIXUmmJxCo3jGG6y37/bTRT0au3HEKNL3xPaeI
 KpZ+uhBwjqo3A8W6hNSlg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D9caliYJenw=:tvO6sT1eKoYIF5CKmSd4CI
 rKoqjs3Mo2hOrVbIksPNM2wapJZQTrLO7mON4Wlvr5Pkz929YPlUUZ4kh8/yFtCMlR8mmeNet
 sgQ6+98RinNP74nV4QaC0tx0fnXYbfspmiEpk9NTHBKN6mJ9J3RDJFNbe12+nab19Yq0XQCLa
 4UawmE+iIGx/DiPDNkUrFBxbR3tHM9eHGdBALiJbQnD+mWKj3QaBBSZSMt9Jt/QKRSJ5rDQAq
 NV7xdJMq3gzb4VQh8Tw4X1+xnVISwD6MQrDtobX2a+WO53VIWQ/bKnbCA23xgDaLjxZRoj4oi
 TL9pJkWxfiAt14zdaE0U1ghnZ/T3G5UX6Phe5nyiuKcTb9kJ4jtg5rCMf+CVwQinG9VDTXvpM
 Ij43dNEhiXRaf2ykjYAEkTDZv7nzpQ8J7km4MsSPgiol9xLGKkrSQjluANyPHlWbKjpojZOr6
 mN/IkgBnqi8+vuXwsi4W4XFMmzCzPJaWdnGArW2qhlwExeQZvj8cYDRBKDR8V77C9SHVio5bk
 cenZ3Fl271bMzGE+kBtmWv5IXHv01Qeq7j5soA28BwzA2cxAhalxqQrUAANS2oG5fUN6Tbfde
 33TV9V2oJ7KIMNzwrGNvB/mnzdSYo8dRQwTF8tuO+HKNbydluE2HYSW2xnG9HHVcgc+8QiYh/
 9891vHVFc+B6LVtTI5clTVeD7pvS9wjC91mQ2m8ut/AnrnUxYdTrolu1+5cwyLW9LYcoGQ82I
 4IYZF4mA9dYEP5KocoiqN8dqnTht7bNrnThm7mC6aT8glfZqFsGSkmyguRXpJiPPMUfPopBk8
 cDv8HBtAtWRnZP5SFPFT37kJYB4BhYhRMwf29bTnTR9F64LsKCyvswOhp8btLqBlasxw5C6qq
 LAXBpaWomqHIloJ0zVWNhKASFHeiX6ztI9YdvH9V8DqNQSAhFH0AWq4nxlccES9d10om4GNez
 qQutjDJG3IY/iidvKmsSWLexdvJuhJvbtAiJMBHMEbAT2LlySYuClI8SfanOH0c24anDtyzRG
 swkr+EZWz1q90WOZ0+uY+WgbLgj5kmlpPUWTs8qxbiH3N8OgOA0ELZlVuJC3lUD0U03p1PKX0
 QWB/IaAdXXFrlA=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

No need to have an own hpmc_stack. Just re-use the toc_stack of the
monarch CPU as either a TOC or a HPMC will happen at the same time.
This reduces the kernel memory footprint by 16k.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/hpmc.S | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index c2981401775c..eb2e4bd67035 100644
=2D-- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -43,10 +43,8 @@
 	 * IODC requires 7K byte stack.  That leaves 1K byte for os_hpmc.
 	 */

-	__PAGE_ALIGNED_BSS
-	.align 4096
-hpmc_stack:
-	.block 16384
+	.import toc_stack,data
+#define hpmc_stack	toc_stack	/* re-use the TOC stack */

 #define HPMC_IODC_BUF_SIZE 0x8000

=2D-
2.31.1

