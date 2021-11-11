Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C57F44DE95
	for <lists+linux-parisc@lfdr.de>; Fri, 12 Nov 2021 00:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbhKKXmj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 11 Nov 2021 18:42:39 -0500
Received: from mta-mtl-001.bell.net ([209.71.208.11]:62646 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbhKKXmh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Nov 2021 18:42:37 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C893820B9E40A1
X-CM-Envelope: MS4xfHbf9xiMKmHK3kqlj5CIQ7USxlTB8aeZtRX9kopUIIpYkjuVRgkmE8c0LWDV+XhXui5sMgE8o1VROrO0YMeTUlPhD7k8tyKLWUwPodtOSC8c5BoGAZxK
 YKTgU2lDaKGGJxa4KBowqpagtp3RBOTOnCl8YT6WaH6yEN5580zX0eAFKRaHPaA73oZt8hjIcLlYzubIH0Mwq4cBgNIE7l6E0xW1d7fqOUUQ4LDnQjnPpRdL
 pkK13R/Gy/UOc45SoVvCOvVan3WR/DLeXuuYzmWjtQ7k8tEstf0lOtdAqS2N0qFU9CTNKSsH0nr2qoGweOkJEQ==
X-CM-Analysis: v=2.4 cv=Z6GPoFdA c=1 sm=1 tr=0 ts=618da9be
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=5N-a68n6PQ5rIc9CELgA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C893820B9E40A1; Thu, 11 Nov 2021 18:39:42 -0500
Message-ID: <0ffcf87d-1ca0-fa4d-46dc-1f5e3d727821@bell.net>
Date:   Thu, 11 Nov 2021 18:39:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] parisc/entry: fix trace test in syscall exit path
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
References: <20211111220429.797-1-svens@stackframe.org>
 <c2377426-5d45-91dd-46f2-74ead855a07d@bell.net>
In-Reply-To: <c2377426-5d45-91dd-46f2-74ead855a07d@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-11 6:24 p.m., John David Anglin wrote:
>>       /* Are we being ptraced? */
>>       LDREG    TASK_TI_FLAGS(%r1),%r19
>> -    ldi    _TIF_SYSCALL_TRACE_MASK,%r2
>> +    ldi    _TIF_SINGLESTEP|_TIF_BLOCKSTEP,%r2
> This change seems applied to the old code and not 8779e05ba8aa. 
Forget this.  TASK_TI_FLAGS was introduced in "parisc: Move thread_info into task struct".

Dave

-- 
John David Anglin  dave.anglin@bell.net

