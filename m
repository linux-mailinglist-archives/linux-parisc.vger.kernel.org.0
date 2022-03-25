Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24704E7912
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 17:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245560AbiCYQmW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 12:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241312AbiCYQmV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 12:42:21 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4733EDFD4A
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 09:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648226441;
        bh=rstQ87HukJoIbDAbGQ1k4+xAUoWLYWvSY8YmQNacqeU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=KDcyFxNpaoc7HZtYMD9aRob1oCWnWRP0KHFrmdtMvz8hMJzbDEeCFZ+fgsUiE1qla
         D9b+maWq0Vm7xynC7082NEq36ikLJOb6jV1FHy3yb2uonicnEajm9w2SJxkDbBXLMu
         5IJQvx0UQEsdvm4K2KHWQ95Dh5GNklw5vqnTDuhY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mn2WF-1nxCKF4B6d-00k8yJ; Fri, 25
 Mar 2022 17:40:41 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 2/2] parisc: Delay until next timer irq in __cpu_disable()
Date:   Fri, 25 Mar 2022 17:40:40 +0100
Message-Id: <20220325164040.502188-2-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325164040.502188-1-deller@gmx.de>
References: <20220325164040.502188-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QEk6/fsKrzazR6tfFiKljFfj27c4HoeesHvvO2kGvBMQ6p+BXZn
 yqDZcJxvXOmCBM+AXBz9C1AF+pEICb+03PHae5BC/5Bs3wk5maACnV65jACqnI/JbOEZIW0
 Ghdq3eEH6g52at1CENODBTnMtglFl+RDDfusDhHIKn4Jd7UTZ6fgQOO/AdvAFjvI1Km9D6W
 9PYdqX/7ClD0rsaZQcNyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/3iLsw3CJRI=:yb8wAbKVLEkJ2XgJqB5flT
 YhUi1K4HteC7RD5uPadIsIT1PlBFK8wZstkEFlFkuqYSCnE8NWwsQbpLej2LKDYBqteVBXHjL
 dUFXryzRXOkocBdvOyAyG5npYvet1dijN8to0coDBuQhdNEdHM/8d8NvMGpyomasuIW3+7KsP
 abf1+jx4ax0KUQ6zGEPEwBHyNOiwXJwZqPgwy8m4RJ7GDTLqY9ytFhFboDEpNR5pMuEpsDXTR
 YrgsNCjAGvpvp73sLECHxqme+E2bilqsuZqiP6LbSYfV5jtvgGi424AEswi3Eu7FN/98ubv4+
 VXDvaJGYUfZi2UJiV/BS9N9+00WCIhnJSXH3yNttJhkFnAD9WgDdhZUxD7/8hbD/hzthWkJkM
 e9bnUezogHlEZAGgaCrmgwnT056f2zpq3Pz7uYQ6nOMT3ABwebFtLESTUtqwrn0ypPuX3eoK7
 QfvZv/qio9cXj1VLpSaMi9NRpfr2CeinMiS1dQxSTjqwzB9HyOVSfdvIosOFh72geluKobuYk
 H9cVBbxEc7UqP4bwkkl5GckOQ/nHa38XrK9v4eXaHzxzQN00YDLmLuYhxUp9DPoBNXTnGLB2f
 ISkvsLmEMDV9qIAw1H6bKP0CcpX8UhztVjznlWYrS1pxpL8tHQcFnkVVZiAM33iEQ7q1P4w+e
 pNJ+HsG40YLHbhwmSryPKpgxQ8lxQiprOqDX52ZvZCl4lXuw+7cSBb2W5M1LPxFD6GnzdTJnQ
 57jPy51KoBK83i+akbqux17OuIjkCkYwVmDF3a1Un6V2ZKxdFlZbHCbGee5heqvlZrOvTVYeQ
 Le5+xgsx0EP6dmT7EeBGlxBRvbSpczcBUlUMhYSOShprZvBh44T7d3xQo3+x0ImpiZ3FpnWwa
 MIKYES+Ym8D00Ev1VXxiuu340xvW6qSosOdKcArvjkGbbVicSQwMXsGIZeKPHe0uzVSVlMZmj
 BB4xj/piopNV1HRKu3sbxlJzUzZwtvjtCqDxSkDSWATntH/qvKL/6DSn3lePvdklFirJkYR6b
 0Pul7nvd3lz5hhdaOD9n3UpW0jyFQ4M8ncQzUPPqZE1Xww449W00I+T46jHZIzckAblZFVutr
 cClIgve/VX+amA=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Wait for next timer irq to trigger, then clear all pending external irqs
before jumping into rendevous PDC loop.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/smp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 60cc33fd345c..564442ac74c9 100644
=2D-- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -491,6 +491,15 @@ int __cpu_disable(void)

 	/* disable all irqs, including timer irq */
 	local_irq_disable();
+
+	/* wait for next timer irq ... */
+	mdelay(1000/HZ+100);
+
+	/* ... and then clear all pending external irqs */
+	set_eiem(0);
+	mtctl(~0UL, CR_EIRR);
+	mfctl(CR_EIRR);
+	mtctl(0, CR_EIRR);
 #endif
 	return 0;
 }
=2D-
2.35.1

