Return-Path: <linux-parisc+bounces-72-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D1E7F9C84
	for <lists+linux-parisc@lfdr.de>; Mon, 27 Nov 2023 10:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C6D8B2097F
	for <lists+linux-parisc@lfdr.de>; Mon, 27 Nov 2023 09:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3EBDDA6;
	Mon, 27 Nov 2023 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-parisc@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93418CB;
	Mon, 27 Nov 2023 01:20:14 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r7Xml-00074A-2E; Mon, 27 Nov 2023 10:20:11 +0100
Message-ID: <69f4eb55-a96b-49a1-9503-5796e90c2add@leemhuis.info>
Date: Mon, 27 Nov 2023 10:20:08 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: parisc: bug.h:71:17: error: invalid 'asm': operand number out of
 range
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-parisc <linux-parisc@vger.kernel.org>, regressions@lists.linux.dev
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Helge Deller <deller@gmx.de>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 John David Anglin <dave.anglin@bell.net>
References: <CA+G9fYsM4Aa1smp2Xahf=z2WOGpXsAC3GzUW06HJN9pucm837Q@mail.gmail.com>
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CA+G9fYsM4Aa1smp2Xahf=z2WOGpXsAC3GzUW06HJN9pucm837Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1701076814;a7274c5d;
X-HE-SMSGID: 1r7Xml-00074A-2E

On 27.11.23 09:57, Naresh Kamboju wrote:
> The parisc tinyconfig built with gcc-11 failed on mainline v6.7-rc3.
> 
> git_describe: v6.7-rc3
> git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
> 
> parisc:
>   build:
>     * gcc-11-tinyconfig
> 
> In file included from lib/math/int_log.c:14:
> lib/math/int_log.c: In function 'intlog2':
> arch/parisc/include/asm/bug.h:71:17: error: invalid 'asm': operand
> number out of range
>    71 |                 asm volatile("\n"
>          \
>       |                 ^~~
> 
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.7-rc3/testrun/21323529/suite/build/test/gcc-11-tinyconfig/log
>  - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.7-rc3/testrun/21323529/suite/build/test/gcc-11-tinyconfig/history/
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Yk9c7RsS6V5pdDdOYzHSrlpZQk/

Thx for the report. FWIW & TWIMC, briefly looked into this and to my
untrained eyes it looks like the kernel test robot ran into this a few
days ago already with a randconfig and gcc13:

https://lore.kernel.org/all/202311230405.edAXyqKp-lkp@intel.com/

Ciao, Thorsten


