Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7275A578608
	for <lists+linux-parisc@lfdr.de>; Mon, 18 Jul 2022 17:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbiGRPG7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 18 Jul 2022 11:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbiGRPG7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 18 Jul 2022 11:06:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C45252A2
        for <linux-parisc@vger.kernel.org>; Mon, 18 Jul 2022 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1658156809;
        bh=o4zKpTjQNHkEbEZym97XHDoJWGx5EPL0B2ziJ3n/zVk=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=aLkoxTX8+kD7Gp7CRcAgxm1/p9cKSUxpqYeeWv8BI7hfuv5ClWm6LoMdsx8kS6pIM
         eesDsB+2fxaLHeO2ckUJIQ+Qa9rrsCJ1xzP9DSl2ASDsWZohkaVLNgaei3JgYa7yx5
         x2ft5uuy9A93/F2EXsJYoBYkQa5ZD9hCQkvCFIW4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.165.57]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQMuR-1nr5zs2uZ7-00MIq6; Mon, 18
 Jul 2022 17:06:49 +0200
Date:   Mon, 18 Jul 2022 17:06:47 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Show device names in /proc/iomem
Message-ID: <YtV3B0xcEK8nX1sS@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:eK28FOPwvrae8pOGV6e0nHscemUAJZ9lYRmvcauFWazZ2KMy+4R
 2+UQnSIRMIkec1cnwj3ecY1AqA6Dzi+i4EldF5Bti8C15QjOF5Cxw0PFtAUzZnn6zSvayjt
 c4zGriEdOoLu+nLGHVP8Q/R+yBCBREaEw8PIIkwKs3SZGKsGATmBZ0L8Ul0gBi1yTu+mONa
 4k6JyeAJllw8hZuLg9L6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6cyK0AorOnI=:UnZx78vZ74fq9IlygZhKtS
 66lJBAwtXvr1sggEJceJ7JRUIjGJQlx2xTFZrHqzq05a6HKYC6djjUZyaV1/ojwniZheh+PqP
 9kwTBkGkqxA7bb9F5iqULS3C+s/U0yNma0siJ/TpA3P7T6QcYghsfdDar8P2WTvxii3oTlo6F
 Zd0KmdGBaQnPWz8xCdq/OZw3wi7+Kkn5xKn78hA+hfMjP6r+K3/GsIjvk5nevDp6aI+T+ivo7
 N5xs6JGSNJg605oRkI0Pa4MsgUMC4FbVV+k07v24527ahsUbMaQbKc216N4eC8IGqxvZyvB1p
 xx2VVdewiMh//HFZJLczCT9pfmnKbvlAJoY7+6lLRawG/SSeXEj3DYdMvlTRdL+Uqf0zxDQz3
 Gu/IG5HmZk6NSD+vk2Tqrsi5pQsJ5VgCSHarfEr5O2L3M3Dpcwjv0ebv5MZrvWwj9Pesx4R6C
 0qehZuNtR5oz81cTKOcDiH34I7gUhqXOUs4URO9ju/qD1d9uiTPMGAeg0SeNnGRJHKDDaldiI
 aBf3sX2nrZBwZ0Kzj0Wc65HVkYXd3pwODit45weLh/nSwtvvZPFvXfxINoO8107MYoDtDUBsw
 CFvwAAeqVI+LWa1iiV3u4VoW6IpGdHUWdD8nnwcvX7gZkB6qigxfA7jVhyfvL/2uMij1oQ8Mm
 DkwV6ni0ZaD+KmNHlzYlW1RmxpF6Eyd5hM7l8V+MkgjApqiDxG+ihZjpzEdm8GceUQWgJ4MaM
 dLBs6Copt3krifTVxOOclA3koMduPgzBlb35r3D3myVZHFc8Kh4VPzukqaSrzCT1pqtpBRIUf
 mkiAWBoZcgPc+WjyK9Y0eIapeqOhpxzCckd88LGZ4I/cjoVZUL6DlxAM9eqh4i8kR063Zorzu
 X9mfpoeutiz49nrOLoBkz+FSyQP7Rq8uU7eBLiv/e71QA8cjVopM+Rtipd0unRFx8a71U+a+8
 2amQOm87Lsg7K7m7XbS1e5NXfdXK09f0kwwSv2ni7sShu+9jJV+XApXBBU/encMBe7ofzlEET
 7PqkPwVQWcH2Lqv0ZtDe86tO4DBUnxt4QxIyZj3UuYrWxo3qcQnl5f3Ro/+DAc3rSl5osF/nx
 I2Z1ITzeZtFKP98AqZJ8eeiURAWHA99RuVm6bPS1yAJh1HFRAgQJWhyXw==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Improve the output of /proc/iomem to show the real hardware device name
including the pa_pathname, e.g. "Merlin 160 Core Centronics [8:16:0]".
Up to now only the pa_pathname ("[8:16.0]") was shown.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index 776d624a7207..d126e78e101a 100644
=2D-- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -520,7 +520,6 @@ alloc_pa_dev(unsigned long hpa, struct hardware_path *=
mod_path)
 	dev->id.hversion_rev =3D iodc_data[1] & 0x0f;
 	dev->id.sversion =3D ((iodc_data[4] & 0x0f) << 16) |
 			(iodc_data[5] << 8) | iodc_data[6];
-	dev->hpa.name =3D parisc_pathname(dev);
 	dev->hpa.start =3D hpa;
 	/* This is awkward.  The STI spec says that gfx devices may occupy
 	 * 32MB or 64MB.  Unfortunately, we don't know how to tell whether
@@ -534,10 +533,10 @@ alloc_pa_dev(unsigned long hpa, struct hardware_path=
 *mod_path)
 		dev->hpa.end =3D hpa + 0xfff;
 	}
 	dev->hpa.flags =3D IORESOURCE_MEM;
-	name =3D parisc_hardware_description(&dev->id);
-	if (name) {
-		strlcpy(dev->name, name, sizeof(dev->name));
-	}
+	dev->hpa.name =3D dev->name;
+	name =3D parisc_hardware_description(&dev->id) ? : "unknown";
+	snprintf(dev->name, sizeof(dev->name), "%s [%s]",
+		name, parisc_pathname(dev));

 	/* Silently fail things like mouse ports which are subsumed within
 	 * the keyboard controller
