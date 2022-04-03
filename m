Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51F564F0C6E
	for <lists+linux-parisc@lfdr.de>; Sun,  3 Apr 2022 22:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241054AbiDCUI6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 3 Apr 2022 16:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239271AbiDCUI5 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 3 Apr 2022 16:08:57 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129DC3A1A6
        for <linux-parisc@vger.kernel.org>; Sun,  3 Apr 2022 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1649016412;
        bh=UfFARla4LRJo23P894N11t+lOIXNck9rWxYehQZUgO0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=He745vEpdVFBNeD1jIBKyH4qVtw6OaBONNZVAGEU16LL7g9VzaKg6X7s4IepAF7tK
         p7KM419yrgWjDhix/IieQldsFLHWHD30S+o46xqgM+tGSa/MCXZX45bH0gGZMvT9pq
         3OgiVccOIxJvzNZyHTlzyoidVROehhs6UQQT1x7M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.29]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6ll8-1nevB73pE6-008Jih; Sun, 03
 Apr 2022 22:06:51 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Show model and model name in one line in /proc/cpuinfo
Date:   Sun,  3 Apr 2022 22:06:50 +0200
Message-Id: <20220403200650.143325-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RCVOfQoCwt+j2msrSL3st2s9Pa4/dkpjgSuvJxq1ExxHqk+Z5s9
 2Hyhx87D4btBGoxoDTjU9kIDxMikLAPso2gTtMTIYxFi3lfx0NiM1pijExK9AK0Nft+l5Ov
 jxzpmrtTuvzH1fy1Nn3hHDMum2EUmaHm7maI54P/7kxia/N0O4Qpkw6NBqSOYI1X7JNUJys
 frITBS6dMochrCOvlbEow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JLWI0b4DlAo=:GQCOUHjfjyvfJGzOGOK0Ou
 RPAJINqrTu7iqgkJQ88e6NjD16kkj8pPfTZsSDgDk34kTznRz8WLknGwBc/HDvU+qogUemx1W
 8HXPT282fXLtpgRA/cm++UI+uubQsJ9Hkj/ed0aBESns211rEa4WjoyO24tFu9tOIJ4cBUqNf
 eL+yc3nKzHB2INBVKXTjFe0fL7zPgZbcyGsgkx2fKuOTMfzlUx2xu5PDSZRuMgmUR/39kX6SZ
 ODCDymdl0iIP4la8rJkiro6LKx3AyRYJTYvLc0MTzw2AVTimezKwNml8an8Kg6ssiB/AYRuTx
 q+hUr7letbaH/VXDMmDabEtTSVtAohtLPppteOnMqadnt8dq6OWG/KjTfyLCcnj75EwX8ETz4
 pEIUXFTksW3Oar/VoLln+04VlOfzlKoWn8OVr5Meg91KLzA7LliuaMFawoAFfRZI9I64tsEuI
 uFQ1srhJg3xY0/MZquJPhIIAXc+W+OOvSdZHonjhA14pksmu8L8YbHA+ZfST6Fy5pH3yLwDaa
 sdkHOoMS5cEHtKDkVb+1+BWNyAD/AzLVpSd5SmDENaJzmCiO/0e4sHJzLfMOqSVfUrXB6ofOF
 RC46cVO85AGZa35q60cUxn3fI63UHzKFuJQ1NfCXEyQCki6SuIlpd4qXDhtiAxfq0WKQ/82qy
 NEeCxIF1rxSoqeIzArCFjnByWkgOHh94aMkWNjAePFkcit8/EN8mLvRwg2hQsyzlrODjP4oOb
 BgXNe/p4HPFz/5iIZCIOeoP+X20vGeXO8IXY7fVnLyTU93dMI9hOKIKwrGYXmaBEJmkNEygaK
 yV7XCYolfYmw/VcnGIRv70UBlIx5Zn0mx61gBzI8EyHRiD9C1AdH+cdWtU25LFUoKByWtpwcz
 HD/EkR2rIobgi7X/CNS9dORkv3H+MgPvooyNETibnCFXHdMHK/hoYDbbvSpbQrvrFFEV/V1Mo
 d2kEMKysx9PnaxMdibSplXmDpXlQnoWVbiaM59mD/1X/1PU5L18FpuL307QQCEetcZi3FPuak
 IYhym+kk3uyJ3uXxeMV6l1ERfyLOKHhKfZ+TiHM4W/jalp0kB4zBUZ5w7Sy6Paux0PGNf90vi
 rmWPNONHEYrW/I=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The Linux tool "lscpu" shows double amount of CPUs if we have
"model" and "model name" in two different lines in /proc/cpuinfo.
This change combines the model and the model name in one line.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/processor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor=
.c
index 9e92b76b0ce0..26eb568f8b96 100644
=2D-- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -420,8 +420,7 @@ show_cpuinfo (struct seq_file *m, void *v)
 		}
 		seq_printf(m, " (0x%02lx)\n", boot_cpu_data.pdc.capabilities);

-		seq_printf(m, "model\t\t: %s\n"
-				"model name\t: %s\n",
+		seq_printf(m, "model\t\t: %s - %s\n",
 				 boot_cpu_data.pdc.sys_model_name,
 				 cpuinfo->dev ?
 				 cpuinfo->dev->name : "Unknown");
=2D-
2.35.1

