Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E96445384F
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Nov 2021 18:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237098AbhKPRLv (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 16 Nov 2021 12:11:51 -0500
Received: from mta-mtl-002.bell.net ([209.71.208.12]:26048 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229509AbhKPRLu (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 16 Nov 2021 12:11:50 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C894590BF4C242
X-CM-Envelope: MS4xfGr08vIV+rjTZgLwFlv8SS3ZFgtbC2YdydsznFDoG19ejcxrKo3plXgDpk/7xPVx2l4o4VssUg9u1g024sKkj7xQCpFiOW37+XBWEqHrD4jEmprMPybw
 fUEDnrRYwJ/RIMeuHQEpeRHULkAKqI+pGfbN3F0XarwtbcZH9SKxBAlQDN12y1tfh0Sl87Smd96HkHRiCOpWO2B0nOJIiz0vVusGakuJ5bfOcrr5kqCYaIwD
 rMmwVyM5VbPsl0ChkNWqudMPpjUhsrunAUaBiZLTEbNoiRVSZHSKqIkKCSbqCktBWH5PeOCkgo9cxY4fZyS2UgnPJ4ON41Z6uMQy0NjbT/4=
X-CM-Analysis: v=2.4 cv=ENdlb3VC c=1 sm=1 tr=0 ts=6193e5a2
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=wpW6t_fBocBu9IUvE5UA:9 a=QEXdDO2ut3YA:10
 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C894590BF4C242; Tue, 16 Nov 2021 12:08:50 -0500
Message-ID: <c1ae6549-0c05-3dc2-30bf-20b1526cdbe9@bell.net>
Date:   Tue, 16 Nov 2021 12:08:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 4/4] parisc: Reduce sigreturn trampoline to 3 instructions
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20210908204405.127665-1-deller@gmx.de>
 <20210908204405.127665-4-deller@gmx.de>
 <689b8410-5384-f77d-0724-eddbb4452368@bell.net>
 <b2abc63f-a898-c925-1fc7-af5cf4930f6d@gmx.de>
 <e6f05692-d275-589e-46aa-32e29765f373@bell.net>
In-Reply-To: <e6f05692-d275-589e-46aa-32e29765f373@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-16 10:31 a.m., John David Anglin wrote:
> I don't know what's wrong with it.  I have reverted it for now.
I think problem must be with cache flush range.

Dave

-- 
John David Anglin  dave.anglin@bell.net

