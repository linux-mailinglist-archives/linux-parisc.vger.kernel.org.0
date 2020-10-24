Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1242297B7E
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Oct 2020 10:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751090AbgJXIeg (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 24 Oct 2020 04:34:36 -0400
Received: from mout.gmx.net ([212.227.17.20]:48567 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S463693AbgJXIee (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 24 Oct 2020 04:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603528459;
        bh=KmIOVTARIjZ/au5IpHzwiyQIMrUgeZv4A6xbrFn3xUI=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=TMaHuwc+brsyIF5sYypoSTeEFZNMHE9ArM0FDhFsm3jKfGKK+ZhntAwqECWXTpq3/
         51BjUc05ZKXmhJrAOBQfe4y7aNgTTUUiOzbNmUYNVa1BDzchDh2ub22FT5+R/nhdYl
         CNWdoklk0Vll3gmsaAUL99RSpFaRftM55PIbSavU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.128.3]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKbg4-1kr4ju3ylI-00KuOX; Sat, 24
 Oct 2020 10:34:19 +0200
Subject: Re: [RFC PATCH v3] parisc: Add wrapper syscalls to fix O_NONBLOCK
 flag usage
To:     Jeroen Roovers <jer@xs4all.nl>
Cc:     linux-parisc@vger.kernel.org, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20200829122017.GA3988@ls3530.fritz.box>
 <20201020192101.772bedd5@wim.jer>
 <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
 <20201022173824.49b6b7f5@wim.jer>
 <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
 <20201022164007.GA10653@ls3530.fritz.box>
 <20201023181847.GA6776@ls3530.fritz.box> <20201024102218.72586ac5@wim.jer>
 <20201024102407.2d90b6b2@wim.jer>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <03cd5a72-57c0-bdf6-f996-d0fd64a7d421@gmx.de>
Date:   Sat, 24 Oct 2020 10:34:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201024102407.2d90b6b2@wim.jer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mnsEvzr24KBUIdLU9OCtBXnxwR2z6cXka8nRJlGaqZF08L0lbnB
 aLKvxkAvKrHtq90UuxGXOsfKr3oRINKFslUBem+SjlLvflbvt3+SGOtnaoAS+L9cnHZGgEn
 8vwndKfqIuYD3vi9ItCRTUKCZxd2VNwXrQ/PQAczqiSuZaGoTeGXfHrBlRDkZ75dADRWhWi
 6xV42NgTv/eFpVLfKDBEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9OvkVTw6OgM=:YQ4vscunoZT7JpCabA75rQ
 NEMQJ6ZpDnu02FjCgbtUHjr1dc1QLJTFFPpsj45jIawR+Nf3XtRmHzzXISD3m9rvyHQ5s6FpX
 /l+ILrdjiyORJg7qKd2rX32eVX1wpIS8guGlaPwgAtHHkJMOGgHobZBTOsDlFP99KZpTp9foP
 2bLj+eBY7FtLWa13loumhlxOeZsYdrR/ddPH2seTcg524wovItri9meheZ4W8I79SDnQdA7QZ
 GesjETm/5IeuQiIqXIs25Y/CfTIkrTBchFKkSl5lQ5Bliba6KYuifZCRrSgEiIUTPSM6L0znn
 QDOWNfdKYHBizji6UFu4MS1f375dUEAVpCTPEXSy5bM3oa97Fz2JDxmVtQ6lnWkdEIxV62Kdp
 MMXBtY9sHYLQfoqFzoglJcxhCnfV+dav3m0Hu8cyR5wE3v+KTwRbk3VcXPNqqI/G9EO+f2bGH
 //RRlaw2uaZoIP52IZ+1PE2MWgr4fE1rofZun6WafOghM8fM0SYrFgF+aZtYbxun6hnD5yvu/
 dGZilQiy56oy6fwsz1eS9/TG/ItznQoU2pcZpFWFRh71c4ycOz2p/YHGHoNcWiHIXX4MbIKUO
 mJMhViwBTHDR82gNxq6R3aBDXLtaeqB93nWoMh6/1dqKM98iEP7NHlhn1QNbwiB+k1kJTwZBp
 neI+0R5F9mXjkeZ5Cvf4vku5pREC8cSU0AVn34kEmmOdLlN9x/ePZQLz3ypQNkPf6+klJGQ1+
 umkhfZVDWL1VYx8D+a+JdFp3K6Z/X5UNKgp7KtLx8IKhYo/D3xL1jr7jdV/q5CjS30dZOmjos
 q5gGKnCvfE5rHN4dc34rV6cWQK+yGxHBpbqEd/aqH/dJozoiF4PyQXZfs4rOB0h6wE+FrtU3H
 unQ7P5Fairhp0QUkaSNA==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10/24/20 10:24 AM, Jeroen Roovers wrote:
> On Sat, 24 Oct 2020 10:22:18 +0200
> Jeroen Roovers <jer@xs4all.nl> wrote:
>
>> On Fri, 23 Oct 2020 20:18:47 +0200
>> Helge Deller <deller@gmx.de> wrote:
>>
>>> +static int FIX_O_NONBLOCK(int flags)
>>> +{
>>> +	if (flags & O_NONBLOCK_MASK_OUT) {
>>> +		struct task_struct *tsk =3D current;
>>> +		pr_warn_once("%s(%d) uses a deprecated O_NONBLOCK
>>> value.\n",
>>> +			tsk->comm, tsk->pid);
>>> +	}
>>> +	return flags & ~O_NONBLOCK_MASK_OUT;
>>> +}
>>
>> Would it be interesting to additionally report the calling function in
>> search for other syscalls that might not be covered yet?
>
> Wait, that doesn't make sense, does it?

makes no sense :-)
The function is only called by syscalls where we know they are affected.

Helge
