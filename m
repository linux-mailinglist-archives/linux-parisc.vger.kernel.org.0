Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2084F4E79AD
	for <lists+linux-parisc@lfdr.de>; Fri, 25 Mar 2022 18:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbiCYRMX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 25 Mar 2022 13:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbiCYRMX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 25 Mar 2022 13:12:23 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E96C12CB
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 10:10:48 -0700 (PDT)
Received: (qmail 3212 invoked from network); 25 Mar 2022 17:10:45 -0000
Received: from p200300cf070e1300b9c188bfe20b0b3e.dip0.t-ipconnect.de ([2003:cf:70e:1300:b9c1:88bf:e20b:b3e]:54462 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Fri, 25 Mar 2022 18:10:45 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 12/12] parisc: Implement __cpu_die() and __cpu_disable() for CPU hotplugging
Date:   Fri, 25 Mar 2022 18:10:39 +0100
Message-ID: <1909223.usQuhbGJ8B@daneel.sf-tec.de>
In-Reply-To: <20220325143833.402631-12-deller@gmx.de>
References: <20220325143833.402631-1-deller@gmx.de> <20220325143833.402631-12-deller@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3347019.QJadu78ljV"; micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart3347019.QJadu78ljV
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Freitag, 25. M=E4rz 2022, 15:38:33 CET schrieb Helge Deller:
> Add relevant code to __cpu_die() and __cpu_disable() to finally enable
> the CPU hotplugging features. Reset the irq count values in smp_callin()
> to zero before bringing up the CPU.
>=20
> Use "chcpu -d 1" to bring CPU1 down, and "chcpu -e 1" to bring it up.
>=20
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/Kconfig           |  1 +
>  arch/parisc/include/asm/smp.h |  9 +---
>  arch/parisc/kernel/smp.c      | 80 +++++++++++++++++++++++++++++++++--
>  3 files changed, 79 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> index a32a882a2d58..60cc33fd345c 100644
> --- a/arch/parisc/kernel/smp.c
> +++ b/arch/parisc/kernel/smp.c
> @@ -430,10 +444,68 @@ void smp_cpus_done(unsigned int cpu_max)
>=20
>  int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>  {
> -	if (cpu !=3D 0 && cpu < parisc_max_cpus && smp_boot_one_cpu(cpu,=20
tidle))
> -		return -ENOSYS;
> +	if (cpu_online(cpu))
> +		return 0;
> +
> +	if (num_online_cpus() < parisc_max_cpus && smp_boot_one_cpu(cpu,=20
tidle))
> +		return -EIO;

I had to look up parisc_max_cpus, and found this:

> static int parisc_max_cpus =3D 1;

Hm, signed?

> parisc_max_cpus =3D max_cpus;
>        if (!max_cpus)
>                printk(KERN_INFO "SMP mode deactivated.\n");

So parisc_max_cpus is now 0, which seems wrong. Shouldn't the check be befo=
re=20
the assignment? This would have avoided the "cpu !=3D 0" in the old code=20
completely.

> +
> +	return cpu_online(cpu) ? 0 : -EIO;
> +}
> +
> +/*
> + * __cpu_disable runs on the processor to be shutdown.
> + */
> +int __cpu_disable(void)
> +{
> +#ifdef CONFIG_HOTPLUG_CPU
> +	unsigned int cpu =3D smp_processor_id();
> +
> +	remove_cpu_topology(cpu);
> +
> +	/*
> +	 * Take this CPU offline.  Once we clear this, we can't return,
> +	 * and we must not schedule until we're ready to give up the cpu.
> +	 */
> +	set_cpu_online(cpu, false);
> +
> +	/*
> +	 * disable IPI interrupt
> +	 */
> +	disable_percpu_irq(IPI_IRQ);
> +
> +	/*
> +	 * migrate IRQs away from this CPU
> +	 */
> +	irq_migrate_all_off_this_cpu();

While I really enjoy good code comments the last 2 seem a t bit wasteful,=20
given that the code is basically exactly the same as the text.

> +	/*
> +	 * Flush user cache and TLB mappings, and then remove this CPU
> +	 * from the vm mask set of all processes.
> +	 *
> +	 * Caches are flushed to the Level of Unification Inner Shareable
> +	 * to write-back dirty lines to unified caches shared by all CPUs.
> +	 */
> +	flush_cache_all_local();
> +	flush_tlb_all_local(NULL);
>=20
> -	return cpu_online(cpu) ? 0 : -ENOSYS;
> +	/* disable all irqs, including timer irq */
> +	local_irq_disable();
> +#endif
> +	return 0;
> +}
> +
> +/*
> + * called on the thread which is asking for a CPU to be shutdown -
> + * waits until shutdown has completed, or it is timed out.
> + */
> +void __cpu_die(unsigned int cpu)
> +{
> +	if (!cpu_wait_death(cpu, 5)) {
> +		pr_crit("CPU%u: cpu didn't die\n", cpu);
> +		return;
> +	}
> +	pr_debug("CPU%u: shutdown\n", cpu);
>  }
>=20
>  #ifdef CONFIG_PROC_FS
> --
> 2.35.1


--nextPart3347019.QJadu78ljV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYj33jwAKCRBcpIk+abn8
TkVuAKCNuZ88OjomTfZm3MfAM7CT6sZJCACgpFpaoV3Hmx49Z+sX4a9rpwDHPcI=
=JidR
-----END PGP SIGNATURE-----

--nextPart3347019.QJadu78ljV--



