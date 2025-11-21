Return-Path: <linux-parisc+bounces-4306-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6440C7B702
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Nov 2025 20:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39A4E3A5CB4
	for <lists+linux-parisc@lfdr.de>; Fri, 21 Nov 2025 19:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA982EC093;
	Fri, 21 Nov 2025 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="KJgm5Rgl"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-003.bell.net [209.71.212.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF72D6E66
	for <linux-parisc@vger.kernel.org>; Fri, 21 Nov 2025 19:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763751983; cv=none; b=nbtPW530eIfT4tn9IUpHEg7bes9CgK1ZXd3kd7PuAal5incnn3WWReOoetQI5swFDJIqrVtvXEA1UyzZWwi+YpixOzHMYDMzVICUP/x2AMuprwK2kIMcFqIiiYxBeVXSQXQf6dcFsdS2BN0hl8K97WnBL5JOTUkcdlSgNRtnUbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763751983; c=relaxed/simple;
	bh=8rLo8+Ogo/5ge0CvoHmjVx9H5eSyRXu18pWTEZJclHM=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=BU96d0lmoLSoZxsoqzwhanT6+uLrjBNZsotWRkWAgOTY7sufIg9Fa2ZOWTFYNNgPC+yL/l66Mj+ZkT9TeoTUiWYQxG8c2CqE42o6FkXX6e1/BCSOwR7uu2chzyrkbVIShxvEvJ8y3fppxzC8EcSVDLM0RJbTricl6Fbqp2SOyvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=KJgm5Rgl; arc=none smtp.client-ip=209.71.212.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1763751981; 
        bh=jQEB3lM4dIMLFcIL1xyMXrMaxcye7Jl7G+2cjOUYJ4A=;
        h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type;
        b=KJgm5RgloG+KdK2zT2nA+ZliYxsxM7NeKEncrFcRfMfeRJaEyUhMDQloujisH/OcBG0Yyi9tLuCEyYHF7pIMU5ZgGDze/dRL9qgdKXs3OHb98Otapll3fAm0x7Jsx8z32hdRUyA7MkDogf58csfsUQ8MZxTVeW/f5cMoHvdi01BRaVeaLFlL7f1aOEJqViqpeYYsO4/CGChyyzzmBZChqDi5/0wbZrOpPHIPw/msC8KQ6iJf6vLOov9/Z6EmWj4aoIGrjTG7BMgRYHvU3qDXFYibKAmmVigMZoV+if5VT3WLB1Ygss2eq1CV5bqfFYMTXP2ZVzUFdf13MyC3Zzo4xA==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6905EC3B0250069E
X-RazorGate-Vade: dmFkZTEURoIuoq4qUFxOE8dGeWWCJmqroOPluHHvNKNSUp2062s2iRuut1SMieeowR/M/z7a+MnZ6w3ER9nesNv8CGAasQXHFgXlhL8KjoPX+8rhosnME0T4XW3lnlf3CgV8cJb6J+bj7ngY1qirVDJ9oZ/8Y3z7UM70NGs91MpMeulW9JY+P0WDZczA/lwWOpT90P+8RsikqFad3N/0YtqeGrvH6nbMrEaID2wZXkhNyRnhZ4q7vsUSgppLRunFdsa2uuiuSjMJvK8w1aA//wjGF1QbYELXB1nrpVdgSXqoR+mABpqg1fEsRetELAuEPkQmhgjJAjOEmic+itSjzmj/ViThiR4ti6xFwyLuC3LRfrI73SwUl4DQaFjKd7AKr3Y6VAhZVN2HqdGl9Vbg27v1TNJSmm4rpQai2VDU5PEtYiHmjPrDCI8NMgmCV+ocl4R0tHKyzR/na683IQlE8OAU9VVCKPc2FOa6AnDh/uKVC08+zubuihqu/DPgaf6jVXDK8bDRDyA9a3KfyAV0fzS++h8/gs/gXhAcPCQ1W1Cew9QrWJ4RARnGBg1wM9dKSJNknAvizHp2arfaJa7l0ICIpG+TBwGXZ9pTvuZZcdD6u3c9307e08KY8sAcTmC89uxs3VY2iFVPUnf4LUExtF/dW6RG2gNVKZek9LA9lBZ7Z+Aw6w
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.189.246) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 6905EC3B0250069E; Fri, 21 Nov 2025 14:04:55 -0500
Message-ID: <2380a8de-5284-49f3-8155-f7fb9496b422@bell.net>
Date: Fri, 21 Nov 2025 14:04:55 -0500
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: John David Anglin <dave.anglin@bell.net>
Content-Language: en-US
To: linux-parisc <linux-parisc@vger.kernel.org>
Cc: Helge Deller <deller@gmx.de>
Subject: PIDFD_GET_INFO
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We have a new glibc failure that may be a kernel issue:

make[2]: Entering directory '/home/dave/gnu/glibc/glibc/misc'
env GCONV_PATH=/home/dave/gnu/glibc/objdir/iconvdata LOCPATH=/home/dave/gnu/glibc/objdir/localedata LC_ALL=C
/home/dave/gnu/glibc/objdir/elf/ld.so.1 --library-path
/home/dave/gnu/glibc/objdir:/home/dave/gnu/glibc/objdir/math:/home/dave/gnu/glibc/objdir/elf:/home/dave/gnu/glibc/objdir/dlfcn:/home/dave/gnu/glibc/objdir/nss:/home/dave/gnu/glibc/objdir/nis:/home/dave/gnu/glibc/objdir/rt:/home/dave/gnu/glibc/objdir/resolv:/home/dave/gnu/glibc/objdir/mathvec:/home/dave/gnu/glibc/objdir/support:/home/dave/gnu/glibc/objdir/misc:/home/dave/gnu/glibc/objdir/debug:/home/dave/gnu/glibc/objdir/nptl:/usr/lib/gcc/hppa-linux-gnu/15/../../../hppa-linux-gnu/:/usr/lib/gcc/hppa-linux-gnu/15/../../../hppa-linux-gnu/
/home/dave/gnu/glibc/objdir/misc/tst-pidfd_getinfo  > /home/dave/gnu/glibc/objdir/misc/tst-pidfd_getinfo.out; \
../scripts/evaluate-test.sh misc/tst-pidfd_getinfo $? false false > /home/dave/gnu/glibc/objdir/misc/tst-pidfd_getinfo.test-result
make[2]: Leaving directory '/home/dave/gnu/glibc/glibc/misc'
FAIL: misc/tst-pidfd_getinfo
original exit status 1
error: ../sysdeps/unix/sysv/linux/tst-pidfd_getinfo.c:52: ioctl (PIDFD_GET_INFO) failed: Invalid argument
error: 1 test failures

  if (ioctl (pidfd, PIDFD_GET_INFO, &info) != 0)
    {
      if (errno == ENOTTY)
        FAIL_UNSUPPORTED ("kernel does not support PIDFD_GET_INFO");
      else
        FAIL_EXIT1 ("ioctl (PIDFD_GET_INFO) failed: %m");
    }

Dave
-- 
John David Anglin  dave.anglin@bell.net


