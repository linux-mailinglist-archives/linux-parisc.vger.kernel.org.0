Return-Path: <linux-parisc+bounces-3706-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A9EAE8FB5
	for <lists+linux-parisc@lfdr.de>; Wed, 25 Jun 2025 22:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2DB173B4E
	for <lists+linux-parisc@lfdr.de>; Wed, 25 Jun 2025 20:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6F7202C30;
	Wed, 25 Jun 2025 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="sIWfD+DG"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E07202963
	for <linux-parisc@vger.kernel.org>; Wed, 25 Jun 2025 20:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885007; cv=none; b=Xj/xTpocu8rp4N+cfDoK4BRTDrQ/0yTcBpFd6mp3w7eq6x4HMkiM4vKwz2secvtCdv7xt+z+ta/vQ1Oyy8HG//2NrR4WXn4drAxhjzTmFWtNvSai6GbWd05QoVWqAsORaKz3H2cLSKi9nR9HtpucAYyam5aSPlk9lwDejFdkQds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885007; c=relaxed/simple;
	bh=HnHLj/jyfnzJn5Pz3pJlna6GHIwF0CM6XdtAc0vaWFE=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=fM60GoTADc4azhsrCOqSk8++ppHGtEA59Fx+wsN73pVp93bNIGXZe/sjyiK6Me1Is4WrSteNfVAeOJcAt5Nufy3dBiX69c3mViwan/F4HgsIOlTryYZLdgug5Bh8kGdtP1niRtNbC18Bg64i65f04D2PeEIXsZtCB42wsq+e0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=sIWfD+DG; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750885002; x=1751489802; i=deller@gmx.de;
	bh=HnHLj/jyfnzJn5Pz3pJlna6GHIwF0CM6XdtAc0vaWFE=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:To:
	 From:Subject:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=sIWfD+DGE/YmOR5meoavKpCxfHxjGfNTtiK5vPqQvnA/cNBfI2YAlKOQS8iXDtYP
	 j+b/0Kwk2DiOSGw+RfACK+sfd32S2lUm9UHgYw4lPBgo83Q4XfeyTsWCpLmU/jENH
	 LCc2AAgdZPRelyOwiXzLM4VfkFfyBjoArpFSkVpQ3dhgQTz4hs0dlkeobBt6UVojo
	 iwqiiM/3V40WuU3OGbA943uAp0zdqAllDp6qvhUCkgMBKjjhHx439A+VqCHwtXpcT
	 6Z/hpyhQHBxkvhIWvLbCNtaeDJTaVjEQeYH4QJoGkAFJjy3q6BEy+7WSOusqmHjO7
	 QZN1uUiwAjy56nfE8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1usm820YDw-010YzH; Wed, 25
 Jun 2025 22:56:42 +0200
Content-Type: multipart/mixed; boundary="------------3WCNOTTIr7j6w4TUBkIIbrT8"
Message-ID: <1793f351-614b-489d-9c44-a044aec46eec@gmx.de>
Date: Wed, 25 Jun 2025 22:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Anglin <dave@parisc-linux.org>,
 linux-parisc <linux-parisc@vger.kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Subject: parisc kernel cache flush issue with mprotect()
Autocrypt: addr=deller@gmx.de; keydata=
 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
X-Provags-ID: V03:K1:Kp6Zxi9rvKAh66G3ZltjERoFrRemV8BtzRCYwk0w08NL4tyNFaz
 sJqg95s3HHQ47sjd3Q4GXcyikxNmx6DKr/DDJ8Ub3TqmNBj8nNyo/wxbIHRgZ+VEhyetFBO
 P2eLYB3Tq4N83y0sCeEx0xjJN1sdflMuej+OjHu/fKvlVmeXj5H3a0q/IH6gA7vzOd+FhC2
 0FiytUyXkgX587PB586kA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VMLbZ288e5g=;XyiFm6z1y1Vp93l+aR9KiMxXNL3
 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
 Bdc48mC9E+d1wUlAjiAdBOvdMOgg8MBw=

This is a multi-part message in MIME format.
--------------3WCNOTTIr7j6w4TUBkIIbrT8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

While analyzing testcase failures in the libunwind package,
I found a parisc Linux kernel issue.

The attached testcase initilizes a memory region, then
calls mprotect(PROT_NONE) on that region and thus effectively
should prevent userspace and kernel to access that memory.

But on parisc it seems the CPU cache isn't flushed when
changing the protection of a memory region with mprotect().
So, the kernel will wrongly not fault when accessing this memory.

I think we are missing to purge the data cache when changing
the protection.
Ideas?

Helge
--------------3WCNOTTIr7j6w4TUBkIIbrT8
Content-Type: text/x-csrc; charset=UTF-8; name="mprotect-testcase.c"
Content-Disposition: attachment; filename="mprotect-testcase.c"
Content-Transfer-Encoding: base64

LyogVGVzdGNhc2UgYmFzZWQgb24gTHRlc3QtbWVtLXZhbGlkYXRlLmMgZnJvbSBsaWJ1bndp
bmQgKi8KCiNpbmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1ZGUgPHN0ZGRlZi5oPgojaW5jbHVk
ZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RyaW5nLmg+CiNp
bmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxzeXMvbW1h
bi5oPgojaW5jbHVkZSA8c3lzL3R5cGVzLmg+CgppbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
KmFyZ3YpCnsKICB1bnNpZ25lZCBsb25nIHBhZ2Vfc2l6ZSA9IHN5c2NvbmYoX1NDX1BBR0VT
SVpFKTsKICBjaGFyICpwID0gbWFsbG9jKDMgKiBwYWdlX3NpemUpOwogIGNoYXIgKnBfYWxp
Z25lZDsKCiAgLyogaW5pdGlhbGl6ZSBtZW1vcnkgcmVnaW9uLiBJZiBub3QgaW5pdGlhbGl6
ZWQsIHdyaXRlIHN5c2NhbGwgYmVsb3cgd2lsbCBjb3JyZWN0bHkgcmV0dXJuIEVGQVVMVC4g
Ki8KICBpZiAoMSkKCW1lbXNldChwLCAnWCcsIDMgKiBwYWdlX3NpemUpOwoKICBwX2FsaWdu
ZWQgPSAoY2hhciAqKSAoKCgodWludHB0cl90KSBwKSArICgyKnBhZ2Vfc2l6ZSAtIDEpKSAm
IH4ocGFnZV9zaXplIC0gMSkpOwogIC8qIERyb3AgUFJPVF9SRUFEIHByb3RlY3Rpb24uIEtl
cm5lbCBhbmQgdXNlcnNwYWNlIHNob3VsZCBmYXVsdCB3aGVuIGFjY2Vzc2luZyB0aGF0IG1l
bW9yeSByZWdpb24gKi8KICBtcHJvdGVjdChwX2FsaWduZWQsIHBhZ2Vfc2l6ZSwgUFJPVF9O
T05FKTsKCiAgLyogdGhlIGZvbGxvd2luZyB3cml0ZSgpIHNob3VsZCByZXR1cm4gRUZBVUxU
LCBzaW5jZSBQUk9UX1JFQUQgd2FzIGRyb3BwZWQgYnkgcHJldmlvdXMgbXByb3RlY3QoKSAq
LwogIGludCByZXQgPSB3cml0ZSgyLCBwX2FsaWduZWQsIDEpOwogIGlmICghcmV0IHx8IGVy
cm5vICE9IEVGQVVMVCkKCXByaW50ZigiXG4gRkFJTFVSRTogd3JpdGUoKSBkaWQgbm90IHJl
dHVybmVkIGV4cGVjdGVkIEVGQVVMVCB2YWx1ZVxuIik7CgogIHJldHVybiAwOwp9Cg==

--------------3WCNOTTIr7j6w4TUBkIIbrT8--

