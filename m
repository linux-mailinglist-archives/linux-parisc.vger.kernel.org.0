Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0BC299DAB
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Oct 2020 01:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395085AbgJ0AJP (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 26 Oct 2020 20:09:15 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46004 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395106AbgJ0AJJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 26 Oct 2020 20:09:09 -0400
Received: by mail-pf1-f193.google.com with SMTP id e7so7109619pfn.12
        for <linux-parisc@vger.kernel.org>; Mon, 26 Oct 2020 17:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LsJlRjdqhDVAHhw47g/atIos95r5K18qubNura+3fzc=;
        b=DV6OWsJ8YTis4RWe74HnMoSPHx2wnbbnih3F0P+HiF57IXnyKrAIcBplDa0TuQW0fe
         aii8O67y5CuNtSNcN0q+CPIFocqT+ma+us4RoqX4TC6tMgaGBGUnwVHQJ/N6qPZoUIZl
         N8PZQaTFtDJvhHp2KmiMn99XHribiQTVBqggOOByg6ZsC+AIdPeSZ7IIhzJWtbXj8peQ
         vUIkbSwJfbOC01KBcysHUuhejsj0lkLWHowENLgMtxCKJmsxzr5jKuNTtJsywdn514eT
         kI7wIhvyoH92wMz2QHWzCBEBrmMggfxor976qEm1YW1xHPKbqwPNkX7lWR3OAQC8rWrk
         OKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LsJlRjdqhDVAHhw47g/atIos95r5K18qubNura+3fzc=;
        b=kyrmvZkCkXC/hDXFex3U95hwV4hzDrBHABpgjdH5bH93Ukxp76u+RcjNi5aAOgquJD
         3ewIks1YHzT7vOG2sCF1DDJXtcBvMMmnp6ZWSGVW37/CbaqEEFlsukdhpmVy6Le9MlMV
         VH6nb0HWu56Yyx+cPpJVzqV5mACyV4L2DakNqh0BTZPXKnN5vm9/Y9tckQDzgLCEmnnL
         GL04L99f+z/K9PoBH20yjo/B1/bi7zbJ3+FQQKNbjNdw+6UeHkwhFfi+oXgufnGG88A1
         5HnWPll3iC76znzX1vt4ZAY9d6YK9r71PaLC5Sf+KliqAAg9sYEcXfpI6GdJCgchsunC
         +sMQ==
X-Gm-Message-State: AOAM53270D+T3vcH2Q7bq7Djmwzj6B4LLTLWdw2myQGKFCTLRfItQSVr
        qpimKylaevSqJqG0jIL3brzRBg==
X-Google-Smtp-Source: ABdhPJzyk1CokDb3PmPO6AYN5WbyxmkTO2goVocCEnl70vwlgJZot7evNIwwh9o3S+Q92QVwXSE2HA==
X-Received: by 2002:a65:5c02:: with SMTP id u2mr18125891pgr.173.1603757348944;
        Mon, 26 Oct 2020 17:09:08 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id e16sm13676837pfh.45.2020.10.26.17.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 17:09:08 -0700 (PDT)
Subject: Re: [REGRESSION] mm: process_vm_readv testcase no longer works after
 compat_prcoess_vm_readv removed
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Kyle Huey <me@kylehuey.com>,
        open list <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Robert O'Callahan <robert@ocallahan.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        "open list:FILESYSTEMS (VFS and infrastructure)" 
        <linux-fsdevel@vger.kernel.org>, linux-aio@kvack.org,
        io-uring@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, netdev@vger.kernel.org,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <CAP045Aqrsb=CXHDHx4nS-pgg+MUDj14r-kN8_Jcbn-NAUziVag@mail.gmail.com>
 <70d5569e-4ad6-988a-e047-5d12d298684c@kernel.dk>
 <20201027000521.GD3576660@ZenIV.linux.org.uk>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <0127a542-3f93-7bd0-e00d-4a0e49846c8f@kernel.dk>
Date:   Mon, 26 Oct 2020 18:09:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027000521.GD3576660@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/26/20 6:05 PM, Al Viro wrote:
> On Mon, Oct 26, 2020 at 05:56:11PM -0600, Jens Axboe wrote:
>> On 10/26/20 4:55 PM, Kyle Huey wrote:
>>> A test program from the rr[0] test suite, vm_readv_writev[1], no
>>> longer works on 5.10-rc1 when compiled as a 32 bit binary and executed
>>> on a 64 bit kernel. The first process_vm_readv call (on line 35) now
>>> fails with EFAULT. I have bisected this to
>>> c3973b401ef2b0b8005f8074a10e96e3ea093823.
>>>
>>> It should be fairly straightforward to extract the test case from our
>>> repository into a standalone program.
>>
>> Can you check with this applied?
>>
>> diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
>> index fd12da80b6f2..05676722d9cd 100644
>> --- a/mm/process_vm_access.c
>> +++ b/mm/process_vm_access.c
>> @@ -273,7 +273,8 @@ static ssize_t process_vm_rw(pid_t pid,
>>  		return rc;
>>  	if (!iov_iter_count(&iter))
>>  		goto free_iov_l;
>> -	iov_r = iovec_from_user(rvec, riovcnt, UIO_FASTIOV, iovstack_r, false);
>> +	iov_r = iovec_from_user(rvec, riovcnt, UIO_FASTIOV, iovstack_r,
>> +				in_compat_syscall());
> 
> _ouch_
> 
> There's a bug, all right, but I'm not sure that this is all there is
> to it. For now it's probably the right fix, but...  Consider the fun
> trying to use that from 32bit process to access the memory of 64bit
> one.  IOW, we might want to add an explicit flag for "force 64bit
> addresses/sizes in rvec".

Ouch yes good point, nice catch.

-- 
Jens Axboe

