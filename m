Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8E75FF3D9
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Oct 2022 20:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiJNSxh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 14 Oct 2022 14:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbiJNSxf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 14 Oct 2022 14:53:35 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CE61D2F64
        for <linux-parisc@vger.kernel.org>; Fri, 14 Oct 2022 11:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1665773608;
        bh=v4oE7g1w0BDbzUVHCgPm+mCLtQWtTUIE7NWu7FBZ3pM=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=IW5SkiMTL05NdBiWXJ8Qw1znXr8FtIT/rNm7OT9f5EEagZBSKkfCEVliXBzeJYz0b
         OMPT5RppOrivGI+153nMSSVm6CShl6rGXW7IyeIH0b5gT/VnzLHHVRZsBRrayDA8co
         wBfvnkEgQXWldOZmWLtGLMNqyv+/PEWNHp1sWN4g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.188.185]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ob6-1pFkZK0r4g-015rbV; Fri, 14
 Oct 2022 20:53:28 +0200
Date:   Fri, 14 Oct 2022 20:53:26 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: fbdev/stifb: Align graphics memory size to 4MB
Message-ID: <Y0mwJrtT+XyXAjQS@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:9L15unTKJmmcoKciVaJxb6rjkOnIi6cVBAuKUkejQ/jtJyHkYtZ
 xfSobSSNIFIcMQEBYPVhgjdzl4jkVuiSr62hsoUV7pDxUm+2aqSMAJNwxwNW08piC3h9Jie
 k11NCTz0urjaD0vEX2ZZVKI+ieZDpnGuObA9j2ZPftVl4zNG/ox3R7zWIX/eVBRDbdYOqXV
 GlYjiP0Xfm94eCe1ylUhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rRG8EETIhBU=:+WpWP88oSZP9PSatnh8osa
 Ye93JH234F1Shw346+iQnbUOt6eSS18V7e4ovySdwFBG8CvfJFYq9Tes2jhm6dDqVzpPRYfIF
 L83Tz4wDd8TwYrdFUTTkzH911WLIGUf3dLSAUPIkNigTgPlpD3SDN9mP3JggkttN1DMkC34uj
 SawomyES29dk2Wcv3PelCsBAqDCLR96H/zdUiIr+YTdLvDZK3LTqo14dneFYQ5ZsVQQt73Qy2
 Sk4MH0sJDLga4b+XgSnbnFnfJ9Eqzp3Jni+kEcgC54jI10WWF+ua0kHvvHkxl1GcBKIVVbBHT
 V4I7OycwVXDZ7KJmoeHFWldX+A1YNk7XHN/q8yMN8gKS3SX/Srt4w/96LcI2iMBttaJ6mvWHz
 gfjtgC+TtKiHl9MCpw4N2oxdUzcoi4iOkElQEFq34DQe3wiMrTb9Z2mlgG1XdFTTo21tckE9L
 4NiPvtpGpQl2EQL+Bj+K4fDwE4Sc0WJTQo8TNWjFwX8R3MIasB8RAdySe6wdBshQFSRELV2aj
 egSMdPvfJz6Oxv8FXgAfD9wkdwq5IdbIlQZ2xLCE8hI3lvSHdzLna3eTvu5oeZkSlATe0zgLu
 ZO5utXgRJVDtbbJHxFbwWmgRA72fAQ13VCljBazxyrhk7LvRKvpcGk1FtCtLhnBTIV6TMmoP9
 0hoc9C8ICJvNzl4Kcr9iGBxTGU4RSTYKTKCGfjwVBmUh1ZJmtOJFPL/AATkKO+dT0VeizQe++
 LZ+BnlVJtQra6zFSaMwrjaNH1qUrUCek44MaQHy2ZW/QiO0jbpOcM/ksJ7c2HcORwfsjB9Vh2
 y11SrZu08ckfRRxPoUVu0/ayIPbTMGRaUyIty1P37TzynUM9Uwc2V2b4G/ZEkP/2vylFHFGnk
 ZXrMM6nWh1+gT0y+Ol2VlIb0fgyLj27OPs3yKHcRcBCO+SiuHVqLFyEZozlAAtQa0a6YBcAyK
 wrrc34nPGKLDgQeZiTwW6WEInFU7bHGufSo4jjqEsxzr8HquyFHfOSmul8Up3zd/8P6Df/9rd
 ABqBXl8CSlzPWBtHMQZH+y/I+lYicbweypmgzG0Fs9HgT2B256LMkOmblYezumH80ivsk386X
 ufrZxRTl2wNdu/f5mGcLO2/4144t5OwENhmW5SnjqJZoj7cTxoQDvaQZPnxAYJh039iBZprvb
 wUFn4/nhEE1eCxFeIYIe+bwVpIp8CFXdFGGfjQfL7JhF9B5jHtdSb1Qxm2auje81QkPkUO53y
 qUSIV34B0IkH5w3GyWLOk9vL0sPt/7OTIuzRbIWM3hIf8FYtrFTxGXeM3IED4zadpnJl1a92q
 YrBncW8lNhRZ8HgsX4Ls7doq8WBcmsZeAdl4jtwWQ6LTFlNylfGNfRDu9d9Qgr1LLboUtZKFX
 RgTy6hsVd6OrqNng1ONPkV5Xx0PyuihFpGq5bghTAbOXvBInmfu+rXcN6jF+/TAl6G4yeJyrE
 XzVokPURkPGLWRyx5YP9lT+f2nuAEFUGSRbcoUZBvZuA1uVO9G448eXdYFfYg5gkgTARMBoGb
 TSa/iBXSsgwFzVm1dHamq0OjhBJmUt+iQwLkGZgT2s/+1
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Independend of the current graphics resolution, adjust the reported
graphics card memory size to the next 4MB boundary.
This fixes the fbtest program which expects a naturally aligned size.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 38a861e22c33..7753e586e65a 100644
=2D-- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1298,7 +1298,7 @@ static int __init stifb_init_fb(struct sti_struct *s=
ti, int bpp_pref)

 	/* limit fbsize to max visible screen size */
 	if (fix->smem_len > yres*fix->line_length)
-		fix->smem_len =3D yres*fix->line_length;
+		fix->smem_len =3D ALIGN(yres*fix->line_length, 4*1024*1024);

 	fix->accel =3D FB_ACCEL_NONE;

