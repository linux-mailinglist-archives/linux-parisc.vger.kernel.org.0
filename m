Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B383870D481
	for <lists+linux-parisc@lfdr.de>; Tue, 23 May 2023 09:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbjEWHHF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 23 May 2023 03:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235318AbjEWHHE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 23 May 2023 03:07:04 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F0D130
        for <linux-parisc@vger.kernel.org>; Tue, 23 May 2023 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684825606; i=deller@gmx.de;
        bh=vg2JvloSRx5BBPL4y8QGGCUFScITIJL6WPifEAxLIyg=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=mtTPV/bJ9Fbbn27+TYoI0ffjriYijtdHQNMXVxfl//2Ij3No3z5ZbQAAK+D5fjSnF
         OZRuf2CYEifS47IME8RCbZ+z6nb5om5M6+hSkHvJcqj5eWi/BAztd/856PIiwg2YOR
         LgfrVjZTe01TlWCYdtdXhWU651GZo5jSsTqKm3UXSq0Rv7BBx/ZPFHITDTGq6P82BL
         0epYEbrWSf/2sZ/zD991NYXnH0mKTQOpjKXUOUk0cupjadgWgATCNXd+YgBv/C4GMo
         0+ELujCz/RbPQ/GQGLVn29Q78v6BQK3nLTRSecbDjCrwxJuSe3WWj73UP+n/G4wA87
         lh7NKJIrdxe7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.145.169]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5QF-1pwesz09w7-00F9aw for
 <linux-parisc@vger.kernel.org>; Tue, 23 May 2023 09:06:46 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Enable LOCKDEP support
Date:   Tue, 23 May 2023 09:06:40 +0200
Message-Id: <20230523070640.82764-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0Qd8t4cOJdf7xBnkh7CMTJrK6nNx8aCBRsfpAnQ3kyCSPUnP7ko
 Tt/AHijSst8U0vnRcyuE7ib4/9YvVCJA42p7wiyELbvt93E4/bryxCBdMYC3B5GPTHYuQow
 vdowG8ZtJ0emWojTqAvM6bEUxcLmk/Bak65M6aMI6rpv3XGZqpWdyQ1lOCi+IS9rsRIYrR+
 43ipzcbF3W7GCHd2ypFBA==
UI-OutboundReport: notjunk:1;M01:P0:ZNMAjMbHqSQ=;yA+8ftvf5exMHeBqRjyj1dM+dbg
 dfiXcGvNXlQyk7QUoq29zdLjbcWRZZ5qqf4z5pd8RAlmFzDBWrcwfrNlQdAW+59NEhi3ChC/Q
 B19OT3Hw6vq0O9vbygbVM9S05ifGRicPXFuaYkjlWjHoDHtaY/4IxvKMLW2TwcZKrnUYZI9SH
 0U+ZyUqYoRHVFKoiFIpRfEjceWXNtWCGhOhSLB2PIPHbvuVkDCJaq4B8chCGlLCW6x8kUnUl9
 sPpIEP9Xt5GkCGK1RIbqisocuHIP7ezRRqSCsZXuV7nJtU4xJlOV4kjLg1cNJ7JbYHwv8C4KB
 R01bxiqj4H4xToNAh+cC6l7ZDdGLOjvQ43U4sglSaxXemCWJty1tozi5EIJOflloDNhNzq6M4
 DLqnZI1+69785EU4JhsJRcB+ipD3M2wu2qq1hm4zURSaYsdid2lhQy13scPn2hl4f3kBr/vQR
 ZqZ9CmvtYk6Hg6K+xrpwZ1fR+4VAXe74dE7Ks6xgASg3+BSDYym82fkuGk5Mwg3isbG+r7YXi
 LeI6+IQvPQdcikrz+j2EIwpqAoIe/3sxdT52jvsuitu5/+ldThoRNIfxVkCK2RWuyLuh+lH3V
 KK9wtN4a7cdE8boF7cU2YBU2lqKocl4TNV3CpiwuEXB11VF2CxugdqaQGAatku5WQs+yoLo7E
 vNG5agfSe1xbGI6kwqCGJU7VfvJsAdPKlrOWN2u8v9vDde5VHBaTZZy4/hZzXnfD2PsXqIF38
 GPVCJSWMXH2JyNBwJXjsKqkvLffskqolWhdQcEWJUpkphIqhdHE/V2i22INdqE6g+N4x24UCN
 0uPpFBNr7jw6hI5DDEkxuVtkeAIcYGyg1aSpv2kHujfKvxvJWWSlRvFTuLnnw58bBXmYXaFmQ
 vu2o2rqA5pGweccL1MHjmRfGfnbRniOYIq01PcyzA/WLIjUTR3ft4O7QVj0APAzORdTti4TwX
 lBRyBA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Cc: <stable@vger.kernel.org> # v6.0+
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index a98940e64243..67c26e81e215 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -129,6 +129,10 @@ config PM
 config STACKTRACE_SUPPORT
 	def_bool y

+config LOCKDEP_SUPPORT
+	bool
+	default y
+
 config ISA_DMA_API
 	bool

=2D-
2.38.1

