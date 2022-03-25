Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEA44E7532
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359347AbiCYOkY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359348AbiCYOkS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF9B97284
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219114;
        bh=aiF5NcAtwR8oBoe7A06WL/K55rvwjMxWdm5rqjfDrI0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=JnAzITPAbnC/MJeBNw0xd3+kZeCRQ8GJzIn0RzMjulsr7yPFg1DfnA66ZgdTLkqZD
         v6frpcA06arD8zny5vgxzcNxvAoIIabcFGYIJePIg6x3M4MltEryTNSSPZIhIGxp3v
         MgtM8mUfaf+bPOgOH9rhIxxRLE3KVZU/2lzZXyiA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKUp-1nmGzl39Y7-00LlJI; Fri, 25
 Mar 2022 15:38:34 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 03/12] parisc: Move store_cpu_topology() into __cpuinit section
Date:   Fri, 25 Mar 2022 15:38:24 +0100
Message-Id: <20220325143833.402631-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a/jau4IvwTTMogFIhK3hLVTWJcVnE63wK1KV7W9+tfuDD9ydDm+
 JjRbMvOk9BJ9GuHENWZiWHoyANEchDeipyLQW0aVyZGftkm7to99RAc7G87hIwTSWmc5ydk
 vffVEC9KXZHP+JQw8xatCoLCKUCKJZknBKii3wOUtNSL5jWhOBM/N7nR6fubYcbpIYt02rM
 UaxEhCGg6W8OCPqJx+qsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MPbL0tszTgk=:f241JD85xKA80YhsEsjRel
 vYhpUoNfMBTec9guhIt5FIPI4n4sAEZHj2JHWbnvCbthFfx/iiSwA17p8/EEmbeI0WKEGKT9e
 6k67EZB225ASIgFdPtz50t71kniIePGsnilsMJbYUYnvr+k+E60XO24SblQCn4+DFz5FC7NJR
 ccJqljClf8WLqicedXwntXWbzvNi9k0deFvVlT4vAzs54KhW27nqEoGA5R6pa9LD1UaxLWDcI
 8asiyyCOOXtktmuVCvpSfWOOqfGd+1iTQKe76UZ2d/T58CUr4d7xsrItit2Tzv646U5FGGz8+
 jRxFhrV4gfj9BcLBY86mUoFesZ5fN3+iU/4QwS+skyhKSUTOHbuaXuSqtVsmKBw/GGGxfTKXB
 YJOuzeP6zVgeYuAC1nn9g5PjvvzirBWcCEdPobupLfP6Xwi2pXKHqftBTxD9OIV4HAqjcyCid
 zymow0y+b6khFVhx8WJQXiFV19LdLjdth5VuGnAqYcbXRzJ9ebMuc58QorZjGvVwF0y9JtWJa
 N6QnHw0tdOhtM9IM6w6n18XoGzqC4pnQRgnzEyOSzevpHShyo5QPWjiLfKt3mX5w8Vff+i1lq
 IvVcl/VuBQ9GQBxQngGUZ+EqNGfMO76ql8IN9rbhWh4+n5483JxYZlDv5t2FegjUZCHOr2V3o
 Qu1FhpAJ7gmPzZya+FC5FqbhzE8jZc6JrWJ/LPjvaNoz9gYR+ysI5p19rC5nhNsrV6pZsIhC9
 Z/bmHFTygErVcGhAsSTNEvUj26F/gXbuvSepouThZ6FE7uhaMIXOvtudTqg128+KO2jfu0j3L
 VMdFlTNBG6RV8FdCd/9e3QTLKoJq7wyppREvT3Mftm4sSK3hgmfius1gNeXTqdxdejeTDOJ+S
 9rO6/m/fRAsIq9q89TgBLbDgzWwbkFuxeUcQw26EUYjn0BNQbX69SGyh8uiIckYto8cRND2iu
 SnEqC3wPOB+MpQtMMd03DdL3sDsiEXO86DiJdoWophdvuSA71SVEewfGFhPV1P3mPXU1BNcvN
 cg7WALNqDFb3VOuT3U672qshxXWciusWShsEU2xWsJTDcHCU6+1Q0Ainx025Ixn8Hw==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topology.c
index 72d9aeb54fbe..dc766fb55491 100644
=2D-- a/arch/parisc/kernel/topology.c
+++ b/arch/parisc/kernel/topology.c
@@ -16,17 +16,18 @@
 #include <linux/cpu.h>

 #include <asm/topology.h>
+#include <asm/sections.h>

 static DEFINE_PER_CPU(struct cpu, cpu_devices);

-static int dualcores_found __initdata;
+static int dualcores_found;

 /*
  * store_cpu_topology is called at boot when only one cpu is running
  * and with the mutex cpu_hotplug.lock locked, when several cpus have boo=
ted,
  * which prevents simultaneous write access to cpu_topology array
  */
-void __init store_cpu_topology(unsigned int cpuid)
+void __cpuinit store_cpu_topology(unsigned int cpuid)
 {
 	struct cpu_topology *cpuid_topo =3D &cpu_topology[cpuid];
 	struct cpuinfo_parisc *p;
=2D-
2.35.1

