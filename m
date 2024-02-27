Return-Path: <linux-parisc+bounces-711-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7988869E67
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Feb 2024 18:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C990A1C21E0B
	for <lists+linux-parisc@lfdr.de>; Tue, 27 Feb 2024 17:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487144D9F0;
	Tue, 27 Feb 2024 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RRQsf9Z7"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9593D4F1E6
	for <linux-parisc@vger.kernel.org>; Tue, 27 Feb 2024 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709056565; cv=none; b=SNuPlgyet9B8KP+TSSbQk9u6CPpY52Rif8J3cLxjLjTU53zyDB/atZktgZNl0e2HqvDcSPgsqcjtoievHIOOe5UviXMji7e/pa1fC0eZ2/2oMGGQ7lBgQECV7vnHAOSCukgby5tNskBfWKE1+Ywq1eSFO4ndykB4xATMmOYLNwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709056565; c=relaxed/simple;
	bh=z9krcDPxGhiMV6NuwRcLOtuYoDFDwnE9XGyDTW8IDtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqEJDiki9VdAbT+uO4Xpt9ILELnMvJ5J+4VL6cEFAktn4NbBuau6q1loqStkhulgsTKqHTD6E1edeL3Kw46CawIdcj+DCjCmsk2D2T+HwcO0MxITySu5ex2xxXBstkcrM6AEOvkSCKGMvlg7RPZIcr84qwM5fOY9Eie+YPEIVjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=RRQsf9Z7; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so2521858a12.0
        for <linux-parisc@vger.kernel.org>; Tue, 27 Feb 2024 09:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709056563; x=1709661363; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i5BHk1gsyfDXTlAMC9vOKJFtYRHrRdcGURp8h1aQnRA=;
        b=RRQsf9Z70TTzNq16YHYaW+KBw7kH8f535vtHpz0feOh/yirc98RXruK6stB6vi6wBN
         hK+GeQx9TEi0h3Sxj55Ep4/TknsK3525VfSK+FBDNwBWV+c1ExDXKRz25eGPH18hggIW
         NGexEvTrJkL029tzX7ErDxh8xDXbapXQyBHkIpwk+6/t2+uYXK/rSLRDdz5HOTgP1+tI
         bfNffWQPfM+Lot/6JLP25FQgiFTx+C8ZgPzFpTah6G+1xm7eTzUjY2puC6+bP7KSGt3E
         jXR9m/8NlaN6r8m+KYSEyjhQJs7cmR2+lEGhXS7SJy7xsqgY7jNowOK9JRJ1gTEaDLER
         nkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709056563; x=1709661363;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5BHk1gsyfDXTlAMC9vOKJFtYRHrRdcGURp8h1aQnRA=;
        b=HUmL+yEvYcljjg8DMJoQ4wb/pZOTIr4eaPYNg1K0wi7bGl6kAjf6SI/oK+i8+k//Os
         q5UspGtjy0azQ9QUSAv3+x8130kSY62KEf9OIOSGKrDWVqbIhhyqn5zdaSXBJN8hDybB
         rKdlU3BK1OIJ10DzesXfTfb8mqA/W6jvPcvKDWKoU8LWUzb5cBPbyqYXN1mV2mBvZqWs
         iqN3PYpMi38MF7U/eAZSOYxKZ7NDxNgJtbXxhjJy/sD5IESN6Uj36J8XeA0/Y/IpeQ2e
         T2VwUIiu6joEGRBBiPOvqTU43qwSVHEEKUY0GZlOawQT4avDU8qyTxblcq+vGy5BjRgw
         ipGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg508Bzjgpy+vs+GKToVvfX+RkO2acjMCL46qwlOn9Ajwb/InAJkgIyL9OUqbIgl9pJlDxF5hGh8weTDcaLE1pEBkS7kGYKID+/Va4
X-Gm-Message-State: AOJu0YymM05abVRLCsudfRGrYCb5z13mq6MCegdcZa/s16obvkT5S2e9
	3Wo5wG5/Fve0pJZURhAoCY6Ctq6uLU0fgQea1y6qKKGe46gGqjQGHeIs1XylsqM=
X-Google-Smtp-Source: AGHT+IHPglwPa8P7/7NBatGh41aAfu9AgRdMAsKkJfDGOUFKsXJ8xqyGKlNhDIysbCysOUHcXYOmWg==
X-Received: by 2002:a17:90a:4094:b0:299:3354:feff with SMTP id l20-20020a17090a409400b002993354feffmr7398886pjg.30.1709056562890;
        Tue, 27 Feb 2024 09:56:02 -0800 (PST)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id sw8-20020a17090b2c8800b0029abf47ec7fsm4634304pjb.0.2024.02.27.09.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:56:02 -0800 (PST)
Date: Tue, 27 Feb 2024 09:55:59 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v10] lib: checksum: Use aligned accesses for ip_fast_csum
 and csum_ipv6_magic tests
Message-ID: <Zd4iL3VbUpot0Zmw@ghost>
References: <20240223-fix_sparse_errors_checksum_tests-v10-1-b6a45914b7d8@rivosinc.com>
 <CAMuHMdW16fs2rtHkwyGK_+Fhgi5LOFVYb6vPN4mTw3Fhjv1sqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW16fs2rtHkwyGK_+Fhgi5LOFVYb6vPN4mTw3Fhjv1sqg@mail.gmail.com>

On Tue, Feb 27, 2024 at 12:17:58PM +0100, Geert Uytterhoeven wrote:
> Hi Charlie,
> 
> Thanks for your patch!
> 
> On Fri, Feb 23, 2024 at 11:12 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > The test cases for ip_fast_csum and csum_ipv6_magic were not properly
> > aligning the IP header, which were causing failures on architectures
> > that do not support misaligned accesses like some ARM platforms. To
> > solve this, align the data along (14 + NET_IP_ALIGN) bytes which is the
> > standard alignment of an IP header and must be supported by the
> > architecture.
> >
> > Furthermore, all architectures except the m68k pad "struct
> > csum_ipv6_magic_data" to 44 bits. To make compatible with the m68k,
> > manually pad this structure to 44 bits.
> 
> s/bits/bytes/ everywhere

Whoops, thanks!

> 
> >
> > Fixes: 6f4c45cbcb00 ("kunit: Add tests for csum_ipv6_magic and ip_fast_csum")
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> > The ip_fast_csum and csum_ipv6_magic tests did not work on all
> > architectures due to differences in misaligned access support.
> > Fix those issues by changing endianness of data and aligning the data.
> >
> > This patch relies upon a patch from Christophe:
> >
> > [PATCH net] kunit: Fix again checksum tests on big endian CPUs
> >
> > https://lore.kernel.org/lkml/73df3a9e95c2179119398ad1b4c84cdacbd8dfb6.1708684443.git.christophe.leroy@csgroup.eu/t/
> > ---
> > Changes in v10:
> > - Christophe Leroy graciously decided to re-write my patch to fit his
> >   style so I have dropped my endianness+sparse changes and have based by
> >   alignment fixes on his patch. The link to his patch can be seen above.
> > - I dropped Guenter's tested-by but kept his reviewed-by since only the base
> >   was changed.
> > - Link to v9: https://lore.kernel.org/r/20240221-fix_sparse_errors_checksum_tests-v9-0-bff4d73ab9d1@rivosinc.com
> 
> > --- a/lib/checksum_kunit.c
> > +++ b/lib/checksum_kunit.c
> 
> > @@ -595,28 +473,31 @@ static void test_ip_fast_csum(struct kunit *test)
> >  static void test_csum_ipv6_magic(struct kunit *test)
> >  {
> >  #if defined(CONFIG_NET)
> > -       const struct in6_addr *saddr;
> > -       const struct in6_addr *daddr;
> > +       struct csum_ipv6_magic_data {
> > +               const struct in6_addr saddr;
> > +               const struct in6_addr daddr;
> > +               __le32 len;
> > +               __wsum csum;
> > +               unsigned char proto;
> > +               unsigned char pad[3];
> > +       } *data;
> 
> If having a size of 44 bytes is critical, you really want to add a
> BUILD_BUG_ON() check for that.

Good idea, I will add that.

- Charlie

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

