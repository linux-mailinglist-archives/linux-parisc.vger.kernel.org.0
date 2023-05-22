Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977C870BF7A
	for <lists+linux-parisc@lfdr.de>; Mon, 22 May 2023 15:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbjEVNRE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 22 May 2023 09:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjEVNRD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 22 May 2023 09:17:03 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942E992
        for <linux-parisc@vger.kernel.org>; Mon, 22 May 2023 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684761421; i=deller@gmx.de;
        bh=7GjDVQ72jouOgUNv0o5SRu3oW9PImDK7nRoa7B8/LKE=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=q4e9n46kOXKxXPco9URjYm2EH/5+zoa6BIFlDlEpLKVlENMT4VPNAv1gEYcdhm6AW
         mABEIZzA5TCX5NtaqTMs28GilKQiYKcVukFh0lreTqDlYCQWZ/JiekUm4dsozcx6Eh
         d7Ozqou2DXKHxSoQmxv4UuEjQKQIL5mXKCLqlnYK8ByHbrrHlkbkxg8aBUplpXPukA
         SVjjE/UA4ipl5A35ALvzLQIFkJf5fgYXBzq8M5F5f3EYHhcu/3goHvbU21BVn/AHqy
         pCNyLvDspISFEyaezLgFh+sJLtQwcnvtrJ6/dntHflMfSm68Ecg1+sQSHm7BKue/GG
         +rA5Zh0nS9Gnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.144.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsEn-1qJ1vn3dgN-00sukE; Mon, 22
 May 2023 15:17:00 +0200
Date:   Mon, 22 May 2023 15:16:59 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Handle Kprobes and KGDB breakpoints only in kernel
Message-ID: <ZGtrS4jHUbWXWdTo@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:0fodhyZB1enR9MtNRIs8ttdUOsCEUasSuhizkY0gZFCwyW6OBa/
 agn9JbQ6/lJsl0+yFwdJbFOueM/TQ9aUDgW6iJE+rxbCcopYUVlvg2p5udiecAxQo73IVTm
 hWXKN6ynzo1AlqbDBLQVtQPGEZSsJdOpnAJYisRI/kju/RTjS/zq7+Mk7QJAftkWYmXWkkY
 WpP/hK5Brg1VUB4f07ZPg==
UI-OutboundReport: notjunk:1;M01:P0:Hb1jsNaaeLg=;A9BJVuLDKeQ0asOhv48ePw1iFV7
 hk2NXpJhpzCPfsVl7tPGwKzHJDbhlEGYdg88vELfN3Run5sdpOg1YX/RnlFDqqW4VJkKEQbL1
 14ZRxtspPOlCXeQUaUVVq0Xgt/jykAEjKUBdrmC77xKeJemHgaIErHaPZodUjqb7xAPLBbSdn
 HY/mQaQhDHKKK9CQW3ypxbWj7GyLuiwW0Oi2ogp2/M1tygH4SDcaLeA82SyWxs3O8f3Mdw9We
 pveZ9AGb0MOfCJh4w4+BeFf8JeT5KwbBrTn0KVCeNMC26YBt/AW08L1+QJ3HjETh7CZ53i3AZ
 iNGZpTyj5FI837emo582+2LtEpy1w0/8X+o0zKbZJ0ezlQ2Z8VvNywoB9kj5iK3Z8URtY38su
 oSt/4AeR7UiNLimg06dx78oQutJhWf9WRyKWUtoY2C/MxJ4tcM59r4zLZkp0Cmnhmvg1DeNRQ
 mK6j0XaPiznEDotgMOHuVCruvui1HA5+r6VXpAhzWOUBybye2P533Lo7ruhAIJZ/SiU/gn4M8
 JLwlFQrVPeLIdBRsCBa/YFRiCiXQN7FX/rESk4MzbaL7U57vuFUHAY9ng1Y/dJ5Xudt4nntsW
 8R0AtvoY7NQAPA+M0A1oTRy9I0wHa4363QFFVExfjCicQc3JOOhonc0wP/kFj7hVlL5tHfbvB
 FP45Ap6oTDKTqvz4L3oXHXQ8nLSCXVaeFqW4I7C5qtnp3BJtsJcPgRStYowUH8X4KhTY9TA+J
 L6dRz25yjieG9XKCn0bS8BwIAtAkPco0SYPj2HmhO0q6A+MiAbcbQ/u3NTZxa14GEmKvUZO2m
 LzI5P0+m2pdiy7MoGq06dO4T3hRH/xd5zQgzLHYI1u3JWnj0FLsWImLBnQxatUdDMWkoEXwrS
 cB89f+7sczXGZC4mTM0uqO7VxsXdvmSYieZ1ThKK2cdZ9N2qUzpo3a7p2dYnRAPBlunga3skz
 CjRcAKo/o2PpmrKIw4bs+8FOtCU=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

context
Reply-To:

The kernel kprobes and kgdb break instructions should only be
handled when running in kernel context.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index f9696fbf646c..67b51841dc8b 100644
=2D-- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -291,19 +291,19 @@ static void handle_break(struct pt_regs *regs)
 	}

 #ifdef CONFIG_KPROBES
-	if (unlikely(iir =3D=3D PARISC_KPROBES_BREAK_INSN)) {
+	if (unlikely(iir =3D=3D PARISC_KPROBES_BREAK_INSN && !user_mode(regs))) =
{
 		parisc_kprobe_break_handler(regs);
 		return;
 	}
-	if (unlikely(iir =3D=3D PARISC_KPROBES_BREAK_INSN2)) {
+	if (unlikely(iir =3D=3D PARISC_KPROBES_BREAK_INSN2 && !user_mode(regs)))=
 {
 		parisc_kprobe_ss_handler(regs);
 		return;
 	}
 #endif

 #ifdef CONFIG_KGDB
-	if (unlikely(iir =3D=3D PARISC_KGDB_COMPILED_BREAK_INSN ||
-		iir =3D=3D PARISC_KGDB_BREAK_INSN)) {
+	if (unlikely((iir =3D=3D PARISC_KGDB_COMPILED_BREAK_INSN ||
+		iir =3D=3D PARISC_KGDB_BREAK_INSN)) && !user_mode(regs)) {
 		kgdb_handle_exception(9, SIGTRAP, 0, regs);
 		return;
 	}
