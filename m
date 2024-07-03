Return-Path: <linux-parisc+bounces-1761-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 352DD92668F
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Jul 2024 18:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B59361F23137
	for <lists+linux-parisc@lfdr.de>; Wed,  3 Jul 2024 16:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311E81836D8;
	Wed,  3 Jul 2024 16:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="JC8qDFQh"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F9317E907
	for <linux-parisc@vger.kernel.org>; Wed,  3 Jul 2024 16:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720025861; cv=none; b=jPIbCfO45DOJepAlXgN8Hye6NqHlssnEcjS8GJPxCz8mar9YoAV3N+GcBSDDfFjrvEIz1Woi+Bn6uvzEbqFNLzZEsEhd2JSEhgl8kBWEOpJvk/eHjDamN7aD2+lE6JkYbh8nLqJEFEpSTJP/tV2lZYeT4aOOW79ILlp5CkD3bFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720025861; c=relaxed/simple;
	bh=goNAMtCltOT0mcOXsd1n7BfK6EnelmZV1C+13+b0NKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QZ3EJLgHCjf9MGBfP6OEPxmScy3eTTzYuF2Tk+2i+ziQRv4aKOYebqdjKdvPVNsTcrSebsciVAHIy6bG9oemLAvlCfLISg+A4K3hA+t+ApXT3AyuNUtd5seyakwScRGA/80NbwuKx+6VvAlToodZ6y59cTMNFt9YxmqN+745xmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=JC8qDFQh; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1720025852; x=1720630652; i=deller@gmx.de;
	bh=Zq/bR/UXD1+DE1m33r//2zRE77MqTgPR5DI7YH5miNk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JC8qDFQhQanh9vFoh1AfNfVqMt0h5rAzdtR7wJdk9jihGgjlxjFlxoGtFHGNKhx2
	 aPJatW5T7aCeHsVu9ex2yNWpyuGIOCZhqDb2s3WqKja1s1gK5g3so3AOvVTVjrBEO
	 SZILdSUNKqhlNdSWCvgF/BGtNVS6WSVfYcyQymrEmf8sSAlmduD6PZOMW634X/0/V
	 ikTT9s5CaENl8aWn+65sQL9FmACRd3gf3ZHwwdnnzdwJiFZAEKBWcVxvYAOpmoiFC
	 Dwjv3Dyz97uUKgtprZyeWZKxOM+VeULkFPA8pYXyENGGIdhur+EReTefzEw+qH/jT
	 0qh5thGIZwGkrCbPtA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.33]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf4S-1rz68E34B0-00g04u; Wed, 03
 Jul 2024 18:57:32 +0200
Message-ID: <fcf1e50a-cac8-4a5f-afb0-bbf1e5abf7d7@gmx.de>
Date: Wed, 3 Jul 2024 18:57:31 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Fix warning at drivers/pci/msi/msi.h:121
To: linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>
References: <ZoKyUdlYiVBx-k7e@mx3210.local>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ZoKyUdlYiVBx-k7e@mx3210.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:srM3wSGlZuRkZhFN58qtNVCk1TbEp/wGQKNe9LIHP/nbCmVotym
 giXSRGL4lfQKN3w/s67UcqTviqJGxWrI5hYPGr1qKNdxIFQJgc7Qtx5I4dbJu5xQGjloLJG
 ebx5zhlMyXJKiHECT59OaWbyznGhaZlvJF2kglBLu8PSqoq7GXZI+MluoDwKosYiYc8kRGJ
 CdGAOiQ+trhAxRBVBKe0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XrcGBvkb+h8=;bQvqr8WQOg5ArwERtUXuRTRdUKZ
 xloLHSOCWuxmSprWVwkLZh+pg2KLOTiY5gCxj1bpkvmVv1nAkN8lhv3UFm16Nu52YAxRAz96n
 UkaN18eLSpRTr9VdAxVSiSs/qHSWVjcXsZ8Ge0CY/ePdGrGmB4SigQ4aw8izdZXADAPFn/YH2
 knaw7EKRGUvglOKgQIxn7pyDia+3t3wD0h42kxDqnJcZosK7Afgrk0O5aqd07exJ4XEgjvLY/
 6jlOCiFrCI7uiB+KpvOXhonDO1TNxeB7Igxa1C+eIUOeL0gAjNlSDpeZz8nxCDTiCMOYw/3pc
 E2b8b+cNOeOixQ/rxx47tEWjUs16ncsBA2j8YZ4l5duQWnupVTpH6y+s1HSC96aTfv01WimAv
 vUMHU9/WeulKjKtqMz1X/D1Ay1nNMMIMQqj8tub/+rdc5FQ8NitNaOA6kEs5ko5i3KtY7lwQt
 UKUiB8Qq8cLMSW9mncpg5Lpfs2+MsO4ZTEFyPuvNHI7y0koSz9BjEvxFQ4bthVGN1cDftmWL9
 007nof0MFB9FOBUVk2W9VhIau68UEjoqopKTdCX5eO0xNQb/RizgqUqyBc7pAYWPR/4SkDKJm
 qQMgE4fYRPbAVdzfUHeNStXO9vfdrdNe+VjddRo6KpnkueRsXDOvhsJ/71u1rPDyj+9q3rQvh
 KAH8MQaeRvkjFK/Y7bzmFsqYHlebchBEZRdF3aWQ7nTEWHkgHmwzAizv8Wkhp4OdXyaXf31zD
 HTYbtCBWrubpzNWn0YiBat1YD3Rr+aRmqJ7G3Ol/o0IPc8mUowW9Xj66PnqSpwwh9A3EtzFms
 lwB8RXSltRk0USiXRHQ1kuep7HDSIzzRCV9q/OUPxO62E=

On 7/1/24 15:42, John David Anglin wrote:
> Fix warning at drivers/pci/msi/msi.h:121.
>
> Recently, I added a PCI to PCIe bridge adaptor and a PCIe NVME card
> to my rp3440. Then, I noticed this warning at boot:
>
> [   25.101978] WARNING: CPU: 0 PID: 10 at drivers/pci/msi/msi.h:121 pci_=
msi_setup_msi_irqs+0x68/0x90
> [   25.104286] Modules linked in: nvme sr_mod(+) scsi_transport_sas nvme=
_core cdrom sd_mod t10_pi ata_generic uas usb_storage crc64_rocksoft pata_=
cmd64x sym53c8xx crc64 ohci_pci libata crc_t10dif ohci_hcd scsi_transport_=
spi ehci_pci crct10dif_generic ehci_hcd scsi_mod crct10dif_common tg3 usbc=
ore libphy scsi_common usb_common
> [   25.129353] CPU: 0 PID: 10 Comm: kworker/u32:0 Not tainted 6.9.7-pari=
sc64 #1  Debian 6.9.7-1
> [   25.129488] Hardware name: 9000/800/rp3440
> [   25.169265] Workqueue: async async_run_entry_fn
>
> We need to select PCI_MSI_ARCH_FALLBACKS when PCI_MSI is selected.
>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>

applied.

Thanks!
Helge


> ---
>
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index dc9b902de8ea..9656e956ed13 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -86,6 +86,7 @@ config PARISC
>   	select HAVE_SOFTIRQ_ON_OWN_STACK if IRQSTACKS
>   	select TRACE_IRQFLAGS_SUPPORT
>   	select HAVE_FUNCTION_DESCRIPTORS if 64BIT
> +	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
>
>   	help
>   	  The PA-RISC microprocessor is designed by Hewlett-Packard and used


