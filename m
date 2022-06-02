Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEE453C00F
	for <lists+linux-parisc@lfdr.de>; Thu,  2 Jun 2022 22:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbiFBUwo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 2 Jun 2022 16:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbiFBUwn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 Jun 2022 16:52:43 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786D1B8A
        for <linux-parisc@vger.kernel.org>; Thu,  2 Jun 2022 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1654203150;
        bh=XmmajEOZkGuX/LFZRnlkp5ayHI7oSU00hfrdb4WotkM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=SOJGAozPnCG63Pz/yO86KGhZorSe66TBI7gvtBIMXaUTpJT5Gjp28jZgURJnxMlIV
         UrPRIY7Y5bzwweLFvxJbG4+ZN5t0/baOquPIhkuPaijspLfAq7G4/gX+RgSj4IIdBG
         IO8DMJaIXMu4UNktaNfwx/sA37KxaQNYB1knP+zQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.181.14]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzjt-1oGRy03YbJ-00XPMB; Thu, 02
 Jun 2022 22:52:29 +0200
Message-ID: <bbb8bd99-195f-6f7e-a4a6-277734dffd28@gmx.de>
Date:   Thu, 2 Jun 2022 22:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] parisc: fix a crash with multicore scheduler
Content-Language: en-US
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <YpZYPokZr9s4uwtt@p100>
 <alpine.LRH.2.02.2206010911370.15916@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2206011053050.20771@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2206011146110.23169@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2206011316440.25830@file01.intranet.prod.int.rdu2.redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <alpine.LRH.2.02.2206011316440.25830@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Xq7bVqsxTPv6XCJeRK4C0DBlDWpGtW/hY/iPUyR2hwvJhvRZqa+
 uqAHda7gCGE/XUZK41zefNp6TQhdaCPkRp+JHf1JjjC5oBh+80y0rf4j8xk515EnIB0baAC
 ZdHsXJ7T4Oo/ei78O5ZI0Vv8cdiNFzoM1JRZbEIRrj0+AWkhB4loWlSdrKGQZZmrC3xEZ4Q
 nLawnhvDWgiKlmr3MSXBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yRmLT1kgQ2E=:nj/k2WDubyhj5ywQqTQJN0
 yI7BDFu7x/Yqo0EmbfSN9f4ZrrH9VsLlX9/cWDH79JeLyWtsGQGb5Zm7vaLOxJwkLJCqFux0Y
 UoQ/G743EJ96pHUwHPyMXOsZHKoKrL6fQ+vIV46ZF0u3PFL+OKTPKGU0jM/G0piBfS0IQzu/J
 +SmMudgwPZ3v677l3l+EDHCCErEC3CrJo7YC4WgAoDcV9nA2azI1Z2ofh3KL4IbEu1qoPe8S+
 0gRuWmDpiI+xhcFF35M4+pwuMlLRGCUvf+EMpN3wXRLTwxQ/SNlpg/s3CEuNIjUr4ZRUHDbPX
 oevFnDR416Ziw2H2dkdvwdgtwN0esdoi2qcnJ6X/e1pCNUJqqt/SrK3dJH9D19aJh/TzgGBlb
 5TWFv35yb5tla1BSq+LxoTal6w1a7dD6TSUSro8zMO87+YksAq9eQmG++h/71mzL3AoyvRBTZ
 aABNfkKwIKm59o1H68aHzZ3Zm6noLNUt36m+/GSnvRNqO/xusTjfw03f+7PYvlH2uRyWrrdZ3
 P32DcjPYnHp60pwtRYWPxOol2gJPTiliDc5hny1TfWKQjIwODZraCkw9cpyU3kAVVNO2jlyMU
 Z8FHQj2DvEGtH1PdEJP+mIJ0KSV+FiL0iu8GP1dllOwNgk9rpL5A1EP2MiwgyLLSHVYPfLXCC
 DnJMOZBoq0XkTleYds6CkP+AsesPjQgp8UeL8xQXUis/RbqAWbdIHmGOFsU23Dw4tEK2SmWxz
 qy7401S8cIBjS2kru9P7m1KIM+Dx+Ipf+APp0EDgMob47tBDhZCvbuIzlkXB/8mZO68F0HREE
 Xf3eA00cdKUC/3pb81EpVYu/gUV3oswMKX9EQNdT5IQTbz04cBqgko4ws8nAgUuGlV/y0tEGf
 jJdlKraWcTHH7E5db9Ho/oHFuzd06+mCCQKT1LOftPNYGKOH68zxeNBxS079KfcDUqgY2+oUM
 ssXVo4apXKoIGwpfDplFxym/BV7Esr+jgUuxSlFZRpPAvMVQc0cv1KwVtMN9jXP8DgwzYqL1m
 cdNcuaSdAH+BSFNNwDx55ZPao+FLTCziZDn5ZHdM8ktq1glew4FYaVuFUM2fZMHFf06VXtk++
 ianxTwxuDTSK08xzKooGqwE5ujILgrihAcp4BmpRLjw0uSJZ0pM6i8BMQ==
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Mikulas,

On 6/1/22 19:18, Mikulas Patocka wrote:
> With the kernel 5.18, the system will hang on boot if it is compiled wit=
h
> CONFIG_SCHED_MC. The last printed message is "Brought up 1 node, 1 CPU".
>
> The crash happens in sd_init
> tl->mask (which is cpu_coregroup_mask) returns an empty mask. This happe=
ns
> 	because cpu_topology[0].core_sibling is empty.
> Consequently, sd_span is set to an empty mask
> sd_id =3D cpumask_first(sd_span) sets sd_id =3D=3D NR_CPUS (because the =
mask is
> 	empty)
> sd->shared =3D *per_cpu_ptr(sdd->sds, sd_id); sets sd->shared to NULL
> 	because sd_id is out of range
> atomic_inc(&sd->shared->ref); crashes without printing anything
>
> We can fix it by calling reset_cpu_topology() from init_cpu_topology() -
> this will initialize the sibling masks on CPUs, so that they're not empt=
y.
>
> This patch also removes the variable "dualcores_found", it is useless,
> because during boot, init_cpu_topology is called before
> store_cpu_topology. Thus, set_sched_topology(parisc_mc_topology) is neve=
r
> called. We don't need to call it at all because default_topology in
> kernel/sched/topology.c contains the same items as parisc_mc_topology.
>
> Note that we should not call store_cpu_topology() from init_per_cpu()
> because it is called too early in the kernel initialization process and =
it
> results in the message "Failure to register CPU0 device". Before this
> patch, store_cpu_topology() would exit immediatelly because
> cpuid_topo->core id was uninitialized and it was 0.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org	# v5.18

Thanks a lot !!!

It took me some time to test it, but it looks good and boots on
all of my machines so far. I was curious if 32-bit kernels still
work since that was one of the issues with the older patches...

With your patch we can drop the "config SCHED_MC" entry from
arch/parisc/Kconfig as well.
Will you respin, or should I simply add this to your patch?

Helge


>
> ---
>  arch/parisc/kernel/processor.c |    2 --
>  arch/parisc/kernel/topology.c  |   16 +---------------
>  2 files changed, 1 insertion(+), 17 deletions(-)
>
> Index: linux-2.6/arch/parisc/kernel/topology.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/arch/parisc/kernel/topology.c	2022-06-01 15:32:59.000=
000000 +0200
> +++ linux-2.6/arch/parisc/kernel/topology.c	2022-06-01 18:37:37.00000000=
0 +0200
> @@ -20,8 +20,6 @@
>
>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>
> -static int dualcores_found;
> -
>  /*
>   * store_cpu_topology is called at boot when only one cpu is running
>   * and with the mutex cpu_hotplug.lock locked, when several cpus have b=
ooted,
> @@ -60,7 +58,6 @@ void store_cpu_topology(unsigned int cpu
>  			if (p->cpu_loc) {
>  				cpuid_topo->core_id++;
>  				cpuid_topo->package_id =3D cpu_topology[cpu].package_id;
> -				dualcores_found =3D 1;
>  				continue;
>  			}
>  		}
> @@ -80,22 +77,11 @@ void store_cpu_topology(unsigned int cpu
>  		cpu_topology[cpuid].package_id);
>  }
>
> -static struct sched_domain_topology_level parisc_mc_topology[] =3D {
> -#ifdef CONFIG_SCHED_MC
> -	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
> -#endif
> -
> -	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> -	{ NULL, },
> -};
> -
>  /*
>   * init_cpu_topology is called at boot when only one cpu is running
>   * which prevent simultaneous write access to cpu_topology array
>   */
>  void __init init_cpu_topology(void)
>  {
> -	/* Set scheduler topology descriptor */
> -	if (dualcores_found)
> -		set_sched_topology(parisc_mc_topology);
> +	reset_cpu_topology();
>  }
> Index: linux-2.6/arch/parisc/kernel/processor.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/arch/parisc/kernel/processor.c	2022-06-01 15:32:59.00=
0000000 +0200
> +++ linux-2.6/arch/parisc/kernel/processor.c	2022-06-01 18:35:12.0000000=
00 +0200
> @@ -327,8 +327,6 @@ int init_per_cpu(int cpunum)
>  	set_firmware_width();
>  	ret =3D pdc_coproc_cfg(&coproc_cfg);
>
> -	store_cpu_topology(cpunum);
> -
>  	if(ret >=3D 0 && coproc_cfg.ccr_functional) {
>  		mtctl(coproc_cfg.ccr_functional, 10);  /* 10 =3D=3D Coprocessor Contr=
ol Reg */
>
>

