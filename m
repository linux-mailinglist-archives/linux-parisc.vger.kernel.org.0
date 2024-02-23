Return-Path: <linux-parisc+bounces-640-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC5860F3C
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Feb 2024 11:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 434CC1C21C13
	for <lists+linux-parisc@lfdr.de>; Fri, 23 Feb 2024 10:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2925B5CDE9;
	Fri, 23 Feb 2024 10:29:07 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D95CDEF
	for <linux-parisc@vger.kernel.org>; Fri, 23 Feb 2024 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708684147; cv=none; b=iAOLdYUNq5tQXMRshzMd4XRkmHNV6gOgoAFeofX3jCzFuxV9JE7SK47VkLLvBgBEtx+Q/rDWx9jrVebRbbQ5/+wLk7fbYtcgJ3vlQGIN2UFIBaNJitHOonWOLQLUfXlblPtQCtlU+ljxVZlcTmNhKj2ZBX04D0VDRDBZnTvMTtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708684147; c=relaxed/simple;
	bh=K3nvk8fe4h7wcPdQeLuw6kV6OrMqvS/Dl7BHL8+zH1k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=qkTJzLtW5Z4SDBoJDZHaJ9CuwfW26aWKikpzPax/8Izk/NDwvapM/H7xgjwgeqxQxphZfh8bJ4DufsQrkd+CqzaYTiZg7KW5irTz9HgtSpzWcjkKYrB9Ka653qBNAhez+/FgAFsjmQxHoEwtniAbltikjOJ/aSGNEw1yEfs1P10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-304-rbwHhyTYOouvcHjWUdr7sQ-1; Fri, 23 Feb 2024 10:28:59 +0000
X-MC-Unique: rbwHhyTYOouvcHjWUdr7sQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 23 Feb
 2024 10:28:57 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 23 Feb 2024 10:28:57 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, Charlie Jenkins
	<charlie@rivosinc.com>, Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt
	<palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Helge Deller
	<deller@gmx.de>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, Parisc List
	<linux-parisc@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v9 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Thread-Topic: [PATCH v9 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Thread-Index: AQHaZkAGLgdm0wM7/EyWAeS1+R0G6rEXuK8g
Date: Fri, 23 Feb 2024 10:28:57 +0000
Message-ID: <fa37be6a8c014d39ab75978e10995ca8@AcuMS.aculab.com>
References: <20240221-fix_sparse_errors_checksum_tests-v9-0-bff4d73ab9d1@rivosinc.com>
 <20240221-fix_sparse_errors_checksum_tests-v9-2-bff4d73ab9d1@rivosinc.com>
 <30e4f267-86c2-4df6-9f33-d6f5fc77c4db@csgroup.eu>
In-Reply-To: <30e4f267-86c2-4df6-9f33-d6f5fc77c4db@csgroup.eu>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAyMyBGZWJydWFyeSAyMDI0IDEwOjA3DQou
Li4NCj4gPiArLyogRXRoZXJuZXQgaGVhZGVycyBhcmUgMTQgYnl0ZXMgYW5kIE5FVF9JUF9BTElH
TiBpcyB1c2VkIHRvIGFsaWduIHRoZW0gKi8NCj4gPiArI2RlZmluZSBJUF9BTElHTk1FTlQgKDE0
ICsgTkVUX0lQX0FMSUdOKQ0KPiANCj4gT25seSBpZiBubyBWTEFOLg0KPiANCj4gV2hlbiB1c2lu
ZyBWTEFOcyBpdCBpcyA0IGJ5dGVzIG1vcmUuIEJ1dCB3aHkgZG8geW91IG1pbmQgdGhhdCBhdCBh
bGwgPw0KDQpXYXNuJ3Qgb25lIGFyY2hpdGVjdHVyZSBmYXVsdGluZyBvbiBhIGRvdWJsZS1yZWdp
c3RlciByZWFkPw0KV2hlcmUgdGhhdCBoYWQgdG8gYmUgYWxpZ25lZCAocHJvYmFibHkgOCBieXRl
cykgYnV0IGEgbm9ybWFsDQptZW1vcnkgcmVhZCBjb3VsZCBiZSBtaXNhbGlnbmVkPw0KDQpJIGRv
dWJ0IGl0IGlzIHZhbGlkIHRvIGFzc3VtZSB0aGF0IHRoZSBJUCBoZWFkZXJzIGlzIDggYnl0ZQ0K
YWxpZ25lZCB3aGVuIE5FVF9JUF9BTElHTiBpcyAyLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJl
ZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXlu
ZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K


