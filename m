Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE3A6BD84A
	for <lists+linux-parisc@lfdr.de>; Thu, 16 Mar 2023 19:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjCPSmy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 16 Mar 2023 14:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjCPSmx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 16 Mar 2023 14:42:53 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F3ABD4D4
        for <linux-parisc@vger.kernel.org>; Thu, 16 Mar 2023 11:42:51 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id q6so1235124iot.2
        for <linux-parisc@vger.kernel.org>; Thu, 16 Mar 2023 11:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1678992171; x=1681584171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CE4Prcpd6bDAI1jiw/kAlYEJ29RvPfxyt80mdTX4QGU=;
        b=BKpkoibsOCJejo6PgvD/u2tblQ2UTIGJgd+3YC2TXnopSnUCC5WtBG0/5hh1BIotXP
         Xbe1zIPSjfg54aUqIpVW3yLNJo31nVHBRmfXU1G+S9AJHTa660dkKrQHUHYMTI+iBSMv
         /EFnkGNtSL4Ztk5tXEZmPB4GbzlfjwHK7dVTPYFi5nj36kMyuwCnqMAy5QtxjCG4f3QL
         DTvPDR9AH+kxwXuqYZ9QWyACqjdaoOhzNalDK83whENRxIpxnt7bD4InzgQyXsvXXXPa
         BFpq8/7nzlanLpoUp8hqBX5BUSxUc130YOdO0mxT02mqb2uRX/DkMuaLl13jvDLxjzdK
         X2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678992171; x=1681584171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CE4Prcpd6bDAI1jiw/kAlYEJ29RvPfxyt80mdTX4QGU=;
        b=dVMwZcoAfwScLBX5VjTgrcevMaiQrdo65nRsEDBX2X86oi9rVl/IQLo8OpseKYLA56
         yNyrXIYLCcOcmxjEFLxiHg7rOsnAZX24qicw70Heuqlcc1DxtJVgwS4BJcVtIx7Q0sPE
         fkvJsEHCkaqUW9v6N/wm+1Q4AmAIZccxw907YgfVV1Q/ZB5QlUyBFauwmXRAQFBZpO4Y
         LLPxkSXTHlAJDpeJn8k3ys/bAFDns8OPK8J8PRw81K/58xrUCJcW1aUtZPydBKFywf7l
         8kC3ycakNGExjIcetZYpg4bdHC62CtlPgDMZoDz676DTO9fI+Y30Zxb3YyHvFZ71X5Ky
         fuPw==
X-Gm-Message-State: AO0yUKU/mwUgp9j10TBvYYWWZfWRxobBXFPwKKK0LfkaFSwoc/uthpQG
        u+ucv5sYr1cAccb6bHyMdkoDRw==
X-Google-Smtp-Source: AK7set/vMq9M/aNghMB4eG8wAnBhit1AUhRchajorza82kRjFxC5lKEIpMsdlhSvxNiXdncddfXkKQ==
X-Received: by 2002:a6b:c38f:0:b0:752:f9b6:386b with SMTP id t137-20020a6bc38f000000b00752f9b6386bmr2095475iof.0.1678992171138;
        Thu, 16 Mar 2023 11:42:51 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id q6-20020a05663810c600b004063510ba0esm310379jad.142.2023.03.16.11.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 11:42:50 -0700 (PDT)
Message-ID: <f9e85ab6-e2cd-f30c-0e46-ab9a312e4219@kernel.dk>
Date:   Thu, 16 Mar 2023 12:42:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/5] io_uring: add support for user mapped provided buffer
 ring
Content-Language: en-US
To:     Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc:     Helge Deller <deller@gmx.de>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        Linux Parisc Mailing List <linux-parisc@vger.kernel.org>
References: <20230314171641.10542-1-axboe@kernel.dk>
 <20230314171641.10542-6-axboe@kernel.dk>
 <ZBNa7/tIwEXiQMcQ@biznet-home.integral.gnuweeb.org>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZBNa7/tIwEXiQMcQ@biznet-home.integral.gnuweeb.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 3/16/23 12:07 PM, Ammar Faizi wrote:
> I tried to verify the for-next build report. And I think this doesn't
> look right.
> 
> On Tue, Mar 14, 2023 at 11:16:42AM -0600, Jens Axboe wrote:
>> @@ -214,15 +215,27 @@ static int __io_remove_buffers(struct io_ring_ctx *ctx,
>>  	if (!nbufs)
>>  		return 0;
>>  
>> -	if (bl->is_mapped && bl->buf_nr_pages) {
>> -		int j;
>> -
>> +	if (bl->is_mapped) {
>>  		i = bl->buf_ring->tail - bl->head;
>                     ^^^^^^^^^^^^^^^^^^
> 
> Dereference bl->buf_ring. It implies bl->buf_ring is not NULL.
> 
>> -		for (j = 0; j < bl->buf_nr_pages; j++)
>> -			unpin_user_page(bl->buf_pages[j]);
>> -		kvfree(bl->buf_pages);
>> -		bl->buf_pages = NULL;
>> -		bl->buf_nr_pages = 0;
>> +		if (bl->is_mmap) {
>> +			if (bl->buf_ring) {
>                         ^^^^^^^^^^^^^^^^^
> 
> A NULL check against bl->buf_ring here. If it was possible to be NULL,
> wouldn't the above dereference BUG()?

I don't think it's possible and we should probably just remove that
latter check. If the buffer group is visible, either method will have
a valid ->buf_ring IFF is_mmap/is_mapped is set.

-- 
Jens Axboe


