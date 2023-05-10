Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDD06FE391
	for <lists+linux-parisc@lfdr.de>; Wed, 10 May 2023 20:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbjEJSCZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 10 May 2023 14:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjEJSCY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 May 2023 14:02:24 -0400
X-Greylist: delayed 343 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 10 May 2023 11:02:23 PDT
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDF759F4
        for <linux-parisc@vger.kernel.org>; Wed, 10 May 2023 11:02:23 -0700 (PDT)
Date:   Wed, 10 May 2023 19:56:36 +0200
From:   Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To:     linux-parisc@vger.kernel.org
Subject: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
Message-ID: <1683740497@msgid.manchmal.in-ulm.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q2TO6g1Q7ddgZzpl"
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


--Q2TO6g1Q7ddgZzpl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

after upgrading from 6.2 to 6.3, my old HPPA box becomes inresponsive
after 10-30 minutes, possibly with some memory pressure involved
(building some Debian packages), kernel messages below. This is 100%
reproducible, switching back to some 6.2 kernel is a workaround.

Userland is Debian unstable, the affected process (as far as I could
see) is either ntpd or ntpq. A reboot is needed to resolve the
situation.

As this still happens with 6.3.2-rc1 which includes "parisc: Ensure page
alignment in flush functions": Has this been spotted earlier, is there
some tentative fix somewhere?

So far, I haven't tried bisecting between 6.2 and 6.3 yet. While I'm
able to do this, it would take days since I don't have a quick
reproducer, and I don't want to do this work in vain. If you can
provide hints how to speed up this, let me know.

Regards,

    Christoph

[  828.356408] kernel BUG at include/linux/swapops.h:472!
[  828.361679] CPU: 0 PID: 7119 Comm: ntpq Not tainted 6.3.1 #1
[  828.367392] Hardware name: 9000/785/C3600
[  828.371440]=20
[  828.372962]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  828.377695] PSW: 00000000000001001111011100001111 Not tainted
[  828.383483] r00-03  0004f70f 11294f90 105c6408 31578540
[  828.388744] r04-07  00000c73 114157c0 00000000 f66326c7
[  828.394004] r08-11  4f855a58 31455c60 31455c60 00004000
[  828.399257] r12-15  00000873 00000006 4f855530 4f855530
[  828.404528] r16-19  00000002 00000100 31455c60 00000000
[  828.409789] r20-23  70000000 0000001b 0098b000 4f855a58
[  828.415060] r24-27  2970de30 315aa8c8 00000000 10e72f90
[  828.420325] r28-31  00000000 129ecf94 315785c0 129ecf00
[  828.425578] sr00-03  00000029 00000000 00000000 00000029
[  828.430925] sr04-07  00000000 00000000 00000000 00000000
[  828.436265]=20
[  828.437780] IASQ: 00000000 00000000 IAOQ: 10559284 10559288
[  828.443389]  IIR: 03ffe01f    ISR: 10240085  IOR: 5e178584
[  828.448900]  CPU:        0   CR30: 4f855530 CR31: 11111111
[  828.454422]  ORIG_R28: 00000006
[  828.457594]  IAOQ[0]: migration_entry_wait_on_locked+0x254/0x274
[  828.463663]  IAOQ[1]: migration_entry_wait_on_locked+0x258/0x274
[  828.469701]  RP(r2): __migration_entry_wait+0x64/0x6c
[  828.474807] Backtrace:
[  828.477195]  [<105c6408>] __migration_entry_wait+0x64/0x6c
[  828.482732]  [<105c6444>] migration_entry_wait+0x34/0x44
[  828.488085]  [<1058c608>] do_swap_page+0x710/0x894
[  828.492926]  [<1058d07c>] handle_mm_fault+0x4e4/0xcb4
[  828.498009]  [<10406490>] do_page_fault+0xd0/0x42c
[  828.502852]  [<10408d60>] handle_interruption+0x4cc/0x6c8
[  828.508303]  [<10403070>] intr_check_sig+0x0/0x38
[  828.513051]=20
[  828.514568] CPU: 0 PID: 7119 Comm: ntpq Not tainted 6.3.1 #1
[  828.520245] Hardware name: 9000/785/C3600
[  828.524269] Backtrace:
[  828.526651]  [<104084e0>] show_stack+0x34/0x48
[  828.531124]  [<10cdb894>] dump_stack_lvl+0x38/0x54
[  828.535953]  [<10cdb8cc>] dump_stack+0x1c/0x2c
[  828.540424]  [<104085fc>] die_if_kernel+0xec/0x1b0
[  828.545241]  [<10408eac>] handle_interruption+0x618/0x6c8
[  828.550668]  [<10403070>] intr_check_sig+0x0/0x38
[  828.555399]=20
[  828.556936] ---[ end trace 0000000000000000 ]---
[  828.562457] ------------[ cut here ]------------
[  828.567151] kernel BUG at include/linux/swapops.h:472!
[  828.572394] CPU: 0 PID: 3059 Comm: in:imklog Tainted: G      D          =
  6.3.1 #1
[  828.579997] Hardware name: 9000/785/C3600
[  828.584045]=20
[  828.585567]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  828.590306] PSW: 00000000000001001111011100001111 Tainted: G      D     =
     =20
[  828.597546] r00-03  0004f70f 11294f90 105c6408 13030540
[  828.602837] r04-07  00000c73 114157c0 00000000 f5a32bef
[  828.608094] r08-11  13035a58 137df5e8 137df5e8 00004000
[  828.613363] r12-15  00000873 00000006 13035530 13035530
[  828.618623] r16-19  00000002 00000100 137df5e8 00000000
[  828.623885] r20-23  70000000 0000001b 0000000e 13035a58
[  828.629144] r24-27  1472c1f0 4fbdf8c8 00000000 10e72f90
[  828.634412] r28-31  00000000 1373b094 130305c0 1373b000
[  828.639667] sr00-03  00000029 00000000 00000000 0000000e
[  828.645014] sr04-07  00000000 00000000 00000000 00000000
[  828.650361]=20
[  828.651874] IASQ: 00000000 00000000 IAOQ: 10559284 10559288
[  828.657476]  IIR: 03ffe01f    ISR: 00000000  IOR: 00000000
[  828.662997]  CPU:        0   CR30: 13035530 CR31: 11111111
[  828.668510]  ORIG_R28: 00000000
[  828.671688]  IAOQ[0]: migration_entry_wait_on_locked+0x254/0x274
[  828.677739]  IAOQ[1]: migration_entry_wait_on_locked+0x258/0x274
[  828.683788]  RP(r2): __migration_entry_wait+0x64/0x6c
[  828.688888] Backtrace:
[  828.691289]  [<105c6408>] __migration_entry_wait+0x64/0x6c
[  828.696809]  [<105c6444>] migration_entry_wait+0x34/0x44
[  828.702162]  [<1058c608>] do_swap_page+0x710/0x894
[  828.706993]  [<1058d07c>] handle_mm_fault+0x4e4/0xcb4
[  828.712087]  [<10406490>] do_page_fault+0xd0/0x42c
[  828.716924]  [<10408d60>] handle_interruption+0x4cc/0x6c8
[  828.722375]  [<10403070>] intr_check_sig+0x0/0x38
[  828.727116]=20
[  828.728639] CPU: 0 PID: 3059 Comm: in:imklog Tainted: G      D          =
  6.3.1 #1
[  828.736223] Hardware name: 9000/785/C3600
[  828.740252] Backtrace:
[  828.742627]  [<104084e0>] show_stack+0x34/0x48
[  828.747099]  [<10cdb894>] dump_stack_lvl+0x38/0x54
[  828.751928]  [<10cdb8cc>] dump_stack+0x1c/0x2c
[  828.756399]  [<104085fc>] die_if_kernel+0xec/0x1b0
[  828.761218]  [<10408eac>] handle_interruption+0x618/0x6c8
[  828.766643]  [<10403070>] intr_check_sig+0x0/0x38
[  828.771376]=20
[  828.772915] ---[ end trace 0000000000000000 ]---
[  828.810379] ------------[ cut here ]------------
[  828.815050] kernel BUG at include/linux/swapops.h:472!
[  828.820241] CPU: 0 PID: 261 Comm: systemd-journal Tainted: G      D     =
       6.3.1 #1
[  828.828273] Hardware name: 9000/785/C3600
[  828.832339]=20
[  828.833861]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  828.838585] PSW: 00000000000001001111111100001111 Tainted: G      D     =
     =20
[  828.845841] r00-03  0004ff0f 11294f90 105c6408 4f830540
[  828.851108] r04-07  00000c73 11415fe8 00000002 f69b63af
[  828.856362] r08-11  4f857698 12951168 12951168 00004000
[  828.861630] r12-15  00000873 00000006 4f857170 4f857170
[  828.866884] r16-19  00000002 00000100 12951168 00000000
[  828.872151] r20-23  70000000 0000001b 0000000e 4f857698
[  828.877406] r24-27  129621f0 130726d8 00000000 10e72f90
[  828.882674] r28-31  00000000 4f8c7898 4f8305c0 4f8c7800
[  828.887925] sr00-03  00000029 00000000 00000000 00000004
[  828.893274] sr04-07  00000000 00000000 00000000 00000000
[  828.898612]=20
[  828.900137] IASQ: 00000000 00000000 IAOQ: 10559284 10559288
[  828.905736]  IIR: 03ffe01f    ISR: 102400fe  IOR: 0c030584
[  828.911258]  CPU:        0   CR30: 4f857170 CR31: 11111111
[  828.916768]  ORIG_R28: 00000006
[  828.919940]  IAOQ[0]: migration_entry_wait_on_locked+0x254/0x274
[  828.925999]  IAOQ[1]: migration_entry_wait_on_locked+0x258/0x274
[  828.932047]  RP(r2): __migration_entry_wait+0x64/0x6c
[  828.937136] Backtrace:
[  828.939530]  [<105c6408>] __migration_entry_wait+0x64/0x6c
[  828.945059]  [<105c6444>] migration_entry_wait+0x34/0x44
[  828.950414]  [<1058c608>] do_swap_page+0x710/0x894
[  828.955242]  [<1058d07c>] handle_mm_fault+0x4e4/0xcb4
[  828.960336]  [<10406490>] do_page_fault+0xd0/0x42c
[  828.965167]  [<10408d60>] handle_interruption+0x4cc/0x6c8
[  828.970618]  [<10403070>] intr_check_sig+0x0/0x38
[  828.975358]=20
[  828.976880] CPU: 0 PID: 261 Comm: systemd-journal Tainted: G      D     =
       6.3.1 #1
[  828.984897] Hardware name: 9000/785/C3600
[  828.988929] Backtrace:
[  828.991311]  [<104084e0>] show_stack+0x34/0x48
[  828.995783]  [<10cdb894>] dump_stack_lvl+0x38/0x54
[  829.000613]  [<10cdb8cc>] dump_stack+0x1c/0x2c
[  829.005084]  [<104085fc>] die_if_kernel+0xec/0x1b0
[  829.009901]  [<10408eac>] handle_interruption+0x618/0x6c8
[  829.015328]  [<10403070>] intr_check_sig+0x0/0x38
[  829.020059]=20
[  829.021590] ---[ end trace 0000000000000000 ]---
[  829.304173] ------------[ cut here ]------------
[  829.308873] kernel BUG at include/linux/swapops.h:472!
[  829.314076] die_if_kernel() recursion detected.

--Q2TO6g1Q7ddgZzpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmRb2tAACgkQxCxY61kU
kv0zsw//UqDSNBfn5rXLAUhEDmu+/wBGHHNtojmn7PI9tJP3d6TsrMfSdyoXrWFx
1IOwC0XtatzkZYHts/3bGldEUj3LeXkmxjuX3OBqgXfZtmhFo64SLfWTrpoIzzIc
MZHnG1pW6nci2qLzNUKZwJ2G60fKvu9nkWh5uAr+pEjihb5Gxp9/O2voZ+nv7kxU
aixnSeVKUeoXb7m20GaGz3X/uOPUfuA4TkuSl/dZtCsT/EI5knuO+sS2pVH7Dt1J
cTmtGKs+lYF7idi5LD/0IWo3tI6gFFKww93l4PGYn/hn/Ytr3rSjtXAzxzi7T3i2
x0yFv3/o+BmuBd0uuDAq12aQAz7YgvxyH3yG6vURUHj2UKT/8FvWjkOomiwpbT88
KyIe0Sf9e4csAcpneZdbfyZsKuxOEld1OBp8LLIz1vCAlSMSYcks0UudIBikZWyb
QLnMqsFzz/wLR149dN+iGKih8pcJKEdJUYhVXspTUi/3PCQLS6sas2BDdWXMUl0E
+Qq6pWUhEtDbYkqTNoU+mTUXcaOA01351tkJWI+HOueOhL0E9S5lZwbRWMadH19j
vTnTVQuqBQtd3MTO5DRMDnPrsX81yc/3LqgFV3ItO/aPnU+RHsnzs8a9+RVrtiIG
Jtfu6/rjVwnSLOsKsAoz/Lvr59998zKnuBa4IN5iPH3CTygcXcE=
=/Cd4
-----END PGP SIGNATURE-----

--Q2TO6g1Q7ddgZzpl--
