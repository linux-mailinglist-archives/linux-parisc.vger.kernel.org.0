Return-Path: <linux-parisc+bounces-211-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A438780DEA4
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Dec 2023 23:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C4971F2190B
	for <lists+linux-parisc@lfdr.de>; Mon, 11 Dec 2023 22:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC37055C1E;
	Mon, 11 Dec 2023 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEybCfC7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58DF10B
	for <linux-parisc@vger.kernel.org>; Mon, 11 Dec 2023 14:52:51 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-28865456abbso3623719a91.1
        for <linux-parisc@vger.kernel.org>; Mon, 11 Dec 2023 14:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702335171; x=1702939971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UbjfBWM9lAEplnTzesLqxXWfLCMjBuqQNDdPaFBOUw0=;
        b=dEybCfC7s7qbLCP7YP8Hr9E36eljhdEJ740J0ixYhTpw7Yn7KMFyXafcZv8pAbO4c2
         AFRnr9wtdBdwFQj1QnPXNimY6uE26YjM4wgVuuZgbpWKh/pcaqHTCjT6A3zWh3DYLP19
         CgALojfa4B4OzoeYTPzLLGOO6PyYBq+/3ooppRc542OYOxQHJJcH1VRKrEQlZsL1i9bl
         39waJYMT5w6QfY1SqZimKzOXenb/VbHVAeVYPHegC56Owt0dKb1UHj/OQfzMGKAYTJY6
         Wh4ZGVXyKxInFoBAXwEGap54UIJs9FvqjZCmarsf12NL5ir0t910NIV+/pS+Wz2luVO2
         FNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702335171; x=1702939971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbjfBWM9lAEplnTzesLqxXWfLCMjBuqQNDdPaFBOUw0=;
        b=jFAZojF9NuaiuYEc3xUzNeCjRIejn/QATwHYypId+1JLkhA9QN+QfiSCsK7tDn/uKr
         e7qW/lbRvGxJnnE0NS4+RLmJ0dQRxKMAKklKxA9rBmGS5x7fniPMF7cmTr6DfHm8jTix
         L5HhMa/fSVMtJOGtnBEwNg3cycWGkJ465lJ9SUMQSpTExfyfc+CiNHuy4EyrMZmpPj5h
         QhYlFS1HccpGzu40FLGYzf7WDOJfMh7ffvh283daWcMCbYzTToVFs7UcuGluhUI1Bs5/
         u37FoKWCNtAKZvL0q/tXpUJzboaulSwBOzzRATFHcY/lXGLH1cLswEIzyjIyOkxQIv6g
         6Yag==
X-Gm-Message-State: AOJu0YycCsGxrWxKYQk+ewRq9dw7OejUMafou+zf1hSun6q/URYn96KC
	JgPkGoTtkP5QTvWlt0cmAoE=
X-Google-Smtp-Source: AGHT+IG+M2SnCQAOzQWy7P3ggLrO7VIaPmLA2VREDBEr7RbykhT6Y3EW+P7cPYBy6aLxdUJZQuteVQ==
X-Received: by 2002:a05:6a21:6da1:b0:190:18d4:6580 with SMTP id wl33-20020a056a216da100b0019018d46580mr3278911pzb.53.1702335171007;
        Mon, 11 Dec 2023 14:52:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d1-20020a170902728100b001d087820175sm7159386pll.40.2023.12.11.14.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 14:52:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58884990-d1d8-458a-a7a2-babc0e2ce98a@roeck-us.net>
Date: Mon, 11 Dec 2023 14:52:48 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
To: Helge Deller <deller@gmx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
 <4ba17f2d-632c-4c49-a9d0-46324b5e5d7e@roeck-us.net>
 <68c3b5c9-4986-48c6-9cdb-52da59486e4c@ilande.co.uk>
 <f3777cce-31af-4632-9480-bc1f78285d2f@gmx.de>
 <df586906-2950-4b55-b26a-50e75d25f195@gmx.de>
 <8f1f2bf0-29aa-410a-8ecb-af61ba9c6dad@ilande.co.uk>
 <9d064661-3568-47f8-890c-4c05027e9999@gmx.de>
 <b22d59ff-bb79-4660-834a-ebbcd10c5ac8@gmx.de>
 <2924c887-0022-4cab-a986-0afd5f7a50f4@ilande.co.uk>
 <3b82d9e7-5b26-4154-a253-9bbbb04cf617@gmx.de>
 <4254a11b-d603-4a6c-9c81-ac7403ae940f@roeck-us.net>
 <0284662a-8eaa-495c-96bc-213b719d40a6@gmx.de>
 <8b356e0d-988e-4fb3-a2c6-7b8acb306b9c@ilande.co.uk>
 <44dec9d0-8715-4ae6-8abc-31159529470d@gmx.de>
 <046e9f36-5086-4d87-8187-94558f52fef9@ilande.co.uk>
 <17a5173a-a596-4ea8-941b-3c9b5492e4b7@gmx.de>
 <e6420598-df13-41e5-b6f2-e469db5473db@roeck-us.net>
 <d68c9ade-9b5e-4ccc-ba72-4c5ef98750a5@gmx.de>
 <6933d337-9ba8-4336-8638-d74321c7cbd7@roeck-us.net>
 <09b4445c-421b-4be0-a6bc-33fc05232d6d@gmx.de>
Content-Language: en-US
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
In-Reply-To: <09b4445c-421b-4be0-a6bc-33fc05232d6d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/23 13:38, Helge Deller wrote:
> On 12/11/23 18:26, Guenter Roeck wrote:
>> On 12/11/23 07:53, Helge Deller wrote:
>>> On 12/10/23 22:59, Guenter Roeck wrote:
>>>> On 12/10/23 13:42, Helge Deller wrote:
>>>> [ ... ]> I actually don't know if null-bytes are transferred.
>>>>> But ext4 reports CRC errors, so I added this hunk to the Linux kernel:
>>>>>
>>>>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>>>>> index d7732320431a..9b12fbd44e06 100644
>>>>> --- a/fs/ext4/inode.c
>>>>> +++ b/fs/ext4/inode.c
>>>>> @@ -4732,6 +4736,9 @@ struct inode *__ext4_iget(struct super_block *sb, unsigned long ino,
>>>>>          if (ret < 0)
>>>>>                  goto bad_inode;
>>>>>          raw_inode = ext4_raw_inode(&iloc);
>>>>> +// printk("raw_info  provided %px %x\n", &raw_inode->i_checksum_lo, raw_inode->i_checksum_lo);
>>>>> +// printk("  iloc->bh->b_data %px  iloc->offset %lx\n", iloc.bh->b_data, iloc.offset);
>>>>> +if (raw_inode->i_checksum_lo == 0) asm(".word 0xfffdead0");
>>>>>
>>>>> The last line immediately stops qemu if the checksum is zero.
>>>>> I start qemu with
>>>>>   ./qemu-system-hppa -drive file=../qemu-images/hdd.img.new,if=none,id=d0 -kernel vmlinux  -append "root=/dev/sda5 console=ttyS0 single earlycon=pdc"  -serial mon:stdio -smp cpus=3  -machine C3700  -nographic  -snapshot -device am53c974,id=scsi -device scsi-hd,bus=scsi.0,drive=d0
>>>>>
>>>>> qemu aborts with the am53c974 driver.
>>>>> If I use exactly the same command, but with the lsi53c895a driver instead of am53c974, it boots correctly.
>>>>>
>>>>> Any other idea?
>>>>>
>>>>
>>>> Does your code use scatter-gather DMA ?
>>>
>>> Which code? The kernel which mounts the ext4 filesystem?
>>>
>>
>> Seabios. Sorry, I thought your problem was with that.
> 
> Yes and no.
> My main intention was to test with the Linux kernel primarily.
> If this works, then it's easier to test the SeaBIOS code too.
> 
>>>> If so, that might explain the problem.
>>>> I don't think the qemu code implements that properly. I don't mean the MDL version,
>>>> that isn't implemented at all. I mean the non-MDL version, where a single SCSI
>>>> command requires multiple DMA transfers which have to be set up one by one.
>>>
>>> Is there any way I could test, e.g. by disabling SG ?
>>>
>>
>> No idea, but that makes me wonder if ext4 and other file systems somehow trigger SG
>> operation while ext2 doesn't. I'll do some debugging along that line.
> 
> Ok, thanks!
> 

Nothing conclusive. ext2 always passes, ext4 and btrfs sometimes pass, sometimes
fail. They also sometimes fail with lsi53c895a, so that isn't the determining
factor. I always get the "Unaligned handler failed" error.

Guenter


