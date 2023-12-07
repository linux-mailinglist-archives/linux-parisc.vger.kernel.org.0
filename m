Return-Path: <linux-parisc+bounces-156-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5381F807F23
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Dec 2023 04:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0E75281446
	for <lists+linux-parisc@lfdr.de>; Thu,  7 Dec 2023 03:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADBD1FCB;
	Thu,  7 Dec 2023 03:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8yeFmCP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3154D18D
	for <linux-parisc@vger.kernel.org>; Wed,  6 Dec 2023 19:20:57 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5c673b01eeeso329380a12.1
        for <linux-parisc@vger.kernel.org>; Wed, 06 Dec 2023 19:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701919256; x=1702524056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pglCpto/YaaQvi+wfDDRhRio4eai7VH/a5mG86+O4dY=;
        b=D8yeFmCP2poAX8JhW7BxPf9sU/7lTEN06gN8Mf4DMKv4lG6WzTD/4Z4z41Grb866Gr
         606sTTq54pZr4iyVWRerPzcsRME+1S+rFvTtnGisbUCMTMJOQ3zXTyAMnu0BAUxcMpiG
         CwS65EwOVvc6+iq4WI8kODXFWU84g3sSOU3S1M1cDCtA46VwTiD1c2V8E5jsdWrlE/qT
         RflY7tFs/JhRmYUvNrj6+nB9RZ4GxrWvfnK812TvmCZcPBg63VpdJ6cs8OwFqXkMT1lt
         oFk7f+NEX5xcTjHBOeuZtdPcFIf6mHSZklUZKKgEQVqLDvFegnhzGyJSJCSNsEMrQ3kl
         Tmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701919256; x=1702524056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pglCpto/YaaQvi+wfDDRhRio4eai7VH/a5mG86+O4dY=;
        b=T6MTpDlz5KJuvcUTULjvWqqA5RR6ttIIluHWZ/6u39x5dXU4MMtSa+AuUO29OHucmU
         Xhwx+8FA11zKUPSU3/7cJvBnVlpes76xKhOOUlO7QNhgikYcw2PxfMl/CQqes+BIhrS+
         FtNBdL+w/OeyLOQ4DUwDw0cIdMNHoJOFb6yVsmmD7E9jaZIi+0+EFonOCT8SU47uHq0g
         POYMYuS9ZOctj/OZn7+BE2gVTJ+RZZ7rnf7Sm8Hs84UdBvqMgyKOplBFFrMRI9HhWjA6
         Iheizfp9fwC8yBtH5SQ9+EuOE0wz7GXnREaMq95AEoNW/vZLqlql2j11o8gO1AE+ikym
         QbeA==
X-Gm-Message-State: AOJu0Ywhvt6a//QHtzuLrplgLv5ejLkLRoa/m9RFM2ozvfLWgsC9l8+q
	DcMHxMaiQg8/EHWh5Hczg0464gM3OP8=
X-Google-Smtp-Source: AGHT+IF24RQC/q4GzxC9DMgQp8K1Uslbo5/C6buOjdxHra+f9UV0CvSAUSm9FJn80IhRWGBIp7q43g==
X-Received: by 2002:a05:6a20:2303:b0:18c:8d0f:a794 with SMTP id n3-20020a056a20230300b0018c8d0fa794mr1356224pzc.19.1701919256358;
        Wed, 06 Dec 2023 19:20:56 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a031b00b00286ab9bb87dsm180051pje.42.2023.12.06.19.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 19:20:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b4c1a6b6-91b8-4baa-9388-14f252a580da@roeck-us.net>
Date: Wed, 6 Dec 2023 19:20:54 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
 <a52d08a9-1114-4d0c-8d10-508d6d49627b@bell.net>
 <b1c864a0-cdda-409a-94c2-1a2cb827f7e1@gmx.de>
 <aeceb922-b6e9-4814-919e-6a82fb869f63@roeck-us.net>
 <6199c59b-1307-48c2-ae9a-254ab2d578c0@gmx.de>
 <0f9710fc-8246-4265-a32f-ebc4fa3eefde@roeck-us.net>
 <41052280-bb9f-4fa4-a3d4-ed23a1fcdbd1@gmx.de>
 <c56601c1-f89a-463a-93df-db93133e8315@roeck-us.net>
 <4b6ef6f3-c3db-48fe-a3ee-1d874d510c7e@gmx.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <4b6ef6f3-c3db-48fe-a3ee-1d874d510c7e@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/6/23 13:43, Helge Deller wrote:
> On 12/6/23 21:19, Guenter Roeck wrote:
>> On 12/6/23 09:00, Helge Deller wrote:
>> [ ... ]
>>>> Is it worth testing with multiple CPUs ? I can re-enable it and
>>>> check more closely if you think it makes sense. If so, what number
>>>> of CPUs would you recommend ?
>>>
>>> I think 4 CPUs is realistic.
>>> But I agree, that you probably see more issues.
>>>
>>> Generally the assumption was, that the different caches on parisc
>>> may trigger SMP issues, but given that those issues can be seen on
>>> qemu, it indicates that there are generic SMP issues too.
>>>
>>
>> Ok, I ran some tests overnight with 2-8 CPUs. Turns out the system is quite
>> stable,
> 
> cool!
> 
>> with the exception of SCSI controllers. Some fail completely, others
>> rarely. Here is a quick summary:
>>
>> - am53c974 fails with "Spurious irq, sreg=00", followed by "Aborting command"
>>    and a hung task crash.
>> - megasas and megasas-gen2 fail with
>>    "scsi host1: scsi scan: INQUIRY result too short (5), using 36"
>>    followed by
>>    "megaraid_sas 0000:00:04.0: Unknown command completed!"
>>    and a hung task crash
>> - mptsas1068 fails completely (no kernel log message seen)
>> - dc390 and lsi* report random "Spurious irq, sreg=00" messages and timeouts
> 
> I think none of those drivers have ever been tested
> on physical hardware either.
> So I'm astonished that it even worked that far :-)
> 
> Based on kernel sources, the "Spurious irq, sreg=%02x." error can only happen for the
> am53c974 driver. Are you sure you see this message for dc390 and lsi* too?
> 

Definitely for dc390:

qemu-system-hppa -M C3700 -kernel \
      vmlinux -no-reboot -snapshot -smp 4 -device rtl8139,netdev=net0 \
      -netdev user,id=net0 -device dc390,id=scsi -device \
      scsi-hd,bus=scsi.0,drive=d0 -drive \
      file=/var/cache/buildbot/parisc64/rootfs.ext2,format=raw,if=none,id=d0 \
      -append "root=/dev/sda rootwait console=ttyS0,115200 " \
      -nographic -monitor null

I'll have to re-check lsi*. My notes for lsi53c810 actually say:

     # Random crashes in sym_evaluate_dp(), called from sym_compute_residual()
     # (NULL pointer access). The problem is seen during shutdown. This is a
     # kernel bug, obviously, likely caused by timing differences. It is
     # possible if not likely that an interrupt is seen after the controller
     # was presumably disabled.

but that was for 32-bit. It turns out I don't have any notes for lsi53c895a.
I'll re-check both tonight.

> For megaraid_sas I see a Seabios-hppa firmware patch is required.
> Could you please give me the full command line how you start qemu?
> Esp. since the lsi scsi is still there, how do you assign a disc to the additional
> megaraid_sas driver?
> 

qemu-system-hppa -M C3700 -kernel \
      vmlinux -no-reboot -snapshot -device pcnet,netdev=net0 -netdev \
      user,id=net0 -device megasas,id=scsi -device \
      scsi-hd,bus=scsi.0,drive=d0 -drive \
      file=/var/cache/buildbot/parisc64/rootfs.ext2,format=raw,if=none,id=d0 \
      -append "root=/dev/sda rootwait console=ttyS0,115200 " \
      -nographic -monitor null

>>>>>> - Not sure it if is worth mentioning: There may be hung task crashes in
>>>>>>    usb_start_wait_urb/usb_kill_urb during shutdown when booting from usb
>>>>>>    or when using an usb network interface. That happens with all emulations,
>>>>>>    though, and is not parisc specific.
>>>>>
>>>>> Did you reported it upstream in the bug tracker?
>>>>>
>>>>
>>>> No, because I have no idea if it is an emulation problem or a linux problem.
>>>> I never had the time to track it down. I just noticed that it seemed to be more
>>>> prevalent with 64-bit parisc especially if I boot from usb _and_ use a usb
>>>> network interface. In case you are interested to see how it looks like, here
>>>> are a couple of examples:
>>>>
>>>> https://kerneltests.org/builders/qemu-riscv64-5.4/builds/46/steps/qemubuildcommand/logs/stdio
>>>> https://kerneltests.org/builders/qemu-parisc64-6.6/builds/1/steps/qemubuildcommand/logs/stdio
>>>
>>> Ok, thanks!
>>> But isn't that more or less expected, as the machine can't simply turn
>>> off USB when root disc is on USB? E.g. otherwise it woulnd't find the shutdown
>>> executables? Maybe just the warning should be disabled after shutdown?
>>>
>>
>> Not sure about that, for a number of reasons: It doesn't happen all the time,
>> and it is more likely to happen if the system is under load. It also seems
>> to be associated with OHCI (I am currently running more tests to confirm),
>> and sometimes the failure is with the network interface. That suggests that
>> some race condition may be involved.
> 
> Ok, at least it should be looked at...
> 

I confirmed that this is _only_ seen if the host system is under load. I have not
been able to reproduce the problem on a system which is idle beyond the qemu process.

Guenter


