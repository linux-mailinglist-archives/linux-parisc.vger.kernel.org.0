Return-Path: <linux-parisc+bounces-3232-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D37BBA15ECC
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jan 2025 21:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2A1165EF7
	for <lists+linux-parisc@lfdr.de>; Sat, 18 Jan 2025 20:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E67A1ACEC7;
	Sat, 18 Jan 2025 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="juXNIEil"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D412A3398B
	for <linux-parisc@vger.kernel.org>; Sat, 18 Jan 2025 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737232605; cv=none; b=OUWxGkFf8U8nqnY8YiLYf4q4avJV2azghqnXWmEjOz3kWqzaJn0fsaHUXXyOkyOwqb22RF45gQ907jgfX71M2jLL3zlDfwb9XnFFRkACK3gzrdUJA4m+TAZLABsbRLR3KswGWbuL12IqBoExsMKa3oo8W3+JqVl5WddEetZI0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737232605; c=relaxed/simple;
	bh=gB3vM12JrgmQ23Fv6PaaVuZpfdhmwH7+NGaDRUvp03M=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=lAT7V5paNzVP/PR7ZDQmoUE92+FDwAQuz87uyAl/N4AEfzwathVNUvwycjVWh00Om8YGSPC6ZkhTzkkUGyPFeUtls1cZrGzvudNIoLVNQgOJ0ln7XU6087KCi/c2r7xDZISxdETZ0/0x2H6sWifGy3Jda7283PUOrxAeQkbCbtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=juXNIEil; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737232600; x=1737837400; i=deller@gmx.de;
	bh=gB3vM12JrgmQ23Fv6PaaVuZpfdhmwH7+NGaDRUvp03M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=juXNIEilIi9oGWHF7JLabiC0Dmk2l7yFe6l0vuUzBtutVn0xZdhVzHUTgvr7Seo5
	 ZRDDbrwbmxuvZQhbLgOrsH6RceDwF8jg3naK10kbJogNTZBgG6aJVvDkMyzSgwfA1
	 TkjzNsb6fSKmVvaCgbp3Bq/hlQ+vd0Npqu1XUGvmsfyJ1s//k2DZ5Hi/Qzfqi2Ee6
	 cFr/oLoEWwOa2BontsLJABSnoIVLXivEyCXSY7IqnVxv/04176oyMtsLQwy666v+m
	 fa2K0EmzgCTM0nbGNXfzt80+8Q9DBFIv1VwuHEadHOpV3Wpzmtg35WGo1rInePikh
	 eRR2OLzGjSIr2Wsz3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N63Vi-1tSsim2YQq-00tgpI; Sat, 18
 Jan 2025 21:36:40 +0100
Message-ID: <9bd2f73d-3aab-4bc6-9b2f-f50129ea7d43@gmx.de>
Date: Sat, 18 Jan 2025 21:36:40 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-parisc <linux-parisc@vger.kernel.org>,
 HPPA porters <debian-hppa@lists.debian.org>
From: Helge Deller <deller@gmx.de>
Subject: Debian HPPA Installation CD-ROM available
Autocrypt: addr=deller@gmx.de; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HPu1O5RHf2ucs3yEaZ6Gp7sSWMSliBBY4LOqs9f54yNss/T7Cm0
 B9SIUhUqqnIKnvHaXhGy4d/YZ57LHU12SZhxhXIVVxFsOQ4F3/d2/2xeXXRcpzi1BQisMKs
 ICgfwXqpqzGfBbCPXai3r7MXAQoVVnYBxt7Dw0pIia6pi5rXSe1aiiUXGGlfh46hvx7Lxnl
 heweJgjrW3/P+Vx7dsnzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nBpmy/B6JkU=;Bngyn3xQTueCsf0CP6GTOZt2F2T
 gWLg7TkiRkzqBJvyk8k43I9pwOzCYvNhZkrX4nLKqbOvHZ7Fg/M2QtP/QDmQF1e+dOJfU5BqY
 pPr8voY77ruLCeolxh2VMOvcHKe5nc5CTfXXrk6cgoAHAMhRHyLd8hRcEyJoQoxmaCLuv2UM8
 +FtjaPmA7bo9XgNZR+Tf84ycm8CQd6JDNpEdz+E/vOVmzNPzGDbcZJ62L+5U+pwWRUMzgm8HA
 qam2gO2x9MFxS97RHYkFTbmAG0MlAKkA9kugmAbGfdqbdwo/6V2rjKJ9KCuf4ldWqj0KombOF
 ntcHxv2DdRLeHT/yUWp01plFbSlmecso5MLY+ZMvAiTqx6x10T5Is6KxcD6Bf9cDA6fntFSBv
 3pSSILqeeBVsuGjt9Nms7SOzoZ0EnsnlwHzn3NxuGYK06RH/I254o9rrovELfKqGhgG9scKMP
 IjtgxYtOi/3ZAbNlBEj3wV1YPy+qlrg0JSWy4v0bNBumt/HaH6f7IOEuY3MbkugeP1eEg5FdB
 0ulIf/v4Ma3Sr0L5q3j4orDbQqe0wtKB2/Qr16gfwDR97C01Dc3t9lC7a2BmmloleM5UI1NJH
 z+RgIJStsaeC4YcUjfRizV5c7+UP12ubDR2HYQpmZ/BvkNMPQK9CUCjVKE+HLII2mVtvajj4R
 MazkBXc8ufTiZcOaVoI91BxwqY/BL7Ce7gyWmIODFjhoEKYU4s9bQf/PYa+RAEccyYMmjZddj
 uj6x6jyHFfkJicmIiy2JcuJ+ngjLAe+oZ5ch1u75qDM7e4oQDD+HDIKq8T/lpFa1zaXqvd1KP
 0nhjTjMARGpVGmURtSWmXGJu+8t70S13dX4BfVFybrXzZcWV7SsmDaMTdd76Ql2L1/iVw0Og8
 WH7jW2QphcKIoxGiJuZ1EOE8N1IcCH3MPDYOFMa4COIrZFDU9qUx1r6JTE/vNVqz2ZqzbKyQD
 RZxy/P/D3iym/OgWf9MsqyfEZ7TNM12qMkYKvG9go09jPCAkIpcZUemElU401cRhDyc75sH4L
 T3LzP4F6LmZ8YM2FyqZ+MK2zJaBVQfV50o9nODDFWTHFOh4HSdNhsF4rNrrt3SOIqoTrLFXc5
 NgylZ8JW/Vb/o6vQ3A1qIQVR94o1ZHPdoYr7vL1tkV6kxSe+O1ZCmnPdujXyS9U0cyxSnJ3+n
 aIQkL9UGjgSI1+RTENDtvxOZP1l+skYprDJBieMYK5Q==

Dear HP-PARISC fans,

I've uploaded a new Debian Installation CD-ROM image at:
http://ftp.parisc-linux.org/debian-cd/debian-12/debian-2025-01-hppa-CD.iso

I've tested this CD-image on 32-bit (Qemu) and 64-bit machines (C8000).
Please read the INSTALLATION NOTES first before using the image:
http://ftp.parisc-linux.org/debian-cd/debian-12/README-hppa

Helge

