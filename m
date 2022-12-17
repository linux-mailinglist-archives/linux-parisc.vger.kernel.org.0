Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40A664FC8F
	for <lists+linux-parisc@lfdr.de>; Sat, 17 Dec 2022 23:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiLQWEt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 17 Dec 2022 17:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiLQWEo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 17 Dec 2022 17:04:44 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066B210FC3
        for <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671314680; bh=MJUMeeGXJTELJm1GrZXbuntu2SgUVWEogBmg+m1S9NA=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=l41+yF+5ZVkWlYFqS0Dbi6oqxAEqbLRhim+KUDsR8W0tSOwxN25gqJeZRt80qwoA+
         OL2P/GnaEmkrAlPyf8DOY+VHHtoh45EYX/v9ij1YwtDafsVXvwPWDKibONGgWZT4wp
         6+G8nE8lSiqn070o5aaAa5QNyMKdZ3mS2FZgekRWhuBVJ+C3gOBvUC4E0e2EMhmSHG
         /fz3YovLdf3kNc6wfn47KofDFav0R9sVQXU6IkAdH6coxVkQsTdx1CUZxupjFTfroU
         5yZVJL5r7FuIQy/9FFL1tZSoa67gvwgKUngugib9VAbjPuttAJzoxS/eHDya1x699R
         LCpSbgaWpVzdw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.160.18]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHAH-1oQhtr1brv-00gqz4 for
 <linux-parisc@vger.kernel.org>; Sat, 17 Dec 2022 23:04:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH 6/6] parisc: Add missing FORCE prerequisites in Makefile
Date:   Sat, 17 Dec 2022 23:04:28 +0100
Message-Id: <20221217220428.383330-6-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217220428.383330-1-deller@gmx.de>
References: <20221217220428.383330-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L3Jo+CXgEkTAIQdFjMNm2tZsk7yTW9yZy6Ku57XQxu1koVgk+u+
 kAFMrJyWw7vNwXQVWqFuopa/8FQrKaXcH/rvRNgAhoMfr2U9LOnKVVMVxbl9PnF3iCeyjZV
 qrJsSAe1x9c0YTvZl2zw2H0X0PuQhmF21IgXjUSZzioCNs3vnoBYxukpe9ajFBQu6H32FE4
 TOVZSyEot/IosjdhOEvNQ==
UI-OutboundReport: notjunk:1;M01:P0:H0uH+62o8bU=;M71yV5nNK3N4U94wQNZ6DVwSvg5
 KFYUw0Sk9VthdvakR5hqHN0A/QV4+3tqAL8bM8jzNuq+GmNGX4FTiK2ZBz+8yUtEF05JPikPD
 e0WFRQZ3ujMtsXbE+9x2nS+krBWT7bPU0eeTYP1WotWTQbIS0vCtK89RT21W5EouIUs3j7ejS
 HuQlQpRB++MTh5ZrjRT4KYhcn/udXhl0HkaK1Z3KLZ+GHqQNWDvakA8tWY51JPglG1GHm9lZ4
 DYxOkBcbNOgFfsqR3at4pZUUUq56wp9AN72iPo8QwNbc+Jep6v9Mqda2woxQGTP0krPOWdf2y
 EDY8gOsRL+XMYMO9c9TCqhEcVUZ2NWDQS4JH/zzxua9+VZn70c9Go74zR6faGAeFmySzRLl/1
 mQxCE5ZpEkTTq0boRqFElLhYw09qQeAOylYS4JVHR+M4pHH9jrMDBZeyPaJZnWFFX7ifGjcqr
 mmttJ1mVbmGMt7SSjkEfQhQ6y3+Cab52dM/x1J7L+u6Pm7cTufrYu/j2aeJVJV0vfMhfoJxC8
 SBv1RDYxxHWMI+xgY6tjowr1ijwM4Hai3PYvKOi4MF3QIiyZkKum/mfVu+OrHfZenS4rNJA8Y
 DY5yOD1E3jYdHRBnQ6K9XT2y6s3J6FD9dh7iBvMqUS0KkgslGk6UgyYgTeptMCAaUF9oR+dPl
 frerESnohMgJgtavyk0jiBCABn6Pz7/zYE7pDLbzB/OCHy13J5BNdaggYYveVoygG793JWy+p
 OogZ3B1tNGQB5BuurZS9mPUTY73e+RPJkK3yqaH/7SJ2ri/tonhFpzQjx1KLCncv/mxHU30z+
 ypB1HtHvSqYl+dK8AsxzhEFsIm4xEJnY7TPuLyVemAbJbhppHNZWhi2ntuX2yCZgFyUN47m7J
 2/LlnV1NK/f/3M44uXtOx4Z3gApw9oRenuQVZ9X6w1a49q64BNOSxA+ZRakwv9wFe6Vd7QWFQ
 c/M3neEbMND2LF9izp5wlbJtdTs=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Fix those make warnings:
    arch/parisc/kernel/vdso32/Makefile:30: FORCE prerequisite is missing
    arch/parisc/kernel/vdso64/Makefile:30: FORCE prerequisite is missing

Add the missing FORCE prerequisites for all build targets identified by
"make help".

Fixes: e1f86d7b4b2a5213 ("kbuild: warn if FORCE is missing for if_changed(=
_dep,_rule) and filechk")
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # 5.18+
=2D--
 arch/parisc/kernel/vdso32/Makefile | 4 ++--
 arch/parisc/kernel/vdso64/Makefile | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vdso3=
2/Makefile
index 85b1c6d261d1..4459a48d2303 100644
=2D-- a/arch/parisc/kernel/vdso32/Makefile
+++ b/arch/parisc/kernel/vdso32/Makefile
@@ -26,7 +26,7 @@ $(obj)/vdso32_wrapper.o : $(obj)/vdso32.so FORCE

 # Force dependency (incbin is bad)
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso32.so: $(src)/vdso32.lds $(obj-vdso32) $(obj-cvdso32) $(VDSO_L=
IBGCC)
+$(obj)/vdso32.so: $(src)/vdso32.lds $(obj-vdso32) $(obj-cvdso32) $(VDSO_L=
IBGCC) FORCE
 	$(call if_changed,vdso32ld)

 # assembly rules for the .S files
@@ -38,7 +38,7 @@ $(obj-cvdso32): %.o: %.c FORCE

 # actual build commands
 quiet_cmd_vdso32ld =3D VDSO32L $@
-      cmd_vdso32ld =3D $(CROSS32CC) $(c_flags) -Wl,-T $^ -o $@
+      cmd_vdso32ld =3D $(CROSS32CC) $(c_flags) -Wl,-T $(filter-out FORCE,=
 $^) -o $@
 quiet_cmd_vdso32as =3D VDSO32A $@
       cmd_vdso32as =3D $(CROSS32CC) $(a_flags) -c -o $@ $<
 quiet_cmd_vdso32cc =3D VDSO32C $@
diff --git a/arch/parisc/kernel/vdso64/Makefile b/arch/parisc/kernel/vdso6=
4/Makefile
index a30f5ec5eb4b..f3d6045793f4 100644
=2D-- a/arch/parisc/kernel/vdso64/Makefile
+++ b/arch/parisc/kernel/vdso64/Makefile
@@ -26,7 +26,7 @@ $(obj)/vdso64_wrapper.o : $(obj)/vdso64.so FORCE

 # Force dependency (incbin is bad)
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso64.so: $(src)/vdso64.lds $(obj-vdso64) $(VDSO_LIBGCC)
+$(obj)/vdso64.so: $(src)/vdso64.lds $(obj-vdso64) $(VDSO_LIBGCC) FORCE
 	$(call if_changed,vdso64ld)

 # assembly rules for the .S files
@@ -35,7 +35,7 @@ $(obj-vdso64): %.o: %.S FORCE

 # actual build commands
 quiet_cmd_vdso64ld =3D VDSO64L $@
-      cmd_vdso64ld =3D $(CC) $(c_flags) -Wl,-T $^ -o $@
+      cmd_vdso64ld =3D $(CC) $(c_flags) -Wl,-T $(filter-out FORCE, $^) -o=
 $@
 quiet_cmd_vdso64as =3D VDSO64A $@
       cmd_vdso64as =3D $(CC) $(a_flags) -c -o $@ $<

=2D-
2.38.1

