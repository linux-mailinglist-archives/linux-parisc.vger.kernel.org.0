Return-Path: <linux-parisc+bounces-643-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78066861AB8
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Feb 2024 18:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7AE1C25EEB
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Feb 2024 17:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F651419B6;
	Fri, 23 Feb 2024 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OkqQa045"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71C813A88E
	for <linux-parisc@vger.kernel.org>; Fri, 23 Feb 2024 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710867; cv=none; b=oq/KB7hA/6p00zLXnPHA31F/7ZKD6xNyYQFnsogCqsppMbvZgXNwjSj6GD4c6L4u7EOyP8hN02jw0LS/mpKlVOh6WXviTM5OnArXQRWdVZUwj0wB03dapHuvc+bwMU0683H3IhmnyL8R86xbGzEs3v+Zuo5EcPtSFgjbH/m0iSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710867; c=relaxed/simple;
	bh=R4+n5nuXj1lGcUghiO6mxMIV+ChZ1AoXRyj1xA1pqrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCvJqUL6YsdRGqBKxwyIWOq7BDvAV1VUIoBdvyNt0uwpIlgTA6uPhJgJkQvPgO/l+OkG2TaUJ7lQAaY49ksX/Ob0LsaLHSvPVrvmytaM29QePYhAT8xY3zkAeZAsR8U3ZkR7dcmeX3b/RuzctnRmJO9SP6p5XwZJBWh2cX33P6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OkqQa045; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e4e7e2594cso519545b3a.2
        for <linux-parisc@vger.kernel.org>; Fri, 23 Feb 2024 09:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708710864; x=1709315664; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EW5C3xAbB93Dl8HA3rkUUESot8i2S4c+lP8NyQ15EwA=;
        b=OkqQa045QGaRnwarCUxy1WI3DtF35SsjkYsJwUgPxcNXaZ+1+z2hUTpE5sRkjfdogq
         KTdSikOZ/G+EgUqOJ2LxFCrn0otQXlKNi1MscWVcjgdPDqCRJD200Vz9B3DWMSyoO2ON
         vFz8Dvzj62aFSvNdC809U4H1+Qo7s7OxchBF7fMLQzve5E8w5WDLbwcIJW9CvUGd9Dfa
         NTpoL2v3AL3rIsPEKwi1hqWi68zzZ9OMhES1ZGYmB9EJ7UeWgVTD+c/qtfkzppL33gRV
         wzmZaFlPgityaeVhqoi1PQQpFj3JiY+ZjtVikHu2apAE94lGwADEhLoj7sz+3KGCe81s
         z3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710864; x=1709315664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EW5C3xAbB93Dl8HA3rkUUESot8i2S4c+lP8NyQ15EwA=;
        b=QXp9B4XVDJjwzf4Lt4yQuYePKf8zrxnaImaYMKSV3A/geQhoV/LpVKAYmOrYfv9Z1+
         OaMVORxR6gcKVj8ybGCe9B46hPNyo4fyK8SNT5j0wx6H6h8i4g9ofTT4wZQm0+hFtDGX
         VdLsvacXzh/0v3UiLZIf6C6f1e/IzAlns5ZvC+mbyN6uiz8emqe2AxGOVw1URM5eTHgk
         8Hapea20EVsnEwAa85mBY/GxudHdPFmLuXLtD3konsoOicTyJt2ia9T2ENJh971TrCTT
         f1XgiH8FDKtPSjZioLvvE8F5w1T2tyUDESy4tewJA6tz7TWfhvaUaQ8xSJGtnQ9L5QF5
         amRg==
X-Forwarded-Encrypted: i=1; AJvYcCUvh+7vUamXbvu+rtqknAFnOIlEMU+A+ZcfgVCpopvlj1Y7bDOHSyOpF8J2gQkkutjJZQY0GnH9VK34ol9ILdab2CyVfuFs/WIXUNPT
X-Gm-Message-State: AOJu0YyPc6bNXnEeDpFzhZqUAnswfejwuatjLy5Yfl5IhXjLlH9aa3B0
	+iiOx33quuIQff9qkT4F8zK0TnctJZp//e5eBSrWyHdYVpU/8MVmsM4KktR6BJ4dOAwQoHrAuWQ
	CnA4=
X-Google-Smtp-Source: AGHT+IGNFyyaEi8tf90krOFfzHcAsGNEa49d8V1iRD6w/prtvv/1kt+U6lypuN1vV1fZ9snR2FEcCQ==
X-Received: by 2002:a05:6a20:9f90:b0:1a0:e468:f954 with SMTP id mm16-20020a056a209f9000b001a0e468f954mr824656pzb.4.1708710864333;
        Fri, 23 Feb 2024 09:54:24 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:a351:1ab0:98d6:3d53])
        by smtp.gmail.com with ESMTPSA id v18-20020a63f852000000b005dc87643cc3sm12523028pgj.27.2024.02.23.09.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:54:23 -0800 (PST)
Date: Fri, 23 Feb 2024 09:54:21 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Guenter Roeck <linux@roeck-us.net>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Message-ID: <ZdjbzRdmeIRiZMC9@ghost>
References: <20240221-fix_sparse_errors_checksum_tests-v9-0-bff4d73ab9d1@rivosinc.com>
 <20240221-fix_sparse_errors_checksum_tests-v9-2-bff4d73ab9d1@rivosinc.com>
 <30e4f267-86c2-4df6-9f33-d6f5fc77c4db@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30e4f267-86c2-4df6-9f33-d6f5fc77c4db@csgroup.eu>

On Fri, Feb 23, 2024 at 10:06:54AM +0000, Christophe Leroy wrote:
> 
> 
> Le 22/02/2024 � 03:55, Charlie Jenkins a �crit�:
> > The test cases for ip_fast_csum and csum_ipv6_magic were failing on a
> > variety of architectures that are big endian or do not support
> > misalgined accesses. Both of these test cases are changed to support big
> > and little endian architectures.
> 
> It is unclear. The endianess issue and the alignment issue are two 
> independant subjects that should be handled in separate patches.
> 
> According to the subject of this patch, only misaligned accesses should 
> be handled here. Endianness should have been fixed by patch 1.
> 
> Also, would be nice to give exemple of architecture that has such 
> problem, and explain what is the problem exactly.
> 
> > 
> > The test for ip_fast_csum is changed to align the data along (14 +
> > NET_IP_ALIGN) bytes which is the alignment of an IP header. The test for
> > csum_ipv6_magic aligns the data using a struct. An extra padding field
> > is added to the struct to ensure that the size of the struct is the same
> > on all architectures (44 bytes).
> 
> What is the purpose of that padding ? You take fields one by one and 
> never do anything with the full struct.

sizeof(struct csum_ipv6_magic_data)) takes into account the full struct.

> 
> > 
> > Fixes: 6f4c45cbcb00 ("kunit: Add tests for csum_ipv6_magic and ip_fast_csum")
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Tested-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >   lib/checksum_kunit.c | 393 ++++++++++++++++++---------------------------------
> >   1 file changed, 134 insertions(+), 259 deletions(-)
> > 
> > diff --git a/lib/checksum_kunit.c b/lib/checksum_kunit.c
> > index 776ad3d6d5a1..f1b18e3628dd 100644
> > --- a/lib/checksum_kunit.c
> > +++ b/lib/checksum_kunit.c
> > @@ -13,8 +13,9 @@
> >   
> >   #define IPv4_MIN_WORDS 5
> >   #define IPv4_MAX_WORDS 15
> > -#define NUM_IPv6_TESTS 200
> > -#define NUM_IP_FAST_CSUM_TESTS 181
> > +#define WORD_ALIGNMENT 4
> 
> Is that macro really needed ? Can't you just use sizeof(u32) or 
> something similar ?

It is for readability purposes. This was introduced to ensure that
alignment on a 32-bit boundary was happening, so I called this word
alignment.

> 
> 
> > +/* Ethernet headers are 14 bytes and NET_IP_ALIGN is used to align them */
> > +#define IP_ALIGNMENT (14 + NET_IP_ALIGN)
> 
> Only if no VLAN.
> 
> When using VLANs it is 4 bytes more. But why do you mind that at all
> ?

Architectures make assumptions about the alignment of the packets to
optimize code. Not doing this alignment will cause illegal misaligned
accesses on some ARM platforms. Yes, VLEN is ignored here, but this
alignment is required to be supported and that is what the test cases
are stressing.

> 
> >   
> >   /* Values for a little endian CPU. Byte swap each half on big endian CPU. */
> >   static const u32 random_init_sum = 0x2847aab;
> 
> ...
> 
> > @@ -578,15 +451,19 @@ static void test_csum_no_carry_inputs(struct kunit *test)
> >   static void test_ip_fast_csum(struct kunit *test)
> >   {
> >   	__sum16 csum_result, expected;
> > -
> > -	for (int len = IPv4_MIN_WORDS; len < IPv4_MAX_WORDS; len++) {
> > -		for (int index = 0; index < NUM_IP_FAST_CSUM_TESTS; index++) {
> > -			csum_result = ip_fast_csum(random_buf + index, len);
> > -			expected = (__force __sum16)
> > -				expected_fast_csum[(len - IPv4_MIN_WORDS) *
> > -						   NUM_IP_FAST_CSUM_TESTS +
> > -						   index];
> > -			CHECK_EQ(expected, csum_result);
> > +	int num_tests = (MAX_LEN / WORD_ALIGNMENT - IPv4_MAX_WORDS * WORD_ALIGNMENT);
> > +
> > +	for (int i = 0; i < num_tests; i++) {
> > +		memcpy(&tmp_buf[IP_ALIGNMENT],
> > +		       random_buf + (i * WORD_ALIGNMENT),
> > +		       IPv4_MAX_WORDS * WORD_ALIGNMENT);
> 
> That looks weird.

If you have constructive feedback then I would be happy to clarify.

> 
> > +
> > +		for (int len = IPv4_MIN_WORDS; len <= IPv4_MAX_WORDS; len++) {
> > +			int index = (len - IPv4_MIN_WORDS) +
> > +				 i * ((IPv4_MAX_WORDS - IPv4_MIN_WORDS) + 1);
> 
> Missing blank line after declaration.
> 
> > +			csum_result = ip_fast_csum(tmp_buf + IP_ALIGNMENT, len);
> > +			expected = (__force __sum16)htons(expected_fast_csum[index]);
> 
> You must do proper type conversion using to_sum16(), not a forced cast.
> 

to_sum16 also does a forced cast, if to_sum16 is a "proper type
conversion", then this is as well. It seems to be an arbitrary to me,
but I can make it to_sum16 since it makes no difference.

> > +			CHECK_EQ(csum_result, expected);
> >   		}
> >   	}
> >   }
> > @@ -594,29 +471,27 @@ static void test_ip_fast_csum(struct kunit *test)
> >   static void test_csum_ipv6_magic(struct kunit *test)
> >   {
> >   #if defined(CONFIG_NET)
> > -	const struct in6_addr *saddr;
> > -	const struct in6_addr *daddr;
> > -	unsigned int len;
> > -	unsigned char proto;
> > -	unsigned int csum;
> > -
> > -	const int daddr_offset = sizeof(struct in6_addr);
> > -	const int len_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr);
> > -	const int proto_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr) +
> > -			     sizeof(int);
> > -	const int csum_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr) +
> > -			    sizeof(int) + sizeof(char);
> > -
> > -	for (int i = 0; i < NUM_IPv6_TESTS; i++) {
> > -		saddr = (const struct in6_addr *)(random_buf + i);
> > -		daddr = (const struct in6_addr *)(random_buf + i +
> > -						  daddr_offset);
> > -		len = *(unsigned int *)(random_buf + i + len_offset);
> > -		proto = *(random_buf + i + proto_offset);
> > -		csum = *(unsigned int *)(random_buf + i + csum_offset);
> > -		CHECK_EQ((__force __sum16)expected_csum_ipv6_magic[i],
> > -			 csum_ipv6_magic(saddr, daddr, len, proto,
> > -					 (__force __wsum)csum));
> > +	struct csum_ipv6_magic_data {
> > +		const struct in6_addr saddr;
> > +		const struct in6_addr daddr;
> > +		__be32 len;
> > +		__wsum csum;
> > +		unsigned char proto;
> > +		unsigned char pad[3];
> > +	} *data;
> > +	__sum16 csum_result, expected;
> > +	int ipv6_num_tests = ((MAX_LEN - sizeof(struct csum_ipv6_magic_data)) / WORD_ALIGNMENT);
> > +
> > +	for (int i = 0; i < ipv6_num_tests; i++) {
> > +		int index = i * WORD_ALIGNMENT;
> > +
> > +		data = (struct csum_ipv6_magic_data *)(random_buf + index);
> > +
> > +		csum_result = csum_ipv6_magic(&data->saddr, &data->daddr,
> > +					      ntohl(data->len), data->proto,
> > +					      data->csum);
> > +		expected = (__force __sum16)htons(expected_csum_ipv6_magic[i]);
> 
> Same, use to_sum16() instead htons() and a forced cast.
> 
> > +		CHECK_EQ(csum_result, expected);
> >   	}
> >   #endif /* !CONFIG_NET */
> >   }
> > 
> 
> 
> Christophe

- Charlie


