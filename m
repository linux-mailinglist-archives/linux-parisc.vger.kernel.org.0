Return-Path: <linux-parisc+bounces-148-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E28A980638E
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Dec 2023 01:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FCE31C2096E
	for <lists+linux-parisc@lfdr.de>; Wed,  6 Dec 2023 00:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F29650;
	Wed,  6 Dec 2023 00:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joEkKaTf"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984531BC
	for <linux-parisc@vger.kernel.org>; Tue,  5 Dec 2023 16:39:22 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-286b4a84044so2079330a91.1
        for <linux-parisc@vger.kernel.org>; Tue, 05 Dec 2023 16:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701823162; x=1702427962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MkthmFG/MVhR4NNQLOwesiFPgiVp8wgTQ1sxZyeRohc=;
        b=joEkKaTfEq8M5UdpqDXRtk10bVExkHfY1iB420Rw9zTorVzCjiB4qrGLTZuJtzcECa
         vzG3DN1Q5BxgAml12KKuseyCpvC03HZNG8g8bpTqk1ky8urgQ6EacUxGTAZzxbGnxE9e
         +I6gmlMT8dnXkmhtVac9VQXSH0r8cXc1ELRWuUNjtK2l+2USGPVy/rrCMtfQrZD46hK/
         1It/ItS2Jw6N1cuSCwtdW6dteZL1dmOuHqZV2m7kjFTAyIDvKdOVfY9eumq7dJ2lAkXR
         Fl/1o8LSBYASyF8YjaqcatpOn7N8iBS7fn55BMhPClXMRY0VNM7QRCrmilSyCCSY8QsO
         4fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701823162; x=1702427962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkthmFG/MVhR4NNQLOwesiFPgiVp8wgTQ1sxZyeRohc=;
        b=u7oBu+8AZfjFcF6W8V+MT3dXos4fBa9Enl6B6NKucgNX61K2aUI6O+THpMiQi2vtqk
         X0jgCp/lGXl1+Sdl6MygCBCmPgzbll70zw4Q4VcFzXf/PmT0r2HmDeS+rvm53rHKWyVY
         9ORCTj/joY1fcLjR6o+0QmQLIwI6LXNNbhf4VU7NZd7AOPnzwdkwB7oJxK5n5Trzctw1
         dv7d0nRFv5B/AWLABe1pfObDc6ZnVEne4YVw3yzDA/c7SWJE2EEY33tuulbVvgGNCYai
         soc6XinN6Vhs+EDFdCzaALTrOKFWxi38LF7V/wzx3gxZfjJZv16hMRDPQjZozyRwPwqo
         oPjQ==
X-Gm-Message-State: AOJu0YyZlJAuTfQcCiX0/2VNdaaeQJ6lDZ6ubQvbaHdjFkYHYLPY6CzA
	TEWjXO9h5ld2xHqkc+Ko7TnNyWLRJas=
X-Google-Smtp-Source: AGHT+IHO+jsgc/yZ8A1PhOWJ8VFaip2rixxFk87u2YVfEseeT4Udds9xrdWOxkxPaolH0/rt2dKJ0Q==
X-Received: by 2002:a17:90b:224e:b0:286:5625:ed09 with SMTP id hk14-20020a17090b224e00b002865625ed09mr98046pjb.28.1701823161808;
        Tue, 05 Dec 2023 16:39:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id pi11-20020a17090b1e4b00b00280a2275e4bsm3087758pjb.27.2023.12.05.16.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 16:39:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0f9710fc-8246-4265-a32f-ebc4fa3eefde@roeck-us.net>
Date: Tue, 5 Dec 2023 16:39:19 -0800
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
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6199c59b-1307-48c2-ae9a-254ab2d578c0@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/5/23 15:22, Helge Deller wrote:
> On 12/5/23 23:52, Guenter Roeck wrote:
>> Hi Helge,
>>
>> On 12/5/23 13:58, Helge Deller wrote:
>>> On 12/5/23 03:39, John David Anglin wrote:
>>>> On 2023-12-04 8:08 p.m., Guenter Roeck wrote:
>>>>> I started to play with the new qemu hppa64 emulation.
>>>
>>> This emulation is in the first row planned to be able to
>>> be used with 64-bit kernels (until we hopefully once get
>>> 64-bit userspace).
>>> Sadly there still seems to be a bug in the emulation
>>> so that it fails when the kernel is built with specific
>>> modules.... :-(
>>> I still don't know where the bug is though.
>>>
>>
>> I don't try to build / load modules, so I don't see that problem.
> 
> Good :-)
> 
>> Couple of observations:
>> - There are spurious issues if I enable more than one CPU.
> 
> Interesting. What kind of issues? Spurious interrupts?
> 

Frankly I didn't check details. I just noticed that I got a high
percentage of test failures and gave up trying after I realized
that the real hardware doesn't support more than one CPU.

Is it worth testing with multiple CPUs ? I can re-enable it and
check more closely if you think it makes sense. If so, what number
of CPUs would you recommend ?

>>    I am not sure if that is realistic (the emulated systems seem to be
>>    single-CPU systems)
> 
> Yes, but shouldn't matter.
> 
>> , so I dropped those tests. Historically
>>    (with older kernels and/or older versions of qemu), multi-core boots
>>    didn't work at all (they were slower than single-core),
> 
> Not sure if this is the case here, but for older qemu's you need
> this option so that the virtual CPUs are put into their own threads/cores:
>      -accel tcg,thread=multi
> This option isn't necessary on newer qemu versions.
> 

Ah, that might explain it. Thanks a lot for the hint.

>>    so there is definitely an improvement, but it isn't stable enough
>>    to use for kernel regression testing.
>> - The e1000 and e1000-82544gc network interfaces don't work
>>    (those work fine with the 32-bit emulation)
>> - ne2k_pci doesn't work anywhere. I get either a hang or a spinlock recursion
>>    error if I try.
> 
> I will try both, but at least for 64-bit emulation I might have an idea.
> 
>> - Not sure it if is worth mentioning: There may be hung task crashes in
>>    usb_start_wait_urb/usb_kill_urb during shutdown when booting from usb
>>    or when using an usb network interface. That happens with all emulations,
>>    though, and is not parisc specific.
> 
> Did you reported it upstream in the bug tracker?
> 

No, because I have no idea if it is an emulation problem or a linux problem.
I never had the time to track it down. I just noticed that it seemed to be more
prevalent with 64-bit parisc especially if I boot from usb _and_ use a usb
network interface. In case you are interested to see how it looks like, here
are a couple of examples:

https://kerneltests.org/builders/qemu-riscv64-5.4/builds/46/steps/qemubuildcommand/logs/stdio
https://kerneltests.org/builders/qemu-parisc64-6.6/builds/1/steps/qemubuildcommand/logs/stdio

Guenter


