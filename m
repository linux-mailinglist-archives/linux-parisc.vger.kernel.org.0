Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D023F4539E1
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Nov 2021 20:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239075AbhKPTPW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Nov 2021 14:15:22 -0500
Received: from mta-tor-002.bell.net ([209.71.212.29]:30380 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232659AbhKPTPW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Nov 2021 14:15:22 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C886880B55CBE1
X-CM-Envelope: MS4xfJzMOKoD51TwrmD+ZCwt8SAuwwemeQ32FR/+p8p/0/cM4iNrvWLQ/bd5fWCCwbL0SyxEwZbY6n1Lxng/ikGKchJgLkUJsQW4Z2uuSHiF79CEj1l7E+4/
 zzbXTFCV4f6FszG30E58V77V0qknofiwojdqHS1spMQAibpjktbl+GI3xU+Ypp9pvMj3UoqzNWwTAQGn7vUe4GgPFkcs8Ky/83AmXZXvKR01/+XUo0kE+4I2
 Krt5KRUQwBNXIEMek/oVzjh/lsIBg3j/zNFPFAA3eq94dUocXgQqJt7COjTFuodqwzUO0WKt+p13Q7MpP3So2Q/veH0PWE8z/Dh5hRnPk4c=
X-CM-Analysis: v=2.4 cv=Udwy9IeN c=1 sm=1 tr=0 ts=61940295
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=IQ9GdI75bBWvXO-FUPUA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C886880B55CBE1; Tue, 16 Nov 2021 14:12:21 -0500
Message-ID: <168f9f6e-4840-2037-e925-6a82b02614cd@bell.net>
Date:   Tue, 16 Nov 2021 14:12:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 4/4] parisc: Reduce sigreturn trampoline to 3 instructions
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20210908204405.127665-1-deller@gmx.de>
 <20210908204405.127665-4-deller@gmx.de>
 <689b8410-5384-f77d-0724-eddbb4452368@bell.net>
 <b2abc63f-a898-c925-1fc7-af5cf4930f6d@gmx.de>
 <e6f05692-d275-589e-46aa-32e29765f373@bell.net>
 <c1ae6549-0c05-3dc2-30bf-20b1526cdbe9@bell.net>
 <0252eb72-2591-c117-6cc1-71b0bffc983b@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <0252eb72-2591-c117-6cc1-71b0bffc983b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-16 2:02 p.m., Helge Deller wrote:
> On 11/16/21 18:08, John David Anglin wrote:
>> On 2021-11-16 10:31 a.m., John David Anglin wrote:
>>> I don't know what's wrong with it.  I have reverted it for now.
>> I think problem must be with cache flush range.
Didn't work 🙁
> Not sure. Seems like reverting SIGRETURN_TRAMP back to 4 fixes it.
>
> Anyway, I'll revert the whole patch for now.
Reverting whole patch fixed issue with 5.15.2 and 5.16.0-rc1.
> Maybe we can fix it in v5.17.
Dave

-- 
John David Anglin  dave.anglin@bell.net

