Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD49C3D92E0
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Jul 2021 18:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237478AbhG1QLL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 28 Jul 2021 12:11:11 -0400
Received: from out02.mta.xmission.com ([166.70.13.232]:47446 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237456AbhG1QKf (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Jul 2021 12:10:35 -0400
Received: from in01.mta.xmission.com ([166.70.13.51]:32964)
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m8m8G-007CzP-LA; Wed, 28 Jul 2021 10:10:09 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:41378 helo=email.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m8m8C-00A9Pq-J2; Wed, 28 Jul 2021 10:10:08 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        Feng Tang <feng.tang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-api@vger.kernel.org, linux-mm@kvack.org
References: <20210727144859.4150043-1-arnd@kernel.org>
        <20210727144859.4150043-2-arnd@kernel.org>
Date:   Wed, 28 Jul 2021 11:09:22 -0500
In-Reply-To: <20210727144859.4150043-2-arnd@kernel.org> (Arnd Bergmann's
        message of "Tue, 27 Jul 2021 16:48:54 +0200")
Message-ID: <87eebifmj1.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1m8m8C-00A9Pq-J2;;;mid=<87eebifmj1.fsf@disp2133>;;;hst=in01.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX18xroipV9CATxhuOK1ETEIbw3EWCZZa/6o=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01
        autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4998]
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
        *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Arnd Bergmann <arnd@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 3133 ms - load_scoreonly_sql: 0.06 (0.0%),
        signal_user_changed: 10 (0.3%), b_tie_ro: 9 (0.3%), parse: 1.52 (0.0%),
         extract_message_metadata: 64 (2.1%), get_uri_detail_list: 3.7 (0.1%),
        tests_pri_-1000: 325 (10.4%), tests_pri_-950: 1.78 (0.1%),
        tests_pri_-900: 1.30 (0.0%), tests_pri_-90: 251 (8.0%), check_bayes:
        248 (7.9%), b_tokenize: 23 (0.7%), b_tok_get_all: 11 (0.3%),
        b_comp_prob: 3.8 (0.1%), b_tok_touch_all: 197 (6.3%), b_finish: 1.56
        (0.0%), tests_pri_0: 2460 (78.5%), check_dkim_signature: 1.03 (0.0%),
        check_dkim_adsp: 3.1 (0.1%), poll_dns_idle: 0.53 (0.0%), tests_pri_10:
        2.2 (0.1%), tests_pri_500: 11 (0.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v5 1/6] kexec: move locking into do_kexec_load
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The locking is the same between the native and compat version of
> sys_kexec_load(), so it can be done in the common implementation
> to reduce duplication.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

>
> Co-developed-by: Eric Biederman <ebiederm@xmission.com>
> Co-developed-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  kernel/kexec.c | 44 ++++++++++++++++----------------------------
>  1 file changed, 16 insertions(+), 28 deletions(-)
>
> diff --git a/kernel/kexec.c b/kernel/kexec.c
> index c82c6c06f051..9c7aef8f4bb6 100644
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -110,6 +110,17 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>  	unsigned long i;
>  	int ret;
>  
> +	/*
> +	 * Because we write directly to the reserved memory region when loading
> +	 * crash kernels we need a mutex here to prevent multiple crash kernels
> +	 * from attempting to load simultaneously, and to prevent a crash kernel
> +	 * from loading over the top of a in use crash kernel.
> +	 *
> +	 * KISS: always take the mutex.
> +	 */
> +	if (!mutex_trylock(&kexec_mutex))
> +		return -EBUSY;
> +
>  	if (flags & KEXEC_ON_CRASH) {
>  		dest_image = &kexec_crash_image;
>  		if (kexec_crash_image)
> @@ -121,7 +132,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>  	if (nr_segments == 0) {
>  		/* Uninstall image */
>  		kimage_free(xchg(dest_image, NULL));
> -		return 0;
> +		ret = 0;
> +		goto out_unlock;
>  	}
>  	if (flags & KEXEC_ON_CRASH) {
>  		/*
> @@ -134,7 +146,7 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>  
>  	ret = kimage_alloc_init(&image, entry, nr_segments, segments, flags);
>  	if (ret)
> -		return ret;
> +		goto out_unlock;
>  
>  	if (flags & KEXEC_PRESERVE_CONTEXT)
>  		image->preserve_context = 1;
> @@ -171,6 +183,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>  		arch_kexec_protect_crashkres();
>  
>  	kimage_free(image);
> +out_unlock:
> +	mutex_unlock(&kexec_mutex);
>  	return ret;
>  }
>  
> @@ -247,21 +261,8 @@ SYSCALL_DEFINE4(kexec_load, unsigned long, entry, unsigned long, nr_segments,
>  		((flags & KEXEC_ARCH_MASK) != KEXEC_ARCH_DEFAULT))
>  		return -EINVAL;
>  
> -	/* Because we write directly to the reserved memory
> -	 * region when loading crash kernels we need a mutex here to
> -	 * prevent multiple crash  kernels from attempting to load
> -	 * simultaneously, and to prevent a crash kernel from loading
> -	 * over the top of a in use crash kernel.
> -	 *
> -	 * KISS: always take the mutex.
> -	 */
> -	if (!mutex_trylock(&kexec_mutex))
> -		return -EBUSY;
> -
>  	result = do_kexec_load(entry, nr_segments, segments, flags);
>  
> -	mutex_unlock(&kexec_mutex);
> -
>  	return result;
>  }
>  
> @@ -301,21 +302,8 @@ COMPAT_SYSCALL_DEFINE4(kexec_load, compat_ulong_t, entry,
>  			return -EFAULT;
>  	}
>  
> -	/* Because we write directly to the reserved memory
> -	 * region when loading crash kernels we need a mutex here to
> -	 * prevent multiple crash  kernels from attempting to load
> -	 * simultaneously, and to prevent a crash kernel from loading
> -	 * over the top of a in use crash kernel.
> -	 *
> -	 * KISS: always take the mutex.
> -	 */
> -	if (!mutex_trylock(&kexec_mutex))
> -		return -EBUSY;
> -
>  	result = do_kexec_load(entry, nr_segments, ksegments, flags);
>  
> -	mutex_unlock(&kexec_mutex);
> -
>  	return result;
>  }
>  #endif
