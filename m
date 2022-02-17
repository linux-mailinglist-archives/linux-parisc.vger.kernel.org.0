Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA944B9FE0
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Feb 2022 13:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240317AbiBQMNC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Feb 2022 07:13:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240316AbiBQMNB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Feb 2022 07:13:01 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F642B263
        for <linux-parisc@vger.kernel.org>; Thu, 17 Feb 2022 04:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645099960;
        bh=QwFeTDflzfrXe5GQ7u/axdfuudKHloY62+8a4ZjvNCM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XRoQowYxBVkgP4Vbo4JUzBmdSlf1SSZhy1wd2m2SY2Q87qDOx4icSDyH56DdkKB07
         5ZwBFq0B1dkCIXaA146Uws9BrmY//gP8JsOAevQYc2V9/UDa0rj/Q/yH60wRhqjzzQ
         AgCLc9cP6WP0bFoLY+Bp58ubBbjtLXnyjwPR5ZII=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.175.13]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3bWr-1oK9zH1igF-010cVy; Thu, 17
 Feb 2022 13:12:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 2/2] parisc: Reduce code size by optimizing get_current() function calls
Date:   Thu, 17 Feb 2022 13:12:39 +0100
Message-Id: <20220217121239.158611-2-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217121239.158611-1-deller@gmx.de>
References: <20220217121239.158611-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n4XJdq6gkr6CrXab1zfpG+yyko5bZDvFgS5c5vrC39fVBAZnH74
 H0Hp9lWS3afX8wdn1BLTUcRGhWcltiaB0x4EsQO783Oe0zo5KMpPDFrnQ3eMfaZL7b9SQiV
 FaS+ylH+BXaiohb+bqC1f1oGmL/ngPEsuFNu1SFsWRUdxtrW5ht0CzzPLRKUuYMjUMNC6ub
 YGx35lPBPX/d4vzzj/sYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wcJw1e0/vGE=:wonGNe49POorStaIbHGSI3
 ANy64GmwlQECAsWAD9nbcatCVKENlBZHMicbj++GffKXHut5raFQUJ49KUrNtU3Q9dlrl+U8/
 uvNoDqXoDwR94e22L+hrvmajeB0GfTt2vYnrERTSNxlLZ07OpW43kpPRbaprs7faH0ZTdpGa8
 4GiXXun7aUgH1Xu8p7nsHCivy2Wr1gQwXM+J6Wp2oceBMO/s1Cf+ec347kSyPD7HYAy2KmmwA
 tjorKVJEmmHHFXLAc98wY9PLl50iNtjwWXM/+DJpJx2VusTrYdM5KGAUARK0YgShMC9HQgHTw
 6JBfGlkAgpkAAaQrk0pTiX6Agy6QS1admWb44x1jQA6dnfDid/UDMMs2MaynygxKGj/Dp9peJ
 NzbPHZoxG3KWmx4lx3ZIpinA/LTHIOJ3R4eRM7nTgj3NrPu+HK2HOUCo1u4VQgPIJPVjMkZhH
 ybjWm01zXBf35LXf63JS7Rel6z0WnHnRe0AyLAsfYL+btEIo7pkoGpoAkRDme/PNyIKqX2gIz
 D2h19gz4PF7zb/k6aPdgP8WEd6DxR0QrPimoL1WnVFmXgaabKauzGQnN1syOz6HQA7NUdEwRw
 DuCjPRTaLAe5KH++hL1zbp1Dqf3TcziKByIM7ftAI0hiLCHyxqUMIHGOiCvUqeHlh+mGLww+G
 f+ftF7zYFcw8ogbhTCSffqW4InEIXzvAE8nILil5j/v9i3a/MLlCA9hYBI25LLrh5ed5fvhYo
 KC6s4KhTJKbg1xhvmSGm9cgBcrv4SPA4VuOzBDLk1gEu0BDHCU74dLqZxoaKZaDwAzac7acSR
 QLUOVA/7TwfduJXhAzuzn7KhuZwKrQTzxmLbzWcWK7pdy1RaIja3pd7Lb2fU9u+wUBeDd9LtT
 MmJYI9sXHjSwp+/dW0fTH+6MnXUgbLcKs45QP+I4xNsIct5xL0hA7vIXnZOzX/4g4ENZyeYuP
 2mwYbemkYIqFa45NFD0rkQqXqVkFOOKyBDZL2KTRvjdzlr6TzSwB7qeN7dzI4alfC6T9z2fpK
 TIdP075tCjjAt7SfR46EbQ3f+edxZlZSyrkmuhUQsHUxZ3JnMIq50frUJhHkGFcU4Q==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The get_current() code uses the mfctl() macro to get the pointer to the
current task struct from %cr30. The problem with the mfctl() macro is,
that it is marked volatile which is basically correct, because mfctl()
is used to get e.g. the current internal timer or interrupt flags as
well.

But specifically the task struct pointer (%cr30) doesn't change over
time when the kernel executes code for a task.

So, by dropping the volatile when retrieving %cr30 the compiler is now
able to get this value only once and optimize the generated code a lot.

A bloat-o-meter comparism shows that this patch saves ~5kB kernel code
on a 32-bit kernel and ~6kB kernel code on a 64-bit kernel.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/current.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/current.h b/arch/parisc/include/asm/c=
urrent.h
index 568b739e42af..dc7aea07c3f3 100644
=2D-- a/arch/parisc/include/asm/current.h
+++ b/arch/parisc/include/asm/current.h
@@ -2,14 +2,16 @@
 #ifndef _ASM_PARISC_CURRENT_H
 #define _ASM_PARISC_CURRENT_H

-#include <asm/special_insns.h>
-
 #ifndef __ASSEMBLY__
 struct task_struct;

 static __always_inline struct task_struct *get_current(void)
 {
-	return (struct task_struct *) mfctl(30);
+	struct task_struct *ts;
+
+	/* do not use mfctl() macro as it is marked volatile */
+	asm( "mfctl %%cr30,%0" : "=3Dr" (ts) );
+	return ts;
 }

 #define current get_current()
=2D-
2.34.1

