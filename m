Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6239F7A317D
	for <lists+linux-parisc@lfdr.de>; Sat, 16 Sep 2023 18:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjIPQuT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 16 Sep 2023 12:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbjIPQuI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 16 Sep 2023 12:50:08 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2D7CE0
        for <linux-parisc@vger.kernel.org>; Sat, 16 Sep 2023 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1694882990; x=1695487790; i=deller@gmx.de;
 bh=KO9Tcyd+VKp1zOgCbNcEUeHLozIR/Xqkt1wk14pk070=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=L+707rRhelEOoEVsBor/i+JOhJFO3Sh+jZWWU4zOsRTkTwZerWEA4RfKq4arXVwD5objm/pyiZR
 YffVvNYlcrQITb4WxDOffW5wJQ0sczdMkDJc7HSqWG1NUMpt5AH9s1HIIr4+fLOsSdRDzv8q2Uf2w
 tQ8im5lF8jrsxhwnbbbnCQvWdVcqKi9w2oSZNYbZN1zcVAVZnnPQqHV7Tz+BArCWoMmIZptycoAhK
 OTEW2yTh4fR72rreoN/p6jTJONqAgVbFcnnsU0Jk5dl6wLgZnj3gNWtqZPRD+vzqrra0WUoikfTpC
 MX75uUbEg7IP/Ji1jCNnlEbdl4VpCCLJrX0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.154.45]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnaof-1rO4R11aXV-00jZbY; Sat, 16
 Sep 2023 18:49:50 +0200
Message-ID: <bb1b594d-5526-7774-44ab-bab8c5262c49@gmx.de>
Date:   Sat, 16 Sep 2023 18:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/hppa: clear the PSW 'N' bit when delivering
 signals
Content-Language: en-US
To:     Mikulas Patocka <mpatocka@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     qemu-devel@nongnu.org, linux-parisc@vger.kernel.org
References: <f69ce25f-733d-7931-e59c-e3f1279b965a@redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <f69ce25f-733d-7931-e59c-e3f1279b965a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uZJVpIAWWT2BxiDSbsrp/j1QTJ4zw48bUoHAT7Gw+9d6fj4YphT
 34EgnIWbFRsCYdjLFib/TwjGcy5tEvJ6JrZLSpbYNan6kS/sx7freCWQS+9C31nX1xJ3kUK
 00zuHjtqdq6qAlMyBN05koAbfdMu6W8qZEbpDsqOYK2FhRpjB4eyQy9qKtZq7PlIdhBxsKa
 7YrC53HcKf8mI0IzywNpg==
UI-OutboundReport: notjunk:1;M01:P0:4JAR97qWQAI=;s/0t2FBF23UP7yhUXSaQOfq4ETf
 zYrF/x2OqV+wryUG7EAN3209IPMs9stvPZNb7ZhhheStYv6Ef0nISWACR+k/uz4nbWEkaUnbW
 GtwmTyPS2BAwRXZ68Z6P/JxXzD6EyDg2a5ckd2hE557Mkvrn5K4jPhA1+FoWsOKx8zy1agbtY
 ymLuvzKgR7s4qniLGbxqFUJG94MwwYYl1rmbsUlsHnbF+oZVtx06ipZ+5Ou3iQVbMGeInZhlv
 s5Nj2kK0l7NSANwJCJbhtgBnhG2d+ywq6Y4jQYfYCwpTJ31Aal/t6seAWVvGT5cQ2RYMRxvP3
 PH/iyUj88AIKciWfWHn0gLcOo5nhdbdz39OxokQ4hPndRJdjTUkb8EGSurm1kWLiIvuKQYC2r
 t7aGP3rGMjEcQ9ZJ+mdwV9Gx1TorEHTyz+QVgOU1XfTqJi1yxWSMqImVYD1KJjz+hjh4wroyI
 xrqtQieshseNoSrS9xpEpmb34hX4NwhRKuy2PsrSlP2C+V8o48aUTE9hTX7BiecJVDxBrr4jG
 EH4s9eponnbpiHfsx76cWLAFcXEyebTDV/ixE8Hn7CKfuqDX37D1NPM5wJhShWhKeFFYR+fMN
 8nqsdw9tKYOuKlxMFc7R+2jpVeQOB1XSaYcKBJz5Z7/4as/GgZ/t8XrXsVdMQld9AVVIVHRwc
 gVRO/xHYyMTxDSU/aoFYb8tvgPjEM5PAk8a8ey4d5HzJVflZuid7F12JNsueV+jj/OqIQtNhe
 wf2FVtUDjWxlVhDiZBttv5w699UWLtmjUmvOE7hF/jX/Pp7SFyk7dzUW3LBnMFDLSoQmQ8SVc
 ndGIHAXey3zMVlFQ621l/EyoebawJsReP2K6O+JVtdYPaH+qZ5BvwohjeYvnrrxY42JpmVJpv
 bLJCyZyOtJaa0EephioRoSDB38Hk/HdjoH2/ahLK4zrePXxoahHi/ztVsRkyqtHNWpq2S2CMY
 T6mRAg==
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 9/16/23 15:49, Mikulas Patocka wrote:
> qemu-hppa may crash when delivering a signal. It can be demonstrated wit=
h
> this program. Compile the program with "hppa-linux-gnu-gcc -O2 signal.c"
> and run it with "qemu-hppa -one-insn-per-tb a.out". It reports that the
> address of the flag is 0xb4 and it crashes when attempting to touch it.
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/time.h>
> #include <signal.h>
>
> sig_atomic_t flag;
>
> void sig(int n)
> {
> 	printf("&flag: %p\n", &flag);
> 	flag =3D 1;
> }
>
> int main(void)
> {
> 	struct sigaction sa;
> 	struct itimerval it;
>
> 	sa.sa_handler =3D sig;
> 	sigemptyset(&sa.sa_mask);
> 	sa.sa_flags =3D SA_RESTART;
> 	if (sigaction(SIGALRM, &sa, NULL)) perror("sigaction"), exit(1);
>
> 	it.it_interval.tv_sec =3D 0;
> 	it.it_interval.tv_usec =3D 100;
> 	it.it_value.tv_sec =3D it.it_interval.tv_sec;
> 	it.it_value.tv_usec =3D it.it_interval.tv_usec;
>
> 	if (setitimer(ITIMER_REAL, &it, NULL)) perror("setitimer"), exit(1);
>
> 	while (1) {
> 	}
> }
>
> The reason for the crash is that the signal handling routine doesn't cle=
ar
> the 'N' flag in the PSW. If the signal interrupts a thread when the 'N'
> flag is set, the flag remains set at the beginning of the signal handler
> and the first instruction of the signal handler is skipped.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Acked-by: Helge Deller <deller@gmx.de>

Thank you!

Helge

>
> ---
>   linux-user/hppa/signal.c |    1 +
>   1 file changed, 1 insertion(+)
>
> Index: qemu/linux-user/hppa/signal.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu.orig/linux-user/hppa/signal.c
> +++ qemu/linux-user/hppa/signal.c
> @@ -159,6 +159,7 @@ void setup_rt_frame(int sig, struct targ
>       }
>       env->iaoq_f =3D haddr;
>       env->iaoq_b =3D haddr + 4;
> +    env->psw_n =3D 0;
>       return;
>
>    give_sigsegv:
>

