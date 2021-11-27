Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598CC4601CC
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 22:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240446AbhK0V5w (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 16:57:52 -0500
Received: from mta-tor-003.bell.net ([209.71.212.30]:39560 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1356322AbhK0Vzw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 16:55:52 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197A9B100B7ADC9
X-CM-Envelope: MS4xfIAnpEEJIF6yJjakEVN0mePFsMW11vJsXgwLFlcKXlQRGgpIasCol1n0ovz1+L4PiuIB7xPHN0w2L2OmLWhzKKGJ5Y5TVVIkzuwhgRA7OahN+o44UQJw
 tFITCjOLPgshFwyvheVRpdslWej7CCsH/t6HaRFJsogvHBUPCcbB6TfE+OYbIFLKiTNyNyg2J2VcEAAfTU4iNc9bPJ++oz6MIKwoVgseICsG+aWhYqWKcXrn
 yK1KtaWMaSnAMSlkmuXgoWiu3jj7SLkHEWlam13+RbB16NDLH2HsUyjaou5xq4p8bsXx59rMROLYf08koM8oDze5M6pZhOWRx1/c3hzLQX5x+zdCPkmbwpQr
 TomWcGVF
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61a2a8a1
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=QubKxf0IzVyWJ_LHXQcA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197A9B100B7ADC9; Sat, 27 Nov 2021 16:52:33 -0500
Message-ID: <a2e9d25d-9a59-1cdf-a0cc-8344625bd2dc@bell.net>
Date:   Sat, 27 Nov 2021 16:52:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] parisc: Do not export __lshrdi3 on 64-bit with gcc >= 11
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Sven Schnelle <svens@stackframe.org>
References: <20211127105818.299902-1-deller@gmx.de>
 <0ed4c18f-79fb-fc95-5baf-ae9a1f99625b@bell.net>
In-Reply-To: <0ed4c18f-79fb-fc95-5baf-ae9a1f99625b@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-27 11:32 a.m., John David Anglin wrote:
> On 2021-11-27 5:58 a.m., Helge Deller wrote:
>> It seems the __lshrdi3 symbol was dropped from libgcc.a from gcc-11 for
>> 64-bit executables.
> This is gcc bug.  There's a typo in libgcc/config/pa/t-dimode:
>
> # Extra DImode libgcc2 functions to build.
> lib2difuncs = _muldi3 _negdi2 _lshrdi _ashldi3 _ashrdi3 _cmpdi2 _ucmpdi2
>
> Will fix.
This is now fixed in upstream gcc source.

Dave

-- 
John David Anglin  dave.anglin@bell.net

