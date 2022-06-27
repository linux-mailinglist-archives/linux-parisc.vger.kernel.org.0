Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F50E55C3F0
	for <lists+linux-parisc@lfdr.de>; Tue, 28 Jun 2022 14:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbiF0Rlt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 Jun 2022 13:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbiF0Rlt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 Jun 2022 13:41:49 -0400
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AF411828
        for <linux-parisc@vger.kernel.org>; Mon, 27 Jun 2022 10:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1656351708; x=1687887708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QYyzvaW7+2ioQ+f12GBUt6U7XC7m2vbg7KANxkeEig4=;
  b=rSKhevO8Ht6OHKmHFs0gldhQQEU/iSSlT//X/oOkNemGHWFQTu6/y/++
   kEOFntKRmLR3Jj0F0Uo4XXFJdHCUR+4aLDyBPHszZaAQoGJd4GdPCkEc1
   SylnzO7QIYGexHgneiZ0vU+VBXkjSqXJTsPpz1BQQ8uww64UEZpEYUmQr
   E=;
X-IronPort-AV: E=Sophos;i="5.92,226,1650931200"; 
   d="scan'208";a="102313699"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2b-6e5a0cd6.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP; 27 Jun 2022 17:24:38 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-pdx-2b-6e5a0cd6.us-west-2.amazon.com (Postfix) with ESMTPS id 6FCD4A2AFE;
        Mon, 27 Jun 2022 17:24:38 +0000 (UTC)
Received: from EX13D04ANC001.ant.amazon.com (10.43.157.89) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Mon, 27 Jun 2022 17:24:37 +0000
Received: from 88665a182662.ant.amazon.com (10.43.161.183) by
 EX13D04ANC001.ant.amazon.com (10.43.157.89) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Mon, 27 Jun 2022 17:24:36 +0000
From:   Kuniyuki Iwashima <kuniyu@amazon.com>
To:     <deller@gmx.de>
CC:     <dave.anglin@bell.net>, <kuniyu@amazon.co.jp>, <kuniyu@amazon.com>,
        <linux-parisc@vger.kernel.org>
Subject: Re: linux v5.18.3 fails to boot
Date:   Mon, 27 Jun 2022 10:24:28 -0700
Message-ID: <20220627172428.83872-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <faea80e5-de8f-f1ca-1412-43f513b3b45c@gmx.de>
References: <faea80e5-de8f-f1ca-1412-43f513b3b45c@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.161.183]
X-ClientProxiedBy: EX13D04UWA001.ant.amazon.com (10.43.160.47) To
 EX13D04ANC001.ant.amazon.com (10.43.157.89)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From:   Helge Deller <deller@gmx.de>
Date:   Mon, 27 Jun 2022 02:08:29 +0200
> On 6/10/22 20:18, John David Anglin wrote:
>> On 2022-06-10 12:49 p.m., John David Anglin wrote:
>>>> The commit was added to prevent compiler optimisation from splitting
>>>> read/write operations.  I think it can lead in a change in opcodes but
>>>> must be safe.  So I'm not sure why the commit causes boot failure for now.
>>> Neither am I.
>>>>
>>>> I'm not familiar with PARISC and this may be a stupid question though,
>>>> what does `ldd` exactly do? and which line is it executed in the func/file?
>>> ldd performs a 64-bit load to register rp (r2).  It is part of mpt_reply's epilogue.
>>> The prior "sync" instruction corresponds to the "mb()" at the end of mpt_reply.
>>>
>>
>> Possibly, this might affect Fusion MPT base driver but no patches are applied:
>>
>> [   29.971295] mptbase alternatives: applied 0 out of 3 patches
>> [   29.971295] Fusion MPT base driver 3.04.20
>> [   29.971295] Copyright (c) 1999-2008 LSI Corporation
>> [   29.971295] Fusion MPT SPI Host driver 3.04.20
> 
> To sum it up - this issue war triggered by a few special situations:
> 
> The kernel patching code uses the altinstructions table from kernel modules to patch
> in alternative assembly instructions.
> To read the entries it uses a 32-bit ldw() instruction since the table holds 32-bit values.
> Because of another issue this table was located at unaligned memory addresses.
> That's why then the kernel ldw() emulation jumped in and read the content.
> Commit e8aa7b17fe41 ("parisc/unaligned: Rewrite inline assembly of emulate_ldw()")
> broke the ldw() emulation and as such invalid 32-bit values were read back.
> This then triggered random memory corruption, because the kernel then patched addresses which it shouldn't.
> 
> I just sent a patch to the parisc mailing list to fix up the ldw() handler, which
> finally fixed this issue here too.

Interesting!
I was wondering enabling CONFIG_STRICT_MODULE_RWX, which was originally off,
could have another impact.
I appreciate your summary and fix!

Best regards,
Kuniyuki


> 
> Everyone who runs kernel v5.18+ on parisc should better apply the patch I sent:
> https://patchwork.kernel.org/project/linux-parisc/patch/20220626233911.1023515-1-deller@gmx.de/
> 
> Helge

