Return-Path: <linux-parisc+bounces-204-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 197FD80BD76
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Dec 2023 22:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 641D6B2077E
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Dec 2023 21:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549FF1CF86;
	Sun, 10 Dec 2023 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkL1XprQ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8131BCF
	for <linux-parisc@vger.kernel.org>; Sun, 10 Dec 2023 13:59:33 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7b435966249so178950839f.0
        for <linux-parisc@vger.kernel.org>; Sun, 10 Dec 2023 13:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702245573; x=1702850373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o4xsNFgrlT7MJakSX8XPmo6T1M/MLAclQ5PQAqayXO4=;
        b=DkL1XprQDe7gNIkxn9Ube5+1Wk5WMl7CYNKcGv3T/LvRwa+wilLWzc6P70kHrR9Xlm
         PnmuWuGWlhu+gL/M3K3yY5r9vLklLzw9vEdoDiw9i0d3cjeHA3pzUzFuCIH4xlHiqVWo
         nHx6MA4mnP8JDZRaHFWNgJ+MSvonmbR+Bwl4UrwxDoDSBRbZ2Ff4OLgBB7jpo5tW4BD9
         eOQ5v4U13CwXU3fCRgHYxShe9TIOdLNgKdjL0IEIlJ5nTZ9MWIybac0viOjkODeUGEry
         GAVzN8mgRgyrxkRTuSzwAWZC0HvQEXkF+hBieN7L+xtP++fI8aI7FZOW4T1JE5PUaYZE
         wqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702245573; x=1702850373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4xsNFgrlT7MJakSX8XPmo6T1M/MLAclQ5PQAqayXO4=;
        b=An+jsnYHHcDtehzZ67fsUryEKfGozGEUQE0WWQ/qDqywQNPTRdjwB6rU3qeladbCao
         QWm+9E2B3qOV/4JYu0ZMPnBuzAw98vkPtzZsiLF8Q+LOUNjcR/1geucorCq1gzT4vPsj
         qbiWKfM9vpvmeKgMPzAGxiTtZkDL04GW/bLD15pLmQa1bA/uDUYriEmaMSMFT+6UNS/W
         Womgz1UJ4gtu3BFbgEVLux/o40FxxloRBLUPH7WW8JQpXMGcb7X+Zp2TWfhM07L6DeaP
         sJhvzTGCsG81vcZ6z4qopoQQEiTKoL/7u5AU+T7OHzGiWWXN4MBTLqSLkNuAVsQr5rGl
         YUmg==
X-Gm-Message-State: AOJu0YwirpjtWKfMV4u2wdQlyKU4hiF95atUtvsgXNpUou7JfvskU0g/
	LtGO2sgSIaNxAZ2eESITPfw=
X-Google-Smtp-Source: AGHT+IHEcCCJH1tnByK1eb976t1QQW2ENSJcd7XK4ukZTDU+YdOxNKjCU3r7dgLUdD59o0sbo4bEgg==
X-Received: by 2002:a05:6e02:148b:b0:35c:e721:e595 with SMTP id n11-20020a056e02148b00b0035ce721e595mr5373813ilk.3.1702245572821;
        Sun, 10 Dec 2023 13:59:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902ecc200b001d05fb4cf3csm5214040plh.62.2023.12.10.13.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 13:59:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e6420598-df13-41e5-b6f2-e469db5473db@roeck-us.net>
Date: Sun, 10 Dec 2023 13:59:31 -0800
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
 <4254a11b-d603-4a6c-9c81-ac7403ae940f@roeck-us.net>
 <0284662a-8eaa-495c-96bc-213b719d40a6@gmx.de>
 <8b356e0d-988e-4fb3-a2c6-7b8acb306b9c@ilande.co.uk>
 <44dec9d0-8715-4ae6-8abc-31159529470d@gmx.de>
 <046e9f36-5086-4d87-8187-94558f52fef9@ilande.co.uk>
 <17a5173a-a596-4ea8-941b-3c9b5492e4b7@gmx.de>
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
In-Reply-To: <17a5173a-a596-4ea8-941b-3c9b5492e4b7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/23 13:42, Helge Deller wrote:
[ ... ]> I actually don't know if null-bytes are transferred.
> But ext4 reports CRC errors, so I added this hunk to the Linux kernel:
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index d7732320431a..9b12fbd44e06 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -4732,6 +4736,9 @@ struct inode *__ext4_iget(struct super_block *sb, unsigned long ino,
>          if (ret < 0)
>                  goto bad_inode;
>          raw_inode = ext4_raw_inode(&iloc);
> +// printk("raw_info  provided %px %x\n", &raw_inode->i_checksum_lo, raw_inode->i_checksum_lo);
> +// printk("  iloc->bh->b_data %px  iloc->offset %lx\n", iloc.bh->b_data, iloc.offset);
> +if (raw_inode->i_checksum_lo == 0) asm(".word 0xfffdead0");
> 
> The last line immediately stops qemu if the checksum is zero.
> I start qemu with
>   ./qemu-system-hppa -drive file=../qemu-images/hdd.img.new,if=none,id=d0 -kernel vmlinux  -append "root=/dev/sda5 console=ttyS0 single earlycon=pdc"  -serial mon:stdio -smp cpus=3  -machine C3700  -nographic  -snapshot -device am53c974,id=scsi -device scsi-hd,bus=scsi.0,drive=d0
> 
> qemu aborts with the am53c974 driver.
> If I use exactly the same command, but with the lsi53c895a driver instead of am53c974, it boots correctly.
> 
> Any other idea?
> 

Does your code use scatter-gather DMA ? If so, that might explain the problem.
I don't think the qemu code implements that properly. I don't mean the MDL version,
that isn't implemented at all. I mean the non-MDL version, where a single SCSI
command requires multiple DMA transfers which have to be set up one by one.

Guenter


