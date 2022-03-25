Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4653D4E7989
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 17:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377183AbiCYQ6a (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 12:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352122AbiCYQ6W (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 12:58:22 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E923ED2E
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 09:56:47 -0700 (PDT)
Received: (qmail 2675 invoked from network); 25 Mar 2022 16:56:44 -0000
Received: from p200300cf070e1300b9c188bfe20b0b3e.dip0.t-ipconnect.de ([2003:cf:70e:1300:b9c1:88bf:e20b:b3e]:47768 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 17:56:44 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 11/12] parisc: Rewrite arch_cpu_idle_dead() for CPU hotplugging
Date:   Fri, 25 Mar 2022 17:56:46 +0100
Message-ID: <21409307.EfDdHjke4D@daneel.sf-tec.de>
In-Reply-To: <20220325143833.402631-11-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de> <20220325143833.402631-11-deller@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7361915.EvYhyI6sBW"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart7361915.EvYhyI6sBW
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Freitag, 25. M=E4rz 2022, 15:38:32 CET schrieb Helge Deller:
> Let the PDC firmware put the CPU into firmware idle loop with
> pdc_cpu_rendezvous() function.
>=20
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/kernel/process.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> index ea3d83b6fb62..44fa89fbb280 100644
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -38,6 +38,7 @@
>  #include <linux/rcupdate.h>
>  #include <linux/random.h>
>  #include <linux/nmi.h>
> +#include <linux/sched/hotplug.h>
>=20
>  #include <asm/io.h>
>  #include <asm/asm-offsets.h>
> @@ -46,6 +47,7 @@
>  #include <asm/pdc_chassis.h>
>  #include <asm/unwind.h>
>  #include <asm/sections.h>
> +#include <asm/cacheflush.h>
>=20
>  #define COMMAND_GLOBAL  F_EXTEND(0xfffe0030)
>  #define CMD_RESET       5       /* reset any module */
> @@ -158,10 +160,35 @@ void release_thread(struct task_struct *dead_task)
>  int running_on_qemu __ro_after_init;
>  EXPORT_SYMBOL(running_on_qemu);
>=20
> -void __cpuidle arch_cpu_idle_dead(void)
> +/*
> + * Called from the idle thread for the CPU which has been shutdown.
> + */
> +void arch_cpu_idle_dead(void)
>  {
> -	/* nop on real hardware, qemu will offline CPU. */
> -	asm volatile("or %%r31,%%r31,%%r31\n":::);
> +#ifdef CONFIG_HOTPLUG_CPU
> +	idle_task_exit();
> +
> +	local_irq_disable();
> +
> +	/*
> +	 * Tell __cpu_die() that this CPU is now safe to dispose of.
> +	 */
> +	(void)cpu_report_death();
> +
> +	/*
> +	 * Ensure that the cache lines are written out.
> +	 */
> +	flush_cache_all_local();
> +	flush_tlb_all_local(NULL);
> +
> +	/*
> +	 * Let PDC firmware put CPU into firmware idle loop.
> +	 */
> +	__pdc_cpu_rendezvous();

That could all be one-line comments for a higher code/line ratio ;)
--nextPart7361915.EvYhyI6sBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYj30TgAKCRBcpIk+abn8
Tr4vAJ0dxzKEfjZmOZk0KJ0SINBW8/nCkgCcDWOeNZqoZcS1mpEn49pg9/B6cfA=
=USBD
-----END PGP SIGNATURE-----

--nextPart7361915.EvYhyI6sBW--



