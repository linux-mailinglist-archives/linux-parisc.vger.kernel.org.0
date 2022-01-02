Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90C5482D1B
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jan 2022 00:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiABXOd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jan 2022 18:14:33 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:52722 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229723AbiABXOc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jan 2022 18:14:32 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61CA82990074E240
X-CM-Envelope: MS4xfDDUKJepEiXYTcBJOFq+qJre5uxsgW8QaCkUsFfioTZkxYtPP1/ZmgRhW4rbkERxneBN7dSp0zK4Ot3sZQKG7hoxeF3vyFgsEEpHvHydDznhNIJ3GSWr
 YPTAB+dVwdqWct/0Cm+l2CoU/Sw9bBPgP5KlAKf7Xg8EyiFasUJbk5le3Om1axGvyq8+pQZSH9P3JXZDoyXmosZhaPL/EvGDTVIY2KX948XVXnoF5tpt9cXI
 DXw6QHbBus2EChkVKJDB3APWwKbs4Ow0Gv6ha9X6XhtK+iuCKJkXozZ+1GtVLsJdQcSQYmFjUPG2KJU2DWN7cXx4eupdtGw4pYjJfpbO3DU=
X-CM-Analysis: v=2.4 cv=WtFIjfTv c=1 sm=1 tr=0 ts=61d231ce
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=FBHGMhGWAAAA:8 a=zi0u3tcFbh9A1EMUzc4A:9
 a=QEXdDO2ut3YA:10 a=3Rn8qB5jpWcA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61CA82990074E240; Sun, 2 Jan 2022 18:14:22 -0500
Message-ID: <6e19ace6-c71d-b4b9-d206-80576b34a037@bell.net>
Date:   Sun, 2 Jan 2022 18:14:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: pagefaults and hang with 5.15.11
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
 <3407744.iIbC2pHGDl@daneel.sf-tec.de> <87pmpbds1r.fsf@x1.stackframe.org>
 <2612761.mvXUDI8C0e@daneel.sf-tec.de> <87lezye8pl.fsf@x1.stackframe.org>
 <3a2b8b2b-28b6-00c6-2294-d26c450f5f81@bell.net>
 <4918be47-6938-f3cb-2a21-8b6c1ed789d3@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <4918be47-6938-f3cb-2a21-8b6c1ed789d3@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-01-02 5:53 p.m., Helge Deller wrote:
> On 1/2/22 23:42, John David Anglin wrote:
>> On 2022-01-02 5:24 a.m., Sven Schnelle wrote:
>>> Yes, when it hangs, press ESC followed by '('. This should give you the
>>> BMC prompt:
>>>
>>> CLI>
>>>
>>> Enter TOC s - this will take around 10s, and reboot the box. in the boot
>>> menu, you can than take a look at the TOC data with the mentioned
>>> service command.
>> It might be helpful to have this in wiki if it's not there.
> I partly added it a few hours ago to:
> https://parisc.wiki.kernel.org/index.php/How_to_report_a_parisc-linux_kernel_problem
> -> Hung kernels.
Looks good.

Dave

-- 
John David Anglin  dave.anglin@bell.net

