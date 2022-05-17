Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95EB352A694
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 17:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243726AbiEQPaA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 11:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236666AbiEQP37 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 11:29:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E023A4F9CA
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652801388;
        bh=rQE/QQszg9caukrVw+WOK8hY+UhT3DXviwVBj3XbWv0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lezkhdhRwU/Y6cCD/+8V1z6KxBLxkqwmpvZCsxI+SfnRbWL6UClU/Gcykg9xf4NPU
         F8X+LHd5ykKYZqu+uBapoOJZC5xMhbxPS01ddC+gC7BIa+TI78gCLsb2YUWGeolTzn
         nwD+ycw7iuq4QOb7+qpSflbWR9V5lvEkv7EC2PGA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.173.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1nnYqN3lki-015KgW; Tue, 17
 May 2022 17:29:47 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 2/4] parisc: Fix comment for shr macro - usage of same registers are allowed
Date:   Tue, 17 May 2022 17:29:44 +0200
Message-Id: <20220517152946.187638-2-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517152946.187638-1-deller@gmx.de>
References: <20220517152946.187638-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jeM6JNMUow3PBfq6uEZyjnNT/hweUMmmUSCl/f2iCTJz1sr08Hn
 pAEq7Od5C28ifQbTkihvTW8MR+xA6ae6r3SCfWYxnItngvWrU0A25ouykRIboZSpKMc4lia
 vMsq3Kh5sKYDTJ6djsZnmkaVvqpJlNdViI3xUnlm0CtPYAzbdUrF6yidVzsizH01ClBArAi
 FR43UbHZAE+1Nai2dcC1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KvFb7XsDQ1w=:YDC3dSoXQeUDu0HinBlcQI
 NOoNrJbhSEZKEyJc5Ai7/Q0hZv1XKW5gWvtPW3cWYx6+ljrSRChkWT4eqlwqc32GWUu+dez3z
 Pqnik0cb9weLB5Ukh2OMs9qW3eRsmWyK+ANNoKQR5orm7hv5Ipbd7jUhZhxN0ie4ZYDc/U/h7
 oPKd8NDhev7h1w1/FMwJpU6KGT+BwpStDmhDLu57Bxm9y9TFGuS6rSGRkKOuiBZvBTNDyGKxF
 s8PF0YjePvqUW3lJr+vH1iqpFv4j1uGqOyTwU8+5+hnL8wCwyuS7UTUV/DboaxrqaYrx9rtuK
 bacpF/5NcgV9E/9brIr0/DASVyXXu2F5R6jTUAk0q6np/tUSWc9odN2lvphk0unNd6ohLgFYQ
 eB749i0DBFqjXiNaWjWar2QC0LNm3yyRCwean9CgpHXxaP0xGdKpYGvZa3vV+WmCu7TWEFOg5
 I2XHborqzt8SyTZJdHZ7B/aC4luiTtb8PpY7pwHblfZ6pbYjWVo6W+XL06/e8fTxoiaS25KL1
 /yBZ+8J8lXpxzSzyyTC0zgPZXpU4zFBFLFA3fj8rEoRw1nG9Rif/OZnm585DW1XiuQA6y7GDn
 VMZeWsmPr0Zu94DJCuQvc14JbTqpl4UslAU6HRYV05Dut7xXqR5LwegE9q4k1rBJryXIXt+uV
 cOTNQ+aFQ03mPaKvlDtpAN+TTrwsDzPnzDMEKrmiLHLrZM321h2GmgLHUcSu16czJaakN2pmI
 p9sLjaUURs47NG94rCL4OitFY6HnC9gGOn2z6CsIjdezts/G0ekHtikoGnNxKbNVrhiCXzmcf
 mKP84A9etJzMwXDdp5nJn7EX82++XapetpymHGrYjLXP45VGNtmMZLbuBqM7Wf544UV9CktWB
 BwmmeXCgZNdpVwEDfzUmMCRjMCWMvYxUGfA7/FaS2TbQy+ADzCYRMf8SvGIwS1wwa4ogZojVQ
 PtdORYiJVsrMTFi2gIJNJzQIzaIwmBLYIk3lKR2Vq3mBDDDM/BPGOnTBRdWeBgUkey5IgdoAK
 1cVhJ5lZs6gGGMf3MlXzl7Iv7dXgPY267ca2KhMg8JCFU4+x7GxwMDXUplxhNnD/ElAwu0EYg
 g0H48tG4BXrmrIoIajH5Rc9am3UmdvKXtm9UMaoYXjF0eLUB4axHcXEew==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The comment that the source and target register can not be the same is
wrong. Instead on PA2.0 use of extru can clobber upper 32-bits.
This patch fixes the comment.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/assembly.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/=
assembly.h
index ea0cb318b13d..be784b41048c 100644
=2D-- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -143,7 +143,7 @@
 	depd,z	\r, 63-(\sa), 64-(\sa), \t
 	.endm

-	/* Shift Right - note the r and t can NOT be the same! */
+	/* Shift Right for 32-bit. Clobbers upper 32-bit on PA2.0. */
 	.macro shr r, sa, t
 	extru \r, 31-(\sa), 32-(\sa), \t
 	.endm
=2D-
2.35.3

