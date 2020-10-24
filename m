Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C51F297CBE
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Oct 2020 16:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1760038AbgJXOLd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 24 Oct 2020 10:11:33 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:58048 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1759926AbgJXOLd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 24 Oct 2020 10:11:33 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20201024141132.ZSUS52743.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 24 Oct 2020 10:11:32 -0400
Received: from [192.168.2.49] (really [76.66.134.232]) by mtlspm02.bell.net
          with ESMTP
          id <20201024141132.TKGZ3672.mtlspm02.bell.net@[192.168.2.49]>;
          Sat, 24 Oct 2020 10:11:32 -0400
Subject: Re: [RFC PATCH v3] parisc: Add wrapper syscalls to fix O_NONBLOCK
 flag usage
To:     Helge Deller <deller@gmx.de>, Jeroen Roovers <jer@xs4all.nl>
Cc:     linux-parisc@vger.kernel.org, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20200829122017.GA3988@ls3530.fritz.box>
 <20201020192101.772bedd5@wim.jer>
 <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
 <20201022173824.49b6b7f5@wim.jer>
 <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
 <20201022164007.GA10653@ls3530.fritz.box>
 <20201023181847.GA6776@ls3530.fritz.box> <20201024102218.72586ac5@wim.jer>
 <20201024102407.2d90b6b2@wim.jer>
 <03cd5a72-57c0-bdf6-f996-d0fd64a7d421@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <4c75a1af-0941-ce87-9be5-f9a92832f3ff@bell.net>
Date:   Sat, 24 Oct 2020 10:11:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <03cd5a72-57c0-bdf6-f996-d0fd64a7d421@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=KoYzJleN c=1 sm=1 tr=0 a=lNGNHD24gN8CBUU6PHFJmA==:117 a=lNGNHD24gN8CBUU6PHFJmA==:17 a=IkcTkHD0fZMA:10 a=afefHYAZSVUA:10 a=FBHGMhGWAAAA:8 a=aatBHDJWo6voicVW7DMA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfIS46Nq88dMOpPFqTtdo2eJBVdR0/JWBzFJUwrEbGoNFkfrcIIekjDo0suJj3JhnQHcJDkbKTV0Zs6rcNQ850esbkTF1fc9iElJ8rwd7ofkVYY4fpip8 +aJ4IcvpmqCBMJsR94D7Ht7czGriSpbUFo2lm9J4WZBxg4KbI2+YN9pgkDh7BSiaTynjkRJLff0f4A==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-10-24 4:34 a.m., Helge Deller wrote:
> On 10/24/20 10:24 AM, Jeroen Roovers wrote:
>> On Sat, 24 Oct 2020 10:22:18 +0200
>> Jeroen Roovers <jer@xs4all.nl> wrote:
>>
>>> On Fri, 23 Oct 2020 20:18:47 +0200
>>> Helge Deller <deller@gmx.de> wrote:
>>>
>>>> +static int FIX_O_NONBLOCK(int flags)
>>>> +{
>>>> +	if (flags & O_NONBLOCK_MASK_OUT) {
>>>> +		struct task_struct *tsk = current;
>>>> +		pr_warn_once("%s(%d) uses a deprecated O_NONBLOCK
>>>> value.\n",
>>>> +			tsk->comm, tsk->pid);
>>>> +	}
>>>> +	return flags & ~O_NONBLOCK_MASK_OUT;
>>>> +}
>>> Would it be interesting to additionally report the calling function in
>>> search for other syscalls that might not be covered yet?
>> Wait, that doesn't make sense, does it?
> makes no sense :-)
> The function is only called by syscalls where we know they are affected.
I tend to think the warning is annoying.  We will have to keep compatibility with old binaries forever.

Dave

-- 
John David Anglin  dave.anglin@bell.net

