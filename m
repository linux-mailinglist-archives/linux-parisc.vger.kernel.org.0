Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D15481770
	for <lists+linux-parisc@lfdr.de>; Thu, 30 Dec 2021 00:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhL2XHG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 29 Dec 2021 18:07:06 -0500
Received: from mout.gmx.net ([212.227.17.21]:51555 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232769AbhL2XHG (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 29 Dec 2021 18:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1640819213;
        bh=SYmeoFKn79TdyxyJU+F/9tgIYGkCh8LielbsvSIywVc=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=X7Lx9WzDspAj+LiVfn5JgEL8cg5WpGqQwtlYQNyQOV80qyinvGvlMbrSJCwBHISo+
         AtA6w5sjbTtM9tfKF4kgYbI1HYg2uFqjdHV/KEYgZiD8ZDHxdesG8fFg+s1TF/aoYj
         9FDuHbXPWVQhEmXYZUprqD5c82wo6nY660NJuuWs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.210]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQkK-1mG7kz2oTI-00vS1H; Thu, 30
 Dec 2021 00:06:53 +0100
Message-ID: <fe133e70-a766-5789-0cbe-8dac7df59258@gmx.de>
Date:   Thu, 30 Dec 2021 00:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/hppa: Fix atomic_store_3 for STBY
Content-Language: en-US
To:     Richard Henderson <richard.henderson@linaro.org>,
        qemu-devel@nongnu.org
Cc:     dave.anglin@bell.net, linux-parisc <linux-parisc@vger.kernel.org>
References: <20211229222926.152109-1-richard.henderson@linaro.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20211229222926.152109-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mtyDH5DwQPnBoaoQsVMewy+OJvID/orhX3lJrtl345Mj37WzcTx
 vUQ9tYHugZZYiNO+gLOtpfy6EOKbTXgG4wrqcXyiuiIhHjzBtF+DTlgEZQUxz4x9mWWU0Y7
 /Ovx+vOl8i49lmXj0Te+JzFR138PMDPx6VXSX5SqgmaolaRUrMSkcGfZE0kLnzh4W3Ei2oh
 gWz/Xvxa2iBI91CaicKTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ELh/ghjJFfI=:O4I+7nWn4T8kctLUD8+3+1
 Evhe0KW4O0dPpWi7HqdVkImeJl87CnCpgwyKe4YDgCO8P3mvNhsWzyv+MMX6UGJmoQKXBGLrJ
 h0NHgOtsC9FfuaHHyhtZeNa8RgmJn140CeFkvw+0iAP0i6+cVXKVq5E3APPr8JvSbjBCcEXG7
 5dqT9CYDYPNkdEDAgS8m3zORpprKAXYxY8VukYf1rfcEt/kgohpTvneL8D01hNHSmB6hVsBCT
 utuP4OFg73KTDMMcwMIk9JQKgo1/TfF/p26YJ53QHgqJ8ZSLQBMj/l2EFxpuEL+ZWVaPs/3rO
 fbOHoQxA1sS4gRuBlc3gzdj0+azbm022hqVaia0ocN2kSjZxE8v5A7k0O4/1VsNL8CeEGFcGN
 lMqlQQKF5owti1ScQpftvYGSyEOLhqBeBjQts5wwBTY3etsNs0SVdBKttI2HUsQxhwTH3PJUR
 SUdAFw0Mn2f9eAhTTE7LLHlQklJgRis6BWXg1I623cIkG7GP3DgjYE52/AP1iw1qmqc6WYrF+
 ThSQgqMzuVko+89uUw51tkhOVH3exUR55uoVOQZLGc2DLMyP/6/opycJp3R2sAztMJcc1jC9x
 FyFNAdHd3+Jl7y2SRf+G5vY1GBOT2mCzZ13t7BmggW9wjm6v3NKgYGzXsqZOOdC4O8HtA8h2A
 n27aVIfnmqKVxZGlHpy5a4BNF6OpYBDyjyzhansp7LS35UNbbWExWv90ih3evo+tnPzEWjrad
 PWxgIZGUhqnS7hztNUFNiDGtakVEEgupe7Lh3Ab16xbIjbwpvJbMyk/8H+Imv31pyP56diyFX
 rn8Ln+hkZfmdYVFfLYi7jtDNkiKOnTd0fiBNcnhDZZbZ4undm+CNzi3kwx3Ii4UkivZ2sRnMy
 D3xEhSlECAzF/+UaV8MrLwVKT3vSYeXltgwxSqOxO07CyuE3YBVwjBgVTWAexl278MmNSqwxp
 wTeCssc+b+CV39lwTPdNB0RomGJ8C+zQ0dWB7qX24d6UUkPv1KCT8SGw8OxgiCNN0KUh41QO6
 M9XeeCYUIsu6nH0jULZPU2DkS7Uk2RIEezHrvM4y13BBLBcbsHMDyc3f+/7kIMMdAxKfuFZan
 5r+Gh6H39WjjY0=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/29/21 23:29, Richard Henderson wrote:
> The parallel version of STBY did not take host endianness into
> account, and also computed the incorrect address for STBY_E.
>
> Bswap twice to handle the merge and store.  Compute mask inside
> the function rather than as a parameter.  Force align the address,
> rather than subtracting one.
>
> Generalize the function to system mode by using probe_access().
>
> Reported-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Please add:
Tested-by: Helge Deller <deller@gmx.de>

I successfully tested the included stby test case on physical hardware and=
 in qemu (on x86).
My original problem where gcc (on hppa) produces wrong assembly output is =
fixed too.
Please backport this patch to qemu v6.1.x and v6.0.x.

Thank you!
Helge


> ---
>  target/hppa/op_helper.c        | 27 ++++++-----
>  tests/tcg/hppa/stby.c          | 87 ++++++++++++++++++++++++++++++++++
>  tests/tcg/hppa/Makefile.target |  5 ++
>  3 files changed, 107 insertions(+), 12 deletions(-)
>  create mode 100644 tests/tcg/hppa/stby.c
>
> diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
> index 96d9391c39..1b86557d5d 100644
> --- a/target/hppa/op_helper.c
> +++ b/target/hppa/op_helper.c
> @@ -57,26 +57,29 @@ void HELPER(tcond)(CPUHPPAState *env, target_ureg co=
nd)
>      }
>  }
>
> -static void atomic_store_3(CPUHPPAState *env, target_ulong addr, uint32=
_t val,
> -                           uint32_t mask, uintptr_t ra)
> +static void atomic_store_3(CPUHPPAState *env, target_ulong addr,
> +                           uint32_t val, uintptr_t ra)
>  {
> -#ifdef CONFIG_USER_ONLY
> -    uint32_t old, new, cmp;
> +    int mmu_idx =3D cpu_mmu_index(env, 0);
> +    uint32_t old, new, cmp, mask, *haddr;
> +    void *vaddr;
> +
> +    vaddr =3D probe_access(env, addr, 3, MMU_DATA_STORE, mmu_idx, ra);
> +    if (vaddr =3D=3D NULL) {
> +        cpu_loop_exit_atomic(env_cpu(env), ra);
> +    }
> +    haddr =3D (uint32_t *)((uintptr_t)vaddr & -4);
> +    mask =3D addr & 1 ? 0x00ffffffu : 0xffffff00u;
>
> -    uint32_t *haddr =3D g2h(env_cpu(env), addr - 1);
>      old =3D *haddr;
>      while (1) {
> -        new =3D (old & ~mask) | (val & mask);
> +        new =3D be32_to_cpu((cpu_to_be32(old) & ~mask) | (val & mask));
>          cmp =3D qatomic_cmpxchg(haddr, old, new);
>          if (cmp =3D=3D old) {
>              return;
>          }
>          old =3D cmp;
>      }
> -#else
> -    /* FIXME -- we can do better.  */
> -    cpu_loop_exit_atomic(env_cpu(env), ra);
> -#endif
>  }
>
>  static void do_stby_b(CPUHPPAState *env, target_ulong addr, target_ureg=
 val,
> @@ -92,7 +95,7 @@ static void do_stby_b(CPUHPPAState *env, target_ulong =
addr, target_ureg val,
>      case 1:
>          /* The 3 byte store must appear atomic.  */
>          if (parallel) {
> -            atomic_store_3(env, addr, val, 0x00ffffffu, ra);
> +            atomic_store_3(env, addr, val, ra);
>          } else {
>              cpu_stb_data_ra(env, addr, val >> 16, ra);
>              cpu_stw_data_ra(env, addr + 1, val, ra);
> @@ -122,7 +125,7 @@ static void do_stby_e(CPUHPPAState *env, target_ulon=
g addr, target_ureg val,
>      case 3:
>          /* The 3 byte store must appear atomic.  */
>          if (parallel) {
> -            atomic_store_3(env, addr - 3, val, 0xffffff00u, ra);
> +            atomic_store_3(env, addr - 3, val, ra);
>          } else {
>              cpu_stw_data_ra(env, addr - 3, val >> 16, ra);
>              cpu_stb_data_ra(env, addr - 1, val >> 8, ra);
> diff --git a/tests/tcg/hppa/stby.c b/tests/tcg/hppa/stby.c
> new file mode 100644
> index 0000000000..36bd5f723c
> --- /dev/null
> +++ b/tests/tcg/hppa/stby.c
> @@ -0,0 +1,87 @@
> +/* Test STBY */
> +
> +#include <pthread.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +
> +struct S {
> +    unsigned a;
> +    unsigned b;
> +    unsigned c;
> +};
> +
> +static void check(const struct S *s, unsigned e,
> +                  const char *which, const char *insn, int ofs)
> +{
> +    int err =3D 0;
> +
> +    if (s->a !=3D 0) {
> +        fprintf(stderr, "%s %s %d: garbage before word 0x%08x\n",
> +                which, insn, ofs, s->a);
> +        err =3D 1;
> +    }
> +    if (s->c !=3D 0) {
> +        fprintf(stderr, "%s %s %d: garbage after word 0x%08x\n",
> +                which, insn, ofs, s->c);
> +        err =3D 1;
> +    }
> +    if (s->b !=3D e) {
> +        fprintf(stderr, "%s %s %d: 0x%08x !=3D 0x%08x\n",
> +                which, insn, ofs, s->b, e);
> +        err =3D 1;
> +    }
> +
> +    if (err) {
> +        exit(1);
> +    }
> +}
> +
> +#define TEST(INSN, OFS, E)                                         \
> +    do {                                                           \
> +        s.b =3D 0;                                                   \
> +        asm volatile(INSN " %1, " #OFS "(%0)"                      \
> +                     : : "r"(&s.b), "r" (0x11223344) : "memory");  \
> +        check(&s, E, which, INSN, OFS);                            \
> +    } while (0)
> +
> +static void test(const char *which)
> +{
> +    struct S s =3D { };
> +
> +    TEST("stby,b", 0, 0x11223344);
> +    TEST("stby,b", 1, 0x00223344);
> +    TEST("stby,b", 2, 0x00003344);
> +    TEST("stby,b", 3, 0x00000044);
> +
> +    TEST("stby,e", 0, 0x00000000);
> +    TEST("stby,e", 1, 0x11000000);
> +    TEST("stby,e", 2, 0x11220000);
> +    TEST("stby,e", 3, 0x11223300);
> +}
> +
> +static void *child(void *x)
> +{
> +    return NULL;
> +}
> +
> +int main()
> +{
> +    int err;
> +    pthread_t thr;
> +
> +    /* Run test in serial mode */
> +    test("serial");
> +
> +    /* Create a dummy thread to start parallel mode. */
> +    err =3D pthread_create(&thr, NULL, child, NULL);
> +    if (err !=3D 0) {
> +        fprintf(stderr, "pthread_create: %s\n", strerror(err));
> +        return 2;
> +    }
> +
> +    /* Run test in parallel mode */
> +    test("parallel");
> +    return 0;
> +}
> diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.ta=
rget
> index d0d5e0e257..b78e6b4849 100644
> --- a/tests/tcg/hppa/Makefile.target
> +++ b/tests/tcg/hppa/Makefile.target
> @@ -12,3 +12,8 @@ run-signals: signals
>  	$(call skip-test, $<, "BROKEN awaiting vdso support")
>  run-plugin-signals-with-%:
>  	$(call skip-test, $<, "BROKEN awaiting vdso support")
> +
> +VPATH +=3D $(SRC_PATH)/tests/tcg/hppa
> +TESTS +=3D stby
> +
> +stby: CFLAGS +=3D -pthread
>

