Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1688247C770
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Dec 2021 20:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbhLUT1Z (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Dec 2021 14:27:25 -0500
Received: from mta-tor-003.bell.net ([209.71.212.30]:14340 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S233354AbhLUT1Y (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Dec 2021 14:27:24 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61C1CFE1000F076A
X-CM-Envelope: MS4xfOzKiVAUpjDXSWbFs29scuN+WUD4sKl2waBqYO52IQX7Dkb1dC5aGkT+hWd4KrvRIBRiPqiocY642JueVH0/+JhpxXfEustuNiAsZtFXZsa/bhBuwoPf
 nH6s4ovNpIkMgKpojuTNFJ058mqLGbmuqxi1tfY8XNYe043qIPavRVSj0r8BVPu3iS93NM++aV3FLVsk1q0qxlVWFhehigslhgF025DwLOUCx5sT+TkPFqXG
 pbJ8EP4lZgyy37qM1fWTIv4G7haw4+6+cciM1t/JYBP61eWlq/MdAtN4SLpICoKm5yHH+cKW8wSDlgdN5AFxX4RRUrHltk7HXl1Xaxeki5aeKOxPv6RyUB4K
 hsiHPUKfN/c8E8bdp7yrp2QHo5nu73V8gJuD4+N9Ra/0Ia255ws=
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61c22a97
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=wshC1Du8o6n3vCRq3T4A:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61C1CFE1000F076A; Tue, 21 Dec 2021 14:27:19 -0500
Message-ID: <7ec01f4d-e0e4-b01f-246a-0185fe2d8111@bell.net>
Date:   Tue, 21 Dec 2021 14:27:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] parisc: Fix mask used to select futex spinlock
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <8186e8fe-1c64-c9fd-ca3c-f7514fb40428@bell.net>
 <5778770.lOV4Wx5bFT@daneel.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <5778770.lOV4Wx5bFT@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-21 1:45 p.m., Rolf Eike Beer wrote:
> Am Dienstag, 21. Dezember 2021, 19:33:16 CET schrieb John David Anglin:
>> Fix mask used to select futex spinlock.
>>
>> The address bits used to select the futex spinlock need to match those used
>> in the LWS code in syscall.S. The mask 0x3f8 only selects 7 bits.  It
>> should select 8 bits.
> This change looks like this should become a helper macro or something like
> that so the code will stay in sync. Can the mask be shared with the LWS code
> with a constant while at it so it will also include that?
I understand the point but it's rather convoluted.  We would need a macro for the assembly
code.  Then the macro would need to be embedded in an asm for C. Then, there's the shift
for the int* type in the C code.

I am proposing to rewrite this code so the spinlock pointer is only computed once, but Helge
wanted a change that could be easily back ported.

Dave

-- 
John David Anglin  dave.anglin@bell.net

