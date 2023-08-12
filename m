Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 091A477A2E4
	for <lists+linux-parisc@lfdr.de>; Sat, 12 Aug 2023 22:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjHLUvo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 12 Aug 2023 16:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjHLUvo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 12 Aug 2023 16:51:44 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB3A171F
        for <linux-parisc@vger.kernel.org>; Sat, 12 Aug 2023 13:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691873505; x=1692478305; i=deller@gmx.de;
 bh=JIQBVPk+RZw6K3xKH10iI4GMpmnhyose8jiExeOJZxU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GYtOZ0SSsOAbGSwd/PRAvrOtoptPLOaw6M4OggrmnAdOjgN4FefXNfcgcVApv5gp+v2mVw2
 dWobJWQAR0QUbtcICjEjwd5lSFSM+kv5Nlc8pXLqrSaE3ZlHEdZDfKYJ/3Plh7QYjHag5C9+4
 e1bnNcm2ge+dE4yG6zhQFSg+3fFU8068mhIIfPSFYOYfUnSkqzuPvQrib/J577rK8peRRFgYP
 lFJLRzCZcmX4aaYnuPx6vvuzRCqkoqc+T28yEugJx2/qaR0Nomj0fdjYcs1fIUewfV7qv/+rW
 iAsCJGHPHfh+uOY3wFll7acC9qFPWfzB3r74E1qvOSS9pnG8weNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.153.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWih0-1qJogT0Yau-00X49p; Sat, 12
 Aug 2023 22:51:45 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH 2/2] parisc: traps: Drop cpu_lpmc function pointer
Date:   Sat, 12 Aug 2023 22:51:39 +0200
Message-ID: <20230812205139.401366-2-deller@gmx.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812205139.401366-1-deller@gmx.de>
References: <20230812205139.401366-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YgLiwv6+dN2atzk/FknRdHfZBjUJKsWzygF2UZGpsEjQt0k3EXW
 RudfhDa/3wcF5ldt9PUZu4VXluJoc6BbyqGNGzPGPlIkGRIMsaQ1bYGaSFYRilHgMCoSyTP
 VlhOERt9EHVoo2wv190MKIS0aeASE5eEAar/rmaakiTC3TbJK8/sz5J0lvQktehfJBYz+P9
 hHULCERkILHVET6duksHw==
UI-OutboundReport: notjunk:1;M01:P0:HaBXkf41KDs=;kWAVa/PZagQZ2yRwRidjWp8nLzu
 +oHlkXWJfPu/CyhFQ72WAYDtpjCyjZbr5+Liv76QjL7xPRzg4WLrsaSlowr1HvwvW+MF8eqor
 8ua5UGXlld0Dtod48CsYaIZwfQh7xBBv+Q98EHuT9RVTqVjXgYNXj+LPJLXanbJb5GX1yU9h9
 CAppFimon57jgsbeiKc5nvZAdxv/p+Pe1JSDCATffczDqyhsA5Z3/kdvvIR7MMJWXfe4uBA7N
 MO1VF5L/WEX/ju+QqBuRsOsBcaX0lmY6ozCqeNh8Kqs3mvOoioC5WXVXAjWE9s5csUp1js/sk
 mbwqadENHaIEyxu3yjuqAVp5hRYcxnsfRTNDzAMLlsB0sKW+UxdkXiBplCwIkfPwHXK9n3iL0
 rQh2VPBYTI6dJO1PjgWmQHI3X7DVwiT6/TsKEnWulnrPaAfIQtREeUCumI03Q62M6qa6I+uF/
 gYtE+BmGEWeY3Ig4+VUHn92ZLVJL+3gLHM05DyKM+nufcG5B8hTc1Am2aeL3uNwiQZGf3K2dk
 1MLgT/hMoywzMnHQzPynw4VIp2nLZvPdPv6ecVykrVtj+vYF4Wobqpqz3kFFR3g2EOJrIFzTO
 hXE/E/AwRmz6VzcGkndWnx2PvECIF+kwubcm/sWwKuRPZX+AmaPkD/RYk/JaZojFpi5lG79NX
 PeagiFvUAdLXwrqW3RSDGWerjHR243Y0FqKJoFZ0/KAmzHnrALYim63ignIvSr721r9/y0eTp
 EWUQ5R2sJgN2f8lmGLdPFNOZy4uWakBO02lnnzPICYCixujK+4HPHIBMRokgAoQ37cdcCfmgq
 77OVoPAgmmzRixo56/ucmKnuhXeN4mGIl+0R9NEeYx4q3dP76wkNcGdC47NNNUwxoxbMDePq/
 NxWSX7rjh4oNAPwKOd49zYnJFOrgKe5gj/mPRtdVoEPgZT5vdz4z0yX6d4nVO9mQPt2MJEUx4
 Ak+FBP7x6iF3sbOdUkKo+eQajMQ=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This function pointer is only used by one function, so no need
to keep such an indirection.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/traps.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 3b97944c7291..1107ca819ac8 100644
=2D-- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -335,9 +335,6 @@ static void default_trap(int code, struct pt_regs *reg=
s)
 	show_regs(regs);
 }

-void (*cpu_lpmc) (int code, struct pt_regs *regs) __read_mostly =3D defau=
lt_trap;
-
-
 static void transfer_pim_to_trap_frame(struct pt_regs *regs)
 {
     register int i;
@@ -557,7 +554,7 @@ void notrace handle_interruption(int code, struct pt_r=
egs *regs)

 		flush_cache_all();
 		flush_tlb_all();
-		cpu_lpmc(5, regs);
+		default_trap(code, regs);
 		return;

 	case  PARISC_ITLB_TRAP:
=2D-
2.41.0

