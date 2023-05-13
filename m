Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D52A701702
	for <lists+linux-parisc@lfdr.de>; Sat, 13 May 2023 15:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238637AbjEMNV7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 13 May 2023 09:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238348AbjEMNV5 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 May 2023 09:21:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518E03AB1
        for <linux-parisc@vger.kernel.org>; Sat, 13 May 2023 06:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683984069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SK16VKdIV5jsDUg8ldfptFQ8faOJ3rucDoLCiFzH7CA=;
        b=bGHXoaiBQckeZI76Saa+5IQFaB1Wrjhag9vH9Y9hlWz2HlzmKXJw82e0LC1Qf/X7O9jbU9
        57ymXtlqeRdwoARBX4RYN3qgensYNFGe08Fs/ANH3AyUHl0AaWiC3Yf5kyT3iwge6iRFcM
        00iUXA4wgLxv8gGpahZ3BgRKoap4s3s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-G0Njj7JLM_C_OHk105DQUw-1; Sat, 13 May 2023 09:21:07 -0400
X-MC-Unique: G0Njj7JLM_C_OHk105DQUw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-5ee8e5e93d7so57929506d6.1
        for <linux-parisc@vger.kernel.org>; Sat, 13 May 2023 06:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683984067; x=1686576067;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK16VKdIV5jsDUg8ldfptFQ8faOJ3rucDoLCiFzH7CA=;
        b=MfPRVpcF+F3SQBzOFmAuBCzLSGLo3MK8HUXrWImrdT6iZaTxcVxytJVtTI95+e0NqY
         0IyhcK0oj1p4eOy4B2jcyZFp0YDEr2ZYMiKNfYf4RQeECRs5EbDh7Oph0nsO3ymTifVb
         fMTUnAmVMsvoYtvMorBr2B0BQu9vZFqF7NPjH7DZA+Zt4sLxVq3MJncmKmU5k72uokdt
         rnYEVc8Wj6BTAohRksVi7a3ktH5nygTvYqpg7plasLiv6IJLQ7S+kjX0RshcqYj7oyxi
         oz6Nk6AZDsiRK357obSqZeXrc4lbWTDElyZxRLaWmvGEO+TVFib6TTO3iISFTkdNunHo
         hi4w==
X-Gm-Message-State: AC+VfDwGDsEF/2+3KoDli9OU96P45fhdfIZhpo2n4wf1ZWavZAYLucSf
        SKyNyBC5gLZ0INwN4U1wMjHPbfB+XASDBxpDGGN62dx0Pp5hhSYGRddC3L4Cc86lwY2p7+yG4xl
        7QojgvjHtHlbd5+o984tL8gfk55sBJ8trh1o=
X-Received: by 2002:a05:6214:e4d:b0:5af:af15:8d44 with SMTP id o13-20020a0562140e4d00b005afaf158d44mr37980321qvc.45.1683984067279;
        Sat, 13 May 2023 06:21:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6v37ctbBhiCLNr+pXKe18rb7uDkNdoXICP/K4POSUqrWF8hGZdOxTUHwlPD2gDgSoNrfsuPg==
X-Received: by 2002:a05:6214:e4d:b0:5af:af15:8d44 with SMTP id o13-20020a0562140e4d00b005afaf158d44mr37980290qvc.45.1683984066952;
        Sat, 13 May 2023 06:21:06 -0700 (PDT)
Received: from ?IPV6:2603:7000:3d00:1816::1772? (2603-7000-3d00-1816-0000-0000-0000-1772.res6.spectrum.com. [2603:7000:3d00:1816::1772])
        by smtp.gmail.com with ESMTPSA id r17-20020a0c8b91000000b0062351ff264bsm78408qva.53.2023.05.13.06.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 06:21:06 -0700 (PDT)
Message-ID: <8d23bbd1-adcb-d52e-791b-42faae04c14e@redhat.com>
Date:   Sat, 13 May 2023 15:21:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To:     Helge Deller <deller@gmx.de>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Cc:     linux-parisc@vger.kernel.org
References: <1683740497@msgid.manchmal.in-ulm.de>
 <8889a75f-1a81-905e-8bc4-a733de32985f@gmx.de>
 <1683825030@msgid.manchmal.in-ulm.de>
 <85aef102-8407-68c7-2dc2-87e5a866906b@gmx.de>
 <1683928214@msgid.manchmal.in-ulm.de> <ZF9+OYqQS/vy7Oq5@p100>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Regression with kernel 6.3 "kernel BUG at
 include/linux/swapops.h:472!"
In-Reply-To: <ZF9+OYqQS/vy7Oq5@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> Yes, makes sense.
> 
>> [1] Total is 1 Gbyte, and running
>>      | dd if=/dev/zero bs=896M count=1 | pv --rate-limit=1k >/dev/null
>>      might not be the best style but does the trick: Wait for pv to
>>      count up to a minute, then ^C it. If the host is still okay after
>>      that, it's considered "good".
> 
> Thanks for bisecting and coming up with a testcase!
> The attached patch survives for me on my C3000 with 2GB RAM with this test:
> 	dd if=/dev/zero bs=1896M count=1 | pv
> (well, the OOM-killer might jump in, but even that is survived).
> 
> Could you try the patch below?

Thanks for debugging! :)

> 
> Helge
> 
> -
> 
> [PATCH] parisc: Fix encoding of swp_entry due to added SWP_EXCLUSIVE flag
> 
> Fix the __swp_offset() and __swp_entry() macros due to commit 6d239fc78c0b
> ("parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE") which introduced the
> SWP_EXCLUSIVE flag by reusing the _PAGE_ACCESSED flag.
> 
> Reported-by: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
> Fixes: 6d239fc78c0b ("parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE")
> 
> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
> index e2950f5db7c9..522846be54b7 100644
> --- a/arch/parisc/include/asm/pgtable.h
> +++ b/arch/parisc/include/asm/pgtable.h
> @@ -413,12 +413,12 @@ extern void paging_init (void);
>    *   For the 64bit version, the offset is extended by 32bit.
>    */
>   #define __swp_type(x)                     ((x).val & 0x1f)
> -#define __swp_offset(x)                   ( (((x).val >> 6) &  0x7) | \
> -					  (((x).val >> 8) & ~0x7) )
> +#define __swp_offset(x)                   ( (((x).val >> 5) &  0x7) | \
> +					  (((x).val >> 10) << 3) )
>   #define __swp_entry(type, offset)         ((swp_entry_t) { \
>   					    ((type) & 0x1f) | \
> -					    ((offset &  0x7) << 6) | \
> -					    ((offset & ~0x7) << 8) })
> +					    ((offset &  0x7) << 5) | \
> +					    ((offset & ~0x7) << 7) })
>   #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
>   #define __swp_entry_to_pte(x)		((pte_t) { (x).val })

This fix makes it work like the layout I documented.

What I originally tried doing was reusing one of the spare bits instead of reworking
the layout. Apparently, I got the old layout wrong. :(

So if I understood the layout right this time, maybe we can just use one of the two
spare bits: _PAGE_HUGE (or alternatively, _PAGE_DIRTY_BIT)?



diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index e2950f5db7c9..ee9f08cd5938 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -218,8 +218,8 @@ extern void __update_cache(pte_t pte);
  #define _PAGE_KERNEL_RWX       (_PAGE_KERNEL_EXEC | _PAGE_WRITE)
  #define _PAGE_KERNEL           (_PAGE_KERNEL_RO | _PAGE_WRITE)
  
-/* We borrow bit 23 to store the exclusive marker in swap PTEs. */
-#define _PAGE_SWP_EXCLUSIVE    _PAGE_ACCESSED
+/* We borrow bit 21 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE    _PAGE_HUGE
  
  /* The pgd/pmd contains a ptr (in phys addr space); since all pgds/pmds
   * are page-aligned, we don't care about the PAGE_OFFSET bits, except
@@ -405,7 +405,7 @@ extern void paging_init (void);
   *
   *                         1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
   *   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
- *   <---------------- offset -----------------> P E <ofs> < type ->
+ *   <---------------- offset ---------------> E P <ofs> 0 < type ->
   *
   *   E is the exclusive marker that is not stored in swap entries.
   *   _PAGE_PRESENT (P) must be 0.
diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 110a36479dce..7510db355f48 100644


-- 
Thanks,

David / dhildenb

