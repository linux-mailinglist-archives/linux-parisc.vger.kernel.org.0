Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095AA7E8352
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Nov 2023 21:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344907AbjKJUC3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Nov 2023 15:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235999AbjKJUCS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Nov 2023 15:02:18 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAF0C6
        for <linux-parisc@vger.kernel.org>; Fri, 10 Nov 2023 12:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1699646511; x=1700251311; i=deller@gmx.de;
        bh=vV5xR3JikbTJlZRRI4X2RP2vrVn8IGgsfqlBvGxX1FE=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=sUV+hZg2JF/hw7Y45ofnO5wghUAOXy53sZo0jOdBtlXrokCKAs/cOBtpY37Iq3+5
         YvR6PkZ5h2DX4BR2RZtzi/RjkcqnyrBAfPu0FiVkQDHy35bSqH6KFIlr2NHtivZfA
         hXCh1E5a/37If5gd1nJqXqoCCilylGzkz801Sm9GwohSd2hu7xi+DyrRlRchGesq0
         oNrtii4/u0hOSBYeIfzPrHwNIIu8/jPBrMNMfh6qKLi6OYmwVp7ii+sVDqPvVG9U7
         k82QGDhVYKDOkf1qtk0aOwelD0QfP0IJBI/sh5faErHJjjNGx0t8e7KobPtNn1kN0
         qEkTnQulp+0XNnKsdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.22]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK0R-1rJLjS1ZTt-00rEHl; Fri, 10
 Nov 2023 21:01:51 +0100
Message-ID: <0fec2446-a523-486f-9df7-4c6af9e2e0e3@gmx.de>
Date:   Fri, 10 Nov 2023 21:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: prctl call wrongly succeeds on HPPA?
Content-Language: en-US
To:     Sam James <sam@gentoo.org>
Cc:     "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
References: <87lebjz9z6.fsf@gentoo.org> <875y2jro9a.fsf@gentoo.org>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <875y2jro9a.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WYXJYK1TgGMcot/XpdYhF+JSA3608F0PGWoQCkeJFI+KkL8aL9U
 auUTr+yKeX//cJSf7eZ96RSsgBTGWvVVFVggnKUToGSYXlAJewKvFEhclOQ655erpms3lp8
 usrdb6lrc2uKvFblMtD7fXDkUOo5sygCuWQtJ39+0nQ6jpgtTeFgk5cSyKcaBZIbKfs8bJP
 /bN+DFmZ6fDHOsUvsiV3w==
UI-OutboundReport: notjunk:1;M01:P0:8BN7pzLmvxE=;z+u7Tqd+P9DUpYuCsToYNA1QwPS
 1anbwhaaqsbDcNzJ0DqokkuyRVfdRAvr34Mb89VVNh+X8CzVZpPgohMhNLaVpP0TZb0+HRjn6
 F10zTDVgHRXydXiUnU15Kh5+mvvoCmVDui3CQ7C/T4xwFzLUDCNW3G5jbQC4RLudkCsIHdMLN
 B7cW6DzRmoNRFuyv2MTB5/tZ9iBxTHARKydUadNF5pmTHfn5/171KyAbhByckBEKzNqBsxPLf
 rtNx+Sqyhydu20jQiF3u30GLGVSSS+aC98WDR9l0gvbhFs2mw7Md26/zzS80u94GXExUnE4ZJ
 fhnzbJTPTm/Bs3uzU7Z/sn7e32KHVday36UQ6kQVzrBuj3CPczuNa8RAxrcFGy3D/+Kr9CUaZ
 3FmdMgYdgWQvP85uHUrISGoRIieTdwMBvE8mUHnvfWvbqNMQVuYCV5SF7qGDYAdAvHipiHtjy
 BfbEzNYQ1Mngneuo2VmzhpmQvpuhXMZqM5ns+/l61BAWrExWXdjFB2AznC0RBzYQbVJmfBrZf
 j7IJCBTKTHMZYb8ZmnZOkjLaiC3dvm7G/8+5bTnuLV4zXfQItxsavSeXaSupAY14IYVt740Mm
 zKGz39KD99mSngwJA/ZD92lAX+VU/PBqKspZA+D9J2dc5B2nbPTFrA/X25cNEJEA25hBmWlu2
 mg9SWkJJt4x91HgmvqIrI9qztq9ylz2z3S3v5WFUpOEo0WbTKy56c4fhoYVN/zWvR3S24Rdp6
 IMFxBLwnZsbSpRHc8Pxa6QohkT9VWeEdFThjQ15aMLErlLjQEZHVaTgwTB8F1zA7l5zELtGRO
 lQtvr6tuFfwk14Xb6BSHOz6q6OjbPATuz6GHUMp+0Ai0aDAAXfFDM6hTwpaDsaeYM+GE9URui
 ETDjSLgwJOcDc92ysWdW9oqZmoonXVucCqrrj6vxyPl1wW2KXqNk1AzjM85TWM/ZS/b9RpBGk
 cQyIAg==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/3/23 13:53, Sam James wrote:
> Sam James <sam@gentoo.org> writes:
>> I recently hit an issue with systemd-254 which tries to use the new
>> prctl(PR_SET_MDWE) for systemd's MemoryDenyWriteExecute functionality.

Is this still a problem?

>> On HPPA, we still need executable stacks, so this option doesn't work
>> and leads to a segfault on boot.

For kernel we don't need it any longer.
But there might be dependencies on glibc version and/or combination.
So, I've currently lost overview if we still need executable stacks...

>> Should this call be succeeeding on HPPA, or should we reject it for
>> now until we have things wired up?
>>
>> Reported to systemd at https://github.com/systemd/systemd/issues/29775.
>
> Lennart has made clear (and I don't think I disagree) that he considers
> this squarely a kernel bug.

I've read the various bug reports and looked at the kernel commits regardi=
ng, e.g.

commit b507808ebce23561d4ff8c2aa1fb949fe402bc61
Author: Joey Gouly <joey.gouly@arm.com>
Date:   Thu Jan 19 16:03:43 2023 +0000

     mm: implement memory-deny-write-execute as a prctl

but what is prctl(PR_SET_MDWE, PR_MDWE*, 0, 0)... expected to return on pa=
risc?
EINVAL? ENOTSUP?

Helge
