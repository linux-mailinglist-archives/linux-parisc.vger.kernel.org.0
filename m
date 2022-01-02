Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E02482D0C
	for <lists+linux-parisc@lfdr.de>; Sun,  2 Jan 2022 23:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiABWm6 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 2 Jan 2022 17:42:58 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:49612 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229446AbiABWm6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 2 Jan 2022 17:42:58 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61CE3D3B0030DC6C
X-CM-Envelope: MS4xfH5qFnA/ADwjtut1Xm/MyiFiGJNWpOHacAFFZBH4CX6bQQmNOxivgtBG1jR2+hyLy+/RO/x8Me/O6CJ8Ii0hENgzTWgCQ/rsZu09Yz+VSzVw4F3xDIyv
 9L1bRYjsBTFS4R/SBioxkMGRVxtqwgXvqgqlisBxycuGJ8FoaEexIAP/wUFJAs7zmpN7v9+6zNHlkH8Whs6Zk0+pz+pM+0ATEJGbmZQd2FXFyXGsjfVh4tn+
 8nBrIqpKsQB8h4oW/FoH7r7FpXJsoSoXiPcZ8RP8FmNGOiu9hqDkHzkUPv275mbPj47Kn0Z0uzOj4J7+wao3+Q==
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61d22a66
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=odHhkk86pgqJvw8v8OcA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61CE3D3B0030DC6C; Sun, 2 Jan 2022 17:42:46 -0500
Message-ID: <3a2b8b2b-28b6-00c6-2294-d26c450f5f81@bell.net>
Date:   Sun, 2 Jan 2022 17:42:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: pagefaults and hang with 5.15.11
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
 <3407744.iIbC2pHGDl@daneel.sf-tec.de> <87pmpbds1r.fsf@x1.stackframe.org>
 <2612761.mvXUDI8C0e@daneel.sf-tec.de> <87lezye8pl.fsf@x1.stackframe.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <87lezye8pl.fsf@x1.stackframe.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-01-02 5:24 a.m., Sven Schnelle wrote:
> Yes, when it hangs, press ESC followed by '('. This should give you the
> BMC prompt:
>
> CLI>
>
> Enter TOC s - this will take around 10s, and reboot the box. in the boot
> menu, you can than take a look at the TOC data with the mentioned
> service command.
It might be helpful to have this in wiki if it's not there.

Dave

-- 
John David Anglin  dave.anglin@bell.net

