Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3F9484355
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jan 2022 15:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbiADO1U (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jan 2022 09:27:20 -0500
Received: from mta-mtl-003.bell.net ([209.71.208.13]:17988 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229798AbiADO1U (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jan 2022 09:27:20 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61CE3D3B0054755D
X-CM-Envelope: MS4xfH10ts4v57WTUai9OL8oGKhRpae4Gk3VO7RXxbfpR/bDx9KDesy7JLcXY6VIRMDE0mKi6zujd2qPVBs2CdTuscJ2l+hes7gA5s5FwVXe+USioaUN8KQK
 YRfOPyi9R6tivS4sw9DHRuevVeTv/p567OxDUuqPfZD+Za0LgFZm79aQKqBCIkGfMlwmeOiHz4ldwarS5BQP7RBfz4vATanmdrBXC1dyRNRmPamdP/rWvfnt
 kUKOx1P1yPgo4zm+JuI57VX8eyUzTIldhrMHqgIlcxQ=
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61d45944
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=pWLCSyVODd2mhxijOvQA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61CE3D3B0054755D; Tue, 4 Jan 2022 09:27:16 -0500
Message-ID: <6d4e9199-bc76-fe85-37ba-7b436857edc6@bell.net>
Date:   Tue, 4 Jan 2022 09:27:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: show_regs doesn't user KERN_CRIT loglevel when called from
 parisc-terminate1G/show
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>
References: <ead5cd3e-f75a-37a9-9065-e66c50c2b617@bell.net>
In-Reply-To: <ead5cd3e-f75a-37a9-9065-e66c50c2b617@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-01-03 12:09 p.m., John David Anglin wrote:
> I've seen this crash twice recently:
>
> Bad Address (null pointer deref?): Code=6 (Instruction TLB miss fault) at addr 00000000e5361d5f
> Kernel panic - not syncing: Bad Address (null pointer deref?)
>
After more thinking, I think it's likely that the pagefault_disabled counter is getting corrupted.

pagefault_disable/pagefault_enable are not atomic on parisc.  The corruption is probably coming
from the revised LWS code.  At a minimum, we need to move pagefault_disable/pagefault_enable
inside spinlock. It's also not a great idea to panic on user space faults when faulthandler_disabled().

Dave

-- 
John David Anglin  dave.anglin@bell.net

