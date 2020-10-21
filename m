Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CA729515A
	for <lists+linux-parisc@lfdr.de>; Wed, 21 Oct 2020 19:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503369AbgJURMY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 21 Oct 2020 13:12:24 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:36869 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2438097AbgJURMY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Oct 2020 13:12:24 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20201021171222.YVVG52743.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 21 Oct 2020 13:12:22 -0400
Received: from [192.168.2.49] (really [76.66.134.232]) by mtlspm02.bell.net
          with ESMTP
          id <20201021171222.TMMU3672.mtlspm02.bell.net@[192.168.2.49]>;
          Wed, 21 Oct 2020 13:12:22 -0400
Subject: Re: Kernel 5.8 and 5.9 fail to boot on C8000
To:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
 <37ee0636688c782a59e8b50eae5c41b96926e7ab.camel@HansenPartnership.com>
 <bbdfecf6-b13f-561f-82f6-1f5e594e02b2@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <35dc2238-cf23-15a5-b214-533133e6bd9c@bell.net>
Date:   Wed, 21 Oct 2020 13:12:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <bbdfecf6-b13f-561f-82f6-1f5e594e02b2@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=KoYzJleN c=1 sm=1 tr=0 a=lNGNHD24gN8CBUU6PHFJmA==:117 a=lNGNHD24gN8CBUU6PHFJmA==:17 a=IkcTkHD0fZMA:10 a=afefHYAZSVUA:10 a=xNf9USuDAAAA:8 a=FBHGMhGWAAAA:8 a=Bo27KyS8eOrg_s98D7QA:9 a=QEXdDO2ut3YA:10 a=Oo4RUI8smAYA:10 a=SEwjQc04WA-l_NiBhQ7s:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfL3Nbl8iuL8WwztxnuPj5sQ3OrUR2fIjaJcFmalCNJtC4/M7DKfJF/raxDa3rr1NKjYtjC2MWASxZxx29tK/Yz18YFOoKynvyklt/X/65oRljY6gRBL0 Fm7pvYTxPVVHtckf/B3lVZbvfr5j8bfrgqzXmXvSvjUbLpwS6sqiHsoTSt8fNuH410UJ2RnVj9Jsaw==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-10-21 12:10 p.m., Helge Deller wrote:
> Any idea what I could test?
Try kernel a build with gcc-9 or earlier.  It appears there are problem(s) with gcc-10.  I'm getting all kinds
of random issues building glibc.
https://buildd.debian.org/status/logs.php?pkg=glibc&ver=2.31-4&arch=hppa

Dave

-- 
John David Anglin  dave.anglin@bell.net

