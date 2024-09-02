Return-Path: <linux-parisc+bounces-2194-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C1967F82
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Sep 2024 08:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A1F8B21CE4
	for <lists+linux-parisc@lfdr.de>; Mon,  2 Sep 2024 06:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B789114BF89;
	Mon,  2 Sep 2024 06:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="N6X6hRA3"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5260914E2F5
	for <linux-parisc@vger.kernel.org>; Mon,  2 Sep 2024 06:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258672; cv=none; b=t/Ebk5o/lbu+pPaW+OGmZFq+G6XhiUjnVUPat8e8ei7sqxg4GCwj/0Ttx61sF/UIrejdiGFgOVSVHvChl7EwVJxVWGg30pjhJlVvfuGLsA66Dbh/MZjaRmHh4kpz3BVgeLCs5FIUXzyNPGVldUN75L6cJhh3c1bT2agBg3WpLcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258672; c=relaxed/simple;
	bh=JuHfumbqqtpZO4ur+H2jL6VJJGoY85aQfr882uJKUFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kThlnCwPy/QhOiVea/pRJQhHyZGLnRZvTo0shHcEdOJ8j7PZNb7AvvuLDcKqhe/zAzo1EDCnLy47ZswFKmDp+deyWVzQcDJn7z8FVI7g/XMN/A0b9gXpGJ3Yw/josZHr3uQG82aU7JBDZFv4VA6SN3LISx2A2jTE5cx3qehOXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=N6X6hRA3; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-715e8d7b998so143191b3a.3
        for <linux-parisc@vger.kernel.org>; Sun, 01 Sep 2024 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725258670; x=1725863470; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4QRHpO2u5pbpxFjPI4wQ+JqY+Z37bYljgBG+DFxhCvw=;
        b=N6X6hRA3e32vVjYUPa6Xsr+vi8DY/lJNSK5PWEVLMUaMut61gKKTEteZs549yuiIPB
         WpBJsQJ/97D+13AYex111INmtSyxaAyVUkURVbfdJ569sOoo7eOMdTzvYc5MitZQ1jfc
         E5T0UGKF/ThVwyeMXwjGCsQAJQDB4M39WEmNb/rPmCaqVEvKsbgcncomL3I2vCj14AB+
         JiEJxgplf3d4ryjXafZ+CbJEd+G30NHHz5hnCjBJkhEYzD33EJfd7+CVViYrMGZYU6Kv
         j9v4S+hv1+I9ymIZMrurZAClpayQoUvnaXo9DFpfWpH8rDBvoAOdpAKTNy/lAfrduQcp
         8R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725258670; x=1725863470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QRHpO2u5pbpxFjPI4wQ+JqY+Z37bYljgBG+DFxhCvw=;
        b=WBQL8aezv4cu8R3x54DFkoba1gnWIYgMhFVmo+xvxbd7iGNj4MhU4GpguBwcKiP5bL
         KlYszNy6qbqQQR3yclYPrJwOOT8pdENUFrGZ+XbSc0qN0xp1tIezYAM4XxY7DY3qSQpf
         awKVw3+kWl6/gQhmWvpz24yhQt9BNvaiSLpql6cRudXE/2iceAG4kq/1kqsBzbXbWZgU
         8zxAy5p+hT0iteAVJ9s0uJPKJTBSyLC2b4ljQ+59iULa/W6mAE8On+2uPMYEHfBZi/1r
         ltgGR22Hq4kxtLl4yyculbDM8YMAr/OlXgoZhEQwlF4mTNBMwPZyocEZa43IhL3X3cND
         g/aw==
X-Forwarded-Encrypted: i=1; AJvYcCXQFRMTXduFJfRhXJ1v9TnHD6VHntoTR/VLblZqGlU88K3FJ+BdvuN4znodBKwoSXRrByhiw5DZO/g5K/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGykLwhbghWVi7Ke/gUYZmgo+4GD1MCT3WLHDPNfqwO9PcCPWZ
	5vM9qs/LSnSItCEzRwwdgcwaye7grr541GpenLVwXsXRiWHjH2vG3GRCvojrpf/3CU1FoKhYzpx
	I
X-Google-Smtp-Source: AGHT+IEamVmuc71sTYPdHjFxuF/z2Kir18akAJnclZjSyzrG4uveb/oGnmnZ8wSmLeO97ZW2P5fb1A==
X-Received: by 2002:a17:902:da86:b0:1fb:1ae6:6aa7 with SMTP id d9443c01a7336-2052750795amr58817315ad.3.1725258670426;
        Sun, 01 Sep 2024 23:31:10 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515542350sm59747515ad.213.2024.09.01.23.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 23:31:09 -0700 (PDT)
Date: Sun, 1 Sep 2024 23:31:08 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
Message-ID: <ZtVbrM4rQsGFJo_t@telecaster>
References: <cover.1725223574.git.osandov@fb.com>
 <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>

On Mon, Sep 02, 2024 at 08:19:33AM +0200, Christophe Leroy wrote:
> 
> 
> Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> > [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: Omar Sandoval <osandov@fb.com>
> > 
> > Hi,
> > 
> > I hit a case where copy_to_kernel_nofault() will fault (lol): if the
> > destination address is in userspace and x86 Supervisor Mode Access
> > Prevention is enabled. Patch 2 has the details and the fix. Patch 1
> > renames a helper function so that its use in patch 2 makes more sense.
> > If the rename is too intrusive, I can drop it.
> 
> The name of the function is "copy_to_kernel". If the destination is a user
> address, it is not a copy to kernel but a copy to user and you already have
> the function copy_to_user() for that. copy_to_user() properly handles SMAP.

I'm not trying to copy to user. I am (well, KDB is) trying to copy to an
arbitrary address, and I want it to return an error instead of crashing
if the address is not a valid kernel address. As far as I can tell, that
is the whole point of copy_to_kernel_nofault().

Thanks,
Omar

