Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED51D4D68D5
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Mar 2022 19:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350936AbiCKTAY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 11 Mar 2022 14:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242878AbiCKTAY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 11 Mar 2022 14:00:24 -0500
Received: from cmx-torrgo001.bell.net (mta-tor-005.bell.net [209.71.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 446201B371B
        for <linux-parisc@vger.kernel.org>; Fri, 11 Mar 2022 10:59:20 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 62280491003AE0E5
X-CM-Envelope: MS4xfLT98fQyUNJMYFZY6S7OnC/d+DyJeMAAVZUWUs5z05rJtTixdL/Gnp2YREEXtSQAEqa2mK2t5zr+GQLRN5q569FpJ7qVkR9MMl6YAxezmHkJgg/1JHiB
 jZSGlWuYPicHHzZZEtECV199943mzPgqnY4Mo/sc43nIQ0/3HGRfUKBTWjKffutwzZq95Vh0mKEU9lRVcM8PRKi2MN5/j1NBSro/9jPcBZW02jinS5+FzEu2
 YQ+xZ1fx108x1pp4sgilNsXg/C1OpKBI4y7lPlsi0yVZg1YZfSuC2IPpUxjS2ZWM9rB4cJRtlNBQ+TWlSot2S3eKY9+2+kuhaCgFoh1UoQ4w6SneBzUUBZe+
 qE7Hc1yUPG+GhvlsLLVm9weMUU4WVDn594ovhHpW/bj7zr0E7cpkK+3OpIAmd3wxqGNb+EbUH6ukJb59qE5JlTjdC0fVR/+WZjxE4JzBMoHTb5SDuxt7MFVd
 RrC5VPNmF3a3hQvlhV6jCx6AdosqA+Phig285It7YBHaAqclz+EaTVYWLxX9QjWOGIReCBzO0CDLbzR13uYIPjr7Jd9ThYBoH42oyPFk5kOcIMf6cuHDfruY
 tDWxEmuNLACCS1beW5e33MjCDI3FDR4BOMG1kZhcUDV+0g==
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=622b9c01
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=o8Y5sQTvuykA:10 a=FBHGMhGWAAAA:8 a=RSDYW5cEIICebtOVsnUA:9 a=CjuIK1q_8ugA:10
 a=JWyi9f5enEdtDAEazwIA:9 a=FfaGCDsud1wA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from mx3210.localdomain (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 62280491003AE0E5; Fri, 11 Mar 2022 13:59:13 -0500
Received: by mx3210.localdomain (Postfix, from userid 1000)
        id 8F872220115; Fri, 11 Mar 2022 18:59:12 +0000 (UTC)
Date:   Fri, 11 Mar 2022 18:59:12 +0000
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Increase parisc_cache_flush_threshold setting
Message-ID: <YiucABkD7eYLQ/0T@mx3210.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bslAzcOv8b43gu6L"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--bslAzcOv8b43gu6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In testing the "Fix non-access data TLB cache flush faults" change,
I noticed a significant improvement in glibc build and check times.
This led me to investigate the parisc_cache_flush_threshold setting.
It determines when we switch from line flushing to whole cache flushing.

It turned out that the parisc_cache_flush_threshold setting on
mako and mako2 machines (PA8800 and PA8900 processors) was way too
small. Adjusting this setting provided almost a factor two improvement
in the glibc build and check time.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 94150b91c96f..8368fefdd217 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -388,7 +388,7 @@ void __init parisc_setup_cache_timing(void)
 {
 	unsigned long rangetime, alltime;
 	unsigned long size;
-	unsigned long threshold;
+	unsigned long threshold, threshold2;
=20
 	alltime =3D mfctl(16);
 	flush_data_cache();
@@ -403,8 +403,20 @@ void __init parisc_setup_cache_timing(void)
 		alltime, size, rangetime);
=20
 	threshold =3D L1_CACHE_ALIGN(size * alltime / rangetime);
-	if (threshold > cache_info.dc_size)
-		threshold =3D cache_info.dc_size;
+
+	/*
+	 * The threshold computed above isn't very reliable since the
+	 * flush times depend greatly on the percentage of dirty lines
+	 * in the flush range. Further, the whole cache time doesn't
+	 * include the time to refill lines that aren't in the mm/vma
+	 * being flushed. By timing glibc build and checks on mako cpus,
+	 * the following formula seems to work reasonably well. The
+	 * value from the timing calculation is too small, and increases
+	 * build and check times by almost a factor two.
+	 */
+	threshold2 =3D cache_info.dc_size * num_online_cpus();
+	if (threshold2 > threshold)
+		threshold =3D threshold2;
 	if (threshold)
 		parisc_cache_flush_threshold =3D threshold;
 	printk(KERN_INFO "Cache flush threshold set to %lu KiB\n",

--bslAzcOv8b43gu6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmIrm/cACgkQXb/Nrl8Z
TfHqVg//cnSvvT5jz0eZVof6d/5WXfDL4A+kCn9+uo5iP5hLs5XnKFWpE+XJ/8GY
POHYoK5nz3m0Q16LnqgJ4vDdjJZJlV4QSwKl6UOBR8BvZ5/dIehj/2OLIJo3xiQd
i23298Z7wRSJTZy2DlNOdxXOlE3/4CV4CfLPQUANzWWjM9KMS9DLav6bcuI/s2P5
IXw5jt/JxhPOQNIV8xCkhVYkdz+cxhFxmOL/BV4k6jc4wn63S0RaF1df+vwnmu3C
PrmD6rEjJL//z5sXUF239Rkoj8/O3h/OJjjkfZRg2ZDXQdOVmpNlvE8PB56iReyC
BUCNVJUg0pFwwq82eRBcI3YdSx45llB8gtX+lLOKLnVzKXZns7HQ69EwpVoSQjh5
RPPWeHqpuLpE8XTqyw+AkrccO58LBEZ/tqzxY2u2ZMme2OyS8j3DvWqjJE24gq48
bGPGOGJhorw8yVargazcMpYYIEARtzdGqxc8y/oqzNIFPBUO30IWAUPsHeUW5UsH
gOKEj7JWv3jRn55NCUDum2thpUf4swHrIpV2lYEWeOg74fOESYCi7dNWw/m+brfK
f+iGG3iKAPiUPklhg09v7yUSfBjzpgvmSq9hx+0LEfXJL4e+1zEJEriV+PLlK9Vx
aKovYYxqc7Neduqsf6//hfuy4loEsK/Gn12m8uE+wT3LgNyTXSI=
=yfBF
-----END PGP SIGNATURE-----

--bslAzcOv8b43gu6L--
