Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED33311BF50
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Dec 2019 22:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfLKVfq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Wed, 11 Dec 2019 16:35:46 -0500
Received: from belmont94srvr.owm.bell.net ([184.150.200.94]:43090 "EHLO
        mtlfep07.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLKVfp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 11 Dec 2019 16:35:45 -0500
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Dec 2019 16:35:45 EST
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20191211212906.RPQS115221.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 11 Dec 2019 16:29:06 -0500
Received: from [192.168.0.101] (really [70.29.36.235]) by mtlspm02.bell.net
          with ESMTP
          id <20191211212906.ZNGL16482.mtlspm02.bell.net@[192.168.0.101]>;
          Wed, 11 Dec 2019 16:29:06 -0500
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20191211201634.GA13407@ls3530.fritz.box>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH][RFC] parisc: Use ldcw,co on uniprocessor machines only
Message-ID: <63f37f01-6ae1-96e2-815b-aa48eb1f1c31@bell.net>
Date:   Wed, 11 Dec 2019 16:29:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191211201634.GA13407@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=I5Mbu+og c=1 sm=1 tr=0 a=esAec85A9Yb2+qcPyvrzNQ==:117 a=esAec85A9Yb2+qcPyvrzNQ==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pxVhFHJ0LMsA:10 a=FBHGMhGWAAAA:8 a=AP0KJY5hXFHwSGIPGuwA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22 a=ZoQ0myBRBqewLq4Mehnd:22
X-CM-Envelope: MS4wfKGThT2NrXyqH5UETT7lkzkAnGTRPj4QzhpR8bGWSQc4OHfzOO6XW9lWzbLXXkvv0kNenMSFEyVEApyDcX+f6ANKarwpIXD5BhIThegpmO5xnODVD+b8 nXfKQgqImW0pzaRUzgR2iwBLEsouNccGIy8UmXmDdhff1XinpsGzp8mXC8myhDi2jyftAT7G3tyg4A==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-12-11 3:16 p.m., Helge Deller wrote:
> Up to now we tried to optimize the ldcw usage by using the coherent
> completer of this command, which operates on the cache (instead of
> memory) and thus might speed up things, and which was enabled by default
> on our 64bit kernel build.
>
> But we still see runtime locking problems, so this patch changes it back
> to use ldcw for 32- and 64-bit kernels, and live-patches it at runtime
> to use the coherent completer when running on a uniprocessor machine.
I'm not convinced this is the problem.  Nominally, every PA 2.0 machine that we support is coherent.
Is there evidence that this actually helps?  I did a test where I switched "ldcw,co" to "ldcw" and
didn't find a significant difference.  So, I left the default assumption that most PA 2.0 machines
are coherent in gcc.

I'm seeing different behavior for pthread_mutex_lock/pthread_mutex_unlock with different
glibc versions.  The locking issues also seem to vary from one kernel version to the next.

I don't know that we can blame the two build failures of acl2_8.1dfsg-6 on phantom on a
locking issue, but phantom failed twice at the same pwasoint.  In both cases, cc1 terminated with
a segmentation fault.  Yet, mx3210 has been chugging away for more than a day on the package.
It also built -4 and -5.

I don't have a clue what's really wrong but I suspect the slowness of our locking infrastructure
is what exposes these issues.

I've seen one issue in user space where a pointer to a mutex got corrupted in apt-cacher-ng.
If I remember correctly, the LWS locking code was spinning with a pointer value of 0x12.  I think
the code should have faulted but the thread stuck.  Had to systemctl restart apt-cacher-ng.

Dave

-- 
John David Anglin  dave.anglin@bell.net


