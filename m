Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8AF4F5417
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Apr 2022 06:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236984AbiDFEEA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 6 Apr 2022 00:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573652AbiDETcu (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 5 Apr 2022 15:32:50 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A9B245BD
        for <linux-parisc@vger.kernel.org>; Tue,  5 Apr 2022 12:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1649187042;
        bh=pP2xQm1tlgSidsO2kPCbb9hLQ3H1/DMpNvKX40XTbu0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=At8Dwv3TLEsLhLoU5Jh3HxFE1nhYBBRX1NcCoiTuvy3g/gC8etDU7Q5ZGwizywKkV
         vj6/HveBbI40bOGP1w6+iqCwl9jsijyiD1J5gRowT1hIBKn7zawKSNAOsgeIJQ4s6R
         UnDSOKjLL4NTgrST3CUh/ziv7ceXOXKbP4xM6w2o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.146.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1nTOnz1bmr-00QoFu; Tue, 05
 Apr 2022 21:30:42 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Change MAX_ADDRESS to become unsigned long long
Date:   Tue,  5 Apr 2022 21:30:40 +0200
Message-Id: <20220405193040.19117-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BRV+e+eAD1k2PsiBgliZajjYfM3WHasucP0BWfaNu1zfLRIhFej
 DBdAcRyJJbLlQq5MMvUSBZQl+qAFafJeJyu3ocCr4NRKSrObBXDdUD91zieKqBQtCkCI0QO
 FiN8jb4sbSqviYwquTCc/bAHo8ZDG08qoS4hYaciRjtCtPyk/TqRUV48+vl7yt8xauHGgDq
 RIr3qoXQucNFCWxQbuT2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qFnCOpdBbko=:GRrQ5Io3U0ooCjDD/tDtG8
 5k8asTIavxoM6BmJqvl7GPtfFBo/N1lRRYdMc7fo0zkUtOxHo3EHfFaPshhBQa/8YBjW6mAPs
 prnebHAPfcZP80umdiC7HeWKyBuJZSbDdUICTvUpSocmj0hsNtOiR760+LuSkDKMzeq/QaBE8
 lTJIJbZ6fx54b1ij8/OSMVho9Ykvc5ggvlH9hTJVYG5+0eYI37+EhnamHfGymzTAUG2IPcD1e
 0/O3YhdaWPTJMMdOmPsjMDWpiCf7mW7z79cnUvWzNrYDjsBTgZ+Rz7H4+ESc6YFNyBrGfGg3E
 3gFXVO6mYkH5o0jqjnq/Q4f9VJ/fRxTyfu9yH8lGZxzbMepOJFT/IBF8qgotOiH7zMgD/xZtA
 WIp00beXUCPPiGjiq8J3O/yThG2UEuAM+E48VUSyEbfy7DTqS1CUi1+AXTiuVrX6lXB3kGvFe
 sEyLkS6E0MoS6BNzWeSzm8iaFJ5Cz8epF+n5ObGggXZhrZsmO4GwfhBfCpHfhtQAweuHdZDRc
 m+Kto4xoUdjcneqxKWXpLFwK5h3nGA5qevLlUhDRz1UQUyU4ueI3v//MW1ivY325nlXScgXY6
 SqqWfgdLDAuVUwV2Ar/ykSlG4WFId7fMJZ0IAbC/T83FdjMlstwiOA6aJoaUyATP0gLrVMCK7
 aTusJ4kpUxXXVyBOjFMqAl2WSVVB1aoSmmZFWNkomhfB8Dl5yainyu+cUOnGzyDGuU+LLncVM
 X6uTsgT8fEVv8YuDJIQqCFBasjLkNakx1Xt8Br7dZF9b96pqzV06TmljGqXzBMNXqXl3rfu8i
 abA0YCyWbxf4xajhAo57FvU3dtZnoBSZCcLe3cT86rtcbIczOQiLlk5bWh+6dxA+VcS9zJETL
 7tJDcX6XpDDrFTNLc7Oin0izpiNl9QSEyDWcHNGtOJpPe/Toaiwg3eSyKYxo0/MoUsEjBMDPN
 FcicW8QgnYfmogWKLOtixNyhAT07qsL6dtP+3zuNDz8gVui0yPDKFmxVsomNUpeXwDyp34VxU
 BB46GzyPIL8+bKVZfSJggduOOBCxO6YxZXnZpTTixXyq2evxPxKLirtepAXiLqk4SQ12MOeUA
 CFlls6nMNV1ntM=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Dave noticed that for the 32-bit kernel MAX_ADDRESS should be a ULL,
otherwise this define would become 0:
	MAX_ADDRESS   (1UL << MAX_ADDRBITS)
It has no real effect on the kernel.

Signed-off-by: Helge Deller <deller@gmx.de>
Noticed-by: John David Anglin <dave.anglin@bell.net>
=2D--
 arch/parisc/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/p=
gtable.h
index 939db6fe620b..69765a6dbe89 100644
=2D-- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -160,7 +160,7 @@ extern void __update_cache(pte_t pte);
 #define SPACEID_SHIFT	(MAX_ADDRBITS - 32)
 #else
 #define MAX_ADDRBITS	(BITS_PER_LONG)
-#define MAX_ADDRESS	(1UL << MAX_ADDRBITS)
+#define MAX_ADDRESS	(1ULL << MAX_ADDRBITS)
 #define SPACEID_SHIFT	0
 #endif

=2D-
2.35.1

