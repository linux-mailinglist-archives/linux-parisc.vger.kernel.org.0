Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9824563C3
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Nov 2021 20:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhKRT6h (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 18 Nov 2021 14:58:37 -0500
Received: from mta-mtl-003.bell.net ([209.71.208.13]:38496 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229576AbhKRT6h (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:58:37 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C894590C262D3C
X-CM-Envelope: MS4xfCK6A5/PR6Ik2kq11ec9GwhWq6yEJFZK3R6057hNPsIvm96p24isHRqd0zHp/KSIarY6YmCvyay/KIctaYpbc+H11PGPusCCi3Yu/s3kDw3ipjN4oy/2
 hCqergdzp5jBOB/alfhiqgRrBjWzxv90Q0oqEg9hAOIIn06+pKJwhIELy8z/scOBFqRQzXkFCpuljxNVEA1xU1zwpPSgsT0YfhyTwKZNgxIqLVsWBgBObOA9
 U1HcCKaspfsH+P9JJ/28Ymcc6IzE0pClB2prrpkKOrNEbtp+cAQpq2/WSpCyznvckZa1CpurgXoMVXF9ogv4r9kzj4fO0oL2eLdczovsOP0=
X-CM-Analysis: v=2.4 cv=ENdlb3VC c=1 sm=1 tr=0 ts=6196afb5
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=UUisJKuhzTG0CerH0RAA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C894590C262D3C; Thu, 18 Nov 2021 14:55:33 -0500
Message-ID: <747b15d8-7908-d93d-8d4a-dc72acff9153@bell.net>
Date:   Thu, 18 Nov 2021 14:55:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] parisc: Fix extraction of hash lock bits in syscall.S
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <df51e873-4576-d4c2-7d86-b607cbb714b4@bell.net>
 <bce8449a-1bdb-ccc5-48cf-09a2a06751aa@gmx.de>
 <ce526095-e6b3-bb1e-aa8e-e97f85e57223@bell.net>
In-Reply-To: <ce526095-e6b3-bb1e-aa8e-e97f85e57223@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-18 2:47 p.m., John David Anglin wrote:
> I just noticed the problem yesterday.  I was looking at the failure of glibc's tst-cleanupx4:
>
> dave@mx3210:~/gnu/glibc/objdir$ env GCONV_PATH=/home/dave/gnu/glibc/objdir/iconvdata LOCPATH=/home/dave/gnu/glibc/objdir/localedata LC_ALL=C 
> /home/dave/gnu/glibc/objdir/elf/ld.so.1 --library-path 
> /home/dave/gnu/glibc/objdir:/home/dave/gnu/glibc/objdir/math:/home/dave/gnu/glibc/objdir/elf:/home/dave/gnu/glibc/objdir/dlfcn:/home/dave/gnu/glibc/objdir/nss:/home/dave/gnu/glibc/objdir/nis:/home/dave/gnu/glibc/objdir/rt:/home/dave/gnu/glibc/objdir/resolv:/home/dave/gnu/glibc/objdir/mathvec:/home/dave/gnu/glibc/objdir/support:/home/dave/gnu/glibc/objdir/crypt:/home/dave/gnu/glibc/objdir/nptl 
> /home/dave/gnu/glibc/objdir/nptl/tst-cleanupx4
> test 0
> clh (2)
> clh (1)
> clh (3)
> global = 12, expected 15
> [...]
>
> As far as I can tell, clh() is called in the wrong order - should be 1, 2, 3.  This gives the expected value of 15.  2, 1, 3 yields 12.
I see same order on c3750 with one cpu.

Dave

-- 
John David Anglin  dave.anglin@bell.net

