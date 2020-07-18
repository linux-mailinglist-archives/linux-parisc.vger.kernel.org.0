Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F16224B1B
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jul 2020 14:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgGRMFI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 18 Jul 2020 08:05:08 -0400
Received: from mout.gmx.net ([212.227.15.18]:59143 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbgGRMFH (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Jul 2020 08:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1595073898;
        bh=/m4IXi1KL82OSuIwT8kbagaF6T+cHChmdQv/TYitoTM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=kIDINUSs0fCKzIUHbNdlKEhS5OvrWDk1LmR1eVAmWXzYyuzgy/qsNWh9GR1KwcKKq
         lWLGg6mtrSMZX4QhwbuNYVzaPe009PyPKg2+YpMKPicHNfVmoWd0FeERo0bzkjtkY0
         8MBuvWXfAEVbBlIRpyikdiQ6nvWnD1GX5w2zTbno=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.179.241]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel3n-1kXCGd29MT-00aikR; Sat, 18
 Jul 2020 14:04:58 +0200
Subject: Re: [PATCH v2] parisc: Fix spinlock barriers
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <9b28e07e-3d11-d24b-410b-4732a828e588@bell.net>
 <7e4fa270-7fb7-d726-da01-7da04f109747@bell.net>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <d5d093f1-8e7b-24bc-2f72-215381821043@gmx.de>
Date:   Sat, 18 Jul 2020 14:04:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7e4fa270-7fb7-d726-da01-7da04f109747@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/YCGCGJti7CjESKexeB31sjF9OLvxXuxLnaE4pnFBM9NrpgwnJ7
 Rf074WW6cymCh2ZgVMFTNLOBb1bgzBTuJugKnp8UIlHjxP1A6REdyr9lfNGaMfVmH/2trhV
 Ti1whm62J7nVtqODVFDPboM45fbvYm3PFJvO+7QwyvzC5rTVsskhNfScyqiHmdG/zlR6410
 OlgiHRsq9AD5rzTe5lyzw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r3sfgu2zhsA=:ZppTd9K4fkqCD0FZKAy+Po
 NCk2J0D7qmDnDZmBmjgYLFCNH5rbG95VQ5bsUtxbGhZ69atVVrAiqe78klvt1c49A05/GA2Dx
 3M+GCx4upq6tO6XpYbyoPcOH7kECCYwYEH5O9NKa8BspbVVsIm9akhhpoBMm/wz/0qL/WnwES
 p/goVRYKMcEqvbB/tGKIqg/3UHF6I5dg8nC1jCS0YoYDG1ElCPJZ0+cFV5EFG3wMEz4UqBukK
 07jqP9ua0YDF3isa7B6gomLn68DXiL7ZvE/28P6RX5i5mPnmES3bY82/gp8cAXt1+I9dDN6Ry
 0Zx+CRw4ObyrW69tjrWCq59gGIZf4txP88khYCYIqG7ONDhIl3FKf9PViZBF08/GmZe5PjpkS
 jgfoGrkySpGRLIa1B5M31oIqf23pbZKaEw+O6z7GGXx5Q5SAgkgSZpY0n54MiePd9y1prfcZ9
 vNYXsgLWz54ulbrg0cM8ujMvUHfw7qAbLP3llnbL1mN5kVyzJg3NdfnBdnntwfu6219KdUORA
 vH2xiWngWaLk6p/jl3kInXkerUmtMietHn2uuw0JtWJybGzZmQWX3GDw54s/jdt7J8ChEuKyi
 CmKhSjapSWTiKmwfjYuDYtfojHYb0i9DFPSIBOtMdZ1SwHVFkVKjf5ePyIJCAmlgSQoPUNzy3
 7eOZPhITZvDRu5J1r1+r0ppTgzYINhWlod7z0epAz6pRnhSKeZTT4Xv+MXE4gXdjY/Ht2d6cp
 MPJRL3ao073wbEebaDBODu9wb98OzdnsvA2UmwkhVHsRVgLNBxBJbMG+HnLQebY848xfpgDWx
 hvJ+djbGHHv6Nk25VmFL5EOqe0oB79ktwPOSr8/77t0NFbLN8vq3fMIKElXuDcdU3T448ud/J
 xhZd9XJQctVvQEniUJzQg2VpzuUjRBIbgM50ZE0BiCr9jld6tKlUKCPV0KDXs0OnCeZNkot/i
 eIr5tbrKhiCgT1IQMXe8oTSGPdcgpgzQaEIeQ8R3tC+3P5ImJufymqvM0JCS8wZYolNzv1XBo
 L+N3u16UKluBLKwURL3tGhnBC/dQ2oMA+jHKQq4uC8t6pTSESJxghu+abUd6p85s+NsrCPpU6
 Obl2pM7uj1Ez7S9USeHMMC06O4Lh38nbMmA739ivsfluyNbHKpflY9D1+ZgPQVueK0ZoZY/Da
 H9qzYLqBvoltKUqjBVFbkpE3uZdbx9CF/G7XZjwQsZqM5z7g/tpVj+H4izrZG/bagkVz0TZ/4
 sGLFhcTuRRonY378z
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Dave,

just a few questions and suggestions below....

On 17.07.20 23:15, John David Anglin wrote:
> diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/as=
m/spinlock.h
> index 70fecb8dc4e2..a23f7bc5d189 100644
> --- a/arch/parisc/include/asm/spinlock.h
> +++ b/arch/parisc/include/asm/spinlock.h
> @@ -10,34 +10,54 @@
>  static inline int arch_spin_is_locked(arch_spinlock_t *x)
>  {
>  	volatile unsigned int *a =3D __ldcw_align(x);
> -	smp_mb();
> -	return *a =3D=3D 0;
> +	return READ_ONCE(*a) =3D=3D 0;
>  }
>
> -static inline void arch_spin_lock(arch_spinlock_t *x)
> +static inline int __pa_ldcw (volatile unsigned int *a)
> +{
> +#if __PA_LDCW_ALIGNMENT=3D=3D16
> +	*(volatile char *)a =3D 0;
> +#endif

I assume this is planned as a kind of prefetching into cache here?
But doesn't it maybe introduce a bug when the first byte
(in which you write zero) wasn't zero at the beginning?
In that case the following ldcw():

> +	return __ldcw(a);

returns zero, althought it wasn't zero initially?


> +}
> +


> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index f05c9d5b6b9e..4ba43a3c7c67 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -659,8 +678,15 @@ cas_action:
>  	/* Error occurred on load or store */
>  	/* Free lock */
>  #ifdef CONFIG_SMP
> -98:	LDCW	0(%sr2,%r20), %r1			/* Barrier */
> +98:	sync			/* Barrier */
>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
> +	nop
> +	nop
> +	nop
> +	nop
> +	nop
> +	nop
> +	nop

I think you should put those nop's before the 99:ALTERNATIVE() instruction=
 above.
That way they all get replaced by one jump instead of multiple nops (when
there is only one CPU in the SMP system).

Helge
