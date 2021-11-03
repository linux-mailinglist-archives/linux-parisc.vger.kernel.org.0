Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2BE444966
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Nov 2021 21:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhKCUPj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 3 Nov 2021 16:15:39 -0400
Received: from mta-mtl-001.bell.net ([209.71.208.11]:49268 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhKCUPj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Nov 2021 16:15:39 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C893820AD94E36
X-CM-Envelope: MS4xfFsXSEVNLYtfdPkqSWc2H88YX2r/S8JFf0YUYK2cXJniS45kPo7Lt6qbfewwNOZuEcKbcQSfmYNNqIOCGX60X1uIKDMwm9H1pUjbeEx/o7ibxfZVinNr
 EpnRFmgLbqLbr/5UApsLZdhZvK3zk80YydLlRagcisYib+Qb5fhl2OX7+oXYN9ChgyWxLhOAx9vjBNRlRHS+PEYSvRs/m8sXBgPY/3T3rApDVoSsBv/F2xIY
 W+sbxdu19bsr/r23KXbGeRuT4FkhDXynSzHPCX6QH7yVV0pgGmVtHICD3IEGhsNrdbAybZc0vurLQfiLD0IkbUqQVsiwBL1dNFa8L3xO6hUxPpca+QMryGrm
 Ciol7G6M
X-CM-Analysis: v=2.4 cv=Z6GPoFdA c=1 sm=1 tr=0 ts=6182ed4b
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=FBHGMhGWAAAA:8 a=-HICB3cYz3EshY4I34QA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C893820AD94E36; Wed, 3 Nov 2021 16:12:59 -0400
Message-ID: <91b3d125-18ae-e10f-3000-1b17a43a156f@bell.net>
Date:   Wed, 3 Nov 2021 16:12:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] parisc: Fix code/instruction patching on PA1.x machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Sven Schnelle <svens@stackframe.org>
References: <YX8HK7ZZZhjRQzcr@ls3530>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <YX8HK7ZZZhjRQzcr@ls3530>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

I think the real problem is that neither flush_kernel_vmap_range() or invalidate_kernel_vmap_range()
flush the icache.  They only operate on the data cache. flush_icache_range will flush both caches.

Dave

On 2021-10-31 5:14 p.m., Helge Deller wrote:
> On PA1.x machines it's not sufficient to just flush the data and
> instruction caches when we have written new instruction codes into the
> parallel mapped memory segment, but we really need to invalidate (purge)
> the cache too. Otherwise the processor will still execute the old
> instructions which are still in the data/instruction cache.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Fixes: 4e87ace902cf ("parisc: add support for patching multiple words")
> Cc: stable@vger.kernel.org # v5.3+
>
> diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
> index 80a0ab372802..8cbb7e1d5a2b 100644
> --- a/arch/parisc/kernel/patch.c
> +++ b/arch/parisc/kernel/patch.c
> @@ -81,7 +81,7 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
>   			 * We're crossing a page boundary, so
>   			 * need to remap
>   			 */
> -			flush_kernel_vmap_range((void *)fixmap,
> +			invalidate_kernel_vmap_range((void *)fixmap,
>   						(p-fixmap) * sizeof(*p));
>   			if (mapped)
>   				patch_unmap(FIX_TEXT_POKE0, &flags);
> @@ -90,9 +90,10 @@ void __kprobes __patch_text_multiple(void *addr, u32 *insn, unsigned int len)
>   		}
>   	}
>
> -	flush_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
> +	invalidate_kernel_vmap_range((void *)fixmap, (p-fixmap) * sizeof(*p));
>   	if (mapped)
>   		patch_unmap(FIX_TEXT_POKE0, &flags);
> +	invalidate_kernel_vmap_range((void *)start, end - start);
>   	flush_icache_range(start, end);
>   }
>


-- 
John David Anglin  dave.anglin@bell.net

