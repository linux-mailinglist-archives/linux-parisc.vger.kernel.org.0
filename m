Return-Path: <linux-parisc+bounces-2245-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A440D96C6DB
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Sep 2024 20:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0DF71C23AC2
	for <lists+linux-parisc@lfdr.de>; Wed,  4 Sep 2024 18:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB481E413A;
	Wed,  4 Sep 2024 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="I1V7lquB"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D059E1E1A3C
	for <linux-parisc@vger.kernel.org>; Wed,  4 Sep 2024 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476033; cv=none; b=WnNZV25Ljt1c3q/EHBRyYOfdSiJyGHM4GfZKZ/vaVLEtWXZAH8UIrwejFq1EmgcllJBZte/3P/FULF9kRUCz8MR38+Sjb5dUD+hut7frTX7w7uB5BoeJGg/vyO2D2fRWkZT9Bj3VOhK6jUoZdzuwPpExMNkOt3BQkX2Ct9f1Wiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476033; c=relaxed/simple;
	bh=s92rW/1gEQr3xvJKMRwsWt6P8BZ8Funj1rbavwH4oWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZ0uSabeQAkUEZTl9cGOKWrvsWNa4MtYWorNmJeTQ8OwgRrXQuoGhnI9x2mBIGmU2Wox/FXPtrSph0aSH+xWm5Lux61FkYjtJRtFUuArfYd2Lb6aa6Ioh8++nMvKuiSNqHlRMILpr7QKqXYyOlFnlgV3hOX1PDj58I1RkzuAjR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=I1V7lquB; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso5078793a12.2
        for <linux-parisc@vger.kernel.org>; Wed, 04 Sep 2024 11:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725476030; x=1726080830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s92rW/1gEQr3xvJKMRwsWt6P8BZ8Funj1rbavwH4oWQ=;
        b=I1V7lquBIV1tuMbzWo1Rmr78uwgd64Cz90/LN5ociO6ZEW/Wqw8V1kSNDjHwc1SQrl
         gBaI66alz16WK+pvTbrtual3WbJtpGuczxNRYdc1gLcuOrMZ4usss1N5f7NdK8JHnD2p
         F0XUwhgMpxkeLvZRW8Uzgt0KvOaFvkDxTAi68bTiJhkqBH+yK8paVuDHYd72QvNHI6kY
         nwO80rF+Oxe0S7e2FzsxLeUgvXejLVpZZJVNZGqiQ+eQ9RCbCRxo2YOrTrYuADPwYNeo
         UMBDEP1bCuHsTMQKOvPWkizZfCYV9cQhfOEuy7O2CfqqeC+9S4/t4PFaZ6WN6eBloGGM
         W2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476030; x=1726080830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s92rW/1gEQr3xvJKMRwsWt6P8BZ8Funj1rbavwH4oWQ=;
        b=uKT+1+bDE4Zgb8e6yJLdaMdhHbKS3ujjHCv+oexRdLMQcWsw9t8z+zIPMYqPp7m5n3
         segO7MqUxsAoVPMPVlGhzWnAR4tXdwVuMYh2pWeqYzIJ6jtMfxUjNw4hiXSs2QfUweq9
         yy2ANAqQktGpHp/4PzlwxZzJb5JHplPbnBL5qwGG326ZZ9IymtAxVRG/igQ7KeYSFpoY
         J5xYcgNOko5t/h6G7q6mdDXLNb1IAekQxMmrdaKcAeiFK8FA6a6zAYmpWP+znEoi765z
         qzdUBJrZ/zPKdVpTRxD8l9Q2EcZlQj+ejF/jY+foNtA/ky2noTTEJJzan727V5Iv3AQa
         L9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWcoTBHHOa95dqBLCWkV7cTCF3dyJXUnrMxMbvS+vIgG7g2Lsz2cNvSJ3VDLdQLzkY/iGzNTSKTSCYvG6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKXh6gU70r2kv5J/dC7Z6V7tCJWSxypNFSozR89UWRRaaurxDF
	D4ponbXdt8B8HaEt3XONfLE9Gt33GsvR+n10NS46Iai60kmn0ccBRtdqeRsFcAA=
X-Google-Smtp-Source: AGHT+IE2IsoC0LRmiLcI1CkvV1DU3vw4DUJdyqp6MID1n1cX+56uyYB7jBo1wGGq/wkl04oTY4Plng==
X-Received: by 2002:a05:6a21:318b:b0:1ce:cbcf:aaa9 with SMTP id adf61e73a8af0-1cecdfdea62mr20770394637.36.1725476029832;
        Wed, 04 Sep 2024 11:53:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778522979sm1947597b3a.30.2024.09.04.11.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:53:49 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:53:45 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
Message-ID: <ZtisuRySfREHjnN/@debug.ba.rivosinc.com>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>

On Mon, Sep 02, 2024 at 08:08:14PM +0100, Mark Brown wrote:
>In preparation for using vm_flags to ensure guard pages for shadow stacks
>supply them as an argument to generic_get_unmapped_area(). The only user
>outside of the core code is the PowerPC book3s64 implementation which is
>trivially wrapping the generic implementation in the radix_enabled() case.
>
>Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Deepak Gupta <debug@rivosinc.com>


