Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B75DC6A50E3
	for <lists+linux-parisc@lfdr.de>; Tue, 28 Feb 2023 03:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjB1CG2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 Feb 2023 21:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjB1CG1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 Feb 2023 21:06:27 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B07252A5
        for <linux-parisc@vger.kernel.org>; Mon, 27 Feb 2023 18:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1677549944; i=deller@gmx.de;
        bh=/4ZXEp7dGympCBAOQNXZXxBs7Gvx81l72tiSIj4fsvQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=ZZ/EegvFQBB319MYOzRdsjgmUc6XqKbkjGda2QB+ZZlsOyjtE90H5fAU1X77ysWNY
         svcDJ/GCVJ44vOc2E+LYVTMOz0WHfPCb5/4HVzU+T6WgZDbdsnizwmCtPnMce4/J1e
         SlVbYWhgFu4+OXB7Nbe/0wLH4YA+/1LG/RdtdQg/Z6yT/A/MIxtqo+SXcAfAHCbFqC
         WLzqEf54WzLGfZtBzIYwHIsqrcrgTk73TmCoTnxB/tgZxjwyOoNPmOLrGch5kfFnMQ
         +rgqe8iKmIhmLDmbf7/aQaeD76e4pwMba5KV0upuRDYcoJMcNAtgspCwR44rG3qHjs
         ogV7JgoJm5HaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.130.211]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLQxX-1pFR512ppj-00ITm3; Tue, 28
 Feb 2023 03:05:44 +0100
Message-ID: <816e79ad-f149-7158-a375-f1b7f22ae20b@gmx.de>
Date:   Tue, 28 Feb 2023 03:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] parisc: Ensure page-aligned addresses in cache flush and
 copy functions
Content-Language: en-US
To:     Sam James <sam@gentoo.org>
Cc:     linux-parisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Ira Weiny <ira.weiny@intel.com>,
        "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
References: <20230127213941.83967-1-deller@gmx.de>
 <71A3B07F-296F-4017-B2EE-710590637107@gentoo.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <71A3B07F-296F-4017-B2EE-710590637107@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N4bbYr91Q5goU0hvNvjXxZZDMk7ZbR/KY3Fzc/+rls80xyq/Aaq
 hfymmmbQFIpskIE8UTaBOD5oxWLA2qCQUx5nmO056pwZFCmGWA0E7OCi3L9GFNAked68iNS
 31l9RcIi6qYNmS4zhFiKkxe3z4rbiSxOmpMrlGozy1q1PeB5VXqyNpPFcooKrzJ7RrBUOJ4
 B4F3CiUv68Q7azADHdLUA==
UI-OutboundReport: notjunk:1;M01:P0:+lTZ+ax+RhE=;lOEmpt5zcBys730bWA8OrZQ8eHp
 bWVVLjKgx4IyyE5UwlgnNEWYVWDvPRCQVEvWZQf8EpABVGQQPnAlEBo99FQdOPSO2DHU0GnJ9
 S5+ddAFmEF/ALIIEKcV/d5Ibpw6W9LteSrZFoj5sNNCfwtdIIl1YpJNVwsvzonTy9kw6tdsVz
 hBWBJ0gZE9l9f2h/AWNgnm64J0UduG+3CHwMtddf4h6mVZRni2S0xrCcIilOHLDtNEFoD+l0F
 +tYD4+kIM+hyaU8MyIwiPw1uqWIYg6pW+l4W7k9VT42RwOMKm2sEWi/5hUAe3J0LrRqSdyTUP
 qxHQMd1TU3r79rPWDPjq5lEg5B/r3K98N6fy+gHLImJiqRlWSuyMO/21kwsgcATC+w3PknUAN
 bBSzYsV7m3R8+Nw7KlsDCGqy0hcONqtJqnSnx7j5Ei+nSBjnuHQ0TgrQMnDuyxNsGasF6sgc3
 qWoQXdhKOGjnqgeyz5f1sQFPlID5juXr5si1h61ERs5Qf1PPbH3UgFKHGHulezueZhyiIeoiZ
 ejkXZt27OKnYsCWxK6pr1uog4r+XUfLV3jxCfQRqiG1RBualqVD+OcTrLVwtSnqjnC/zzl0mG
 cI5sE31RweGkFvpmdx8GUDTm/ct0xzfSWtwm4DVJ4tiK+guoK9aE9RAp7IWUVSHNWK2vuGAZ7
 JaODTbuaKFlrUIZ1uFhZuc+rbv7vEVhGk8WT7+Lqk75TQ4/C5wjqnu4bYTH3IfynjEYjDVY6I
 dpIezcvDRRykwu3ffPm5xStaQ6MivKEdD7QEZsUXBvZ3kl3OmhRHhqRgV8vKlqQZ765V0U9G+
 SNL82mp5mknuBBFBy4MdhqK1KDbroxy4RrijaoEpp0wQ6KxqtVhm2ThTx42bNSk0ZkYb+nzE0
 qLAoONwSAbcgUd+UoIEO/asYPfzda66348PtXbtY/3FXtI+Nq0iZWxy/fVyOkRn2P03yXjaww
 XUtA6A==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2/28/23 01:20, Sam James wrote:
>
>
>> On 27 Jan 2023, at 21:39, Helge Deller <deller@gmx.de> wrote:
>>
>> Matthew Wilcox noticed, that if ARCH_HAS_FLUSH_ON_KUNMAP is defined
>> (which is the case for PA-RISC), __kunmap_local() calls
>> kunmap_flush_on_unmap(), which may call the parisc flush functions with
>> a non-page-aligned address and thus the page might not be fully flushed=
.
>>
>> To prevent similiar cases, page-align any given address in the
>> following parisc low-level calls:
>> - clear_page_asm(),
>> - copy_page_asm(),
>> - copy_user_page_asm(),
>> - clear_user_page_asm(),
>> - flush_kernel_dcache_page_asm(),
>> - purge_kernel_dcache_page_asm() and
>> - flush_kernel_icache_page()
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: Matthew Wilcox <willy@infradead.org>
>> Cc: Al Viro <viro@zeniv.linux.org.uk>
>> Cc: Ira Weiny <ira.weiny@intel.com>
>> Cc: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>
> Is this patch obsolete as of https://git.kernel.org/pub/scm/linux/kernel=
/git/deller/parisc-linux.git/commit/?h=3Dfor-next&id=3D76008c1008dca3cdd77=
09f4a468b0c3ff9787632
> or still relevant?
>
> Asking because I want to know if I should carry on testing with it or no=
t.

You can drop it. I'm going to drop it from my for-next git tree as well.

Helge
