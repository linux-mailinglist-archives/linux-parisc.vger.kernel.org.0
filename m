Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA3F780EF2
	for <lists+linux-parisc@lfdr.de>; Fri, 18 Aug 2023 17:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376574AbjHRPTF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 18 Aug 2023 11:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378116AbjHRPSu (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 18 Aug 2023 11:18:50 -0400
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C726A3C1F;
        Fri, 18 Aug 2023 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
        bh=Yi7tE55S8lvTzPNErtn97ZNAyJLBYyaB731OWaTvH5A=; b=bx/pnPPqUct68o2lLc0sIngH+z
        EvWdMRdqbVhCHouofWuSwMI2PerQoauwZgRVn2/tN78LV9uAue1hbD37m0byjuN3q/YBuObK4fumg
        f5SujJ4qbfWfvkSvR38NW3wZNJltnDCNb43SYcLEtehgEZ/kXv97TZI+TJ82cHrkDh7brKCZXFzpB
        dxOrlRjq8n6JZQsbiVracOvPCMrmdtktJSBQ85C88xnsWDxdZSV//4/pkV7WJeZSTR2oFI0j7Q6Qq
        T5utzeH0KcXGdXtYLUaVeUwB2PDmMeH2MMziJph5ieRZ7YQExzqbXKmjC0dnPQU1LaMuM0bCELuqO
        INdVafCg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <daniel@iogearbox.net>)
        id 1qX1FP-000Jda-LG; Fri, 18 Aug 2023 17:18:47 +0200
Received: from [85.1.206.226] (helo=pc-102.home)
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <daniel@iogearbox.net>)
        id 1qX1FP-000Dr5-0P; Fri, 18 Aug 2023 17:18:47 +0200
Subject: Re: [PATCH] bpf/tests: Enhance output on error and fix typos
To:     Helge Deller <deller@gmx.de>, bpf@vger.kernel.org
Cc:     linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZN6ZAAVoWZpsD1Jf@p100>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <a0fe9ee2-1c16-98a9-6038-249fc5d1c55b@iogearbox.net>
Date:   Fri, 18 Aug 2023 17:18:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ZN6ZAAVoWZpsD1Jf@p100>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.8/27004/Fri Aug 18 09:41:49 2023)
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/18/23 12:02 AM, Helge Deller wrote:
> If a testcase returns a wrong (unexpected) value, print the expected and
> returned value in hex notation in addition to the decimal notation. This is
> very useful in tests which bit-shift hex values left or right and helped me
> a lot while developing the JIT compiler for the hppa architecture.
> 
> Additionally fix two typos: dowrd -> dword, tall calls -> tail calls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> 
> diff --git a/lib/test_bpf.c b/lib/test_bpf.c
> index fa0833410ac1..2c01932524b3 100644
> --- a/lib/test_bpf.c
> +++ b/lib/test_bpf.c
> @@ -596,8 +596,8 @@ static int __bpf_fill_alu_shift(struct bpf_test *self, u8 op,
>   {
>   	static const s64 regs[] = {
>   		0x0123456789abcdefLL, /* dword > 0, word < 0 */
> -		0xfedcba9876543210LL, /* dowrd < 0, word > 0 */
> -		0xfedcba0198765432LL, /* dowrd < 0, word < 0 */
> +		0xfedcba9876543210LL, /* dword < 0, word > 0 */
> +		0xfedcba0198765432LL, /* dword < 0, word < 0 */
>   		0x0123458967abcdefLL, /* dword > 0, word > 0 */
>   	};
>   	int bits = alu32 ? 32 : 64;
> @@ -14577,8 +14577,9 @@ static int run_one(const struct bpf_prog *fp, struct bpf_test *test)
>   		if (ret == test->test[i].result) {
>   			pr_cont("%lld ", duration);
>   		} else {
> -			pr_cont("ret %d != %d ", ret,
> -				test->test[i].result);
> +			s32 res = test->test[i].result;

Added a newline in here while applying to bpf-next, thanks for the patch!

> +			pr_cont("ret %d != %d (%#x != %#x)",
> +				ret, res, ret, res);
>   			err_cnt++;
>   		}
>   	}
> @@ -15055,7 +15056,7 @@ static __init int prepare_tail_call_tests(struct bpf_array **pprogs)
>   	struct bpf_array *progs;
>   	int which, err;
>   
> -	/* Allocate the table of programs to be used for tall calls */
> +	/* Allocate the table of programs to be used for tail calls */
>   	progs = kzalloc(struct_size(progs, ptrs, ntests + 1), GFP_KERNEL);
>   	if (!progs)
>   		goto out_nomem;
> 

