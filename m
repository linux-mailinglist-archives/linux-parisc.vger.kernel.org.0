Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D6360F108
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Oct 2022 09:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbiJ0HQ0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 27 Oct 2022 03:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233669AbiJ0HQ0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 27 Oct 2022 03:16:26 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5320786F7
        for <linux-parisc@vger.kernel.org>; Thu, 27 Oct 2022 00:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1666854982; bh=4bkDGGt84/IgzrbcBDD71Z9TZyzQfGcrUGWpTRyaNgI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=rCDQWR3dMuBIA9Ul9iDzunxMjHiRen6Ii1OBR3Xz9r/COidPgzyGrk0i3f9doxAvG
         UOhejVuCIu0m/FMIFQM5M+VLrDUhRaIWP+E+3cwTJwHp+JbMI4ASHY6ZQXZdZRoyUo
         5tLyyh5gu/OAtFit1pzSomdhVd9jvbUYZa3FAhKCBlaGbelFOgJ4JvhPQdefw8AAad
         iNNpLP2ZLyvD2R3fGWCWmBpUZpMlRpnA8f3iEssuVfmMsm+qRvWB6pqrY81TzlZi3C
         EaPVAJbSXt+xE/lAOlDHPbANaJ9e3OydBfbQ1s+lBIOKdKOsRK4+H0A/p8YKERbUwN
         rVmRVr7P4JLdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.164.228]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYbu-1pUQ1Y2i4M-00m4gi for
 <linux-parisc@vger.kernel.org>; Thu, 27 Oct 2022 09:16:22 +0200
Date:   Thu, 27 Oct 2022 09:16:21 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Export iosapic_serial_irq() symbol for serial port
 driver
Message-ID: <Y1owRTWYoEU7DCZS@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:qP0drYfeMuE18eTAkzO0y8TI/45f8otuXjXDUOe9aZb3h0J+ZOl
 73akH9ubIXlmsz0xlZ8Kr7rAnSFYsvleB61I50Gu/ah7gyQM2JVk8/68pEgyWj8y2BowYhL
 vtIPScc9FqAL2yA2WNDm6H8rYLOX+wQmZFoP3G4VZSxUII1ffVEQWXWjRcZhv7dPcNZvatG
 9a8lQhR0UyhAZ5pFA6rUg==
UI-OutboundReport: notjunk:1;M01:P0:zx7xHPSlqxQ=;FVsC86YifKWWKwj0q3GoRZrmYGg
 6Wd+himiP5clMUiBySPLDBZ528UTFv0YkcJxptyOsVtAnEgHg0YmKUmXrBgmppmDtIdbIRQxo
 T3t9jRBORc0zuFUibrAsI2I/K75lCe+ST3tsoZARbxQluecu2OxMQ/6BBMIRRI9OnQZ4JSv60
 tz8w1Fm35eMeV8TQNkulTv4ZNYb+slfFD5YfBkZWqqgVuJgT1wgvnmiRDHM65T2s52OqVlAv4
 hsYvCXPh3kWya3eXjp/k72LBY9MqheFRnkxBYbE5oCgImLTZS32m8E47r0hm53OxVH2lvnojX
 NdpRXJIeV091kw08hExUeekPfjCdVlEzitVXJ2soLAmGIB5tZ1Xt+RaqUfSl7kUmpXuOZssM5
 ermCZ9mLsUcGuyMjy0uaaOpB9YNuCDWiR3LY8f0HB0v43gvEesoZVYH/ZumRnOL8BgbsRhdBa
 AiZ1u2RftOJsSjtFlOSlMdrAXX2PITLHOF7FmDWRLA4WfmUCmreCSgElHk3WEdrYFlb306i80
 GynHTtl7S/3Irh1IOrvuRO4Ns4NXXFslsMsLn+64+OLOzl+uoWYsOY/G+fPhwA+247zrSNKni
 ddzVtnzoGgjaOIhq/vjGjcICtT58dFzu6+OpIR+RGMpSPwCXCHB7mLyRrYJRBDjcHGjmrbwPP
 qP2b4CpAiSkdmqBea8ppCFCOhaMW0cZc72IcGvUFC6GARAQYfHJskV8qaQGIYorIL7kho1M98
 VzRNCPznrijmG4p5cVfl5eoQBR/05Rq2DSkY2W4yR6vY628Qr6uA9mWuTFGIic/RKH6ACu3tn
 p/FlBDY5VdhuD+NTe8chJYR4W4suuNMVsfqXk9bNSY9E7luyM1FDxrU663BYa64tSE+wf5Bfp
 SC88G80dTs/QBOSoOLpI5tFhZbXECf/vXZDEZFLk2VZL36AMqAmBOf1KCK2bpz51/FvE2kfZq
 j4VI8Iz+P+0XXCbizjy7MZtqClg=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The parisc serial port driver needs this symbol when it's compiled
as module.

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: kernel test robot <lkp@intel.com>
Cc: <stable@vger.kernel.org>

diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index bdef7a8d6ab8..bcc1dae00780 100644
=2D-- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -866,6 +866,7 @@ int iosapic_serial_irq(struct parisc_device *dev)

 	return vi->txn_irq;
 }
+EXPORT_SYMBOL(iosapic_serial_irq);
 #endif


