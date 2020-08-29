Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72ED3256905
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Aug 2020 18:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgH2QZh (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Aug 2020 12:25:37 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:51649 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728310AbgH2QZg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Aug 2020 12:25:36 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20200829162533.PLZK5779.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 29 Aug 2020 12:25:33 -0400
Received: from [192.168.2.49] (really [70.53.61.197]) by mtlspm02.bell.net
          with ESMTP
          id <20200829162533.NPEF3672.mtlspm02.bell.net@[192.168.2.49]>;
          Sat, 29 Aug 2020 12:25:33 -0400
Subject: Re: [PATCH] parisc: Drop useless comments in uapi/asm/signal.h
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20200829160924.GA5329@ls3530.fritz.box>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <94f89eec-5792-0521-ea90-15e3da56bfab@bell.net>
Date:   Sat, 29 Aug 2020 12:25:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200829160924.GA5329@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=6x1y2OhCX1CAR/Lk3lU3cg==:117 a=6x1y2OhCX1CAR/Lk3lU3cg==:17 a=IkcTkHD0fZMA:10 a=y4yBn9ojGxQA:10 a=FBHGMhGWAAAA:8 a=8NGk9NCD8IMIvlGbngoA:9 a=QEXdDO2ut3YA:10 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfHiM0r1CvZ3wt9VJGL4ZuxXNFdi0SaagFZ9BxX7BQnBNO7R/+JJGo+fP4bk2u1zFOKQMB04xSe9R42jMZxNuLY+u3GsRcMHtGQ0kNem1NJ4D5Gzsp1dJ 37ZV2YjeRZ8HQ9ctrCf5xmpMH4ACykLNN8D2VI8Ozoyb31dLARL4PkZo1UODqVSMBHRYnWFPmJvIVw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-08-29 12:09 p.m., Helge Deller wrote:
> -#define SIGSYS		31 /* Linux doesn't use this */
> +#define SIGSYS		31
?

Dave

-- 
John David Anglin  dave.anglin@bell.net

