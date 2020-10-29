Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6EE29F3DD
	for <lists+linux-parisc@lfdr.de>; Thu, 29 Oct 2020 19:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgJ2SLv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 29 Oct 2020 14:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgJ2SFO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Oct 2020 14:05:14 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A6BC0613D2
        for <linux-parisc@vger.kernel.org>; Thu, 29 Oct 2020 11:05:14 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id c11so3955946iln.9
        for <linux-parisc@vger.kernel.org>; Thu, 29 Oct 2020 11:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3Pk/sZUj9WHLTFxNkJqOxrgpAQUbLZP44axoIe1Z2Us=;
        b=V+tIw0SjtiM5Qtn6mDGQDHrkOSsTOR4tYO5vtlHFZ1uwEIguMiH4a96OGfi+dWFSSt
         dgUAKmwcJCuDp9K4Y+PotiZ6906XvS4NJo4Es1GpoZ7WES4dKMkrdJq7f8ZCV1rFXzUc
         WFWDiddsfWq080jNDOKqRmy8PXx3t+LtljcIpEWKDe4RJznT/HX9U7yZTJu0SBbMev8w
         buEsOhSD/HTd4EzZfwYWaK44LJZvU/9oQo/7XsdCgKew5RJZlL2mfwFwpRT2QVTNGwcW
         Nb4BLH4FMJ+xBXvF6ReTYcCBnWoSlA97ek9wlgMiskVf3TqYQLGRfqGwKHwfRMbTqXxN
         er+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3Pk/sZUj9WHLTFxNkJqOxrgpAQUbLZP44axoIe1Z2Us=;
        b=hndHAyUnGyPVC/VO5LTDC2ONl2FetDbE5V547GWZTiAV7iVfhDYB0HBdZejOZkR5jo
         CVq7+VCH58J1EoMz5LNlqIzVo40tvmp+CqMpFUVWStqXX+lF/FrEDI1Q9dYUtgDMthEH
         4Htin2DmqV7GS3OiTukXaEQZcgteeu5EKkm1sCap2kj8aQuBvd7lZfRRWGHarIu02B+1
         LlD0udmMndBIYU8t63tMsoMhoGxEEco+QzyyZgm4R4Gre0KqwbbQy5jLrJoyC02RigSJ
         7i0eCHRFA/K5mmijyA74KIVaDJXlvObU4MJT+o5v86dU/f+Q83Jp2GQDc72bWOZUtSnz
         i6iA==
X-Gm-Message-State: AOAM532dzhpnc2bGnsBxPbFy2ICZCxldfPdr/xPJdKlFI/UgYFvWHX6j
        f0vd8HbVH1RVNJxFsani+oqReLAjzqiU8A==
X-Google-Smtp-Source: ABdhPJy+rDe5DXVdINDqjaX1YCYvxRLyxk6ONww4defqykVWfe+YlaLmJfPFgWOrgKhVDEG9wE5c2g==
X-Received: by 2002:a92:1f90:: with SMTP id f16mr4163803ilf.296.1603994713457;
        Thu, 29 Oct 2020 11:05:13 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id f22sm2494338ioh.34.2020.10.29.11.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 11:05:12 -0700 (PDT)
Subject: Re: [PATCH] Wire up TIF_NOTIFY_SIGNAL handling for parisc
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <18ca5e8a-2ae9-a15b-24c4-4b6b501c9121@kernel.dk>
 <c2d3b7c7-331a-b258-31ab-bf7fc46dad92@gmx.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <5408b716-8822-b18f-170b-70350258482f@kernel.dk>
Date:   Thu, 29 Oct 2020 12:05:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c2d3b7c7-331a-b258-31ab-bf7fc46dad92@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/29/20 12:01 PM, Helge Deller wrote:
> On 10/29/20 5:19 PM, Jens Axboe wrote:
>> Wire up TIF_NOTIFY_SIGNAL handling for parisc.
> 
> Nit: You mixed up the mail subject....

Oh shoot! I did these manually to send them out separately, looks like
this is the only one that got messed up.

>> Cc: linux-parisc@vger.kernel.org
>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>> ---
>>
>> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
>> for details:
>>
>> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
>>
>> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
>> as that will enable a set of cleanups once all of them support it. I'm
>> happy carrying this patch if need be, or it can be funelled through the
>> arch tree. Let me know.
> 
> Thanks for adding the support for it on parisc.
> I'd prefer if you keep it in your tree and push it together with the
> other patches.
> 
> You may add:
> Acked-by: Helge Deller <deller@gmx.de>

Thanks!

-- 
Jens Axboe

