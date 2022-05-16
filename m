Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5085B529567
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 01:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbiEPXlm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 May 2022 19:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240092AbiEPXlb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 May 2022 19:41:31 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-003.bell.net [209.71.212.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3692519024
        for <linux-parisc@vger.kernel.org>; Mon, 16 May 2022 16:41:30 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627B9E56012A0AD9
X-CM-Envelope: MS4xfAN5cALroK3//76TmWB08DFB3Nr5ZfoynU4he40RdRdGBkHyqAacRky4BXqFULdbN2JOln+HlJod+JbH0WlSJ+HiH/2v1+qhK50afk+e7eL739pAiUvm
 tYlR2qFTQ4fqkRbxKwvOAMaovJPMDRjZ8fZlzZJMWI95KK42giL3PE7kMRpiJFTfrPUKEyEg5GfTVk9pljdAAkjMCjvCWQ9uh6Jue71+FR1q0MS93FM60VWU
 6TbqJhyzDN2xeORdOiiVD4FpoPATLpSkimMloOp4Onthe5MAjwh/88YJRXijth5J9Gq7SkJFD9DwXAPI9K/eD/NN5b0iQsYqA+x+Be7JuHyg6nmflUFMDdQf
 NKkx8Eew+sFoVlW31BO7SXebYlJY15qJ3OBo2kZeW42+lEaySmzE3Awl4L04zE7d91duFaDc
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=6282e118
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=xrS5mNnbmIjaS0DKwGwA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627B9E56012A0AD9; Mon, 16 May 2022 19:41:12 -0400
Message-ID: <ed2a853f-4531-ba20-78cf-e7783d02d6f7@bell.net>
Date:   Mon, 16 May 2022 19:41:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Content-Language: en-US
To:     Sam James <sam@gentoo.org>, Helge Deller <deller@gmx.de>
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <5568470.DvuYhMxLoT@daneel.sf-tec.de>
 <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
 <0E5A13A5-8210-4E86-A8D1-4B056062BAF9@gentoo.org>
 <2df8c4f1-f93d-8ef0-3bfd-9249d43953fc@gmx.de>
 <F63F43FC-D3BA-4477-B4F0-B4BCABA61878@gentoo.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <F63F43FC-D3BA-4477-B4F0-B4BCABA61878@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-05-16 6:54 p.m., Sam James wrote:
> I'll be testing it on RP3440 (PA8800) and C8000 (PA8900). If you need it, I can test on C3600 (PA8600) too.
I would test all three.  The latest version affects them all.

Watch for random segmentation faults, malloc corruption, etc.

Thanks,
Dave

-- 
John David Anglin  dave.anglin@bell.net

