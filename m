Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3CB1791C3C
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Sep 2023 19:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbjIDR5T (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 4 Sep 2023 13:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbjIDR5S (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 4 Sep 2023 13:57:18 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-001.bell.net [209.71.208.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010C6DD
        for <linux-parisc@vger.kernel.org>; Mon,  4 Sep 2023 10:57:11 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.198.135.111]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64C35282035A5989
X-CM-Envelope: MS4xfAPjfPu05dcH8uv2sS8SHRlcsSy4KQiSse029DYT5h2OuERTfrZcaOiWK7LJqB26eRFI5i25L0YaiUGp7bkcy0opiEsUIl917F/kuuDhmui+kINU3291
 dqJ+Tc0M5IA3cxgULYbclce1ydoPlV1P8FRBpyGSejl7nusjp+KjHoP4AO9kBwPtTDAi4j6+AsLFDtLC7z5+ye0nbk0xijAMSnaFbYDqfN4u2NVE96YYBSsi
 Qrhuu8NkThyYwKXoXEvDe7SCgEi3r9o0bhB2wDNaYtEiLV7bMIKKwYLudSCIune+BmRPgaVAsKR4gVGwbeF49Q==
X-CM-Analysis: v=2.4 cv=W7Nb6Tak c=1 sm=1 tr=0 ts=64f61a6c
 a=m0hBPjpnfWKpZW+YOe+Hqw==:117 a=m0hBPjpnfWKpZW+YOe+Hqw==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=xNf9USuDAAAA:8 a=FBHGMhGWAAAA:8
 a=dEZuh6yRk1065rfvW3AA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=SEwjQc04WA-l_NiBhQ7s:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (142.198.135.111) by cmx-mtlrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64C35282035A5989; Mon, 4 Sep 2023 13:57:00 -0400
Message-ID: <d9caffa3-7995-e2a9-325d-f92b05504f9d@bell.net>
Date:   Mon, 4 Sep 2023 13:57:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] parisc: shmparam.h: Document aliasing requirements of
 PA-RISC
Content-Language: en-US
To:     deller@kernel.org, linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
References: <20230901060431.6170-1-deller@kernel.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <20230901060431.6170-1-deller@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-09-01 2:04 a.m., deller@kernel.org wrote:
> From: Helge Deller <deller@gmx.de>
>
> Add some documentation why PA-RISC uses SHMLBA and SHM_COLOUR.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   arch/parisc/include/asm/shmparam.h | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/arch/parisc/include/asm/shmparam.h b/arch/parisc/include/asm/shmparam.h
> index 74f74e4d35b7..5a95b0f62b87 100644
> --- a/arch/parisc/include/asm/shmparam.h
> +++ b/arch/parisc/include/asm/shmparam.h
> @@ -2,6 +2,21 @@
>   #ifndef _ASMPARISC_SHMPARAM_H
>   #define _ASMPARISC_SHMPARAM_H
>   
> +/*
> + * PA-RISC uses virtually indexed & physically tagged (VIPT) caches
> + * which has strict requirements when two pages to the same physical
> + * address are accessed through different mappings. Read the section
> + * "Address Aliasing" in the arch docs for more detail:
> + * PA-RISC 1.1 (page 3-6):
> + * https://parisc.wiki.kernel.org/images-parisc/6/68/Pa11_acd.pdf
> + * PA-RISC 2.0 (page F-5):
> + * https://parisc.wiki.kernel.org/images-parisc/7/73/Parisc2.0.pdf
> + *
> + * For Linux we allow kernel and userspace to map pages on page size
> + * granularity (SHMLBA) but have to ensure that, if two pages are
> + * mapped to the same physical address, the virtual and physical
> + * addresses modulo SHM_COLOUR are identical.
> + */
>   #define SHMLBA	   PAGE_SIZE	/* attach addr a multiple of this */
>   #define SHM_COLOUR 0x00400000	/* shared mappings colouring */
Does SHM_COLOUR need to be exposed to user space?  See the following issue with sysprof:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1021853

Dave

-- 
John David Anglin  dave.anglin@bell.net

