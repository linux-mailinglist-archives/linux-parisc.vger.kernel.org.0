Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584F747E8AD
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Dec 2021 21:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350239AbhLWUTl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Dec 2021 15:19:41 -0500
Received: from mta-mtl-001.bell.net ([209.71.208.11]:56230 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240669AbhLWUTh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Dec 2021 15:19:37 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C4B2F400046F42
X-CM-Envelope: MS4xfBROuOZ3XlsqrtUuHwdWyC3GmExmSMlu0qWHjynm1B3we+nDTCklN9BRLDXslB3YUIEGBAvsgrM5wPXfGInQLVL4YlIzBtGYkAEeEsRHdnA9y16H2Fgc
 6l519xoAPkwHVWaEmgV4JKwbT7OrYvYta3pLmtpG0heYpRkTU/e60gYwxvxgC02jH62PwH3PRygZ817junZILVCCUNpEe0lir/k1h8fTv/TUiEIC86CjXbFe
 /M77KGsOWJKtOV+fFb0KqwRtXV8QqnTfcvQR/c6pNFL+R+uWuKpcjIcfCuj0fBD0Z74mE2IlTjUe8c749ifNZ5ga2B8U8scdQBIuuOZofhyyDDEN1kc522U2
 jez3NeCb
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61c4d9d7
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=ucK_BCECNZZ-K_TlwAYA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C4B2F400046F42; Thu, 23 Dec 2021 15:19:35 -0500
Message-ID: <cdbb6cca-29c0-361a-4a86-be8ef6c62f14@bell.net>
Date:   Thu, 23 Dec 2021 15:19:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2] parisc: Rewrite light-weight syscall and futex code
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YcScAR4cPgyI5B6d@mx3210.localdomain> <YcTEOhVnmT8kQRmf@ls3530>
 <888da884-86e0-e6f4-68c3-e3448eb4c9c8@bell.net>
 <6e4b0354-c3d9-ec11-4303-525e04c2d5d8@gmx.de>
 <96a706a5-a2c0-68ae-2541-0ae7287e2aab@bell.net>
In-Reply-To: <96a706a5-a2c0-68ae-2541-0ae7287e2aab@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-23 3:14 p.m., John David Anglin wrote:
> -static inline bool _futex_force_interruptions(unsigned long ua)
> +static inline unsigned long _futex_force_interruptions(unsigned long ua)
>    {
> -    bool result;
> +    register unsigned long error __asm__ ("r8") = 0;
> +    register unsigned long temp;
>
>        __asm__ __volatile__(
> -        "1:\tldw 0(%1), %0\n"
We can avoid two variables if we clear the return value after ldw.
> -        "2:\tstbys,e %%r0, 0(%1)\n"
> -        "\tcomclr,= %%r0, %%r0, %0\n"
> -        "3:\tldi 1, %0\n"

Dave

-- 
John David Anglin  dave.anglin@bell.net

