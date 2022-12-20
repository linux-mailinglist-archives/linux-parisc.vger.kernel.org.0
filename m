Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163A96527A7
	for <lists+linux-parisc@lfdr.de>; Tue, 20 Dec 2022 21:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbiLTUOt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 20 Dec 2022 15:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbiLTUOS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 20 Dec 2022 15:14:18 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EB71DA42
        for <linux-parisc@vger.kernel.org>; Tue, 20 Dec 2022 12:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671567255; bh=fVmAih7wVbxi+e8XqfAFT4qbkjufdfXcRr6okO1sqvs=;
        h=X-UI-Sender-Class:Date:Subject:References:To:From:In-Reply-To;
        b=WMcJ6y+QDqLnAa5HGMBGxrNYbX29KW6UdeejXMPfPwdXQnFTTftSJUhgzQRQhJiPm
         ah+e91AQtsPUgbmJHAl3xjUKlhF4b8k2ig2RLoWc64WS/Ibvh5OFa/HdocnkJGbmg4
         IbHzKyY57qfT4TWbPpFiq2lTQ48xezv4ZIlo4Wv76SJtMaigy8mzrqxLqVNqyFS4Yp
         nmOvL4q/DqgtUKtJ5tF/L1maftP8uEzhCVwYRtZ9q2KwxEA/d5kF255gjxLCvNqlgS
         O0sOWXDZXToLuuU11UkTzAgkI5QhRIqSL5vCr6upwqEuo9VTGm7RN49D1pDOipcW6G
         OyxgGnJbtMP4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.174.3]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE6F-1pRK5V3hyl-00KfOR for
 <linux-parisc@vger.kernel.org>; Tue, 20 Dec 2022 21:14:14 +0100
Message-ID: <7563f100-63bf-b184-0734-7df20f900828@gmx.de>
Date:   Tue, 20 Dec 2022 21:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Fwd: [PATCH] Reduce number of concurrent KGDB_MAX_BREAKPOINTS
References: <Y6DhewN27vMnfgzT@p100>
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <Y6DhewN27vMnfgzT@p100>
X-Forwarded-Message-Id: <Y6DhewN27vMnfgzT@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7S5NNLXUFwtH8CY+GK3lTB0ms4YbBQxrB329WeaDufaqNxZb/K+
 GY4ITq+Tst27IrxFQ9VSjWfQoxaMYOpP/XcZ9fTa8j1aJnBoN0eo8MoVy4jW9tDfVeHxP1T
 FkMHUWFO45hN5zpC0a8GTbMVp5S8kVyhR1JX/n1DVVAJfJ//gwVAn5xeq2EK65ojIG2RFSU
 yc0PxHZ011tkCnrjsZ6+Q==
UI-OutboundReport: notjunk:1;M01:P0:gXxcCETHwGY=;f1EINObbE50IByNi86u9MzxvsM5
 ajVMQxv6GlaRU4uxAsDZMoZx5rRcE4utdavU7wfMAhr5MC0q1GutilhiozVR/mJLqck4JrbKG
 YNHA6YlMwyej0SMgMncXGODzsGSB3E3oDk7wJpgv0oKJ4FDcU8RfLpbfKhqoVXHSKPQPgg4Lj
 axvC73uPs6Gkp0pg1ucSX86WFoQqlJN54K7LulG9RvBcYe4c6jvs75BUL0YQEcElYg1Pxh0m5
 0eEWSBO9ExSKyYrJ/4zkiXZb5Kbcb9VDPkJGG52FF0ovJ36CircHMGmwVAFbbN1uc76dT4ZiM
 faC31WUHDKgbdC03TMOrQiA2eStmqyGbyx4fL0+K9AJsPbhIEFnaQ4OGBIzbub8AkiUb0jLf6
 PnNslhKBGAiqQtzsjhrpwuIQ1eFsweM2VsmOKATXWpvaD5/CeLZRXoGDnN1z5px/8b+dOV/63
 VyUla7D/dzbQ53grypasfWEip5DMDfszOPqpBrVpZ0NxX3KVhIP3tsAziyEbNHd7Wm0Z3j8Th
 bb64xRmu8k9UkcBGIGLz5WKvruug7GCiwh9Jjm5/gkL8M9hFKOYtwP0yjzWIGyFW9bTPoQCod
 0rDChp49+awucRM+ojj8ZSklf3NKDIaANpoqVLLTkbXVKjzP49FoutVTDCjCl8J0Cnj5BnioK
 lLCgo9c8c5jb3E0q4J1Gy2pawL8zfZq+nKdYlaqOogfnH1LCSSOjGLBCqlHVAed4RwcsEzq7b
 dzHeBujwqGHIbDp0O4QMDctCP8qP4z1xV587OqG9U4V5ft/sx00CI3P2Lta1bv22e4UiejkRy
 egUSRmW46CpOX09zEs1cb+naMfMBlCKw4WnzeYsu1GeU1wBiOXWNJdQN+fqmxvyie1jXlgVZa
 KAjHb1cBofBlNejytIR50ODrVbAjH6xsfOE2C5Tafa6II1jI4gHh/5vVoKvUdkSIJI2IRZ7cA
 cXz87eL/WAVJbTqfd+vAthdq/E4=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

------- Forwarded Message --------
Subject: [PATCH] Reduce number of concurrent KGDB_MAX_BREAKPOINTS
Date: Mon, 19 Dec 2022 23:11:07 +0100
From: Helge Deller <deller@gmx.de>
To: Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <daniel.thompson@linaro.org>, Douglas Anderson <dianders@chromium.org>, kgdb-bugreport@lists.sourceforge.net

On my 32-bit machine, with BREAK_INSTR_SIZE=4 the kgdb_break[] structure
allocates 16000 bytes of static kernel memory, which is - by default -
to be able to handle up to 1000 concurrent kgdb breakpoints.  I might be
wrong, but I doubt that in real life someone really needs that many
breakpoints, so I suggest to reduce the number of possible kgdb
breakpoints and thus reduce the memory footprint of kgdb_break[].

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 258cdde8d356..fab81c4f007e 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -95,7 +95,7 @@ extern char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs);
  extern int dbg_set_reg(int regno, void *mem, struct pt_regs *regs);
  #endif
  #ifndef KGDB_MAX_BREAKPOINTS
-# define KGDB_MAX_BREAKPOINTS	1000
+# define KGDB_MAX_BREAKPOINTS	40
  #endif

  #define KGDB_HW_BREAKPOINT	1
