Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBFBB445B97
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 22:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbhKDVWm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 17:22:42 -0400
Received: from mta-tor-003.bell.net ([209.71.212.30]:59760 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230162AbhKDVWl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 17:22:41 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C8802C0A6A3F62
X-CM-Envelope: MS4xfCBLYJaBDv0p5e9ZlcywOKwgwpdOJ61Tjs2XuP7NFt/tibBaQ5q+n+e+ac5a8oYDi9zXPZnAUh1ryJZkLWDVTH2PJce+AtY6AG6YcVh4AX0n8ZbBMVps
 rO3zinam9X1EScF2lfcl4EQt2IxFEG5zeDuoOqfAH9hn0C9Mlz5LD7SXjHatmKWIiaTQT1WUs1tgWXiawnZ7P+SLRbSK1j0fUVYOD3a1vo3riI2eUlDR8obG
 5QWVxpx5+8kJ8VCF5B/eNcJTpVOGLcOxBmKxvcUI95cJ1dLhSByiOVZuRvrjVc8gyjEJPNc2I3hG0JPlmHsSAmDUy9O+KVeOyFSHUwwHlZtQ8dFEf1RXoLFm
 XnTFrurT
X-CM-Analysis: v=2.4 cv=Zd5+iuZA c=1 sm=1 tr=0 ts=61844e7f
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=80mMMp9jjUlJ2tsuGHUA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C8802C0A6A3F62; Thu, 4 Nov 2021 17:19:59 -0400
Message-ID: <75eb414e-0db9-4d6f-4db2-b13120d13192@bell.net>
Date:   Thu, 4 Nov 2021 17:19:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] parisc: Fix code/instruction patching on PA1.x machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Sven Schnelle <svens@stackframe.org>
References: <YX8HK7ZZZhjRQzcr@ls3530>
 <91b3d125-18ae-e10f-3000-1b17a43a156f@bell.net>
 <cf2c5fa8-5b98-50b7-00ef-0e86df918e8e@gmx.de>
 <a3568fd4-79be-798e-3078-60b187ddaea7@bell.net>
 <f8a7f1fa-dc97-224b-8726-25bb66653aa3@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <f8a7f1fa-dc97-224b-8726-25bb66653aa3@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-04 4:48 p.m., Helge Deller wrote:
> I believe the alternative code patching isn't critical.
> It just patches in NOPs, so even if the newly patched NOPs aren't visible yet (when the TLB handler is
> executed), it uses the old instructions which shouldn't harm anything. They were executed before the
> whole time.
But we flush the data cache when we hit a page boundary.  This makes these NOPs visible.

Maybe we should do both flushes after all words have been written.

Dave

-- 
John David Anglin  dave.anglin@bell.net

