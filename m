Return-Path: <linux-parisc+bounces-200-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA40D80B837
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Dec 2023 01:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2045BB20A06
	for <lists+linux-parisc@lfdr.de>; Sun, 10 Dec 2023 00:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FE3188;
	Sun, 10 Dec 2023 00:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=ilande.co.uk header.i=@ilande.co.uk header.b="kxj5JbfG"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail.ilande.co.uk (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E627126
	for <linux-parisc@vger.kernel.org>; Sat,  9 Dec 2023 16:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V3mUwyqYlK6x0v7tpFQ6W8F5H3FgzSgiCHrXJuRZwHc=; b=kxj5JbfGkkdJV2L0XE96AypPTk
	BeV/6chd5QaLkhAOL/Gr7a1goKgixNmwzUA+d4uJKjySVA0Z7w4BxWwHHh8bvz76Xt8/Zse5DEHgE
	MIC/0cgNPYqlgsYyhEr1wYYaKQ7962/17JEYFoHUki/oxgF6fsGwfDeHc4iC5NwoH/66v9KBQRI+D
	friiTxFOJ5zseAknp94QTkwQmeLGUcNpqQ3d1y+5zcq1p+ukVhEgKhkkgwIhSiLnjQEAjDSijlkzA
	7naPNblpNUdOd3ib2lUKJBwqT3c243bSHocVxMVFBikyy+W5ifv6tQuyyk+ih7poL7hziUYvTBR6M
	q3kzn2fDoI7u93WNG6dy2DKxq36FgkFvXnG0N+dTeBAQgCyfIvJTPz25xcHxnsPHSpFIrrJ+foEoW
	RbbunJ10vQdq5Ai5iz2eKpyzDmuiEdDEzWWZOVifz61m93nzKxkt863HlE1qnKX4k9AW/ZQmkzEYp
	c9pfZartBfZcAiZId+za1sEGLfhN+RtzOvEixscS7d3XF6PG+uaMpWUzGo7kMQkplx4XppJHASZDw
	CoTpwY4Tyhh82i16kDpWGoyTEBhAvHAuWmUn8S38R1TOEqbFDE/bE+KSwiUPu4KlgQaqqZnTPhukJ
	aUHuM4xep1PsGrdLSlhCY0ovwRmCjx3FvOvZZA/OA=;
Received: from [2a00:23c4:8bb0:f100:140b:63db:b8d4:eb7a]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1rC7a6-0009LK-7n; Sun, 10 Dec 2023 00:22:06 +0000
Message-ID: <8b356e0d-988e-4fb3-a2c6-7b8acb306b9c@ilande.co.uk>
Date: Sun, 10 Dec 2023 00:22:17 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Helge Deller <deller@gmx.de>, Guenter Roeck <linux@roeck-us.net>,
 John David Anglin <dave.anglin@bell.net>,
 Parisc List <linux-parisc@vger.kernel.org>
References: <17dc79fa-4a38-44ee-a8ea-b523b2d99b26@roeck-us.net>
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
 <4254a11b-d603-4a6c-9c81-ac7403ae940f@roeck-us.net>
 <0284662a-8eaa-495c-96bc-213b719d40a6@gmx.de>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <0284662a-8eaa-495c-96bc-213b719d40a6@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:f100:140b:63db:b8d4:eb7a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Level: 
Subject: Re: 64-bit userspace root file system for hppa64
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 09/12/2023 23:43, Helge Deller wrote:

> On 12/9/23 23:57, Guenter Roeck wrote:
>> On 12/9/23 13:58, Helge Deller wrote:
>>> On 12/9/23 19:56, Mark Cave-Ayland wrote:
>>>>>>>>>>>> The command line I used for testing hppa is below:
>>>>>>>>>>>>
>>>>>>>>>>>> ./qemu-system-hppa \
>>>>>>>>>>>>      -kernel vmlinux-parisc \
>>>>>>>>>>>>      -no-reboot \
>>>>>>>>>>>>      -snapshot \
>>>>>>>>>>>>      -device am53c974,id=scsi \
>>>>>>>>>>>>      -device scsi-hd,bus=scsi.0,drive=d0 \
>>>>>>>>>>>>      -drive file=rootfs.ext2-parisc,format=raw,if=none,id=d0 \
>>>>>>>>>>>>      -append "panic=-1 slub_debug=FZPUA root=/dev/sda 
>>>>>>>>>>>> console=ttyS0,115200" \
>>>>>>>>>>>>      -nographic -monitor null
>>>>>>>>>>>>
>>> ...
>>>>> If I limit the disc transfer size of am53c974 to just 4K per transaction
>>>>> (like the patch below against Linux kernel 6.6.4), then qemu-hppa
>>>>> boots up nicely with qemu git head (and Günther's patches applied).
> 
> A diff of the qemu traces shows, that at some stage
> esp_transfer_data transfer() is called for 4k/transaction,
> but is not started for 12k/transaction...
> 
> Full traces are here:
> http://www.dellerweb.de/qemu/qemu-bugs/FAIL
> http://www.dellerweb.de/qemu/qemu-bugs/OK
> 
> verify with:
>   diff -u OK FAIL  | vi -
> and go to line 2496:
> 
> -STC: 1000    hi/mid/lo: 00/10/00
> +STC: 3000    hi/mid/lo: 00/30/00
>   esp_dma_enable Raise enable
> -esp_handle_ti Transfer Information len 4096
> +esp_handle_ti Transfer Information len 12288
>   esp_raise_irq Raise IRQ
>   esp_lower_drq Lower DREQ
> -esp_transfer_data transfer 0/4096       <<<<<<<<<<< this seems missing for 12k
>   esp_pci_dma_read reg[5]: 0x00000010
>   esp_mem_readb reg[4]: 0x91
>   esp_mem_readb reg[6]: 0x04
> @@ -8081,21 +7111,22 @@

Thanks for the traces, but it looks as if they are from QEMU git master rather than 
the esp-rework-testing branch? The existing code has a number of known issues so it 
would be good to eliminate those first if possible.


ATB,

Mark.


