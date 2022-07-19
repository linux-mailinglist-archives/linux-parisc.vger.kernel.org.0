Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F73F5791C6
	for <lists+linux-parisc@lfdr.de>; Tue, 19 Jul 2022 06:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbiGSEWJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 Jul 2022 00:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbiGSEWI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Jul 2022 00:22:08 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4644A3ED5D
        for <linux-parisc@vger.kernel.org>; Mon, 18 Jul 2022 21:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1658204518;
        bh=ti8gNzUzSg1pAiVhjbSsCTrqv4F4hL9+LUtAQG0Vpzg=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=VguibWuEUPznsq9G8AV0VjQ7Pf5hzTHUqKZltJVQQLoUj8QcZ7/0NzrjYHVYFalVy
         tLIfcoLEyh+bjtsKaxvEUBiVy8afk4YZwKP7YoKXE++A0PRnV1rbd7aLyQx6HwJUIo
         Fb2j+mmUc9UntIbsnLQcyUKAuoh/3Oj0NQlxtEG8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9XF-1oMh9T1Mmn-0097EB; Tue, 19
 Jul 2022 06:21:58 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Drop pa_swapper_pg_lock spinlock
Date:   Tue, 19 Jul 2022 06:21:55 +0200
Message-Id: <20220719042155.2739-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Uo4AJrmdM4tNI7bdTVHh7+8j6CWXOyZbZqZjbiYc+zlszYxqI2m
 m01h9Uvj//37KxyeIeKCiasZj6dCAlwrxV+ceDtjn1TajLDwbZkqkc4/mv4jjgH/eaghjrs
 kLakNI+254/9RuoToHhqJ9tpHFrwXhVMVFrhx/KcfHxQalcjFgkbhA4Jsgdk7ehJuKdAxiA
 +uA+tn6BqtePO5Onl/oOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3u5YJS+m0QU=:5v09rCCNO/4y438keUaXMf
 Ve3XwlEgCWahlWCns1rbB4GvSCkaTNHOG9FBMMJMRUzlZXbQZcQrn1QqKhrSt2CYptQ9KGupC
 oKe7Fufzbg1Wh9kHbcck6pyfWwJS2b+johx9Q/VIcikZ0wp5VJTWb+Vxd0FfpMH3hAK3MrXbw
 XMFUq58K5QUszQ00wSqClJqCHXuI4O0gel0ngxcXM9poaq3byDzcE0gim+YYbClxSfEaoTC4T
 GvTQnFjwsADAhIZTrtI41U38SBta+VKNp//cMAcEvdbzaodpGY1c6mVFlBe5+5Y+vr9LL7JuP
 c+yPMd6rRWYWlOdP62DPQf9vUhNilc8xbVfmkSppc3xp/at56NtjyPvuY9kO0V9Bp1RIWkDhu
 fwDElejLA1Sv8RWhKo9fr13t9XAa/dN5J0yPWvEFQWAtqGUj8kzh9T/YiO06e7RU8LhnoCzxM
 3Ja1LmULnhGNvg+2SJBRVFLyypQmKZ0Q8/uVHEbGx5bxPdFvyO07gtt/t9uTyvF7Yt4H5hfS5
 cU15p81dQMs7zsE5PZw7WNZin1HvE1IklS7+m7hzM74bqaQ/E4xOsYVYyrcPnpUigbKk+y42Q
 F2jlPzkGP20YUpHP7iTb5Z/7F2yf06FHb5KV3qad76hOZNP70ZvDdh4g2uV9D4w7P6QcioY/4
 Hnlor902dzbiDHhs6k9x8SsvUSWUngZoWfk20bF0Rv7cpz0GeGp2JAAAUngi/WKalgSIlcLuy
 iWAMR1t7+B0CYW7702sZ7PONiLfQ7XfCv631DQnxPJUkxw2si2GUk7I3XicatC3WToMUAaGWO
 3Rt4viA+wKV6oqveabtH7weVFTmjt7iQi7uGpbKPmFdD/42EV3ibvl12oAdneJjBrIAvTBwOQ
 b0AWRHhSMP8fY5/ZqMTO/EWjVm2iKJt7Gg8fpOF8OxpJlUab6yWI+RnghtNBsmNtCYfxlFBqW
 blMiQPX5uDBCpl3vIx2JOlVzK6U64JPZ5JerCAnJ0uqMZDWmNgFpc2qnMxiFPGdegD6T6Aesp
 i8tKgb4ulwaMam+igtG1EwbiWW2IvJ531i8P+pdoD6r0yeApDIwvhSUEdQYqP6IhW/MDOlRUk
 9FbpOe1zfPSzx8tJA4W3ANlpacW1Z2SeNkzEJ70dVKDxZqhm9xjB08gxw==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This spinlock isn't used any longer. Remove it to silence a sparse
warning.

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: kernel test robot <lkp@intel.com>
=2D--
 arch/parisc/kernel/cache.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index a9bc578e4c52..af3d7cdc1541 100644
=2D-- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -50,9 +50,6 @@ void flush_instruction_cache_local(void); /* flushes loc=
al code-cache only */
  */
 DEFINE_SPINLOCK(pa_tlb_flush_lock);

-/* Swapper page setup lock. */
-DEFINE_SPINLOCK(pa_swapper_pg_lock);
-
 #if defined(CONFIG_64BIT) && defined(CONFIG_SMP)
 int pa_serialize_tlb_flushes __ro_after_init;
 #endif
=2D-
2.35.3

