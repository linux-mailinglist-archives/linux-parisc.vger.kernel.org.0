Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77162EDA9A
	for <lists+linux-parisc@lfdr.de>; Mon,  4 Nov 2019 09:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfKDIcz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 4 Nov 2019 03:32:55 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46763 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfKDIcz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 4 Nov 2019 03:32:55 -0500
Received: by mail-wr1-f65.google.com with SMTP id b3so10162675wrs.13
        for <linux-parisc@vger.kernel.org>; Mon, 04 Nov 2019 00:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XF7J+DG7tWV9RXyc1r5Ixjph12lPvVDvV5bwthUbBEI=;
        b=FZhgUCwUZX7igZi16yQODx8+KbkHGclBlDJjHYCZxM7KjufVHj1csQ1x5nU3ZRUFHy
         W6P9jDawE7Aci66askzFeHB+6ipqKGEIDPN2Ki1vkVD8jIZdzdVPPYWAaH9cUTuCQGcu
         mtMasHpUeWbSaJ5F7hZ/6NQ574mhrl4uqfRZE8El7uTMrRhF5gbGUZYwLU9a5kvxVE/L
         k4FbZTQzVozpd/OHSfrPOPT/2ZE3nmsKoaKh0pdcsjJFPZUbMDzqQKX+3+8VrIUAWPbz
         Dh2lV4z13F7IEOp8RrfBBB0mXD8VVMXOiUwDIV2Fvb8GQi4ZrkAH1gqu/gdbTfTKb/bR
         gbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XF7J+DG7tWV9RXyc1r5Ixjph12lPvVDvV5bwthUbBEI=;
        b=lmGu0bIVa7rrJNVeKMg8+ufcWQPOKrE99FAciLw7GmXeATB3x6Zth9ibRVHH2wF1lj
         bvsCKix8ANpVj0VFYbOCj1gFoNUEkrkldvNYoWd9Y4SBlGARBZTJqVxePmviHfA6EgrA
         hWaojdpSXCYrQEOqS0kVQ1GOZZG99/7KCXZclk354lsL2XDrGMzfv8hHsDhQ4Yl7PPoy
         iJ58MACIqRRcAu2gK0tQ9SaBrSs3KG/2O/KWDZhLm3bYgvLhIsbd0lO03F0Qc7s+azdi
         zuMW3DyPVgKwl/kddlJ69hHiLGqunCvGyNTMQAr9biW/NYRIn8bZMJnyI8lKtbVfKv2O
         fL3g==
X-Gm-Message-State: APjAAAWGutona1v9Me1lS1lb2xInLJR53uYHLQLY/NTWtbZqNQSEP4Yg
        UpimWihCTEO/fb0s13wfafDeOw==
X-Google-Smtp-Source: APXvYqy3vFTV9LTgmQjmmhjTc6kU9Rr4Y6pS3SE6yuds7uL1u/ShsusG3J537rgd9MSMTZj9mf8vxA==
X-Received: by 2002:adf:fd08:: with SMTP id e8mr1452202wrr.42.1572856373332;
        Mon, 04 Nov 2019 00:32:53 -0800 (PST)
Received: from [192.168.86.166] (83-86-89-107.cable.dynamic.v4.ziggo.nl. [83.86.89.107])
        by smtp.gmail.com with ESMTPSA id z13sm17303360wrm.64.2019.11.04.00.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2019 00:32:52 -0800 (PST)
Subject: Re: ALSA: pcm: use dma_can_mmap() to check if a device supports
 dma_mmap_*
To:     youling 257 <youling257@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc:     linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>,
        x86@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k@lists.linux-m68k.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, hch@lst.de
References: <CAOzgRdYSaaF6OkXGME2=fn1dfTbpyt_GqEs=10oXH=V6SudfyA@mail.gmail.com>
 <s5himo0cbmm.wl-tiwai@suse.de>
 <CAOzgRdYTa-nAa7QV6c2aZs910BACg91vAjcjw4V-Oy8KCZVmmQ@mail.gmail.com>
From:   Greg Kroah-Hartman <gregkh@google.com>
Message-ID: <60ee349a-1fe7-46f0-5161-1dcfcb6fbee9@google.com>
Date:   Mon, 4 Nov 2019 09:32:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAOzgRdYTa-nAa7QV6c2aZs910BACg91vAjcjw4V-Oy8KCZVmmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/4/19 9:27 AM, youling 257 wrote:
 > This driver 
https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/usb/gadget/function/f_audio_source.c
 >

The driver is broken and needs to be fixed.  Please feel free to submit
patches to AOSP to do so as you can trigger this easily.

thanks,

greg k-h
