Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD3504E7533
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 15:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350856AbiCYOkX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 10:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359347AbiCYOkS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 10:40:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5CF97B86
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648219115;
        bh=rbe7gJ6eCnQ57vZAV9Lr+L2It33KwFigfTexI1h0I0A=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=RWMjhuDp73aJvshkG6YLlwXkUzt+nR6k7GjN0WmnUZzpFCpZlnMZ04slawcixxd1w
         aD/LAv2FhiN8YYeRxTXwBrERNYBdOURqFyhMAbS4xhWjtkt68oKl+YQ4+yocJ6L+gC
         BmDh2GnV5ftH/QgQ09/e2W815wU+dGfVfYPILEPc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEV3C-1nIvtw3g2k-00G2HF; Fri, 25
 Mar 2022 15:38:34 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH 04/12] parisc: Move start_cpu_itimer() into __cpuinit section
Date:   Fri, 25 Mar 2022 15:38:25 +0100
Message-Id: <20220325143833.402631-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325143833.402631-1-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lp+XTO6GnIScy8rzHcyNHFHF+FlZhXv39a2xlcJIaENwrVHmqC9
 Ny6i4L+4Nb2JX1PtJURiOSmo8gD+jq+G5S/F7ZDmzRFLpczoGuctxXJlu2MLaZN+fqNkcYg
 /n49R/Gwv6tbaBJZiy+iUbWzP8ptGg/+7lrrIhlZRCPgSycZENZ5MmtVOkOdlWi0uPJE928
 qNCsvrCJZB9Jnv51G75ZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hU393pN70mc=:YWaXpCg4QDeaPB+xLDslEy
 HaAtWIqLQwMkDcF+EEQpqsfya2z6WXgFh5+OcCo7i+q9AjSvC8weKa9GCpA50rP+/y60ZzmBC
 zCxuNPMpwX4ixvo4ttYUJqyqEw/1UEnmJFFSBJ2kBwtuR9GEnM6+Wn/eAAgmMvgZcmurDMock
 zW+j29y4PZWPLGiHzUMxrkK/azTTSg7TDxLaFNbZza25x+zY1uVbk3QFnkf7wplJp1DYasNoU
 maBm5pIjdFq41g3PAcBliodOF4lCg1tmok5JCigZ8fHg5pob32gd18z+CTdWtHpXKOX/X/vO7
 f82s9LU3uxJNPXDGiPF5d7DFhv1F3gofRcSxhHsyzDNkIun4DDqUWm9X+YkojORhmvzeWwBaN
 xUrveg24WW+d91euOH4xLsk1DejzKItrwzW71pQolR73i3CSXp/SkyX9E4eVVRBD/o0/zEL6G
 RxCqW4/Imalz+8+ukJOW7jxlMs14KA+PCwtoEH+RORB4587hjYric7QKKJa1ZBoxLLTCyXZ3h
 Zsmobq+kbsjAanZts0UNyZ7xQGJi7VpMYhOnklZ9lLFUtl5L5B3SL6PSE/W1I3bxEysM8cQ9F
 3ORyvGX+rajYs+t9i2JnKZKaAJhkwbSrDxl6YyI3LDB+nEZhNBRczBAsC0M0uG7fAWtWOxXiV
 o3hNhSRRsPOHDu/Rt8Q1CKOkKVV1Cbw6clRSYpsKV0PlwXftqzAnYYx8r6kMJt2ZIHJL+CIgB
 UPV/3pxQWOXNHCvWF9z+x4YJICLshu6GB94nef1Pp0W/MXGMGE235fP+vWgV39i/ui7p6Fz60
 c0jlztbrGdZ6C4Izj5xsrIB2XIXh+Qn/pf1lyrzldzCE8i6YaZ+JqdTd5t6v/fsMKySkqyolo
 9daTdZUDiD1MuZP6BczqFKLi3BLAsCz+MxKUKf9l2oYWpmmCSiIzRo60R6XIvlysu6r0CAN6+
 ngQdsBZFQEyiBefG8lQjpSLsHYW1kMw0jGO5gv+7j6bOiofFd+xwehUt9LzoufbPtpDiIiIEg
 P1NeaJzTjcW6vFJiAJVuZHgBmA7HF05DrttHhAMlG3Yo/acNzcb7uiyi9ueqBvqeIYpEexnUP
 jiqWesbYhUO4+Q=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/kernel/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 061119a56fbe..4101392bf74d 100644
=2D-- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -150,7 +150,7 @@ static struct clocksource clocksource_cr16 =3D {
 	.flags			=3D CLOCK_SOURCE_IS_CONTINUOUS,
 };

-void __init start_cpu_itimer(void)
+void __cpuinit start_cpu_itimer(void)
 {
 	unsigned int cpu =3D smp_processor_id();
 	unsigned long next_tick =3D mfctl(16) + clocktick;
=2D-
2.35.1

