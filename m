Return-Path: <linux-parisc+bounces-2939-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8039D761A
	for <lists+linux-parisc@lfdr.de>; Sun, 24 Nov 2024 17:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCF0E164B60
	for <lists+linux-parisc@lfdr.de>; Sun, 24 Nov 2024 16:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEAB18872F;
	Sun, 24 Nov 2024 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="Kc3uMSpE"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo002.bell.net (mta-tor-005.bell.net [209.71.212.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8A72500C7
	for <linux-parisc@vger.kernel.org>; Sun, 24 Nov 2024 16:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732466833; cv=none; b=gnruM7OCm/aLdSWpbIti8B7vaKRnncMS0mAomYGJijclaC2idQywcQ8iWfBn5REKNCCWYb8GFLIcgCxR7MMZ13XGUTBs7uVkeWSZruO8NyucsDvy/NL/Z8hF6DWMUz8isji9DmWiobgXyxy7AsVFdi136agDLIfDiAqAT8YKhMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732466833; c=relaxed/simple;
	bh=C8ABLonbHvRKE1hgjTXuiXyNri+PYU43wrTLLvTDZQk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=KjGPnJ0EkhHxcFRpol+zKS4q05qOi0GyG6LahjOUvnfuM6GJT9xG/X78FjWA1QZUbnBMB/MT7kqmV0A2/iCDkM5HEiIEtZmmFRdj/mQnaQX/T4lpEUMzvCHQklRBMU2qWMvjCf1SplRmhPlgyI82ZfgOmpWN9DNd5111InbUKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=Kc3uMSpE; arc=none smtp.client-ip=209.71.212.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1732466830; 
        bh=Xq9RT9rCOB/b/rlmhTr09I9e1gOl7HOD4D3g7aa9hkw=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:References:In-Reply-To:Content-Type;
        b=Kc3uMSpEEu8xf2CYiFgDH7yAg9v5ARtEfK434qD8D+xefoVZnFQW7+Pyfw809fpxFpF0KdfhWl2r4pZvJqDbB+9vYvVP9rajJLid4MaAFuhLaqwxYOP3w51Z9TrrwwFbuP+Pnh344TS92/GtAu3NpWvfDmFbA06iZQJb2ocLCYLNnWF/iPNtBAtQe/TB91QXY1Ht4rwCEiJj72ARwmstBmulpnB5rU5v5qSiZRp9BillK5P5KR4th2rF9em7b79Tt9wgeZllGlSlwTpSs2L/1hmnOG8r6+s5YrkhE8X9o7GIvcsHe55dOB6xn/EJqm4C9oMIKJTdnyVsvkJEYS/PCQ==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 673CED6E00E0255B
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeefuddrgeefgdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceugffnnfdpqfgfvfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffhvfhfvegjtgfgsehtkeertddtvdejnecuhfhrohhmpeflohhhnhcuffgrvhhiugcutehnghhlihhnuceouggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpeejjeeijeeifeeuhfdtudduudekkedtkefhtefhjeegffdugfdvvddvgeefieegveenucfkphepudegvddruddviedruddvledrieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpedugedvrdduvdeirdduvdelrdeipdhmrghilhhfrhhomhepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepuggrvhgvrdgrnhhglhhinhessggvlhhlrdhnvghtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehlihhnuhigqdhprghrihhstgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgvvhfkrfepsghrrghsqdgsrghsvgdqohhtfigrohhntdeltdeifidqghhrtgdqtdegqddugedvqdduvdeiqdduvdelqdeirdgushhlrdgsvghllhdrtggrpdgruhhthhgpuhhsvghrpegurghvvgdrrghn
	ghhlihhnsegsvghllhdrnhgvthdpghgvohfkrfepveetpdfovfetjfhoshhtpegtmhigqdhtohhrrhhgohdttddv
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.129.6) by cmx-torrgo002.bell.net (authenticated as dave.anglin@bell.net)
        id 673CED6E00E0255B; Sun, 24 Nov 2024 11:41:01 -0500
Message-ID: <f7d0e2fe-b613-4327-b926-5a36d5b8163c@bell.net>
Date: Sun, 24 Nov 2024 11:41:02 -0500
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: CPU: 1 PID: 1 at drivers/pci/devres.c:602
 pcim_add_mapping_to_legacy_table+0x74/0x90
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc <linux-parisc@vger.kernel.org>
References: <09692e99-a05a-4240-96bf-040eea60d936@bell.net>
Content-Language: en-US
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
Cc: Helge Deller <deller@gmx.de>
In-Reply-To: <09692e99-a05a-4240-96bf-040eea60d936@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-08 8:04 p.m., John David Anglin wrote:
> [ 1.377745] printk: legacy bootconsole [pdc0] disabled
This warning has to do with switching consoles on v6.11.*:
[    2.928681] printk: legacy console [ttyS0] enabled
[    2.931997] printk: legacy bootconsole [pdc0] disabled
[    2.936688] ------------[ cut here ]------------
[    2.939833] WARNING: CPU: 0 PID: 1 at drivers/pci/devres.c:602 pcim_add_mapping_to_legacy_table+0x78/0xb0

         /* The legacy mechanism doesn't allow for duplicate mappings. */
         WARN_ON(legacy_iomap_table[bar]);

I don't know if this is related but I need to enter a return to get past the ip_tables patching:

[   36.185386] x_tables alternatives: applied 0 out of 4 patches
x_tables alternatives: applied 0 out of 4 patches
[   36.455891] ip_tables alternatives: applied 0 out of 6 patches
ip_tables alternatives: applied 0 out of 6 patches
[   80.824767] systemd[1]: systemd 257~rc2-3 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK -SECCOMP +GCRYPT -GNUTLS 
+OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT 
+QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
[   80.835893] systemd[1]: Detected architecture parisc64.
systemd[1]: systemd 257~rc2-3 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK -SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL 
+BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 
+BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
systemd[1]: Detected architecture parisc64.

Welcome to Debian GNU/Linux trixie/sid!

[   80.914590] systemd[1]: Hostname set to <mx3210>.

The above boot was with "Linux mx3210 6.11.9-parisc64 #1 SMP Debian 6.11.9-1 (2024-11-17) parisc64 GNU/Linux".

I see the same thing with my builds.

Dave

-- 
John David Anglin  dave.anglin@bell.net


