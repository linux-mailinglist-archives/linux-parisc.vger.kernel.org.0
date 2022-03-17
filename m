Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5EE4DD08B
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Mar 2022 23:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiCQWLb (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Mar 2022 18:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiCQWLa (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Mar 2022 18:11:30 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADD11FDFE3
        for <linux-parisc@vger.kernel.org>; Thu, 17 Mar 2022 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647555007;
        bh=gASHEDd0jZqHrPympRXwACWH9Hr9EqeChOxZ3GV7oQQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=huHRXDx7tD+Fur0JnKSdSJyyKB2PEOV8Z4Vtrzl0ilARkbywKc67dH4j9RzkbnsGs
         ULdjAC4tO9fqgMxiXowQobJ9DeoU07mDGc0hcW1lLCXQoc4OLfYgYLv6Nf8O3ry0U1
         cE9yiaT9Q6VKL2hcdn3wc5/2PkjsgvcDKGwS9LMU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.128.131]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnpns-1nsRQD2Bq6-00pMqz; Thu, 17
 Mar 2022 23:10:07 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Improve CPU socket and core bootup info text
Date:   Thu, 17 Mar 2022 23:10:02 +0100
Message-Id: <20220317221002.133311-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L1VsOuzEumEEk8StVpRNmNivDzu5Phc4dL9DncJMGiJfiLbZLJc
 4ScDSqNQSbxn8w2tVOdK2+o5M9y5+Hvq8QwFf6rsGqyjjGnGDDpDXhlXdCPLcxOB6VZ/L3h
 3st4HCQOKCHhRCmXgOwJOKmfyM3jtfNQRvfojY4zQoLVqIZHTSMs0kj7jKDXPaMuZmwG9Br
 5PYNkS38oGGiJJss+W3Eg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zde365kVlf8=:mNot/8nsorVvvWQFumwYnK
 ZhnGix0ru5SbdmoG9Jn6aISl3uh56+3F/SRhGWvWTS4ncVkOwxUyquurpLhA1Zs4OcVppuZF2
 5Vv82duK7pNBp6AYsJwbBW5h1Z+bYLL+3KazRjKvlCsYuCbQN2hxI7yGeIgX/wKsGjXPV7mWj
 7Olvw5FTH3QnmnEGqXZIIys0CjVFpz2ap+UnQPoXI5yNPhWbGyerreBTv6HkRWQcwmwvgLKar
 uZF+zW2M7v4N7pgWUEQtVoFsphxZumpctM8zOIeXgRRK+s7zvIJFqdyOVrwZxCGj8Mr6wmAeE
 5rT9Ac2FvHP3jsMSYo+8h4wrj1CsL6NrX9DVsnYCf7mMdUKFk3Ztx27ZzMPRTwIT5ud7zL8tk
 psl+zXlzIIrqehEkRdQm4P60UciHC9K+2+Lv9EHHT+T0igy/3+5jG1980aca1IffKpHmUFNP0
 8OYCCAiRYbG9vz9DWB78PDYc46SiQY+vnQd5WiE/CJF503/gSPdhHW6oF38zaeusHOfXgRJ2/
 SOxTVyYKj009cj8IWg4jjDLn3i7RS/s5MAVun0GISs8G4LFaQb7vVhJPgDIiDrwU4doSL2j1u
 5ZqajcyNu533HIKBCTN5QociCS6xIrH9GQ35pXZDs2tMTkPSb+XifapAi0A9qUt2629rZQstY
 pUN45g228MAwm+r4K5zHtH7aBM3Z9L2BnnGPJ8FXm+shPo37XAYTCBGFVR0V99Lcfi4UGpcjc
 xBprewe3uNVFM8p7XSewpYS6u1kRXLG3LPVxBiMZFzAgnDzyG5U2HolZJDB8k1C/hUNRAK6/L
 Y9BPZCUrUGnIWC6sPVvyPPmAJV1gVYhBFIWpiqP3/kvcsR0EZ+7VLLA90yt3MjNuEPGlAzJht
 H82hUgq+0c7X36UgHjDrqeS0Ud5IGemIWkJ2WWZi1Q8SekO7TTCDZYZzXZPGDbANQ7zFjIczP
 3fA3deeLNewMzTtp1oixxJkaWaxsN3JG+8YovVrgm9/oSoGwslW7TMPoPDFgQMgPRvskNJTzW
 x8+cTmBjQxqRKRiVNPyO0FFSMCJaVbjzmTNKhiaA+ISM6za2MgyMyURwZoATdbCijoGpfykp1
 HYQ+Ifmmti9bmo=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Improve CPU bootup info text from:
 CPU1: thread -1, cpu 0, socket 1
to
 CPU1: cpu core 0 of socket 1

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topology.c
index 0a10e4ddc528..e88a6ce7c96d 100644
=2D-- a/arch/parisc/kernel/topology.c
+++ b/arch/parisc/kernel/topology.c
@@ -101,8 +101,8 @@ void __init store_cpu_topology(unsigned int cpuid)

 	update_siblings_masks(cpuid);

-	pr_info("CPU%u: thread %d, cpu %d, socket %d\n",
-		cpuid, cpu_topology[cpuid].thread_id,
+	pr_info("CPU%u: cpu core %d of socket %d\n",
+		cpuid,
 		cpu_topology[cpuid].core_id,
 		cpu_topology[cpuid].socket_id);
 }
=2D-
2.34.1

