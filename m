Return-Path: <linux-parisc+bounces-2940-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA39D7809
	for <lists+linux-parisc@lfdr.de>; Sun, 24 Nov 2024 21:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DD99162AD0
	for <lists+linux-parisc@lfdr.de>; Sun, 24 Nov 2024 20:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9337DEDE;
	Sun, 24 Nov 2024 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="mEORGPWw"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE39A136658
	for <linux-parisc@vger.kernel.org>; Sun, 24 Nov 2024 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732478477; cv=none; b=HC7I48ooiM5IyBsNAWmwChMICWgV5UVrDqi4+A+eXg/cw7pxgdj8op5Zfj5xi9EuMhdTagW+TGMc7jw9xf5WiNGF78+oFxwiaZZLRsHzQjskVMhZvt/fgpRH4VQeBPFXZI6BFJxwo4MxG4aJR50mOq7qvgBePEAAgKgvpCrZu9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732478477; c=relaxed/simple;
	bh=IWdwGj0tJd3dvqQ0tMIR7380W5bMZFAH2jkkKmblSNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DmswfOweU/k6rz6lWr1Pmqph9u0XFWvJrFzdhWc+DtF0OOl2jb4ofSoc+WAlKWIEf/4AKEc8R4nmunPLLnNoATe93JEKZddlrnfCC7/qRr2FRf/e682qjgxwJZEzBZ/Q6YAy7zXjCTVMIsCBPwWz0CE8wWmjySXpLkYe2RtT4EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=mEORGPWw; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1732478471; x=1733083271; i=deller@gmx.de;
	bh=HfUm95nQlEOKHytgSG/KPN80vifGmVNbyZdIUWMqZnY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mEORGPWwSpFp/t9Hd8jcrP+uQt6pyMy0lnAd9Blo5JeIT747IME2ClAf1hWAD+Dy
	 lKKSYa24P9+T9cJX2MAXrE5AgnnwryasFZPSaLi3oGqNFcoZGGywozHI2sgnO32Lb
	 sEXyO1t+ZUn0noRXFT2m8q+sYhjQWCXozjLT6asFM0VsL5ld6kHZ1sguAuOGeBen9
	 2UoJjASX5se2J9FMQ95JlGCBeG9mEU2h3e4ZDiP5zyt2QXzvwPtZ9UfGCdofIfgF1
	 9p7w7XvDwwmfhBm5brFXq27L4pV+8Cd+G8SzdjJNoEy7NnUKHdp/QIOWRwbpUHuXC
	 qytWVCr8RTPPbGr38A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.155]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1tXeeh3pfZ-012Ode; Sun, 24
 Nov 2024 21:01:10 +0100
Message-ID: <c312debc-f6e7-4c9e-8e20-e47e7e3b27f3@gmx.de>
Date: Sun, 24 Nov 2024 21:01:10 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: CPU: 1 PID: 1 at drivers/pci/devres.c:602
 pcim_add_mapping_to_legacy_table+0x74/0x90
To: John David Anglin <dave.anglin@bell.net>,
 linux-parisc <linux-parisc@vger.kernel.org>
References: <09692e99-a05a-4240-96bf-040eea60d936@bell.net>
 <f7d0e2fe-b613-4327-b926-5a36d5b8163c@bell.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <f7d0e2fe-b613-4327-b926-5a36d5b8163c@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+IGYichXf8vVDz9lpYkuNVfO2duLrkXljJTMBBLvZRsC/d+N7dh
 Gj5kOZ+IfR99Kf7gMb8q+WHhlVloA/pCVH+0/QJd6tDug4ZKvopB5t+avC6Swamu/R5iDjT
 3o6AOWpcXuriOq3LXobOt3IGseTEaapobJPhnWaLnxwigIKvy0b15equr1wPcsYBXyfAhe2
 PaJgcKGHTWmsyJsj4NEwg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Eba9Vh8g5zc=;d5lXkctPke6rHFDJ1CI5sl+gt+q
 U20saobVAwr3uYjJOLqdCiq2a42649gbjJDgHr6SJnJUG7gzcNWENiQvykK7sbFlL0cC33Vgq
 q3/j8Gdw0OgqGYMwsbGDHw8St0bxNHenDYu8BKo4j76sK+UkhaPGAo89552anqJDaq4mI+eHI
 V/MZwGE13N93BpL0uQOjKSUXpDE+V7u23edkjA1w5qpVvTqh1ioV3g+mB4YtfwTdV4r0+YmX9
 GkCVEJJ1UpMfIoc9/RtbwgPrcTp/RSmT0mPmRnnaPiS5B+yVkeaR02y2gvIyJYsYgWPloet3R
 DEo+KOl23m9kiqZley8h6CRUg+9UlrYjrQHQSZWjaZDavC0WpxeB/mPKhzPuzrPPYcZMWiwun
 ZiK3MNHW8XBDUemkx/TywiM8D3G078BFW+8+ZK7mhAieZNKJ+CcQfU7dkJAzgY+NkCjMLy3Y7
 ymYGc2Qim4ZU+AqoRt4+N7bsk/3vOSAiOcQIgOuZ+PDnTAsrkYEodkOSUmVxe7+dwCMeQUMs7
 SksMH8Ja3QMlHXn+uqroLNVHroAzdyC2UBHALmH4Z7Q7fD/ZK8Kw1HFAuQCrll2hvUFrJjKj9
 2lkVu0eq899NWoCV+pu/po77ALze9tqC7uKCvIiqeJu9+ku43cr5P2sXJLYhUp+bZZR7PTPT0
 4JG0A5dCS54F0yM+6yNVg87c4PDSfHNU5/KAPhVfuPIJSNKkvZMmQLDH5LmdBNRTM/oTtF1+m
 N64ZU6rLgjVOpRH6uTI+x6lSkoN8CXkGXXcOzsZ1yjTNO7bt3TpMdjrFfspIrbM7SjrhvpdRc
 suvN4snMACaJrEK162rpRJaUC5HscuBzVX9JYZ6IIifk+veLpPtxQhwFA6rZli79/zUqIXoD3
 IUajsm17d/Ijr0xArFQ+aXeDSO+cBwsqBvmazjNi9Jc4IoA3WOGWz+8IOz5rVhZjWKzTqu08w
 v5YTISnev2WreVkhpH2Sl75m3R0BHCI4LQP9o86Rc9ibg1ppHnUk+e4xr/mPqnIm4eVH1I6pm
 4TS7o2IewD5xCZU8KS6ZC7gc47CvlV2YaeB3p2lMbI7uc/5vO0/69ekLve5w8+zu/ko/+mfE6
 ygv1y9WIOTvp/j2kCvHk5bIH1OtOqd

On 11/24/24 17:41, John David Anglin wrote:
> On 2024-11-08 8:04 p.m., John David Anglin wrote:
>> [ 1.377745] printk: legacy bootconsole [pdc0] disabled
> This warning has to do with switching consoles on v6.11.*:
> [=C2=A0=C2=A0=C2=A0 2.928681] printk: legacy console [ttyS0] enabled
> [=C2=A0=C2=A0=C2=A0 2.931997] printk: legacy bootconsole [pdc0] disabled
> [=C2=A0=C2=A0=C2=A0 2.936688] ------------[ cut here ]------------
> [=C2=A0=C2=A0=C2=A0 2.939833] WARNING: CPU: 0 PID: 1 at drivers/pci/devr=
es.c:602 pcim_add_mapping_to_legacy_table+0x78/0xb0
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The legacy mechanism does=
n't allow for duplicate mappings. */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(legacy_iomap_table[b=
ar]);

I know I saw this warning in the past, but not this time.
Just booted Debian kernel 6.11.9-1 (same as you) on my c8000.

> I don't know if this is related but I need to enter a return to get past=
 the ip_tables patching:

I had to press enter to get console login.

It's not critical.
Since I have no free time, I won't be able to analyze this soon.

Helge

> [=C2=A0=C2=A0 36.185386] x_tables alternatives: applied 0 out of 4 patch=
es
> x_tables alternatives: applied 0 out of 4 patches
> [=C2=A0=C2=A0 36.455891] ip_tables alternatives: applied 0 out of 6 patc=
hes
> ip_tables alternatives: applied 0 out of 6 patches
> [=C2=A0=C2=A0 80.824767] systemd[1]: systemd 257~rc2-3 running in system=
 mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK -SECCOMP +GCRYPT -G=
NUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +=
LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +=
QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -BTF -XKBCOMMON =
-UTMP +SYSVINIT +LIBARCHIVE)
> [=C2=A0=C2=A0 80.835893] systemd[1]: Detected architecture parisc64.
> systemd[1]: systemd 257~rc2-3 running in system mode (+PAM +AUDIT +SELIN=
UX +APPARMOR +IMA +IPE +SMACK -SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKI=
D +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSE=
TUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ=
4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHI=
VE)
> systemd[1]: Detected architecture parisc64.
>
> Welcome to Debian GNU/Linux trixie/sid!
>
> [=C2=A0=C2=A0 80.914590] systemd[1]: Hostname set to <mx3210>.
>
> The above boot was with "Linux mx3210 6.11.9-parisc64 #1 SMP Debian 6.11=
.9-1 (2024-11-17) parisc64 GNU/Linux".
>
> I see the same thing with my builds.
>
> Dave
>


