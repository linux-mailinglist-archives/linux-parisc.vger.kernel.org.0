Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9456C4EFBA8
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Apr 2022 22:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235145AbiDAUd0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 Apr 2022 16:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbiDAUdZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 Apr 2022 16:33:25 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0531E102437
        for <linux-parisc@vger.kernel.org>; Fri,  1 Apr 2022 13:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648845076;
        bh=LJBKA8q7jhmTpgfkcVbvdAAatfJXDOkG0+64Hqsize8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Q/4EVV9b2oxJC5rDg0RO+ic8NwGw13Fz/4YwRN7vP+jd9Qk7yGU8Qpy6seRZuXHJe
         M6Vkz0qUWUATD1fuQmIWDUtsDPDWU5j3DWPZ1e2O0UNB+oZrS4AyRIrmbwXQf0+HwK
         3ir/lfS5v0hOW44jULXD58TuQGDu42bDf3Acb89E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.191.12]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXuB-1nWBkh18tL-00Z2rx; Fri, 01
 Apr 2022 22:31:16 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] parisc: Re-enable GENERIC_CPU_DEVICES for !SMP
Date:   Fri,  1 Apr 2022 22:31:14 +0200
Message-Id: <20220401203114.348053-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D8zg+oO3I3VR8w2Ms49aXd/1L/fqZEX49Eem/7R/vW53P+ZpZfX
 6eoPNWxiIpAZ0qDkeezBHp+sUZBKrwUvTDSv984tGjecWApJyARuFN94kqWTfgomoPJz+n2
 nhzQsVcCwljqql8BUjp2OTok5afA54NK8dRpwzlYH8BMGwSGgFm2olb30JH9mWZB9jw+9aQ
 n8KcMErhVbPbgTyKvF+ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Su9vLY6bzLY=:yzB2zNsggATOzN9KTRHlll
 3NIvjrs/iAEWk9Ttl6XrUXruqx6uj2LwEIa+4aKjcCZUu2QxXv2gaj8Tn4g5ZiTtlixa+gXAU
 aCYG/GnnoowiWAudKx9dWBQyFQ9LFRTCUNcbHE9klmUhaEME2sndx62530PD5R4K8Xq6sp4Wg
 unmpTsPcR9LW4nJJW4d3C07Tdm9l/scADx0pYBKvv9vnbMtEaPppUdEuWSQO+W01rYZfr9+4Z
 gms+Y5cHJFCjaQC9V+fbmW30EPilvJP3tmxUhRsk2y4i9PwEwmpzNqQHE+GrLg5PyJqPLhXce
 EGMjA8YZm+/09knvXlCiokwtycn5bC9+9oiU06BtERLlj6KX23AQFy/N+mA03lOYdUmJxMrH9
 Aopek02vvc5O47nIELpIv6UyBqMCUggfnAui0Obzw/UC0TeJAEqsTwigznjfsomqNrl4MzOUN
 yK5pqb8TUr09AhO8Icei+yoqSIU3OvIjwza3csEk21TFLFmZcnTbhNDLRN1WuSVly28BuTd/b
 /IfWEx7WppnBhzoNqZ7hLiCns9Sfj+KxC66cyEft90F2/22pv0PJTUvQoOR6SZYPqQWZFvxjO
 AFpOyDw2cX7gDc6PNi6hc27FbFpnI0CuKMdSYdLuZl1lGGfIS+mHjHLyPSsRlJ+ShWgMBR5S1
 LPs6UTsOMBSNYs4f+wUcVqCKqdVr/BTFg5YcxoVO2XZ39P6fUGY9hhcFFe+Hq8Gn/4KeL+Kyj
 jaqDUTGvFb+YREGsVXDZPq4gBrx3Qly+Mvhr9+98oWVebwWMT4//KAvMPpjn7vKVl+nqbidb6
 9VMhFrnEPjnkO+mNo5Y2QLmxui9hd6SeF+M8Rh03BqjXazxp/W+YCHg1CuUQ2qhafGuFipOnL
 kI+HySvL50J7fRYd2w6Jw32COLTlFG+Vt0jqDUWzs19RyhvnWnxQQ9hpyZDdHR0g9cozPJGh5
 jaPqJo4mp73K23NiJLelScAiuLRfx0Ie9Hp4rAwHYUxCQ/YUfGe6yMybJCNT44TwJ8SVXupK/
 FS3Q/XrNf8shNFjTkXXlsGmUt+An+AEhPaWaAG9/oguKcvx3iYptwYtBfazAB0TPH1JSGyrEg
 XlVJzPa0m1ufIA=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

In commit 62773112acc5 ("parisc: Switch from GENERIC_CPU_DEVICES to
GENERIC_ARCH_TOPOLOGY") GENERIC_CPU_DEVICES was unconditionally turned
off, but this triggers a warning in topology_add_dev(). Turning it back
on for the !SMP case avoids this warning.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 62773112acc5 ("parisc: Switch from GENERIC_CPU_DEVICES to GENERIC_A=
RCH_TOPOLOGY")
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 52e550b45692..bd22578859d0 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -38,6 +38,7 @@ config PARISC
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_ARCH_TOPOLOGY if SMP
+	select GENERIC_CPU_DEVICES if !SMP
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	select SYSCTL_EXCEPTION_TRACE
=2D-
2.35.1

