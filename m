Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C8242A953
	for <lists+linux-parisc@lfdr.de>; Tue, 12 Oct 2021 18:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhJLQZ7 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 12 Oct 2021 12:25:59 -0400
Received: from mta-mtl-003.bell.net ([209.71.208.13]:54890 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229495AbhJLQZ7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Oct 2021 12:25:59 -0400
X-Greylist: delayed 380 seconds by postgrey-1.27 at vger.kernel.org; Tue, 12 Oct 2021 12:25:59 EDT
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C893820868EB13
X-CM-Envelope: MS4xfLEdywh6/TN8I3kmUTOGBP2olz8E/c+ccjzrsGXPSYjGa49uFzalN6lrS0m7Hi6mycoi5f6ICRqDYZ6Jua++Bxw6tGlQ+0XZoX8TBNH7o8dvmK2egCsj
 PQ+quoeX50p4qkcjCfOR4m7UoPK33oR1ihEJBvgapIxsqA8R4ePsD0hwxjvKFOzo+jglnSqPLDYi7teX2Dzm/zchLMj2AGfoyJ34Vext3KwjRAlt5m330cGR
 Xe9TmOFfHz0eHrVNSRguPWhvBdrT4KHXMsC2zZ+GhM+WNPXE+tXay8ZlxeCtqJHd1J2Er3UF2rWzHDvb8G6i9apqQIfPHBuMN3QnCFHif64=
X-CM-Analysis: v=2.4 cv=Z6GPoFdA c=1 sm=1 tr=0 ts=6165b51e
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=_HDKo53N7aDPK3uDIiMA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C893820868EB13; Tue, 12 Oct 2021 12:17:34 -0400
Message-ID: <611ad012-75fa-21a6-1104-acb75107d8e1@bell.net>
Date:   Tue, 12 Oct 2021 12:17:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] parisc: Fix xmpyu usage in 32-bit kernel
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YWSSVwQ9tc9YaC+f@ls3530>
 <d4c868f8-5001-495a-524f-752545146b20@bell.net>
 <2bc6a677-95f1-93c6-6a26-895912a5f7b2@gmx.de>
 <873f8d7c-a284-9565-986a-ac9f387c3b56@bell.net>
In-Reply-To: <873f8d7c-a284-9565-986a-ac9f387c3b56@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-10-12 10:14 a.m., John David Anglin wrote:
> On 2021-10-12 8:43 a.m., Helge Deller wrote:
>> I fully agree with you!
>> The problem is though, that the current kernel is buggy and we
>> need to solve it ASAP.
>> The question is, when a fixed libgcc will become available...?
> I will do an updated patch today and install it after testing.  It will take some time to get
> into Debian, etc.
Bah, -msoft-float and -mdisable-fpregs are broken and libgcc won't build with these options.

Dave

-- 
John David Anglin  dave.anglin@bell.net

