Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9191B22CBE5
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jul 2020 19:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgGXRSI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 24 Jul 2020 13:18:08 -0400
Received: from mout.gmx.net ([212.227.15.15]:38425 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbgGXRSH (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 Jul 2020 13:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1595611075;
        bh=SZYj7n6G4Lhr5a+IFOi8aym3UDQ2GOS0mtYwI3tKtaI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=KQ30s2opY0ZXSTHEPqoBVxDyX9yCgFChFpc/sEMIvu57ngCh2vmOd5nkjBa//yhnM
         PVKGDW2HdFQO8Dhoyz4Judz9XhM7sZn/cRkDfzUJBavzG/ZfKuicYHeptJutPHcvJj
         OsOU/pDXEDI1PG1GqLSFbnK1s2MtjJkHPzWsgMYc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.174.101]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2E1M-1kxD0H3Fqo-013hJX; Fri, 24
 Jul 2020 19:17:55 +0200
Date:   Fri, 24 Jul 2020 19:17:52 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Report bad pages as HardwareCorrupted
Message-ID: <20200724171752.GA17395@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:lsxVAOnxNQKqVex1nzSVcn+s+11/ToTbxLe5Gu3tpsvfulh205S
 dBdy59uSNLnTBU+tF5aJzmINrToNFpiehY+0HKkdqh55oimvwkvl94VXWemW8PaUBPr0ovB
 HX3hK4jo/MCbYd5re1RP4S5qJXFxfBcLEIu/3+qNQNRcOMc6S7NHJokDHpxC7v1SgZmcxWX
 NfdzxkAn1PylqXZXVPMrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oifaUMNM2Go=:TIe+9QfoZynwYi+4eEVqzw
 qyq50msloQIeDnxZKtcm6wFm+cifg4xGp8oPENX0AWBrORA5zybS33ygENCNW/iQ8SDMBg6jL
 lsNchl+E4NG6XXZrCQzJ6uS4RMTtVIZNJ3x4JGymX8hh6YxMulInSaIOi0O4dEzDIWif9w40k
 bK3z6b7OpV1OU1tVy11VNHq6r7MNZxuAc10dfywUEXrRUTaI3p7VT2b1SGG4cQlBJY1j0foHH
 YBf+NZ45rYRcfGn1LIOqkMy1Y2fgxzvfF+s7xQW3eAXPZs6414VkfvX6pfpdObY4Fk2KJnsin
 Jlt/hL0iq4VpR8vqWtYggvaH0jpzT9v/Cdf0jP7wxKX1I+TvX2I9TI/VAt+ce36oM1ixRoZGJ
 PSmXkO6sG4YW2VSXGjbIX6HotQSjIJk1QJUQio4gytq2Kf5DyGB8rRlQlWaQyESzaPiLbL8PO
 t+AtifuFdAGlJ8Qh1CAB+HWwJgXBLsyFjpKFhzr2B6o39EGM4iwRmshuaTm4yr4aqxHNGbio2
 BIsrDfLJ24ae1ksSvy9e+g7jxhfMfLeiCQkLnVgwngrmo8njvuRZ9TEU/1gZ2QQWbloxhiqAz
 T66k0zLjVpPRFKrAA4LMXhhSCskBVxCrAbNLgiPtpqKy5GgP+7Dx6MHA2U73VlP4vBAS3+/uO
 Y4nj3mIB0+Ta/H4C+WbZZrdV/ozqv3atzOr2nhBPw2VAsajyXNS03wruEA+Jthc4Led4spVMm
 VS9Gw/tkdaLmQY3hTn7/J658OicAMQ7O3IyWC0A0a33nDP6Xyon8KJtsMvwzKVYsnU8bnPl7T
 VP2LrlEdc8PQ4Y6sG0fEj6n+a00JqdTa39ZyFie8asr5VjuUSivTDM1+113FwIpXn6sCAdsnn
 Q502lb8D1xVSQHRhbaXfqXxc9KbmtaUbxU01ASwDnlrVWiFSnClzu2dRixUO9M5hF06vrf4l3
 n1uyLLbtt6LMiak2h2VH1kFnhCX7RhVuHfgU4NrkmtAtEFm45kYSax+84f4dBoULxRa6eBZCi
 LJei+1bZgCt+btlfpHWSxBiLolvOKc13qIXVehla/wZhaRuwGfqcEgZu9Bq+XcyNgmFEL2qTq
 ZETVMVoovZN/OWBcg+GvNSyC2QEIOCurBf7bCdoXnbyPaiwvvpiBeYYLiwRK4ilo8YBMfByhS
 2UBuaIFORf5c59f93waJsujHOsO45qQziSykbY02ZfZg4aLU2lJQ35prd9gUA/Bij8IVlUBRE
 4e9wKKhEoRG+ecZWb
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The /proc/meminfo file reports physically broken memory pages in the
HardwareCorrupted field. When the parisc kernel boots report physically
bad pages which were recorded in the page deallocation table (PDT) as
HardwareCorrupted too.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 6e8550fefad6..fcc761b0e11b 100644
=2D-- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -18,6 +18,8 @@
 #include <linux/kthread.h>
 #include <linux/initrd.h>
 #include <linux/pgtable.h>
+#include <linux/swap.h>
+#include <linux/swapops.h>

 #include <asm/pdc.h>
 #include <asm/pdcpat.h>
@@ -230,6 +232,7 @@ void __init pdc_pdt_init(void)

 		/* mark memory page bad */
 		memblock_reserve(pdt_entry[i] & PAGE_MASK, PAGE_SIZE);
+		num_poisoned_pages_inc();
 	}
 }

