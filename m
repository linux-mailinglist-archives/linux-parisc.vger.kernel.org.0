Return-Path: <linux-parisc+bounces-2440-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09598E299
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 20:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D6571C20A41
	for <lists+linux-parisc@lfdr.de>; Wed,  2 Oct 2024 18:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6893E212F0F;
	Wed,  2 Oct 2024 18:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aAN2R31Y"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D58212F0B
	for <linux-parisc@vger.kernel.org>; Wed,  2 Oct 2024 18:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727894024; cv=none; b=KHzIoj54NG+m7C/JUnjDE/QkEYjfwKr+KFc/mBMgWvC08Priecy5BtxAPEt3VxBLc9HtgKjKgy8Bo+5xFPIxcTKD1w56gmuCFWoUe8RI+Wdrye9SMhjEzBOKgdbNz1io9CM7Wmqv+2sUuPO/k9ZpBqU2BiBsZtn3KpIkKJ5D768=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727894024; c=relaxed/simple;
	bh=AjMuW3cUPqvX5IXf0tVKVsi6FlVddUpdkqEr9qZyHG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXxS8ESF6GgGwRtlri/lYMTVZu84GtfcH5Y7ac36puyXhVRXrd4OSXrAbzKDCzeg+3twhMgOPnSEHMXTFtg3Lq4UakIhdSD35Cj5tPMHiynyt1v0HSz8A7b5idD28vopQCrC+l/metb2n0+DjOfVPf5KdxZVet3UgqSp+Z4BM8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aAN2R31Y; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c8af23a4fcso45014a12.0
        for <linux-parisc@vger.kernel.org>; Wed, 02 Oct 2024 11:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727894021; x=1728498821; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nuETLuv/R/DJMMuFcZ4I+Mj9qc52mZmXcaPl20FH7fo=;
        b=aAN2R31YX6XAV5xJPF0CCUL2bfkSUDz2/o7rcS0qdcfE5UnBrsUmtTQUxKq59peCly
         mNwedh+f/ZFU6V3n2/S3lAegpWb+BeXXS7mhs7qvCmz28DSl6+z79VKNZL+4cDYMm3PM
         NZVzBp7/30RCi/HXo+NjoyFN0auC1+Ft20j3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727894021; x=1728498821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuETLuv/R/DJMMuFcZ4I+Mj9qc52mZmXcaPl20FH7fo=;
        b=keRwPDAquu8brzXJQ7AfK7EQVlEHX0bCITlWpp0+1WSmGTPvNtq3lniLz+hMGS6eBK
         /aSVi3Lln2ZJQLfrbuxb3UUunQx2Bo+ukd57qSH6dLqY6/gK/4Pe1NaPs+G5NQyVEJKz
         HAwN5loaGyV81RtByfFMXwseYfhHVwqaiBHroSKW8hdgaYA+3IzGhI5Spp9ZpqiPz9NL
         HWvLKqAITkQF/ReJdcnoXuF5NrOW7mRFax8T6qWVT9n92Tiv7qI56yfRzfbWqp021fgi
         Cuo9tVv8Cy4gvlHaoTTGOPRwWVom/szReLa3fqc2+i8dpCDesDaQqUZMW9zsc8vkyXWL
         O8qg==
X-Forwarded-Encrypted: i=1; AJvYcCVhPrrN2DMJ5JOqHIdsyH0W8vePdHuHlw/q7FbrD11Ie/xqVK633wo7Grwop7Z5aX0IF+08czuUPrPnJAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzty7hZmYGNRboK0FVcD+wCBOKrWTbg0KF78khMIo+Q6zftJKZP
	WgMvkh02nMT2cb7pEhcIkx6119dZ+zuzkeqZT3ZpGI1Ogczqng0NS073QvWj80oNMV4IItUvB9a
	WfnzgpA==
X-Google-Smtp-Source: AGHT+IELlt4TfeqWFLNl4D4t/oSwkqqwOBw//cshXEUqKeryux4eZad0xQ/VaCz/5z2h2R9L64Ocgw==
X-Received: by 2002:a05:6402:51cc:b0:5c2:439d:90d4 with SMTP id 4fb4d7f45d1cf-5c8b1b84137mr2368646a12.30.1727894020696;
        Wed, 02 Oct 2024 11:33:40 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88332989dsm7737901a12.81.2024.10.02.11.33.39
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 11:33:39 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c88b5c375fso14394a12.3
        for <linux-parisc@vger.kernel.org>; Wed, 02 Oct 2024 11:33:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzZJKPUzncrx224BxMaTRZeR+/8oRcuqD7+9q7D08vPGZpGUh8YsAh0wFZGeHQgY86CtwdDniQK6tAC58=@vger.kernel.org
X-Received: by 2002:a17:907:6e8d:b0:a86:97c0:9bb3 with SMTP id
 a640c23a62f3a-a98f837d570mr382833266b.51.1727894019353; Wed, 02 Oct 2024
 11:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001195107.GA4017910@ZenIV>
In-Reply-To: <20241001195107.GA4017910@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Oct 2024 11:33:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj7f32w8p1OrN4fahaF+44zWfTAD+3ucd=XETM_Pt-=6A@mail.gmail.com>
Message-ID: <CAHk-=wj7f32w8p1OrN4fahaF+44zWfTAD+3ucd=XETM_Pt-=6A@mail.gmail.com>
Subject: Re: [RFC][PATCHES] asm/unaligned.h removal
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org, 
	Vineet Gupta <vgupta@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Oct 2024 at 12:51, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         Please, review.  I don't really care which tree(s) does that stuff
> go through; I can put the first two in my #for-next, as long as nobody
> has objections to the patches themselves.

Please just add the whole series to your tree. I see you already got
the ack for the parisc side, the arc side looks fine too.

And even if there is some further fixup required, I'd rather just have
this done and do any possible fixups later than have some kind of
"wait for everybody to ack it".

               Linus

