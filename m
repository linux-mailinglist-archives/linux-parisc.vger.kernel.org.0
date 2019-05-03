Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E9B135A9
	for <lists+linux-parisc@lfdr.de>; Sat,  4 May 2019 00:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfECWbh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 3 May 2019 18:31:37 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:44319 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726059AbfECWbg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 May 2019 18:31:36 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190503223135.BVWQ4444.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Fri, 3 May 2019 18:31:35 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by mtlspm01.bell.net
          with ESMTP
          id <20190503223135.LZUU87666.mtlspm01.bell.net@[192.168.2.49]>;
          Fri, 3 May 2019 18:31:35 -0400
Subject: Re: [PATCH] parisc: Add static branch and JUMP_LABEL feature (v2)
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190501200231.GA7087@ls3530.dellerweb.de>
 <20190502050510.GA10924@t470p.stackframe.org>
 <20190503214006.GA25013@ls3530.dellerweb.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <ce170758-ec9a-7f30-64ea-e153ed27242b@bell.net>
Date:   Fri, 3 May 2019 18:31:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503214006.GA25013@ls3530.dellerweb.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=MFz3nphFqa752OitLKMA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfKzCxBuqQWg9tzBt2/r9Js4l6WV6OUVJ7dLb0iEDiqMMKIzZu810U71UcrqKkgDN2wC57u3t0BXDVkeMF9JJV44ykYdVNDNNm7Gfma3KO2Np5sBw0LxH wjfzQqARCwx0yvP2ou74mw7Ep8HxG2mCvCt4IqhYnFWYuD7AsSZoJH4cIE5hetmeNs1tKp7QF3rX+w==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-03 5:40 p.m., Helge Deller wrote:
> +		void *target = (void *)jump_entry_target(entry);
> +		int distance = target - addr;
> +		/*
> +		 * Encode the PA1.1 "b,n" instruction with a 17-bit
> +		 * displacement.  In case we hit the BUG(), we could use
> +		 * another branch instruction with a 22-bit displacement on
> +		 * 64-bit CPUs instead. But this seems sufficient for now.
> +		 */
Just a note on the comment.  The branch instruction with 22-bit displacement uses
the return pointer register %rp.  It is available on 32 and 64-bit PA 2.0 machines but
one would have to clobber %rp, or save and restore it on stack. The former would cause
%rp to be saved and restored in the function's prologue and epilogue, respectively.

Dave

-- 
John David Anglin  dave.anglin@bell.net

