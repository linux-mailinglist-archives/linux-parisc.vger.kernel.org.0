Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D69F650469
	for <lists+linux-parisc@lfdr.de>; Sun, 18 Dec 2022 19:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbiLRSs1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 18 Dec 2022 13:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiLRSs0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 18 Dec 2022 13:48:26 -0500
Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A7C2DE5
        for <linux-parisc@vger.kernel.org>; Sun, 18 Dec 2022 10:48:25 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [174.95.50.166]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 637E1DE8042E70DC
X-CM-Envelope: MS4xfGwI7BppMq60m8nv9AQb/+9Ekj67gDsNkEkeKXo3DyJvGvPscdplLd25WJFg6ctIWcdsdMU1yHIDnUvpZvsFyO77g5jG7AmrDUU2nVLHkRWEJbTMZ6KP
 s/GCrQfjypF/dTSb2lfLQ8lJaLYrtIVd1O03O9V74kTIObdwXxEMH98FjyN4LtPOqeBUs0kZnQPI5TmKcWpsEam30kvAVO9R06XaQJ9x1U2MgUXk2ji+2tb8
 oYfFvOESI3pRs38pk1L2cNcVkGLyX4mqkinu6WpuNpa0rt1KfZwPripxMW8SQ4mw
X-CM-Analysis: v=2.4 cv=drYdSXs4 c=1 sm=1 tr=0 ts=639f606d
 a=DujhYzqEYufUJi90e8Godg==:117 a=DujhYzqEYufUJi90e8Godg==:17
 a=IkcTkHD0fZMA:10 a=mDV3o1hIAAAA:8 a=FBHGMhGWAAAA:8 a=KKAkSRfTAAAA:8
 a=lVMTrcmURubp9GDC-YUA:9 a=QEXdDO2ut3YA:10 a=_FVE-zBwftR9WsbkzFJk:22
 a=9gvnlMMaQFpL9xblJ6ne:22 a=cvBusfyB2V15izCimMoJ:22
Received: from [192.168.2.49] (174.95.50.166) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 637E1DE8042E70DC; Sun, 18 Dec 2022 13:48:13 -0500
Message-ID: <564a88f9-afcf-b40c-5adf-833d9fc20806@bell.net>
Date:   Sun, 18 Dec 2022 13:48:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Way to kill processes with unaligned access?
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, Sam James <sam@gentoo.org>
Cc:     linux-parisc@vger.kernel.org
References: <1Mf07E-1oQMEy3JxS-00gYTD@mail.gmx.net>
 <2407F312-9FFD-4872-B172-405787E99C1E@gentoo.org>
 <f1e1830e-8cd6-65bb-9a27-44b14125234f@bell.net>
 <dddbf2bb-bbdc-2029-95a3-3d6ab7e582fb@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <dddbf2bb-bbdc-2029-95a3-3d6ab7e582fb@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-12-18 12:32 p.m., Helge Deller wrote:
>> Sadly, glibc (I believe) still generates some:
>> dupload(8822): unaligned access to 0xf8b3630d at ip 0xf720c88b (iir 0xee8104d)
>> http(6292): unaligned access to 0xfab011cd at ip 0xf720c9c3 (iir 0xd481043)
>
> why do you think it's from glibc?
> couldn't it be from the program itself?
I haven't actually debugged these but previously the warnings from http came from a
misaligned header in the glibc resolver.

commit 05dec22d7be722987ff07aebf9690f6078b3c4e9
Author: John David Anglin <danglin@gcc.gnu.org>
Date:   Tue Mar 22 17:35:54 2022 +0000

     resolv: Fix unaligned accesses to fields in HEADER struct

     The structure HEADER is normally aligned to a word boundary but
     sometimes it needs to be accessed when aligned on a byte boundary.
     This change defines a new typedef, UHEADER, with alignment 1.
     It is used to ensure the fields are accessed with byte loads and
     stores when necessary.

     V4: Change to res_mkquery.c deleted.  Small whitespace fix.

     V5: Move UHEADER typedef to resolv/resolv-internal.h.  Replace all
     HEADER usage with UHEADER in resolv/res_send.c.

     Signed-off-by: John David Anglin <dave.anglin@bell.net>
     Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

Dave

-- 
John David Anglin  dave.anglin@bell.net

