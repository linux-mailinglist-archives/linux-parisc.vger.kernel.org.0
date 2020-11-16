Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB7B2B528F
	for <lists+linux-parisc@lfdr.de>; Mon, 16 Nov 2020 21:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732607AbgKPU3m (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 Nov 2020 15:29:42 -0500
Received: from mout.gmx.net ([212.227.17.21]:57273 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730751AbgKPU3m (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 Nov 2020 15:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1605558571;
        bh=cv+m0dBQ+pnh84ukYGqT4SNozWORrTwKHb1tK/SzOe4=;
        h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
        b=aeoFICsFkpIQuqxcGyq0hObjtTQVR8rAd+DXsaFsifv8480++D+l0pRVatRhkwDo+
         uMXy9WfEEmyz7aWdNkyxWIReL4gJmdC1RYWxFZLZyclx9CEdLMVTf4/IOtxf6hqakC
         /rAiO27HUk5nJcNiD+dO8XvAdiiqnZQb1/iLzTkA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.180.179]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeMt-1kinc02aWp-00VitK; Mon, 16
 Nov 2020 21:29:31 +0100
Subject: Re: HPPA support for IGNITE-UX install discs
To:     rs.rdp@zoho.eu
References: <519529904.604445.1605544518496.JavaMail.administrator@n7.nabble.com>
Cc:     Keith Monahan <keith@techtravels.org>,
        Sven Schnelle <svens@stackframe.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        qemu-discuss@nongnu.org
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <49e3e3cc-d747-58b8-c99c-19fbe7265b50@gmx.de>
Date:   Mon, 16 Nov 2020 21:29:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <519529904.604445.1605544518496.JavaMail.administrator@n7.nabble.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mxasz9zjZpt/EjEeMpFUENV3HG3uizSurjA9H9qsWVUlO281LiM
 heyxi/yppwTiX8uFKsvVDzsOvFMxyj+4DoPcYBJB2TjwQk1M1uNIcpwCwJ7G1hCiIey37vz
 34KuVMnUtjyUx2vpk6ng3QVxz8/1t4dtgg4hBybUYrZouEGakYeTFVeK+fC8yVNtkwvx9e8
 F5pRM4qOzJy04hc0YG3xQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9SC7wN3+5cw=:5raf+hhRNwYf4Gdlx4wfq/
 ri3i892CbAhb3LoJ/FuqxAF+NFNvWG0tUo9ze5jzqHvo/680p0JV/IcGI/a0mXsdeVzIyIMnE
 kTuCKAp5sWjizDjGSn14zOQyP8N9SLIalgxgwcfF/2lCQ0xpvFpval1RKY7ZI9gzGltj09TfS
 xlxuiqplQmMu/6Hp6MsyzxodRLEOBTHpQhhnGDw/DSmBdey/nn3hD7rgsWMKWuLsG4DFzIJg6
 jNsNpqtsXcQOqoaISvQNrqGXXctIyAo/ssh4yJzLiVcoEnOa0hGfgXfnU+9ZVFe7uYmDdUNNG
 oOpCfwB1UhiwfhQ/EPleMf7lAtJNfgNC2VHnFtjLWzleyhBEYyzNwsdQnDeRlLQ0mPdJZHo5N
 01vixXGcRDK+eFv0DrjR9k2AbZPmJszQfpY4sDb8465J/sQL/cn6CZ7uvVGoLusRFvV5qZPXB
 yA6dPUJFq6FzyY9ha+V6KG7n8ezoseSNlN9tjda/0q2JNmQVSDgeb35codLoJqANY1Mmh+A4V
 vZl49fz/ZO0dPoRCJeWvP9ihhTX/Il9AvZetULVDemjpfm2oNg3Br+u96zyslHAM7fgevP0Av
 JgxErKrZXYYhzjMAJ22liM/BWXdTz1cNJQb6dAA2UJZk5/FkDF4V8MMkprrI8C9UmkpkNzaxh
 2nx7xp+qpU6EyYW79KlR4yeXCEFDlPVGWErY/XbxDnjV0kWjq/KT2Yy9Y8RqQNWmGcfFrqdsN
 oh6WPsloLNyDM/U2kCxa9ucWylCYkdOH7NZaiCBpApFjvWnm0ncBk8bNE654s+Ea/Y4hZn9J8
 9iwtnl9xEaCTGij386Yfzx+o+9Mq24wJXeVRok+6Y2PxJ3DZQlgpwyREFDdyHJlOlh9vhePsF
 MjkOKz5sUS96NXQ6YSUg==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/16/20 5:35 PM, rs.rdp@zoho.eu wrote:
> In qemu the B160L emulation isn't complete yet.
> The SCSI disc is emulated by a "virtual built-in" PCI SCSI card, while
> the original B160L has a NCR 53C710 SCSI chip internal in the LASI
> controller.
> Additionally the LASI emulation isn't complete either.
> My assumption is, that your Install CD for the analyzer will only detect
> real LASI/53C710 chips and ignore the virtual PCI card. That's why it
> doesn't
> detect any discs.
> _________________________________________________________
>
> Many years ago I had to install HP-UX 10.20 on a 712/9000 machine.
> At first I tried with a third-party SCSI hard disk, unsuccessfully.
> Then I replaced it with an HP hard disk and could install the os success=
fully.
> So I would confirm that the 10.20 installation process looks for HP phys=
ical drives and don't accept anything else.
> Any chance to deceive it?

The IGNITE-UX install disc doesn't detect any *SCSI controllers*,
so I can not say if you need real HP hard discs in this case.

> It seems it's not so for the 11.11 installation: I'm just installing it =
on Qemu.

Yes, there the emulated LSI 53c895 SCSI controller is supported & detected=
.

Helge
