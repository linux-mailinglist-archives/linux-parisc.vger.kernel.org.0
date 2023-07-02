Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA92C744E41
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jul 2023 17:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjGBPIN (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jul 2023 11:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGBPIM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jul 2023 11:08:12 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F144E67
        for <linux-parisc@vger.kernel.org>; Sun,  2 Jul 2023 08:08:10 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.181.186.176]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64A12DE6000A9025
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedviedruddtgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceugffnnfdpqfgfvfenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfvhffutgfgsehtkeertddtfeejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpeeitdduhfevleehjeduteehfeehkeeggfffueelveegffelffehgfegveehtdfhfeenucfkphepudegvddrudekuddrudekiedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrddukedurddukeeirddujeeipdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdgruhhthhgpuhhsvghrpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpghgvohfkrfepveetpdfovfetjfhoshhtpegtmhigqdhmthhlrhhgohdttddv
X-CM-Envelope: MS4xfOfAgZBlEdqNJolA4UffmpzH3hYDO1rDqEfOaXHFEN2O1c37JqVv/BXktVWeIYyG5xKXfoaev7BNyrVMvltX0x4xbimLc5jgTv8Fo/6dZPLfrJkGEEHh
 nJ/QJL+hFUdBNfM4UGpbH3xHyZAv2e5k0Th+Hs/ftHuqByan6Cf8I7qaigN5YmD+RiUF4BzcafZxb50wVvQATYVu7wcZAJG+2hvet7PQtqxMUxQmr3hv4Gp4
 gg0nM7+aKPCidqAfDLd15ZYTjqcb8Scrbr5ERLt3ai4=
X-RazorGate-Vade-Verdict: clean 0
X-CM-Analysis: v=2.4 cv=QbcFAuXv c=1 sm=1 tr=0 ts=64a192d7
 a=4B+q39mD0Bm0IdZjDiNhQQ==:117 a=4B+q39mD0Bm0IdZjDiNhQQ==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=t28vcC8J_x0fSPyDT2sA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.181.186.176) by cmx-mtlrgo002.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64A12DE6000A9025; Sun, 2 Jul 2023 11:08:07 -0400
Message-ID: <612eaa53-6904-6e16-67fc-394f4faa0e16@bell.net>
Date:   Sun, 2 Jul 2023 11:08:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
From:   John David Anglin <dave.anglin@bell.net>
Subject: execv: Argument list too long
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

With Linux  6.1.37+, there is a problem with argument lists:

| gcc -E -undef     -I../include -I/home/dave/gnu/glibc/objdir/csu -I/home/dave/gnu/glibc/objdir  -I../sysdeps/unix/sysv/linux/hppa 
-I../sysdeps/hppa/nptl  -I../sysdeps/unix/sysv/linux/include -I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl -I../sysdeps/pthread  
-I../sysdeps/gnu  -I../sysdeps/unix/inet -I../sysdeps/unix/sysv  -I../sysdeps/unix  -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1  
-I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32  -I../sysdeps/ieee754/dbl-64 -I../sysdeps/hppa/fpu  -I../sysdeps/hppa  -I../sysdeps/ieee754 
-I../sysdeps/generic  -I.. -I../libio -I. -nostdinc -isystem /usr/lib/gcc/hppa-linux-gnu/12/include -isystem /usr/include -D_LIBC_REENTRANT  
-include ../include/libc-symbols.h -DTOP_NAMESPACE=glibc -x assembler-with-cpp - \
            > /home/dave/gnu/glibc/objdir/Versions.v.iT
make[2]: /bin/sh: Argument list too long
gcc: fatal error: cannot execute '/usr/lib/gcc/hppa-linux-gnu/12/cc1': execv: Argument list too long
compilation terminated.

Linux 6.1.36+ is okay.

It doesn't help to increase stack limit.

Dave

-- 
John David Anglin  dave.anglin@bell.net

