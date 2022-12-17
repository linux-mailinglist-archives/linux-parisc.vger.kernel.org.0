Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB5964FC8C
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Dec 2022 23:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiLQWEq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Dec 2022 17:04:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiLQWEn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Dec 2022 17:04:43 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6B3E013
        for <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671314680; bh=pKwdDsCdec+OWgQwT0Z/y0rVzZh/45ZL17kX64ShjGw=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=q3ag3iH4lWvWrofU+8lHnFE+9y8wkl6Sn1wmSuMYpxARKW7t8cuK/8NG6FegVoN57
         T/hUug/hvpdPhUmJmXC9M+Pyt5sWktJ1cEQtpVFIXPWdSKkbkHafav7CMIw3kNMyCH
         JeX/97513BSg91bTlyXmvWVFFWCExPMYtMipUho9FIDJDGxlgtXWiOQa+YY+9dYtpO
         1ynewn0znWCeiP5U4VIkDgK/67Oq5rBU6TF44fCIPFzNvvTvbFWGVqidVAZSxjorkb
         MLNtpu4INWqR/vedIw5qf5h/FUiSYXsvAVSD5HuXDtx/nJAqsc9dJJiLeLvNW2E1Wk
         5aLpaKoFRwLcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.160.18]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79yQ-1oqJ5Y0Rlk-017V3V for
 <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 23:04:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 3/6] parisc: Drop duplicate kgdb_pdc console
Date:   Sat, 17 Dec 2022 23:04:25 +0100
Message-Id: <20221217220428.383330-3-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217220428.383330-1-deller@gmx.de>
References: <20221217220428.383330-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EYNo8BBWUSpsyuSWDHcuqZJc/DlcdwY91qSfMiOf9rH4XlchDo8
 XcDUN3ynjiRVFGHZ2KSb0mPoSrC/8dTD3IoIvSytk+9+YEYchqoJc1ni3vsDrsZCMGH4J3K
 /Jx38MINIpbIETg0g8WAwSc3WIL/6zCj4K6gcEqgJGeY0jE78Wgz2J6rqnCVw57sCoQ+y7W
 TBefct422UNmEQJTEPkPA==
UI-OutboundReport: notjunk:1;M01:P0:ydUprJsfL0A=;GBUHJlIleiSrurA2JTFNJBDunQ1
 6/RLfF06VZZ3lLZtc2dJMzIKwhYp7cS7941eMwghz6yP3pJS8R4ps7QFZ6oyKH4ihQY8Jg5bR
 kcXTwiGllG9Fv+fcUfI34rV6lEr94+gtCOXVE3HBYhNNXXnPqWohADilOaDKmylYLkXkFzVo2
 jwQluhhfKxykFRboTMj69NW9qHOyTAR/iATFaAEzFIIieESR6BAxWqIqqg1GAE7wU+qIfy/6+
 Hat1xNjJh11/bjwYQYpIE4Go9NSA/iBz5Xn6xl3bmtP68x59KUC/dVFxnNvOOOxtMtmYrZZf+
 PPNvFspdHoa5HhRfDLmi85yqDvp14Vg34exYkW+D2TC68VU2tBUj+hwNTkMDfq0vYM5yyV2xI
 +hfITTB7285K6r+S6F18afz+yo1NwcaRxjXLDvsy2etWGTwUZX5UEZTz6UGdPD8rzZLqRraCn
 NedMN90ucjGEC6n5BSKWDh11JDJRQ/Ib92kyu1IGvErTABs7hZeQMdBJbcQRh7jZhqfFRkyf5
 N9rnw0pBphS6CXAb58qzZDT0H/B5n22VHvlP8VWSaGPRvp5LnivQHYeR2dN5TEI9zr+bPaDXb
 nX+OnCATyBzBdQWn1rhD9vBUznV/Y+Lc0SAd7g40alBxv2yjSe9XjWEdrx+o2xgxKoX2I6Pl6
 E+OqW7vaJy1qH+D0vKqYVNxtTv82hUgy6s9tBS6J1vSxj84CH28lEEMRadZJuze2LVZm1jD9F
 UMQEDes8lC5Rgg+C+ep4WJgAMRiQr5DkHG7JpTjuU+1Wyf4iNH42Cs/8ZUGNQbS3kM4IksDGV
 J627GVKjtD8UJR2w4AGVgvpaDIwACWmWtaiz8QnCT1/zBCTAFNZyThxQYOGGgzvA1XU5Pdh0e
 azYptbpE7uPh19m/IwBwcuSBO8ITOHu2RRX4heA2fxvvKjHFbDzJ2UpaB2cDVZZHh0a3hunc8
 28de6w==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The kgdb console is already implemented and registered in pdc_cons.c,
so the duplicate code can be dropped.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # 6.1+
=2D--
 arch/parisc/kernel/kgdb.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/parisc/kernel/kgdb.c b/arch/parisc/kernel/kgdb.c
index ab7620f695be..b16fa9bac5f4 100644
=2D-- a/arch/parisc/kernel/kgdb.c
+++ b/arch/parisc/kernel/kgdb.c
@@ -208,23 +208,3 @@ int kgdb_arch_handle_exception(int trap, int signo,
 	}
 	return -1;
 }
-
-/* KGDB console driver which uses PDC to read chars from keyboard */
-
-static void kgdb_pdc_write_char(u8 chr)
-{
-	/* no need to print char. kgdb will do it. */
-}
-
-static struct kgdb_io kgdb_pdc_io_ops =3D {
-	.name		=3D "kgdb_pdc",
-	.read_char	=3D pdc_iodc_getc,
-	.write_char	=3D kgdb_pdc_write_char,
-};
-
-static int __init kgdb_pdc_init(void)
-{
-	kgdb_register_io_module(&kgdb_pdc_io_ops);
-	return 0;
-}
-early_initcall(kgdb_pdc_init);
=2D-
2.38.1

