Return-Path: <linux-parisc+bounces-4355-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11ACCCC76
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 17:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32B5A30536A8
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Dec 2025 16:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D0C28751B;
	Thu, 18 Dec 2025 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTPIjgri"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DA123D7F7
	for <linux-parisc@vger.kernel.org>; Thu, 18 Dec 2025 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766074946; cv=none; b=Vf6GKyf0f3lfYl6DFxKG5DVRAlKAqWiTiGwq00HmSB4FpEyDyK1d0aHvSpgHmRqafwnMHkoRokdo8HSH9eilB7Ua9GNS5Hqv9L9AuephL94/PZRoO3+1+OXldrE86VUymS5ZxED1eb2FWnjhCGkcS5v4szLPHZm78Hk32xZ9UiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766074946; c=relaxed/simple;
	bh=SaG2urrRmxi0OuzD0Rf31kBZP0SJ7A4Epc0+j+T1yt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qymv5kotOBw1dlJTwkLgNV/e1XacZ6EzoJcF2wQLRncO1HBw63GFe6s0sxmwj2QM44CqBRQGRh4gZD3tGdFCSZA9oYC9v/G8K0OJq4uZ1VBl23R+W0lt0rz4v11A+/xWuMKFr5mpJrCu6sCsIimdp4SxRfJbVtQT5qz3TpY8cK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTPIjgri; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a102494058so9973655ad.0
        for <linux-parisc@vger.kernel.org>; Thu, 18 Dec 2025 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766074943; x=1766679743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VHZxWg8SmFf+BlwruBFTfWNayJ5AKYw+FscQwTUOj+c=;
        b=XTPIjgriIhKF/aAoOn+pRNRH06hAfj2LcNx6ixZ0RSq9K7zn7dGNTIFHRvuBeMjRAm
         YO+oVHp2j32ejdRc1zsGwS2kNUgCCHTWAAWhAgWRS4qNLI1XMJKij+/3F7OS5OKYElIL
         wjIkeHxGLG+6X3s6ZaAvektmoGoS3n5OamFwn+WT++yKupWI9yzMpnwUmDPHX50yB0Ow
         A4ZKjLb/o4SctMZp2OQBa+nqyK6LOlAFZVOcXLIzgkRVAv6vV3sls963XagOzYrEJ2O0
         4xTAHbui0ilGAKS1TPgbfHqS5ZRRE4zmZ4/ijIeYWb/Gdjr5uC27nIDXdq2Oi+Z04qaK
         yoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766074943; x=1766679743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHZxWg8SmFf+BlwruBFTfWNayJ5AKYw+FscQwTUOj+c=;
        b=K6KxuGcdvmfw6NEt4HFWRStCy4s4h/e4hvnnwU2RRUGT0/AD1YXwR5GVv5L3Rbenp2
         pYPB//ssdnnsf9ewQzLD7o7rEc+XYByTtHTp432fsugRGFyowVfLlraeZaYR5ITK4Izv
         cY0MNSS2KKjEQ0IQ79BQ7oGS2lwovC4n3TXAv2sI1w4byI7cNahhoMHZRHupscxSbbif
         t3+bE0e2lTXMAbAKolPyOZnJA3K5qQ0VzMcKxQkf3TQfWT8QVs6m77rkz9ocv1dPeEgr
         BPVEdLR5Vg8Fny+CmlFKJTJL/rpyl+/a+UBVGc+bujAYS07cYA32zDYg/arrGW/H2jSS
         kXqQ==
X-Gm-Message-State: AOJu0YzE6QBHbpAsZP+iE5Zb7wpo3gHolsnFRizSzqAUfEKhMu0JI7nD
	/p7Jj5dYP3jQ8t8S1vs3ldpD7HRoDXlQ2eiLwpJGjBhhlqE+4ueALhPK
X-Gm-Gg: AY/fxX6ZwAa54NBnYrmBU41w9EUPO0xfqX19Z+fR5JC7TZtPJyUHp/9/LuL6uhGGuDo
	g1h1NwTwb8JuYK8Bqc95d13wScUSXbGrpkUXP0MWEg12QG8TMSwmKU+p5ArMWXIWoMU3HA9ynws
	ZhF7ku+a2J7+ze/1Q/Ne4wZKfp7YszYzF827b2C3BewadQupv6zoGrK2UTSg1toR0rYk4MEmc1A
	wpzqUCrnZURF+uF6PIzh4JPIaFZYFpaPMxQzyF4Ba+kCk4SFo0d6qLADe3SWvnM+MIBV0t2Ikow
	vaH/1UPMaXbcsRjkRiD4eQbAc5kUQi0NXsbB+o8hryuCzRfQJx7ns3tRWaBFq4CdTGROC3ruMJJ
	KbXyiYWHOxznSq0+8x50Q/GV+x3p78ZL2jczldZznwQEs+3Ng43eaVXuhrE2u1LKNWmVBYKI/Ws
	Ck5/UvYq/rRAb8gSvGfXsvJ4iVrJ71JzkBqTifqOn717BCeR9Dld+9d8TEGIxn
X-Google-Smtp-Source: AGHT+IEmFYZ1EylYk3GpVeCGaZj1mfUZ0vvbKpitP+V3UNgms7wBX/hdCS7qRlaMOT8kAQ0XIIk7qQ==
X-Received: by 2002:a17:903:2450:b0:2a0:e5c3:d149 with SMTP id d9443c01a7336-2a2f0d40410mr948355ad.23.1766074943343;
        Thu, 18 Dec 2025 08:22:23 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c606sm29886035ad.3.2025.12.18.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 08:22:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bc6a3b96-8954-4c79-928d-4035179b09e6@roeck-us.net>
Date: Thu, 18 Dec 2025 08:22:21 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_parisc=3A_Set_valid_bit_in_high_byte_of?=
 =?UTF-8?Q?_64=E2=80=91bit_physical_address?=
To: Leon Romanovsky <leon@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/18/25 04:08, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> On 32‑bit systems, phys_addr_t is defined as u32. However, parisc
> expects physical addresses to be 64‑bit values so it can store a
> validity bit in the upper byte.
> 
> Resolve this mismatch by casting the physical address to unsigned
> long, ensuring it is treated as a 64‑bit value where required. This
> fixes the failure to start block device drivers on the C3700
> platform, as reported by Guenter.
> 
> Also remove the now‑obsolete macro.
> 
> QEMU command line to reproduce the issue (with Debian SID as rootfs):
>    qemu-system-hppa -machine C3700 \
> 	-kernel arch/parisc/boot/bzImage \
> 	-append "console=ttyS0 \
> 	root=/dev/sda rw rootwait panic=-1" \
> 	-nographic \
> 	-device lsi53c895a \
> 	-drive file=rootfs-hppa.img,if=none,format=raw,id=hd0 \
> 	-device scsi-hd,drive=hd0
> 
> Fixes: 96ddf2ef58ec ("parisc: Convert DMA map_page to map_phys interface")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net/
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>


