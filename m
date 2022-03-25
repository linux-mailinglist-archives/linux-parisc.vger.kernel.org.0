Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A99884E7530
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359343AbiCYOkV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359349AbiCYOkS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C376B97299
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219114;
        bh=u4qnli1WWVwxR0RiJIaaYGpYmOLyDM057kihqzKtpsU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=id9qwhm3heFK0yBt7zDB6LntyxlLoivoq1T1DhCaFsrey+VD3JJkNxcw9UvEp9Bbv
         77WWrmTWgSfKDHezciKQyRphjZJH78Ebt+mINlmzgR/mrkuyAaEuDxTo0fEYtZ1+aO
         uAAsaZXksPGQ8/8y7aZ4cGsTF0XpANKjS6prZs7Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1noSr72TWZ-00JZSC; Fri, 25
 Mar 2022 15:38:34 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 02/12] parisc: Add __cpuinit section for HOTPLUG_CPU
Date:   Fri, 25 Mar 2022 15:38:23 +0100
Message-Id: <20220325143833.402631-2-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MBBV1qNjMo6rULsrlVh4hZ4WFQTTngRNVYrgdw356TXY+Aor2WX
 t8vLHfLesxvP1OEUlO1A5CyVdnDJRfwRQ5ZFkIphS4UutNQpG42AJuQoulw6pPJASgdWrrW
 gNIlLy+4q7uUjyv/kXaDoYgjDWneeCbZfPT1U70KCRPXkKC9yzfYWRr6A+lxf9ornED2L0C
 jD+uiySZDHoECrP3fOLvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0GsB8cOhUoM=:11t4NF9qyYKVmubyIPPzLk
 z/49mhdYjlfjyg34OcoorvIz+WzvYM6/3dqXJcwVMVSO8Rq/MlcL5/nEBOcBpa0wlSOunnZ3u
 u6c/Q6FWjaqOopjmDIPHitMjA1WncTbaIhHRzFUQZGL9YtO4NpdwzH1rXnp6ncY9ZatGS6BDg
 uigdPYGyQNLvJdAeJt7Xd/GXFsV4swtnsbHn21Gr/hMOXyl+pvj7vqiOQ6SUAM98Jiysw/emB
 2Vqb5ziVeEf4va4Ig37CVuJ/NC3CtULEd8p/Cfzc8iHkQcnVVNX5l6y0yCL1f+a+DCnRAry6E
 QHTqcR6UtiAujNWNF0ClH3fgm9z7CVaIlyO9TcFyCSDkCAG+Ye/INvrBSfBsLII57SuujVCqc
 Iu4bNWNT3Q/aTrbQNtypTRwKxPumBNZQ45XovM+uI3rDjd2UxajAU0ikR1lQWcDBGK4gkZ56I
 8QAaSdoqzN/dsaMXOeZbJ5hVYsj0A1ihqU2lVyUIqxHunmd77Lm78wJ1RsJjpfch3ZWK7kCZB
 8UXm9s1+IXNo5uLHskKrAuE+q3mmdihbBLHo6TrIarUiXl3qjK+cbiQ2xQ2875LhV7Rgu5tIK
 Tc8EJo4dXuooA6cz4yGclsE13XrKY7riCfNhJ43f/wuXEMNsfr6mDCtWPK8ImJJgRae8e+2ly
 EMvG339enBCv+Z58LVDleiI9qL10mXRj5PjsQRqlquYUvEarmhJoIS46BJFzoqHXbxZUmXOMk
 b5mtFbLQBe14cZZuhakfQRrWIhbm6m+iE/gXgcEPy+aqJnBeEH3QuMbHmR/AaWWW9nsCPv+1A
 RYqHAbVRCe5jp2E/+EyuKtUs+H6CM54QuXKwpgquclq/ipcpMKnNJQgbj1ecJN83aUoQ7W3ON
 FhJx9lB6xXqnA1TAyL2bT4++0425zUSO92DQCAD9cd8+3hzx6zke7ckqNb8ssVdheeRGuH3QH
 t3wFyJc6dt5s2s4//RCNs52kncT2XUkyzxapxnQZhW8UDJNExCjlYEPodCQiH5/aj1L+9ug4e
 AMOpmIIx4/MlaZBljuYeJiA0uwb7eZhBbSaFAeaxy5w+kApPONVRHO+jDz2H2cpsvg==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Provide a __cpuinit section which needs to be used instead of __init
when CPU hotplugging is enabled.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/sections.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/parisc/include/asm/sections.h b/arch/parisc/include/asm/=
sections.h
index bb52aea0cb21..4c28c7adaf5f 100644
=2D-- a/arch/parisc/include/asm/sections.h
+++ b/arch/parisc/include/asm/sections.h
@@ -7,6 +7,12 @@

 extern char __alt_instructions[], __alt_instructions_end[];

+#ifdef CONFIG_HOTPLUG_CPU
+#define __cpuinit
+#else
+#define __cpuinit	__init
+#endif
+
 #ifdef CONFIG_64BIT

 #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
=2D-
2.35.1

