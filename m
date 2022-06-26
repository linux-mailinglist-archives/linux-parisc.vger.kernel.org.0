Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 821CD55B10C
	for <lists+linux-parisc@lfdr.de>; Sun, 26 Jun 2022 12:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiFZKNy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 26 Jun 2022 06:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiFZKNy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 26 Jun 2022 06:13:54 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69611146D
        for <linux-parisc@vger.kernel.org>; Sun, 26 Jun 2022 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656238425;
        bh=jKlG43vKonX8SZBK/M/E3ZkmVqAJ89qqlVbjdyvtzUQ=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=bPRkK1WUmZcJ/ydqRIFM7sanxfCjDCV6j9TmmSiSnPjg6GkNa4aP8mZ6M161jPg0h
         PUtKL+yRm1XrzE/VxfrESVinOZLiizv7GEf/tNiv3FVKc1o5hRIN7gKRg+c5feX9PO
         laCTwaGSnui1UeXvZubsskhPAmk6gvB/dMp8agBs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5rU-1oIenR1vYu-00M3v7; Sun, 26
 Jun 2022 12:13:45 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Enable ARCH_HAS_STRICT_MODULE_RWX
Date:   Sun, 26 Jun 2022 12:13:44 +0200
Message-Id: <20220626101344.122111-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VQRlxpqldyWjBo/2t7O9aw82mMqD12kHimsVWk/4Fz6r5XI5ErO
 gEqw2tu/QdWuPNgLBUczcc4t8XSH3FINFIOuMHy9odYqZHwWOdrMSPtUsb7ztikT+2AT+lh
 nx+l3xTAqHMzc83WAsc7PfPPtOHRUE5BEKuHawwGhvosO9raxv8Se3dUIC9E2FcMMs+Bq7/
 +cV2aWrR6VmPER9f4B2jw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5yygcQjxZgE=:YMONq7JhPs8EynVDS/eQtg
 eJHBF2tPujhWQML3miSQC2Nh2JM0YlKqcg/QWE+dFuEAhJiMWEOr96EppIIliAj5uJ4rKU4z5
 QPP9SaisfuVudnVJEpwBM7+lc6KWdpT1SKeB/qt6vDjkVyjCV/P5Uo2+NdThBS8lMvQnYp/tP
 rGtBFD6lzLT+rQGrktJ3BHlieuzYehvfcMeFrMlkfVe1J/vNyLBdvVAuGJ/4EQ8icxfj0wLOd
 3MWeZpYFcgrzferYJ9wDmracBR6ug1HdrMz+gaQGRjJoXgjJCjPGvuYlvK1mqAZDiqwahK5RN
 kgtKEHuADGbkjEORnKGgPks7HduGA1XQ312GO4aAvXLyCAVZxgPCGf2V0hfAL2Y+H1yGxo32/
 0mtK1U8Hz4qd1nRd9f4LZz3DQUhA4PItUtkGYXvfHrsjcytZyy4IS8+rwJqiVbfoahUgQgjaA
 b58Fj+tg3hMi1zCffalOu0eRCvY3lNpvzAZVD/EP7JKMRKUrEzeJrv+mz4if4VLMoBmCy0b33
 LqemKB5Wnubl3/Q6tPs/nxLFsMwvoVVKc3noI6i9AZO4lHkLzjrPzmOvuY+1JQ/1lB6dJ3xDw
 mOBcitwmGYrzLpbnR96Hj0nyOoxYzUOWFwDlxoWs+P1+cN8frOLkTDbUDpuxu1OnWypkeCNYW
 qQQ8fQ41oeVvUWtKR9IfzPKVJRgr9nuSKTpv2nUHLk8dO0A9SzQwh6NbdX7l0+q+XfJ4Edl2O
 zfj1EFvRVxEwCdxepVns/indOkjIwHLRAMaiNiBvwyehWswWdHWjGjL9R4pPSbvsT/FuN7kBl
 sx4yqTrGrOQEHLUq8FhzirvmSfG96c8BI31te9KVVNEDhND+Qi6rOPZRIsF1JkRfWCnz8oLKi
 vGXIQzaHOMup3DOheW5oKi7ML57Mn1s8HNE85HxI7fLJ7uDgVQFESnc+z5xvSRhrD+0idOY1E
 vZaQcInh3L2dVAXt1I5EzwFv1WKoOMuKx8YU9M8sw3UdLh2CaFKjlgqm1q+/sVwPi198aoRAH
 +7aBEBGtwrBZHazIHzryL529VLWNYGvq+M8VNTxMaOj0dAB49ppZ6rPszZCqEppjuhlM+av9A
 Kdh8LpZ+0LrA72qmRr8YpXnoWAqumsziq45QGFgTTytU/7U3m8U/bQsVQ==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This fixes a boot crash on a c8000 machine as reported by Dave.
Basically it changes patch_map() to return an alias mapping to the
to-be-patched code in order to preent writing to write-protected memory.

Signed-off-by: Helge Deller <deller@gmx.de>
Suggested-by: John David Anglin <dave.anglin@bell.net>
Cc: stable@vger.kernel.org   # v5.2+
Link: https://lore.kernel.org/all/e8ec39e8-25f8-e6b4-b7ed-4cb23efc756e@bel=
l.net/
=2D--
 arch/parisc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 5f2448dc5a2b..fa400055b2d5 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -10,6 +10,7 @@ config PARISC
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_STRICT_KERNEL_RWX
+	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_NO_SG_CHAIN
=2D-
2.35.3

