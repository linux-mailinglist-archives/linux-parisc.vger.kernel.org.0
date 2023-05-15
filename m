Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD9527040FB
	for <lists+linux-parisc@lfdr.de>; Tue, 16 May 2023 00:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243631AbjEOW2V (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 15 May 2023 18:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbjEOW2U (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 May 2023 18:28:20 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4258A5B
        for <linux-parisc@vger.kernel.org>; Mon, 15 May 2023 15:28:19 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.181.186.176]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 645FE0CF0030C386
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehkedguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpefhieegtdduvdevteefvdefvdevtefgtefhieefhfevveevhfegfeefudejueekgfenucfkphepudegvddrudekuddrudekiedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrddukedurddukeeirddujeeipdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprghuthhhpghushgvrhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhgvghokffrpeevtedpoffvtefjohhstheptghmgidqmhhtlhhrghhotddtvd
X-CM-Envelope: MS4xfA49dB+jc5l7WSF5i9dHy9ruzMhoVfAblm5pW5CcQ4FxHkSrsBAxKmEgviK3H8z+H3A0ySuTVLVlKy0MKyZnulenbOjwaU5Yd9qRr+fYhVPIZHg5JQSC
 rymUM6cSRFged7dAMpu6KrYZ8k6T0fXt0paAOPPxDEaZ/KKHMiA0CWnb9RGXUO5WhgvAnOYIu9w+R4tMJw92xpRAVJrVmXVP5/2ao130EqN2+RM6mwP2KuTo
 ykmCUgIDfdCMLDlZQ77DF2tCEpDNnA2fKBxU3HcklxedvVMyiU/60bs5/h2TKvJx
X-RazorGate-Vade-Verdict: clean 0
X-CM-Analysis: v=2.4 cv=Tf71CTch c=1 sm=1 tr=0 ts=6462b200
 a=4B+q39mD0Bm0IdZjDiNhQQ==:117 a=4B+q39mD0Bm0IdZjDiNhQQ==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=G5Gv66TajD-kTQwMLHwA:9 a=QEXdDO2ut3YA:10
 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.181.186.176) by cmx-mtlrgo002.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 645FE0CF0030C386; Mon, 15 May 2023 18:28:16 -0400
Message-ID: <4664024c-1312-64b5-5150-e60bf3fc49bb@bell.net>
Date:   Mon, 15 May 2023 18:28:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] parisc: improve cach flushing in arch_sync_dma_for_cpu()
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <ZGJ8ZcPZbckX7VNB@p100>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <ZGJ8ZcPZbckX7VNB@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-05-15 2:39 p.m., Helge Deller wrote:
> +	case DMA_BIDIRECTIONAL:
> +		flush_kernel_dcache_range(addr, size);
> +		purge_kernel_dcache_range_asm(addr, addr + size);
I don't think flush and purge are both needed.

Dave

-- 
John David Anglin  dave.anglin@bell.net

