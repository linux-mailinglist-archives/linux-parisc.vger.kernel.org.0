Return-Path: <linux-parisc+bounces-367-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 255958314EA
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Jan 2024 09:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B3B91C22150
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Jan 2024 08:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F1A1F93F;
	Thu, 18 Jan 2024 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YF+ZtTtE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0YgdCbUf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H5GcSD4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DOY9vXKM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095291F60B;
	Thu, 18 Jan 2024 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705567109; cv=none; b=aLP2p4kQqK4C1yaLASwvYoh0cB0HHRJUrOFQcFNDsz4bKxS9AexScVAJap+EDAK46dxrZuJgHj3Z7b20w6cGruH9K7LUjEEpGejCqAKr8+k4cp/1RcntYr5R4d6IS5XAIOE/v0iuET+qbYZEJgDeX+uZEkuxdaVrC44qtklUATM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705567109; c=relaxed/simple;
	bh=uV10TaJX3KOo6YeLVG3K6b8oN8p3ULd1mWP16Uwyy6A=;
	h=Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:
	 Autocrypt:In-Reply-To:Content-Type:X-Spam-Level:X-Rspamd-Server:
	 X-Spamd-Result:X-Spam-Score:X-Rspamd-Queue-Id:X-Spam-Flag; b=YA6zZ8R4maZohfc8M2ljmteORSOCqJp4ZUpDlHmIwSuchl1YxS2p1z1VJ+LUOHwUrjG1fJ/e11OuuBorfL+fTdhCRgriL1LpY/aHZ2LMI8nT9QM7ptTBRR4kJoCsQfLG4mWDVr4LZtMBplgDOyV1ZDRa/R1opptnReWwacNRQvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YF+ZtTtE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0YgdCbUf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H5GcSD4L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DOY9vXKM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E418C21F61;
	Thu, 18 Jan 2024 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705567105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uV10TaJX3KOo6YeLVG3K6b8oN8p3ULd1mWP16Uwyy6A=;
	b=YF+ZtTtEFkRiBktcfYYcWeYZ5h8mmnUXjI+AvV9iiT2lxhN2aeFIVYsP2RMleRf0es9j/w
	sa0caaBqegD8HHcQDnVMCOTp3zk6onqg8+MUa/pAo/KdEOVjg3CVuyNlUBBYlzuP2P9j1y
	9tVujb6M5UGRJsuiRpr4coEwsx6mJwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705567105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uV10TaJX3KOo6YeLVG3K6b8oN8p3ULd1mWP16Uwyy6A=;
	b=0YgdCbUfraA/5QXMRHeJ/TbSyzwZXSKMFQIA+QYrjVRP0rPQWB3fHLHyvmPvadTIXUkmHG
	pTfA5V7VvIABBOBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705567104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uV10TaJX3KOo6YeLVG3K6b8oN8p3ULd1mWP16Uwyy6A=;
	b=H5GcSD4Lu/P8QUJlneIJpZsiLMH2e6kVyul3G3nEkKQJ1YjknlnJfbHtkYEMd8UjJsKl/Q
	NODyyGURuscyXHcLQbHWW3ISBSm4Ev7eYd0lULU43NrAr1G9+LbSevrY+gmQawUac2cyqp
	8C5wVt9J2mJ+8Ns+dzeRsZ0BMm1ondo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705567104;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uV10TaJX3KOo6YeLVG3K6b8oN8p3ULd1mWP16Uwyy6A=;
	b=DOY9vXKMdXBa4gl4M1jE9L0ZDutNBs+rY9+pBeIqUHLoqttwZWATTqrj74AASeV7TOhD10
	DFBKtyPOrVvDyLDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A726C136F5;
	Thu, 18 Jan 2024 08:38:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id frSEJ4DjqGVtKQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jan 2024 08:38:24 +0000
Message-ID: <1261336c-e8da-4a85-acac-18a7c6230ff6@suse.de>
Date: Thu, 18 Jan 2024 09:38:23 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/45] tty: vt: use enum for VESA blanking modes
Content-Language: en-US
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org
References: <20240118075756.10541-1-jirislaby@kernel.org>
 <20240118075756.10541-33-jirislaby@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20240118075756.10541-33-jirislaby@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g4KPoZ8KkQKvV0cvl8BbOLjf"
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=H5GcSD4L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DOY9vXKM
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-7.50 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[vger.kernel.org,gmx.de,HansenPartnership.com,ffwll.ch,lists.freedesktop.org];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -7.50
X-Rspamd-Queue-Id: E418C21F61
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g4KPoZ8KkQKvV0cvl8BbOLjf
Content-Type: multipart/mixed; boundary="------------9U00ZT7qdOc3P8b405nEmWw5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org
Message-ID: <1261336c-e8da-4a85-acac-18a7c6230ff6@suse.de>
Subject: Re: [PATCH 32/45] tty: vt: use enum for VESA blanking modes
References: <20240118075756.10541-1-jirislaby@kernel.org>
 <20240118075756.10541-33-jirislaby@kernel.org>
In-Reply-To: <20240118075756.10541-33-jirislaby@kernel.org>

--------------9U00ZT7qdOc3P8b405nEmWw5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDEuMjQgdW0gMDg6NTcgc2NocmllYiBKaXJpIFNsYWJ5IChTVVNFKToN
Cj4gU3dpdGNoIFZFU0EgbWFjcm9zIHRvIGFuIGVudW0gYW5kIGFkZCBhbmQgdXNlIFZFU0Ff
QkxBTktfTUFYLiBUaGlzDQo+IGltcHJvdmVzIHR5cGUgY2hlY2tpbmcgaW4gY29uc3c6OmNv
bl9ibGFuaygpLg0KPiANCj4gVGhlcmUgaXMgYSBkb3duc2lkZSBvZiB0aGlzLiBUaGUgbWFj
cm9zIHdlcmUgZGVmaW5lZCB0d2ljZTogaW4NCj4gbGludXgvY29uc29sZS5oIGFuZCB1YXBp
L2xpbnV4L2ZiLmguIFdlIGNhbm5vdCByZW1vdmUgdGhlIGxhdHRlciAodWFwaQ0KPiBoZWFk
ZXIpLCBidXQgbm9yIHdlIHdhbnQgdG8gZXhwYW5kIHRoZW0gaW4gdGhlIGtlcm5lbCB0b28u
IFNvIHByb3RlY3QNCj4gdGhlbSB1c2luZyBfX0tFUk5FTF9fLiBJbiB0aGUga2VybmVsIGNh
c2UsIGluY2x1ZGUgbGludXgvY29uc29sZS5oDQo+IGluc3RlYWQuIFRoaXMgaGVhZGVyIGRl
cGVuZGVuY3kgaXMgcHJlZXhpc3RpbmcuDQo+IA0KPiBBbHRlcm5hdGl2ZWx5LCB3ZSBjb3Vs
ZCBjcmVhdGUgYSB2ZXNhLmggaGVhZGVyIHdpdGggdGhhdCBzb2xlIGVudW0gYW5kDQo+IGlu
Y2x1ZGUgaXQuIElmIGl0IHR1cm5zIG91dCBsaW51eC9jb25zb2xlLmggaXMgdG9vIG11Y2gg
Zm9yIGZiLmguDQoNClBlcnNvbmFsbHkgSSdkIHByZWZlciBzb21ldGhpbmcgbGlrZSBpbmNs
dWRlL3VhcGkvdmlkZW8vdmVzYS5oIHRoYXQgDQpjb250YWlucyB0aGUgY3VycmVudCBkZWZp
bmVzLiBGYmRldiBpcyBkZXByZWNhdGVkIGFuZCB0aGUgbW9yZSB3ZSBjYW4gDQphdm9pZCBi
dWlsZGluZyB1cG9uIGl0LCB0aGUgYmV0dGVyLiBJZiB5b3Ugd2FudCBhbiBlbnVtIHR5cGUg
aW4gdGhlIA0Ka2VybmVsLCBtYXliZSBjcmVhdGUgaXQgZnJvbSB0aGUgY29uc3RhbnRzIGxp
a2UgdGhpczoNCg0KZW51bSB2ZXNhX2JsYW5rX21vZGUgew0KCVZFU0FfQkxBTktfTU9ERV9O
T19CTEFOS0lORyA9IFZFU0FfTk9fQkxBTktJTkcsDQoJVkVTQV9CTEFOS19NT0RFX1ZTWU5D
ID0gVkVTQV9WU1lOQ19TWVNQRU5ELA0KCVsuLi5dDQoJVkVTQV9NQVhfQkxBTktfTU9ERSA9
IC4uLiwNCn07DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEppcmkgU2xhYnkgKFNVU0UpIDxqaXJpc2xhYnlAa2VybmVsLm9yZz4NCj4gQ2M6IEhl
bGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT4NCj4gQ2M6ICJKYW1lcyBFLkouIEJvdHRvbWxl
eSIgPEphbWVzLkJvdHRvbWxleUBIYW5zZW5QYXJ0bmVyc2hpcC5jb20+DQo+IENjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtl
cm5lbC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IGxpbnV4LXBhcmlzY0B2Z2VyLmtlcm5lbC5vcmcNCj4gLS0tDQo+ICAgZHJpdmVycy90dHkv
dnQvdnQuYyAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+ICAgZHJpdmVycy92aWRlby9j
b25zb2xlL2R1bW15Y29uLmMgICAgfCAgNiArKysrLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2Nv
bnNvbGUvbWRhY29uLmMgICAgICB8ICAzICsrLQ0KPiAgIGRyaXZlcnMvdmlkZW8vY29uc29s
ZS9uZXdwb3J0X2Nvbi5jIHwgIDMgKystDQo+ICAgZHJpdmVycy92aWRlby9jb25zb2xlL3N0
aWNvbi5jICAgICAgfCAgMyArKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2NvbnNvbGUvdmdhY29u
LmMgICAgICB8ICA3ICsrKystLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJj
b24uYyAgICB8ICAzICsrLQ0KPiAgIGluY2x1ZGUvbGludXgvY29uc29sZS5oICAgICAgICAg
ICAgIHwgMTggKysrKysrKysrKystLS0tLS0tDQo+ICAgaW5jbHVkZS91YXBpL2xpbnV4L2Zi
LmggICAgICAgICAgICAgfCAgNSArKysrLQ0KPiAgIDkgZmlsZXMgY2hhbmdlZCwgMzMgaW5z
ZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy90dHkvdnQvdnQuYyBiL2RyaXZlcnMvdHR5L3Z0L3Z0LmMNCj4gaW5kZXggNmY0NmZlZmVk
Y2ZiLi43NTYyOTFmMzdkNDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdHR5L3Z0L3Z0LmMN
Cj4gKysrIGIvZHJpdmVycy90dHkvdnQvdnQuYw0KPiBAQCAtMTc1LDcgKzE3NSw3IEBAIGlu
dCBkb19wb2tlX2JsYW5rZWRfY29uc29sZTsNCj4gICBpbnQgY29uc29sZV9ibGFua2VkOw0K
PiAgIEVYUE9SVF9TWU1CT0woY29uc29sZV9ibGFua2VkKTsNCj4gICANCj4gLXN0YXRpYyBp
bnQgdmVzYV9ibGFua19tb2RlOyAvKiAwOm5vbmUgMTpzdXNwZW5kViAyOnN1c3BlbmRIIDM6
cG93ZXJkb3duICovDQo+ICtzdGF0aWMgZW51bSB2ZXNhX2JsYW5rX21vZGUgdmVzYV9ibGFu
a19tb2RlOw0KPiAgIHN0YXRpYyBpbnQgdmVzYV9vZmZfaW50ZXJ2YWw7DQo+ICAgc3RhdGlj
IGludCBibGFua2ludGVydmFsOw0KPiAgIGNvcmVfcGFyYW0oY29uc29sZWJsYW5rLCBibGFu
a2ludGVydmFsLCBpbnQsIDA0NDQpOw0KPiBAQCAtNDMzNCw3ICs0MzM0LDcgQEAgc3RhdGlj
IGludCBzZXRfdmVzYV9ibGFua2luZyh1OCBfX3VzZXIgKm1vZGVfdXNlcikNCj4gICAJCXJl
dHVybiAtRUZBVUxUOw0KPiAgIA0KPiAgIAljb25zb2xlX2xvY2soKTsNCj4gLQl2ZXNhX2Js
YW5rX21vZGUgPSAobW9kZSA8IDQpID8gbW9kZSA6IFZFU0FfTk9fQkxBTktJTkc7DQo+ICsJ
dmVzYV9ibGFua19tb2RlID0gKG1vZGUgPD0gVkVTQV9CTEFOS19NQVgpID8gbW9kZSA6IFZF
U0FfTk9fQkxBTktJTkc7DQo+ICAgCWNvbnNvbGVfdW5sb2NrKCk7DQo+ICAgDQo+ICAgCXJl
dHVybiAwOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9jb25zb2xlL2R1bW15Y29u
LmMgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvZHVtbXljb24uYw0KPiBpbmRleCBjOGQ1YWEw
ZTNlZDAuLmQ4NmMxZDc5ODY5MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9jb25z
b2xlL2R1bW15Y29uLmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9jb25zb2xlL2R1bW15Y29u
LmMNCj4gQEAgLTc5LDcgKzc5LDggQEAgc3RhdGljIHZvaWQgZHVtbXljb25fcHV0Y3Moc3Ry
dWN0IHZjX2RhdGEgKnZjLCBjb25zdCB1MTYgKnMsIHVuc2lnbmVkIGludCBjb3VudCwNCj4g
ICAJcmF3X25vdGlmaWVyX2NhbGxfY2hhaW4oJmR1bW15Y29uX291dHB1dF9uaCwgMCwgTlVM
TCk7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGludCBkdW1teWNvbl9ibGFuayhzdHJ1Y3Qg
dmNfZGF0YSAqdmMsIGludCBibGFuaywgaW50IG1vZGVfc3dpdGNoKQ0KPiArc3RhdGljIGlu
dCBkdW1teWNvbl9ibGFuayhzdHJ1Y3QgdmNfZGF0YSAqdmMsIGVudW0gdmVzYV9ibGFua19t
b2RlIGJsYW5rLA0KPiArCQkJICBpbnQgbW9kZV9zd2l0Y2gpDQo+ICAgew0KPiAgIAkvKiBS
ZWRyYXcsIHNvIHRoYXQgd2UgZ2V0IHB1dGMocykgZm9yIG91dHB1dCBkb25lIHdoaWxlIGJs
YW5rZWQgKi8NCj4gICAJcmV0dXJuIDE7DQo+IEBAIC04OSw3ICs5MCw4IEBAIHN0YXRpYyB2
b2lkIGR1bW15Y29uX3B1dGMoc3RydWN0IHZjX2RhdGEgKnZjLCB1MTYgYywgdW5zaWduZWQg
aW50IHksDQo+ICAgCQkJICB1bnNpZ25lZCBpbnQgeCkgeyB9DQo+ICAgc3RhdGljIHZvaWQg
ZHVtbXljb25fcHV0Y3Moc3RydWN0IHZjX2RhdGEgKnZjLCBjb25zdCB1MTYgKnMsIHVuc2ln
bmVkIGludCBjb3VudCwNCj4gICAJCQkgICB1bnNpZ25lZCBpbnQgeXBvcywgdW5zaWduZWQg
aW50IHhwb3MpIHsgfQ0KPiAtc3RhdGljIGludCBkdW1teWNvbl9ibGFuayhzdHJ1Y3QgdmNf
ZGF0YSAqdmMsIGludCBibGFuaywgaW50IG1vZGVfc3dpdGNoKQ0KPiArc3RhdGljIGludCBk
dW1teWNvbl9ibGFuayhzdHJ1Y3QgdmNfZGF0YSAqdmMsIGVudW0gdmVzYV9ibGFua19tb2Rl
IGJsYW5rLA0KPiArCQkJICBpbnQgbW9kZV9zd2l0Y2gpDQo+ICAgew0KPiAgIAlyZXR1cm4g
MDsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbWRhY29u
LmMgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbWRhY29uLmMNCj4gaW5kZXggNDQ4NWVmOTIz
YmIzLi42M2UzY2U2NzhhYWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vY29uc29s
ZS9tZGFjb24uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbWRhY29uLmMNCj4g
QEAgLTQ1MSw3ICs0NTEsOCBAQCBzdGF0aWMgYm9vbCBtZGFjb25fc3dpdGNoKHN0cnVjdCB2
Y19kYXRhICpjKQ0KPiAgIAlyZXR1cm4gdHJ1ZTsJLyogcmVkcmF3aW5nIG5lZWRlZCAqLw0K
PiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgbWRhY29uX2JsYW5rKHN0cnVjdCB2Y19kYXRh
ICpjLCBpbnQgYmxhbmssIGludCBtb2RlX3N3aXRjaCkNCj4gK3N0YXRpYyBpbnQgbWRhY29u
X2JsYW5rKHN0cnVjdCB2Y19kYXRhICpjLCBlbnVtIHZlc2FfYmxhbmtfbW9kZSBibGFuaywN
Cj4gKwkJCWludCBtb2RlX3N3aXRjaCkNCj4gICB7DQo+ICAgCWlmIChtZGFfdHlwZSA9PSBU
WVBFX01EQSkgew0KPiAgIAkJaWYgKGJsYW5rKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9jb25zb2xlL25ld3BvcnRfY29uLmMgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbmV3
cG9ydF9jb24uYw0KPiBpbmRleCBhZDNhMDkxNDI3NzAuLjM4NDM3YTUzYjdmMSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy92aWRlby9jb25zb2xlL25ld3BvcnRfY29uLmMNCj4gKysrIGIv
ZHJpdmVycy92aWRlby9jb25zb2xlL25ld3BvcnRfY29uLmMNCj4gQEAgLTQ3Niw3ICs0NzYs
OCBAQCBzdGF0aWMgYm9vbCBuZXdwb3J0X3N3aXRjaChzdHJ1Y3QgdmNfZGF0YSAqdmMpDQo+
ICAgCXJldHVybiB0cnVlOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgbmV3cG9ydF9i
bGFuayhzdHJ1Y3QgdmNfZGF0YSAqYywgaW50IGJsYW5rLCBpbnQgbW9kZV9zd2l0Y2gpDQo+
ICtzdGF0aWMgaW50IG5ld3BvcnRfYmxhbmsoc3RydWN0IHZjX2RhdGEgKmMsIGVudW0gdmVz
YV9ibGFua19tb2RlIGJsYW5rLA0KPiArCQkJIGludCBtb2RlX3N3aXRjaCkNCj4gICB7DQo+
ICAgCXVuc2lnbmVkIHNob3J0IHRyZWc7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2NvbnNvbGUvc3RpY29uLmMgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvc3RpY29u
LmMNCj4gaW5kZXggODE3Yjg5YzQ1ZTgxLi5lOWQ1ZDFmOTI4ODMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vY29uc29sZS9zdGljb24uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVv
L2NvbnNvbGUvc3RpY29uLmMNCj4gQEAgLTI5OCw3ICsyOTgsOCBAQCBzdGF0aWMgYm9vbCBz
dGljb25fc3dpdGNoKHN0cnVjdCB2Y19kYXRhICpjb25wKQ0KPiAgICAgICByZXR1cm4gdHJ1
ZTsJLyogbmVlZHMgcmVmcmVzaGluZyAqLw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQg
c3RpY29uX2JsYW5rKHN0cnVjdCB2Y19kYXRhICpjLCBpbnQgYmxhbmssIGludCBtb2RlX3N3
aXRjaCkNCj4gK3N0YXRpYyBpbnQgc3RpY29uX2JsYW5rKHN0cnVjdCB2Y19kYXRhICpjLCBl
bnVtIHZlc2FfYmxhbmtfbW9kZSBibGFuaywNCj4gKwkJCWludCBtb2RlX3N3aXRjaCkNCj4g
ICB7DQo+ICAgICAgIGlmIChibGFuayA9PSBWRVNBX05PX0JMQU5LSU5HKSB7DQo+ICAgCWlm
IChtb2RlX3N3aXRjaCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vY29uc29sZS92
Z2Fjb24uYyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS92Z2Fjb24uYw0KPiBpbmRleCA5MTBk
YzczODc0YjcuLmE0YmQ5N2FiNTAyZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9j
b25zb2xlL3ZnYWNvbi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS92Z2Fjb24u
Yw0KPiBAQCAtODEsNyArODEsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50CXZnYV92aWRlb19u
dW1fbGluZXM7CQkJLyogTnVtYmVyIG9mIHRleHQgbGluZXMgKi8NCj4gICBzdGF0aWMgYm9v
bAkJdmdhX2Nhbl9kb19jb2xvcjsJCQkvKiBEbyB3ZSBzdXBwb3J0IGNvbG9ycz8gKi8NCj4g
ICBzdGF0aWMgdW5zaWduZWQgaW50CXZnYV9kZWZhdWx0X2ZvbnRfaGVpZ2h0IF9fcmVhZF9t
b3N0bHk7CS8qIEhlaWdodCBvZiBkZWZhdWx0IHNjcmVlbiBmb250ICovDQo+ICAgc3RhdGlj
IHVuc2lnbmVkIGNoYXIJdmdhX3ZpZGVvX3R5cGUJCV9fcmVhZF9tb3N0bHk7CS8qIENhcmQg
dHlwZSAqLw0KPiAtc3RhdGljIGludAkJdmdhX3Zlc2FfYmxhbmtlZDsNCj4gK3N0YXRpYyBl
bnVtIHZlc2FfYmxhbmtfbW9kZSB2Z2FfdmVzYV9ibGFua2VkOw0KPiAgIHN0YXRpYyBib29s
IAkJdmdhX3BhbGV0dGVfYmxhbmtlZDsNCj4gICBzdGF0aWMgYm9vbCAJCXZnYV9pc19nZng7
DQo+ICAgc3RhdGljIGJvb2wgCQl2Z2FfNTEyX2NoYXJzOw0KPiBAQCAtNjgzLDcgKzY4Myw3
IEBAIHN0YXRpYyBzdHJ1Y3Qgew0KPiAgIAl1bnNpZ25lZCBjaGFyIENsb2NraW5nTW9kZTsJ
LyogU2VxLUNvbnRyb2xsZXI6MDFoICovDQo+ICAgfSB2Z2Ffc3RhdGU7DQo+ICAgDQo+IC1z
dGF0aWMgdm9pZCB2Z2FfdmVzYV9ibGFuayhzdHJ1Y3Qgdmdhc3RhdGUgKnN0YXRlLCBpbnQg
bW9kZSkNCj4gK3N0YXRpYyB2b2lkIHZnYV92ZXNhX2JsYW5rKHN0cnVjdCB2Z2FzdGF0ZSAq
c3RhdGUsIGVudW0gdmVzYV9ibGFua19tb2RlIG1vZGUpDQo+ICAgew0KPiAgIAkvKiBzYXZl
IG9yaWdpbmFsIHZhbHVlcyBvZiBWR0EgY29udHJvbGxlciByZWdpc3RlcnMgKi8NCj4gICAJ
aWYgKCF2Z2FfdmVzYV9ibGFua2VkKSB7DQo+IEBAIC03OTcsNyArNzk3LDggQEAgc3RhdGlj
IHZvaWQgdmdhX3BhbF9ibGFuayhzdHJ1Y3Qgdmdhc3RhdGUgKnN0YXRlKQ0KPiAgIAl9DQo+
ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGludCB2Z2Fjb25fYmxhbmsoc3RydWN0IHZjX2RhdGEg
KmMsIGludCBibGFuaywgaW50IG1vZGVfc3dpdGNoKQ0KPiArc3RhdGljIGludCB2Z2Fjb25f
Ymxhbmsoc3RydWN0IHZjX2RhdGEgKmMsIGVudW0gdmVzYV9ibGFua19tb2RlIGJsYW5rLA0K
PiArCQkJaW50IG1vZGVfc3dpdGNoKQ0KPiAgIHsNCj4gICAJc3dpdGNoIChibGFuaykgew0K
PiAgIAljYXNlIFZFU0FfTk9fQkxBTktJTkc6CQkvKiBVbmJsYW5rICovDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYmNvbi5jDQo+IGluZGV4IGQ1ZDkyNDIyNTIwOS4uNjliZTVmMjEwNmJj
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYw0KPiAr
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYw0KPiBAQCAtMjE5OCw3ICsy
MTk4LDggQEAgc3RhdGljIHZvaWQgZmJjb25fZ2VuZXJpY19ibGFuayhzdHJ1Y3QgdmNfZGF0
YSAqdmMsIHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPiAgIAl9DQo+ICAgfQ0KPiAgIA0KPiAt
c3RhdGljIGludCBmYmNvbl9ibGFuayhzdHJ1Y3QgdmNfZGF0YSAqdmMsIGludCBibGFuaywg
aW50IG1vZGVfc3dpdGNoKQ0KPiArc3RhdGljIGludCBmYmNvbl9ibGFuayhzdHJ1Y3QgdmNf
ZGF0YSAqdmMsIGVudW0gdmVzYV9ibGFua19tb2RlIGJsYW5rLA0KPiArCQkgICAgICAgaW50
IG1vZGVfc3dpdGNoKQ0KPiAgIHsNCj4gICAJc3RydWN0IGZiX2luZm8gKmluZm8gPSBmYmNv
bl9pbmZvX2Zyb21fY29uc29sZSh2Yy0+dmNfbnVtKTsNCj4gICAJc3RydWN0IGZiY29uX29w
cyAqb3BzID0gaW5mby0+ZmJjb25fcGFyOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9jb25zb2xlLmggYi9pbmNsdWRlL2xpbnV4L2NvbnNvbGUuaA0KPiBpbmRleCBmN2M2YjVm
YzNhMzYuLjVlYTk4NGI4YzVlNCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9jb25z
b2xlLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9jb25zb2xlLmgNCj4gQEAgLTMxLDYgKzMx
LDE1IEBAIGVudW0gY29uX3Njcm9sbCB7DQo+ICAgCVNNX0RPV04sDQo+ICAgfTsNCj4gICAN
Cj4gKy8qIE5vdGU6IGZiY29uIGRlZmluZXMgdGhlIGJlbG93IGFzIG1hY3JvcyBmb3IgdXNl
cnNwYWNlIChpbiBmYi5oKS4gKi8NCj4gK2VudW0gdmVzYV9ibGFua19tb2RlIHsNCj4gKwlW
RVNBX05PX0JMQU5LSU5HCT0gMCwNCj4gKwlWRVNBX1ZTWU5DX1NVU1BFTkQJPSAxLA0KPiAr
CVZFU0FfSFNZTkNfU1VTUEVORAk9IDIsDQo+ICsJVkVTQV9QT1dFUkRPV04JCT0gVkVTQV9W
U1lOQ19TVVNQRU5EIHwgVkVTQV9IU1lOQ19TVVNQRU5ELA0KPiArCVZFU0FfQkxBTktfTUFY
CQk9IFZFU0FfUE9XRVJET1dOLA0KPiArfTsNCj4gKw0KPiAgIGVudW0gdmNfaW50ZW5zaXR5
Ow0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtNjksNyArNzgsOCBAQCBzdHJ1Y3QgY29uc3cgew0K
PiAgIAkJCXVuc2lnbmVkIGludCBib3R0b20sIGVudW0gY29uX3Njcm9sbCBkaXIsDQo+ICAg
CQkJdW5zaWduZWQgaW50IGxpbmVzKTsNCj4gICAJYm9vbAkoKmNvbl9zd2l0Y2gpKHN0cnVj
dCB2Y19kYXRhICp2Yyk7DQo+IC0JaW50CSgqY29uX2JsYW5rKShzdHJ1Y3QgdmNfZGF0YSAq
dmMsIGludCBibGFuaywgaW50IG1vZGVfc3dpdGNoKTsNCj4gKwlpbnQJKCpjb25fYmxhbmsp
KHN0cnVjdCB2Y19kYXRhICp2YywgZW51bSB2ZXNhX2JsYW5rX21vZGUgYmxhbmssDQo+ICsJ
CQkgICAgIGludCBtb2RlX3N3aXRjaCk7DQo+ICAgCWludAkoKmNvbl9mb250X3NldCkoc3Ry
dWN0IHZjX2RhdGEgKnZjLCBzdHJ1Y3QgY29uc29sZV9mb250ICpmb250LA0KPiAgIAkJCXVu
c2lnbmVkIGludCB2cGl0Y2gsIHVuc2lnbmVkIGludCBmbGFncyk7DQo+ICAgCWludAkoKmNv
bl9mb250X2dldCkoc3RydWN0IHZjX2RhdGEgKnZjLCBzdHJ1Y3QgY29uc29sZV9mb250ICpm
b250LA0KPiBAQCAtNTIwLDEyICs1MzAsNiBAQCB2b2lkIHZjc19yZW1vdmVfc3lzZnMoaW50
IGluZGV4KTsNCj4gICAgKi8NCj4gICBleHRlcm4gYXRvbWljX3QgaWdub3JlX2NvbnNvbGVf
bG9ja193YXJuaW5nOw0KPiAgIA0KPiAtLyogVkVTQSBCbGFua2luZyBMZXZlbHMgKi8NCj4g
LSNkZWZpbmUgVkVTQV9OT19CTEFOS0lORyAgICAgICAgMA0KPiAtI2RlZmluZSBWRVNBX1ZT
WU5DX1NVU1BFTkQgICAgICAxDQo+IC0jZGVmaW5lIFZFU0FfSFNZTkNfU1VTUEVORCAgICAg
IDINCj4gLSNkZWZpbmUgVkVTQV9QT1dFUkRPV04gICAgICAgICAgMw0KPiAtDQo+ICAgZXh0
ZXJuIHZvaWQgY29uc29sZV9pbml0KHZvaWQpOw0KPiAgIA0KPiAgIC8qIEZvciBkZWZlcnJl
ZCBjb25zb2xlIHRha2VvdmVyICovDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGlu
dXgvZmIuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9mYi5oDQo+IGluZGV4IDNhNDk5MTNkMDA2
Yy4uNTYyYmRiYjc2YWQ5IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvZmIu
aA0KPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvZmIuaA0KPiBAQCAtMjk0LDExICsyOTQs
MTQgQEAgc3RydWN0IGZiX2NvbjJmYm1hcCB7DQo+ICAgfTsNCj4gICANCj4gICAvKiBWRVNB
IEJsYW5raW5nIExldmVscyAqLw0KPiArI2lmZGVmIF9fS0VSTkVMX18NCj4gKyNpbmNsdWRl
IDxsaW51eC9jb25zb2xlLmg+DQo+ICsjZWxzZQ0KPiAgICNkZWZpbmUgVkVTQV9OT19CTEFO
S0lORyAgICAgICAgMA0KPiAgICNkZWZpbmUgVkVTQV9WU1lOQ19TVVNQRU5EICAgICAgMQ0K
PiAgICNkZWZpbmUgVkVTQV9IU1lOQ19TVVNQRU5EICAgICAgMg0KPiAgICNkZWZpbmUgVkVT
QV9QT1dFUkRPV04gICAgICAgICAgMw0KPiAtDQo+ICsjZW5kaWYNCj4gICANCj4gICBlbnVt
IHsNCj4gICAJLyogc2NyZWVuOiB1bmJsYW5rZWQsIGhzeW5jOiBvbiwgIHZzeW5jOiBvbiAq
Lw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3Nl
IDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFH
IE51ZXJuYmVyZykNCg==

--------------9U00ZT7qdOc3P8b405nEmWw5--

--------------g4KPoZ8KkQKvV0cvl8BbOLjf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWo438FAwAAAAAACgkQlh/E3EQov+B3
0hAAsJ9/R3HoCz6S1aO4bVjCZj6PUbskrqoSTMZvisPg6E78KE+CcZP8LxE9vdLkQUFBw+UuPC7+
FHvebgYZ7Sdg3PyM3GjE/3gIyiLbmKaT8h4C9zk/LOSi8xoXLYib+JlUDsXZU/3KBVVPtCegJabv
/N8emRuA8pxDrOJNGs2WJAF9Xn6xrOfQBry1wbEj3T1WXcifUZrYdh6VwXQtRGT5mXn2ANd7npbu
veQEak8SYKxQqMgvC50PpRULozSStOPPVt2G5BsV5pYwhcMrNHlgIr2oJKv4dbkFIAE+t2Qk+aS3
8nNv2V9+Dit5nFNCtCYWXvXiUfmBWePtWRLrZ4S6cbV46G2QaThwOUlKrOuheF5TMQX+5IbKRUmJ
yrUxi5DP6AceXVl6599fgRUeNBQdh+oSkOUjZjEiSJF/SzEhMuThHQyynoxe/LmB9vZCcGpS3Ftz
BjNLKd+zf9EZYVVfZDuts46+SjfXFfzmCG+3Bfu4HuJNTzpAvrx4aSI9/kFzgH4xnPfjObftnpvl
QwDnpp7SR9VRXLGucGN/uosHcwORTqeHUvoq3TtTA/2hllVn+DvDWGajB/mq9HJnXInbD/Msah08
6Bu2z23vcbMVSX0Aa19pYs++Et0xEcz2kzw4G34wTvE6BvrVqFD6DFi1169CAOwADy5roYNpdhiL
J80=
=YYvP
-----END PGP SIGNATURE-----

--------------g4KPoZ8KkQKvV0cvl8BbOLjf--

