Return-Path: <linux-parisc+bounces-4494-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE9D3934C
	for <lists+linux-parisc@lfdr.de>; Sun, 18 Jan 2026 09:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0B913010988
	for <lists+linux-parisc@lfdr.de>; Sun, 18 Jan 2026 08:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BEE26B777;
	Sun, 18 Jan 2026 08:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzQ5aXSe"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B741727A477
	for <linux-parisc@vger.kernel.org>; Sun, 18 Jan 2026 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768724054; cv=none; b=HNDtgdbDLbHBz0h8l0foMN5tDVFjO+FHH1biepkofpzPJZRwN9hhI1386R+HfINm9/IVv9b5YzE10Ffd2yOAmlzUZ3Z8tA5pEvOc+HuhsaFbGUfWpFNnLW2tg4CnWbXTImh0EBNKSPQaD7+jg+BaA8sF5sXLnkeDjbHVeJsr8oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768724054; c=relaxed/simple;
	bh=QgT2evQuj3cvQqRAA1G9AXLS+KHzWpz3urey0I2MaQM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p0qtVGitZ+puAY8BIyD5gM1G95XgiPPKjWbwlQ1xX2l+E/5CvZqGyBFchWalIPbHlLVFqxi4h/9s5liydWjvEfqsHAKhToRj9iAfUZq3YlBW/7E4+XCBLTLfHT23ce4acVY6IvKCoe5finNOFD4ALsLkUAFMdY3IBOWyltAaCno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzQ5aXSe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a2ea96930cso19804865ad.2
        for <linux-parisc@vger.kernel.org>; Sun, 18 Jan 2026 00:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768724052; x=1769328852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X+fhLmMt6EbvGWzllqZJVhmHGvaT37bdUz8irugZaMU=;
        b=YzQ5aXSezflQSS4fyv6YrVmbfYKirEpnZcjFX8vKbHywdSy74iYS6281s9Keui7EAZ
         CQ5KoP6iC97nn7Kv0GsSObUSL2JQywB7nmYE676KDVv4XZKKf3hlx24Q7ny3bd8jpEJl
         gDuJ8d45gtLMWZYw4UJxjV39vcXirmfTu79baWdlAJlll6LfU4Mj9VzAHpfW2p5Bn0mz
         Kw0s7hbWKRT7+vEb79JxIrGc8laHKof/zs22o8Rff0TwpBUlD+Is2rYEPfhRcs+6MwIC
         Yqp50pTXO4z7pH/OINQ0KX7kFvDuxlNiVIV5M8DiZ3pAS6VD591IxrR81OcXia5FHQJW
         x5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768724052; x=1769328852;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+fhLmMt6EbvGWzllqZJVhmHGvaT37bdUz8irugZaMU=;
        b=MaOA+fxfLxZfstZaoieaATGHwgrZ7Ht/EM2/f6N8fLYRNaV6vxdmDc2gX1fdarNybU
         KV+uhi9On1Zg1OlTSwP2EMjq1ACGK0Cp3hvQJ8dFlHONVpb6svh5gajeJ3qVJXL1trbh
         4sftvUfkA5WvRmANhHneAYWfoL75hLOZz8k7a9Pd+rsxjf9SL68b1hgW8sXoe+4rSFLr
         UIoavgvGrcngFDu9u9Jb5EDypF0dZ1Ct5SKuq+hApIuowNyLA2xvRa7yotBpFXSxkCEq
         Q3nGuwdx9+vk3Czu2flZHWD9gMCkZ7BoUDXWiwGIx6/X0bg2HRaes9+NbDtLhH9dHYbQ
         6fPA==
X-Forwarded-Encrypted: i=1; AJvYcCUGF768T/Qa0Zi62QAv5q8JZALkkpcjZE++5au+R0SJZSv9kuURJ/o9cVAYvyfxM3kYbyhrS87M3eGUvxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgxIhF57QF011SmH97YEhwkCGOQFGng894ZrtekFkrZJZ2Va9Y
	P+lbXf9n/j7GYkXoAWrY3ViZY/jn0a1Lqx0GF4m96pRPf+gZXve5sapl
X-Gm-Gg: AY/fxX6+6D3cO+kvBvGZG3j1IqBeuNUAocIts2ncsgtrlzjeCu6kqz6QF7auuJbuzrh
	KNkhlytSMddGOtYqJNaSZ2J+u9uDh58Dce6a4n3s3zMab41ObRzhMQe7v5Ff/1O/RhtY+KZHUfM
	c63g3je4pNNppLT10iCp3nnxgq4j0aZ7jPIwioK1BeJc/ETlAsHNgHDtRitEUpG6/yg4rbueXGr
	+NlDVXMSvRv9QKjUJ3B2TIHEMj9Ped0jNnwmRvWhncVYf/BQSY/N52+4Pw+WM4/xvaHE0kAUrpl
	fE3IFGpp6JpVV9HpL9nhMp1dhUrp/dTTT6AssE7ZnrRnFRTGfc/e0KNCbRcRTNFMfJAI0nOcxnc
	seOzPOrKDcW7Bki69/bnQRu4Yb0MEPfyhFkOYbxpg0F7JSejtos0kz5DPHoVhmopMLwGq/KY+RL
	N0YQsW5i20
X-Received: by 2002:a17:903:40c5:b0:2a7:3dae:de9b with SMTP id d9443c01a7336-2a73daedf5fmr2287485ad.44.1768724051933;
        Sun, 18 Jan 2026 00:14:11 -0800 (PST)
Received: from [192.168.2.226] ([114.92.45.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190abcf0sm63240195ad.12.2026.01.18.00.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 00:14:11 -0800 (PST)
Message-ID: <85a0be43-3598-435d-a50e-9403b7e963f7@gmail.com>
Date: Sun, 18 Jan 2026 16:13:47 +0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pgtable: convert pgtable_t to ptdesc pointer
From: Alex Shi <seakeel@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, alexs@kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-arch@vger.kernel.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-mm@kvack.org>,
 "open list:C-SKY ARCHITECTURE" <linux-csky@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON ARCHITECTURE" <linux-hexagon@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:OPENRISC ARCHITECTURE" <linux-openrisc@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:USER-MODE LINUX (UML)" <linux-um@lists.infradead.org>
References: <20260107064642.15771-1-alexs@kernel.org>
 <aV4h5vQUNXn5cpMY@kernel.org>
 <080e493a-e4f1-4c97-a3e1-f76f126b5213@gmail.com>
 <aV5yIuGi9Ni5YP5E@casper.infradead.org>
 <1d110134-89ab-474b-bca6-cfbfd4b5057f@gmail.com>
Content-Language: en-US
In-Reply-To: <1d110134-89ab-474b-bca6-cfbfd4b5057f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/1/8 10:23, Alex Shi wrote:
> 
> 
> On 2026/1/7 22:48, Matthew Wilcox wrote:
>> On Wed, Jan 07, 2026 at 05:28:36PM +0800, Alex Shi wrote:
>>> Right, I will fix this. and sent the 2nd version.
>> No, the patch is stupid and wrong.  Don't send a v2.  You seem to have a
>> hairtrigger resend, so I'm trying to prevent a v2 being sent instead of
>> sending a patient reply.
> 
> Hi Matthew,
> 
> I hear you—no v2 will be sent.
> but sorry for a bit confusing, what's your expected fix? is the too 
> quick resenting? or the direction to alignment pgtable_t with ptdesc is 
> wrong?

Hi Willy, Do you mind to share the detailed concern for this patch?

Thanks

> 
> If it's the first. the new change for review address Mike's concern.
> diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/ 
> pgalloc.h
> index a17f01235c29..a204c3ac800a 100644
> --- a/arch/arm/include/asm/pgalloc.h
> +++ b/arch/arm/include/asm/pgalloc.h
> @@ -94,13 +94,13 @@ pte_alloc_one_kernel(struct mm_struct *mm)
>   static inline pgtable_t
>   pte_alloc_one(struct mm_struct *mm)
>   {
> -       struct page *pte;
> +       struct ptdesc *pte;
> 
>          pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
>          if (!pte)
>                  return NULL;
> -       if (!PageHighMem(pte))
> -               clean_pte_table(page_address(pte));
> +       if (!PageHighMem(ptdesc_page(pte)))
> +               clean_pte_table(ptdesc_address(pte));
>          return pte;
>   }
> 
> @@ -141,7 +141,7 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, 
> pgtable_t ptep)
>          else
>                  prot = _PAGE_USER_TABLE;
> 
> -       __pmd_populate(pmdp, page_to_phys(ptep), prot);
> +       __pmd_populate(pmdp, page_to_phys(ptdesc_page(ptep)), prot);
>   }
> 
>   #endif /* CONFIG_MMU */


