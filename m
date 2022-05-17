Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02CA852AC9D
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 22:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347953AbiEQUTQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 16:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347714AbiEQUTP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 16:19:15 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3733651E6E
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 13:19:14 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627CF32E015FED51
X-CM-Envelope: MS4xfDGVi33H681Cx3FdbjQ3/FdJgX0jQVLFEPqwMfpfJQIyqdLZZHLIsiQCukimqOKPJGRLcAeNdWhyMAsZVQcXI9NSpZIi7nKk14K59AWXAcOuIA+8NH0R
 /myJFFEAEqwiomLSy/XKKXMN3TFsqjVgCpo8Di4o+TUK+c+12s604QpmU6khq9dUD0dVC2s/nS6nCaKRv/d5szm0zcFnw5cPmOuNR/8dvD/FzmOCs+j6d63u
 fk8MPtxTPPmoVJxeI+/iwRHJRQaYFRtOKLz9vp1ZFnhySZ+i5xu/ISkRo7C3IizC8ipINaqzNQ4ChngqZ0toWlfJQDauaXnQYDJAcgGBs7OPd1pYG1QBJkUl
 plWkIG/PAMDwkey54WA2uE7kWtPEBA==
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=62840337
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=FBHGMhGWAAAA:8 a=dqR1hUTgLDahriLbHwMA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627CF32E015FED51; Tue, 17 May 2022 16:19:03 -0400
Message-ID: <879391a4-8388-de7b-1f25-a70f0618408d@bell.net>
Date:   Tue, 17 May 2022 16:19:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <aa7e15ff-3e74-1b9d-4d65-235517b26675@bell.net>
 <5ea9b91f-1d64-027a-b00d-53e0ad2302ff@gmx.de>
 <4399477.LvFx2qVVIh@daneel.sf-tec.de>
 <3e255faa-25a7-b886-6956-239bdd88cbdf@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <3e255faa-25a7-b886-6956-239bdd88cbdf@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-05-17 4:00 p.m., Helge Deller wrote:
> On 5/17/22 20:28, Rolf Eike Beer wrote:
>> Am Dienstag, 17. Mai 2022, 20:11:38 CEST schrieb Helge Deller:
>>
>>> I can easily split out the pr_warn("WARNING").
>> Would make sense IMHO.
> I split that patch out now.
> Dave, can you please check if you are ok with it?
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=67c35a3b646cc68598ff0bb28de5f8bd7b2e81b3
> I used the wording from your other mail.
Looks better than what I sent!
>
>>> Moving the get_ptep() back to the original place seems ok, and I'll keep
>>> the strange indenting which checkpatch want.
>> If its back at the original place then there is no need to change as
>> checkpatch will not complain on unmodified lines.
> I meant "back to the place where it was versions before".
> So, it has to move anyway now.
>
>> If it needs to be moved and
>> changed then I would say do it in it's own patch as well.
> I kept it in the way Dave sent it (with the checkpatch fixups I added).
>
> Just pushed a new "for-next" tree at the usual place:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next
Will test.

Dave

-- 
John David Anglin  dave.anglin@bell.net

