Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68AB843D2A1
	for <lists+linux-parisc@lfdr.de>; Wed, 27 Oct 2021 22:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235443AbhJ0UQc (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 27 Oct 2021 16:16:32 -0400
Received: from mta-mtl-001.bell.net ([209.71.208.11]:44870 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234969AbhJ0UQc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 27 Oct 2021 16:16:32 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C893820A097F33
X-CM-Envelope: MS4xfCZWxS2HynhnMYFzhdTB6oWfprsYCkD+bpufaAhCx7S83aW64hHpyam8KvcwgSSGTb4qiRpF1RcZInYhpi7gENzZ3W4ohmllSDBUYmV7kdzOjqEeQiB8
 WGPd/Q9V2Mw3/PPdOLJlDfX9zNQr2T6LcW9BJt0Gwphts+nZcX2uU3rZv754bzb5OuN7fJn6kxCRWxQu8YeZPo4Tl05M6Xlh5e/BKRh3qavl/iHqrFfmlMEZ
 vBHtm/3vxycUKsYsHJEVvlIcy7ap+8e71Whduy1mVw8=
X-CM-Analysis: v=2.4 cv=Z6GPoFdA c=1 sm=1 tr=0 ts=6179b30d
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=OLL_FvSJAAAA:8 a=FBHGMhGWAAAA:8 a=eHZ9jtMqRVuMoW2gYDIA:9
 a=QEXdDO2ut3YA:10 a=E4aW7Zid9gMA:10 a=d-Xp-GvoW_QA:10 a=wbbTpC8Z_7cA:10
 a=oIrB72frpwYPwTMnlWqB:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C893820A097F33; Wed, 27 Oct 2021 16:14:05 -0400
Message-ID: <a10ff403-3869-9eb1-8213-b51e6ca8d219@bell.net>
Date:   Wed, 27 Oct 2021 16:14:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: fixmap problem on PA11 hardware
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <3b8410fd-f688-862f-3c3c-7ccf5d523075@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <3b8410fd-f688-862f-3c3c-7ccf5d523075@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-10-27 3:09 p.m., Helge Deller wrote:
> In the archives I found this old thread, which might be related:
> https://www.spinics.net/lists/linux-parisc/msg09391.html
These seems unlikely as both 7100LC and 7300LC are PA-RISC 1.1 processors (1.1c vs. 1.1e).  Big difference
seems to be cache.

Dave

-- 
John David Anglin  dave.anglin@bell.net

