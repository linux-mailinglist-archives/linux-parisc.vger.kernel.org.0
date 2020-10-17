Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6306B29137B
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Oct 2020 20:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437989AbgJQSNS (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Oct 2020 14:13:18 -0400
Received: from mout.gmx.net ([212.227.15.19]:44789 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437557AbgJQSNS (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Oct 2020 14:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602958390;
        bh=ndfEM6P7ktROJnB9dyrdzP1V5yAlaiJAQjdd2ef6qfg=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=ZpctIgvIcSsw56eArDpYIdt+95Vwm7tvm2q/P5idbkH53xR9qaYJCLA4YmlNrTsMt
         dhK1f6bvP9I+kTZHw9W6CYgJwfqeW9NVebW5QLAyq/lI16FcsEZH7/RONVntClGvzn
         jGmN7Pv/OX9BnhMf3/9/9sk42WulxLBa2CgRe0Mw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.160.218]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbEf-1kbnBG3XFL-009hV2; Sat, 17
 Oct 2020 20:13:09 +0200
Date:   Sat, 17 Oct 2020 20:13:06 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Improve error return codes when setting rtc time
Message-ID: <20201017181306.GA12903@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Jv62ecO/5ropSjHKAmD8iFDX0/8TvRMYQM5S4R4nkJxiGnObihA
 jKVox9+pSw0bfWPpmFqtW8NEmnFpNSOK7x1D1ks38omDt8m3r/6OA9F2NQySD1EZeqb5q5u
 rJqbC05m1w9JJdFdOYyQGIrhOsAnL6vxF+fPVjZdNcBMvAy2dEjhhFl0xOdXpJfOcR6OZbJ
 tgfiAZV3QPolRrJK/WNyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IrWDGQ4R+DU=:KhEoU+Ba1RkdjnNXwJZTnc
 IYvDnsd2cL+dUkUdwVu8Fuo1yo38x2JcseEU/HrYlLWAfkf02MwpKHV2vySWb+5uFE/LVx8Ny
 SAQGVZtDXJ2S0M4SbhjA5WBRlN4CzRtNcVJbF5zCGmsaJuYC9YaaNOtJ4Ju2QF5e+HzrSJ6H5
 LR/uySY9qvRa+Sm1qmIbGFKBSWiWfvtgG8GYs+ZcDa9ZScWOoW5pvUzeniYLEHKiinrd0pJGq
 yoULPzkyWHP3wJ30kZLY0+hKkkzpcSgaqaCNUbR0lx4jsSLmDt/DLfLhe/S7CG5n3XVsROx4N
 zHClEehTK90K9fwfER28qKwvrvTRySCMb7xtHota/zknZ731xnIRemmzexZtw+eqVhb74QA8r
 Qqx+/3tgAxND/SsFvkq0zvPHKrzRTQtzf6ywPY1s8Z4g3wc601FbWU7pDZXimf1/aGdDE/TKS
 NO0HpeSlFVO8lThkZdMT1XhnjM9Ja7ABlpr8korfwhT0I1MPMjC7aRcxYIyM9Q7d8X9jESGWf
 WYGIuZoHrf7N74IgmqzeV+yiOvfB1ktRq1hde1UUCBZZa5HU81VL8uohz3dZS98oR9DPnwwSL
 2w03dXRBcew/oxRKljJll01PKzrMLZo5dIPn1EEsIos1G5YqrviyxQOAriy2fV8NEkpb2ivh+
 XdOOsF4TKpyjHd+i4lwF3Gkjo/w1lkIkt2nQSonn+QgLYi8nQxgXlwtQZ2gQIatgXRdEW53Cj
 BazFi+pJUhNniz6zvbnzZjcpbcggyzs3AlyP42xJVf2W99XFc+gso5VACdkcxI7tAceGOUB8z
 Q5Tk+sQOhn0dx1I0/eF8wLzme/YCgIPG6YYOPqazS/zTwiMaji6X1ge/uyi7E4vgBQgz0wUYx
 cZW+ZJH8330srEmh6Rfw==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The HP 730 machine returned strange errors when I tried setting the rtc
time.  Add some debug code to improve the possibility to trace errors
and document that hppa probably has as Y2k38 problem.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 04508158815c..13d94f0f94a0 100644
=2D-- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -180,9 +180,16 @@ static int rtc_generic_get_time(struct device *dev, s=
truct rtc_time *tm)
 static int rtc_generic_set_time(struct device *dev, struct rtc_time *tm)
 {
 	time64_t secs =3D rtc_tm_to_time64(tm);
-
-	if (pdc_tod_set(secs, 0) < 0)
+	int ret;
+
+	/* hppa has Y2K38 problem: pdc_tod_set() takes an u32 value! */
+	ret =3D pdc_tod_set(secs, 0);
+	if (ret !=3D 0) {
+		pr_warn("pdc_tod_set(%lld) returned error %d\n", secs, ret);
+		if (ret =3D=3D PDC_INVALID_ARG)
+			return -EINVAL;
 		return -EOPNOTSUPP;
+	}

 	return 0;
 }
