Return-Path: <linux-parisc+bounces-198-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E406C80B6F8
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Dec 2023 23:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 989C5280ED8
	for <lists+linux-parisc@lfdr.de>; Sat,  9 Dec 2023 22:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845AC8468;
	Sat,  9 Dec 2023 22:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/rRsUDO"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FBAF9
	for <linux-parisc@vger.kernel.org>; Sat,  9 Dec 2023 14:57:43 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3ba04b9b103so41879b6e.0
        for <linux-parisc@vger.kernel.org>; Sat, 09 Dec 2023 14:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702162662; x=1702767462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kX3wQF2xwkkc0oFgtj3xlbuSeqRmG1LTTRYRzARkVlE=;
        b=S/rRsUDOswta+yBfk5z87McflyMjJqs4nPjFpew95yGG3IsmcbxVgBht+FlrDbJ9hA
         o6q3MqXzlrSNguZkKuq3DjvtsUe7pAgNlrnnBQAJv/evUJZgErG77atoVqOIs3kqauFH
         Lm/uwjd5Xyly8QPWeJFXG8d3lBt68sXHOV4wKoCd7LBoMqmUmzNIjZzDa0Jqdwp2GFQx
         QohJhl/qcSuc1/zMs+k0fzwGO8siRzetarHQR2IQoTDwUT0rQjb6muRIjSpM84DKz529
         4IRPMW9cqb4LD19f1l1O572PXHu800JEGlMNrEG6B22O4CxWZ3rRll/SDHof7LVAHYpE
         CNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702162662; x=1702767462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX3wQF2xwkkc0oFgtj3xlbuSeqRmG1LTTRYRzARkVlE=;
        b=hNsyX1BEjBjqvs6fe8S6nT362L/kuWEHJa7sZ8NG+oTFXvp7U7/yq/5VUcSRXRNp36
         nWqYDAb8xcZ58zf7vOSqSPSzgkYhq7KJSGbaPUJt6RAs6OnVpX1p2BI5GfKZI/F1CCad
         OilZaHuvEpDqW8/6OKbXuTKMbcF26+K0XVZtRyePnn6mjiVU71SkHdzy/Bw9UXjOhsHm
         DgrD2rFjTQBPJ9jAzrE2ZlLeSbpRot5vFyVqzovo765qFqXWAFsGNA8riAwwlGGhKw1E
         yIWxKZb+c23Lvh9lOjiV6m+PNUzQT+5eujRk1MQuItbTZU6SM0zr3wyTRNny3WYL0BOO
         J5JQ==
X-Gm-Message-State: AOJu0YxRl132cHXiji5mn0KjcfFE15bU/EgWgB7Y0INxwVu3Nx7aOZXJ
	ruvBSJjuEjwayysGq478rPM=
X-Google-Smtp-Source: AGHT+IEFcdQia/1JCJea1Dhn3sket67CqBl+UqlPCo4ZU2uQDp//I+kT435xoSqDg2Pg9/t69YuQTQ==
X-Received: by 2002:a05:6358:f57:b0:170:17eb:3799 with SMTP id c23-20020a0563580f5700b0017017eb3799mr1690964rwj.65.1702162662043;
        Sat, 09 Dec 2023 14:57:42 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id mp1-20020a17090b190100b0027722832498sm5716407pjb.52.2023.12.09.14.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 14:57:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4254a11b-d603-4a6c-9c81-ac7403ae940f@roeck-us.net>
Date: Sat, 9 Dec 2023 14:57:39 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 64-bit userspace root file system for hppa64
Content-Language: en-US
To: Helge Deller <deller@gmx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
 <c56601c1-f89a-463a-93df-db93133e8315@roeck-us.net>
 <4b6ef6f3-c3db-48fe-a3ee-1d874d510c7e@gmx.de>
 <12740a29-5827-4a62-8acf-a7b1b14f7099@roeck-us.net>
 <11088c05-eaf8-48ca-8767-bc55e78e1350@gmx.de>
 <9e5599dc-06ba-47ca-bdc1-8b612694a95e@ilande.co.uk>
 <5d811129-ca84-4f7f-bbc6-8f5fa0ce06c0@roeck-us.net>
 <97729a4b-5ef7-42ad-897d-a57cd9a5a5bf@ilande.co.uk>
 <a68b234a-c202-44ca-bb45-5cbb86b5729b@gmx.de>
 <ae5e04f4-3979-4a6e-8cff-58f69e41fb08@gmx.de>
 <015b31ba-f440-4fb1-af0c-265f484bc91a@ilande.co.uk>
 <4ba17f2d-632c-4c49-a9d0-46324b5e5d7e@roeck-us.net>
 <68c3b5c9-4986-48c6-9cdb-52da59486e4c@ilande.co.uk>
 <f3777cce-31af-4632-9480-bc1f78285d2f@gmx.de>
 <df586906-2950-4b55-b26a-50e75d25f195@gmx.de>
 <8f1f2bf0-29aa-410a-8ecb-af61ba9c6dad@ilande.co.uk>
 <9d064661-3568-47f8-890c-4c05027e9999@gmx.de>
 <b22d59ff-bb79-4660-834a-ebbcd10c5ac8@gmx.de>
 <2924c887-0022-4cab-a986-0afd5f7a50f4@ilande.co.uk>
 <3b82d9e7-5b26-4154-a253-9bbbb04cf617@gmx.de>
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
In-Reply-To: <3b82d9e7-5b26-4154-a253-9bbbb04cf617@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/9/23 13:58, Helge Deller wrote:
> On 12/9/23 19:56, Mark Cave-Ayland wrote:
>>>>>>>>>> The command line I used for testing hppa is below:
>>>>>>>>>>
>>>>>>>>>> ./qemu-system-hppa \
>>>>>>>>>>      -kernel vmlinux-parisc \
>>>>>>>>>>      -no-reboot \
>>>>>>>>>>      -snapshot \
>>>>>>>>>>      -device am53c974,id=scsi \
>>>>>>>>>>      -device scsi-hd,bus=scsi.0,drive=d0 \
>>>>>>>>>>      -drive file=rootfs.ext2-parisc,format=raw,if=none,id=d0 \
>>>>>>>>>>      -append "panic=-1 slub_debug=FZPUA root=/dev/sda console=ttyS0,115200" \
>>>>>>>>>>      -nographic -monitor null
>>>>>>>>>>
> ...
>>> If I limit the disc transfer size of am53c974 to just 4K per transaction
>>> (like the patch below against Linux kernel 6.6.4), then qemu-hppa
>>> boots up nicely with qemu git head (and Günther's patches applied).
>>
>> Nice detective work :)
>>
>> If you're using the esp-rework-testing branch then the only patch you should need is the patch to esp-pci.c: otherwise if you also apply Günther's esp.c patch then you break the reset of the ESP_RSTAT flags when reading ESP_RINTR. Can you confirm that this is the case in your tests?
>>
>>> No ext4 crc errors in this case.
>>> Mark, your git tree then still gives IRQ issues and other problems.
>>
>> Presumably this is just the "Spurious irq, sreg=%02x." errors, or are you seeing something else?
> 
> Mostly spurious irq:
> 
> [   41.561399] scsi host1: Spurious irq, sreg=10.
> [   41.562700] scsi host1: Spurious irq, sreg=13.
> 
> But later too:
> 
> [    **] (1 of 5) Job dev-disk-by\x2duuid-ac…ice/start running (50s / 1min 30s)
> [   72.700842] scsi host1: Aborting command [0000000016534e32:2a]
> [   72.700842] scsi host1: Current command [00000000320ffcdd:2a]
> [   72.700842] scsi host1: Queued command [0000000016534e32:2a]
> [   72.700842] scsi host1:  Active command [00000000320ffcdd:2a]
> [   72.700842] scsi host1: Dumping command log
> [   72.700842] scsi host1: ent[13] CMD val[01] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[01]
> [   72.700842] scsi host1: ent[14] CMD val[10] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[01]
> [   72.700842] scsi host1: ent[15] EVENT val[02] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[01]
> [   72.700842] scsi host1: ent[16] EVENT val[0d] sreg[90] seqreg[01] sreg2[00] ireg[10] ss[00] event[02]
> [   72.700842] scsi host1: ent[17] EVENT val[04] sreg[90] seqreg[01] sreg2[00] ireg[10] ss[00] event[0d]
> [   72.700842] scsi host1: ent[18] CMD val[90] sreg[90] seqreg[01] sreg2[00] ireg[10] ss[00] event[04]
> [   72.700842] scsi host1: ent[19] EVENT val[05] sreg[90] seqreg[01] sreg2[00] ireg[10] ss[00] event[04]
> [   72.700842] scsi host1: ent[20] CMD val[01] sreg[93] seqreg[01] sreg2[00] ireg[10] ss[00] event[05]
> [   72.700842] scsi host1: ent[21] EVENT val[0d] sreg[93] seqreg[01] sreg2[00] ireg[10] ss[00] event[05]
> [   72.700842] scsi host1: ent[22] CMD val[01] sreg[93] seqreg[01] sreg2[00] ireg[10] ss[00] event[0d]
> [   72.700842] scsi host1: ent[23] CMD val[11] sreg[93] seqreg[01] sreg2[00] ireg[10] ss[00] event[0d]
> [   72.700842] scsi host1: ent[24] EVENT val[0b] sreg[93] seqreg[01] sreg2[00] ireg[10] ss[00] event[0d]
> [   72.700842] scsi host1: ent[25] CMD val[12] sreg[97] seqreg[01] sreg2[00] ireg[08] ss[00] event[0b]
> [   72.700842] scsi host1: ent[26] EVENT val[0c] sreg[97] seqreg[01] sreg2[00] ireg[08] ss[00] event[0b]
> [   72.700842] scsi host1: ent[27] CMD val[44] sreg[97] seqreg[00] sreg2[00] ireg[20] ss[00] event[0c]
> [   72.700842] scsi host1: ent[28] CMD val[01] sreg[97] seqreg[00] sreg2[00] ireg[20] ss[02] event[0c]
> [   72.700842] scsi host1: ent[29] CMD val[43] sreg[97] seqreg[00] sreg2[00] ireg[20] ss[02] event[0c]
> [   72.700842] scsi host1: ent[30] EVENT val[0d] sreg[96] seqreg[01] sreg2[00] ireg[18] ss[00] event[0c]
> [   72.700842] scsi host1: ent[31] EVENT val[09] sreg[96] seqreg[01] sreg2[00] ireg[18] ss[00] event[0d]
> [   72.700842] scsi host1: ent[0] CMD val[01] sreg[96] seqreg[01] sreg2[00] ireg[18] ss[00] event[09]
> [   72.700842] scsi host1: ent[1] CMD val[10] sreg[96] seqreg[01] sreg2[00] ireg[18] ss[00] event[09]
> [   72.700842] scsi host1: ent[2] EVENT val[0a] sreg[96] seqreg[01] sreg2[00] ireg[18] ss[00] event[09]
> [   72.700842] scsi host1: ent[3] CMD val[00] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[0a]
> [   72.700842] scsi host1: ent[4] EVENT val[0d] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[0a]
> [   72.700842] scsi host1: ent[5] EVENT val[01] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[0d]
> [   72.700842] scsi host1: ent[6] CMD val[01] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[01]
> [   72.700842] scsi host1: ent[7] CMD val[10] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[01]
> [   72.700842] scsi host1: ent[8] EVENT val[02] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[01]
> [   72.700842] scsi host1: ent[9] EVENT val[0d] sreg[90] seqreg[01] sreg2[00] ireg[10] ss[00] event[02]
> [   72.700842] scsi host1: ent[10] EVENT val[04] sreg[90] seqreg[01] sreg2[00] ireg[10] ss[00] event[0d]
> [   72.700842] scsi host1: ent[11] CMD val[90] sreg[90] seqreg[01] sreg2[00] ireg[10] ss[00] event[04]
> [   72.700842] scsi host1: ent[12] EVENT val[05] sreg[90] seqreg[01] sreg2[00] ireg[10] ss[00] event[04]
> [   72.759532] scsi host1: Aborting command [00000000320ffcdd:2a]
> [   72.760847] scsi host1: Current command [00000000320ffcdd:2a]
> [   72.760847] scsi host1:  Active command [00000000320ffcdd:2a]
> [   72.760847] scsi host1: Dumping command log
> [   72.760847] scsi host1: ent[13] CMD val[01] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[01]
> [   72.760847] scsi host1: ent[14] CMD val[10] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[01]
> [   72.760847] scsi host1: ent[15] EVENT val[02] sreg[92] seqreg[01] sreg2[00] ireg[10] ss[00] event[01]
> ...
> 

Yes, I see that as well.

Guenter


