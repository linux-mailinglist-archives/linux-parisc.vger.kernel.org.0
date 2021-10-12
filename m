Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1783442A6F2
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Oct 2021 16:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236695AbhJLOQt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Oct 2021 10:16:49 -0400
Received: from mta-tor-003.bell.net ([209.71.212.30]:14568 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S236943AbhJLOQt (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Oct 2021 10:16:49 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C8802C07D6229F
X-CM-Envelope: MS4xfIZ5Ou8y8Eer1bLLkaB8+eMA5NGyUBypLax6UJuw7lfOkxH0hZOnSZicrRBitd5IFYoUXZ5IQwnNvtkfFIW8y0pAFphhkllq5VrBdZ91mdtjtm1Qf8/9
 qq+vBPr308qFICjfFrvalz5OIoBSe9ARRkIH8eO4rHdHIp6K+mglZ91oYKCCEYD50oAkhd7m16wdiR4m5+n+aE8go9NlDr91mghoJ3p1Kmoo6+v0QlxaPu78
 Qecr5l4UMnxx2OsLwWXBT/iOBkPGISEyLlENOkBoP3xHossu6AIXgXbYUjz10HjD2kJDvNwncW/5v+gof6IxMb/Edsy5PdcEFbCYDMy7TEM=
X-CM-Analysis: v=2.4 cv=Zd5+iuZA c=1 sm=1 tr=0 ts=61659855
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=cYsh0HDiZHoAB1nxHlQA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C8802C07D6229F; Tue, 12 Oct 2021 10:14:45 -0400
Message-ID: <873f8d7c-a284-9565-986a-ac9f387c3b56@bell.net>
Date:   Tue, 12 Oct 2021 10:14:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: Fix xmpyu usage in 32-bit kernel
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YWSSVwQ9tc9YaC+f@ls3530>
 <d4c868f8-5001-495a-524f-752545146b20@bell.net>
 <2bc6a677-95f1-93c6-6a26-895912a5f7b2@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <2bc6a677-95f1-93c6-6a26-895912a5f7b2@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-10-12 8:43 a.m., Helge Deller wrote:
> I fully agree with you!
> The problem is though, that the current kernel is buggy and we
> need to solve it ASAP.
> The question is, when a fixed libgcc will become available...?
I will do an updated patch today and install it after testing.  It will take some time to get
into Debian, etc.

Once that is done, we could generate assembly code for __muldi3, __divdi3, etc.  That would
remove the kernel dependence.  But I think it would still be better to use the libgcc implementations.
The compiler might get better, etc.

Dave

-- 
John David Anglin  dave.anglin@bell.net

