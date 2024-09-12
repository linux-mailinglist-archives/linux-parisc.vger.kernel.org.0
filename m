Return-Path: <linux-parisc+bounces-2351-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4735976166
	for <lists+linux-parisc@lfdr.de>; Thu, 12 Sep 2024 08:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 850D3282216
	for <lists+linux-parisc@lfdr.de>; Thu, 12 Sep 2024 06:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F703188A00;
	Thu, 12 Sep 2024 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="f7ImMjz5"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAAD189F20
	for <linux-parisc@vger.kernel.org>; Thu, 12 Sep 2024 06:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726122044; cv=none; b=DVub2ajhyAuFVbXTzxvLpCjEZrMjgYo0aGTiwiAiKwSw0pNkGZObcypzakwhM8yovFSmbikNdseQafqBFZmsHfmGTA8FXMuEKYyTNQWvNkgXVZpigkuGkoVj3PSkp5IzX9hc2J/JALdJP6ePfheH16GLQHQIji7NeZy6W8g69eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726122044; c=relaxed/simple;
	bh=2F6IKkpv/Qwlr7Q/6xNHbyfy5PQ3xNesTPaXOFDb4UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwjFN3Ipgz2M2eQGI37XJvijCD4hEVfXwYcBqZm01Lzj3xZfjPwHdK2qNBrXPb888yC/JAHcMRtPeCf2M+Wr6CWu2oD4S+kft9fGcWQ5pu/WyUNaAPceozTdiVhUcLE0CLuCV1T8urJxRGBGzGhNacvu+fuxyrcXXn3Lw96O22I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=f7ImMjz5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2053525bd90so6138855ad.0
        for <linux-parisc@vger.kernel.org>; Wed, 11 Sep 2024 23:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726122042; x=1726726842; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MH+VWCTNjiA22bJ+vIa1h0/NxuAZxX6cpAlaipl1hg=;
        b=f7ImMjz5nD3GVetxCwMWoMX0kbIS4lvT7rEllYmLdT1KxiOENjPfwGS0uGx1s49aoE
         e+S6xHj/IwKOfMTOWQabXZVX65tJFPq0fLcBDOfXfsFJhwEvgMvrUr9UlGXPbcb7Lay4
         Gi/IQ6rnGZ8UYdmka+oBZwvNaR+WwIpIymqItrNmjNailKIQdWCBeH89j2wDY3mlS/wx
         FvHk8yCVj+VYIQSt+IwVrm0VnCz09SHus+F7QpDCtn0bPIzDT+K5kwUg6cnCIkY1VOMH
         97dX+cVLAMHx/6gRUewjaflWeYX++hO2+QEGMn2rXsKqWiltX77adLjzFL/QhUylIYvo
         MahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726122042; x=1726726842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MH+VWCTNjiA22bJ+vIa1h0/NxuAZxX6cpAlaipl1hg=;
        b=aj7Suh0dKZ6zrq8iVz3kMY3KzbqREQI6kBh8hptQzlRJeKcjPcKyI4Hao3zdWRcnI4
         S8FJnL05fQ2dvpSsaBftmePyDjE24VA/WaQyM29sWjfQmDXqXll2gp0W7R4y9HP25yQN
         iFatk3vkxvUS4HejMybPg9dXf09C6+aWvdqjuv8K0RPJoKf8+PwbWq9lot9+ImqTPOM8
         D9vG/xLcGbZu7pFZyceqQsxwoekK0EDVDkDzfSvzq8SCyzQyV/cSanlEmEZwbWLpcorb
         /32WdAfqDABwiohqe7kvvcZKeosQ9CDaJsmiWwoSTTp4EueCs+GXRlWo2fHGz+M28hZk
         2j0g==
X-Forwarded-Encrypted: i=1; AJvYcCXJfmhSNxBMXTmRD1q2ZQ5BwRDJd+KbmPkgzE1sLrfBpH5adNklPH3vZU6/TWSLsuUsU117wKt7h5I8/nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFm67A8aWoQeKiahG1FLSsu6eOq7mSx8ECfHcti54k4hcN36XZ
	21aeuiEhIPSEaNYYdPOHdCF8YekYII4kpE3PRzSf5PRyJO23emw9CZhCLFEhwtQ=
X-Google-Smtp-Source: AGHT+IEU0tdlu4WO+IdyYZyQDbQui3iM6ZAtkm5A4CWh7CFo7CMKirqsrpvUAjbSGnQEOy1Vcb5RUw==
X-Received: by 2002:a17:903:191:b0:206:aa2e:6d1f with SMTP id d9443c01a7336-2076e423272mr22083755ad.46.1726122041553;
        Wed, 11 Sep 2024 23:20:41 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:7acc:9910:2c1d:4e65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd82asm8286105ad.129.2024.09.11.23.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 23:20:40 -0700 (PDT)
Date: Wed, 11 Sep 2024 23:20:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
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
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuKIMz7U8rDrq8jA@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse>
 <Zt9HboH/PmPlRPmH@ghost>
 <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
 <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
 <8734m6s428.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8734m6s428.fsf@mail.lhotse>

On Wed, Sep 11, 2024 at 11:38:55PM +1000, Michael Ellerman wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > Hi Christophe,
> >
> > On Tue, Sep 10, 2024 at 11:21 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> >>> diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
> >> >>> index 49796b7756af..cd3b8c154d9b 100644
> >> >>> --- a/include/uapi/linux/personality.h
> >> >>> +++ b/include/uapi/linux/personality.h
> >> >>> @@ -22,6 +22,7 @@ enum {
> >> >>>     WHOLE_SECONDS =         0x2000000,
> >> >>>     STICKY_TIMEOUTS =       0x4000000,
> >> >>>     ADDR_LIMIT_3GB =        0x8000000,
> >> >>> +   ADDR_LIMIT_47BIT =      0x10000000,
> >> >>>   };
> >> >>
> >> >> I wonder if ADDR_LIMIT_128T would be clearer?
> >> >>
> >> >
> >> > I don't follow, what does 128T represent?
> >>
> >> 128T is 128 Terabytes, that's the maximum size achievable with a 47BIT
> >> address, that naming would be more consistant with the ADDR_LIMIT_3GB
> >> just above that means a 3 Gigabytes limit.
> >
> > Hence ADDR_LIMIT_128TB?
> 
> Yes it should be 128TB. Typo by me.
> 
> cheers

47BIT was selected because the usecase for this flag is for applications
that want to store data in the upper bits of a virtual address space. In
this case, how large the virtual address space is irrelevant, and only
the number of bits that are being used, and hence the number of bits
that are free.

- Charlie


