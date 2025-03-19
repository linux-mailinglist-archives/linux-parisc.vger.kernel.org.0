Return-Path: <linux-parisc+bounces-3462-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F7A68951
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Mar 2025 11:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 193833BAA78
	for <lists+linux-parisc@lfdr.de>; Wed, 19 Mar 2025 10:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC86253F0D;
	Wed, 19 Mar 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cqzk+EdP"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3200253F17
	for <linux-parisc@vger.kernel.org>; Wed, 19 Mar 2025 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742379620; cv=none; b=ao9E+15Q8vCh1TIr7aPshXrZOzw6ho94IT6KA/z9hfIMG3M4v2LId4f0kGO+U/1w09zsfpf55InGE7Cx9jAERyBf6HVDyI6/66js7FOog+46EvUX/bDPSfQahQ4UFxw8cir+wtqIATjQnCuYSr5FSom1h+e0YRnczLh6G9PkAWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742379620; c=relaxed/simple;
	bh=tK60PvB18wBvxWYt9lvP7XZvyX62+1Eh/q18fiab6Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvS8QVN0pZ+AQMVHp2nrtEp6+Qh7tPVDfr3hYvSIOqjAEdzlEWrXrZW/oHfM36D8HEh0tGQe4DV4bifTJNs7jNQZCeH4JV4y3JVfEgdR5t4c2xaSUVHCVoeVlK7N/dPofa+zBMed5yarmNKbl/5gYLEeIxgQ+9/tn4crjnlRm/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cqzk+EdP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39133f709f5so4086261f8f.0
        for <linux-parisc@vger.kernel.org>; Wed, 19 Mar 2025 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742379616; x=1742984416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=Cqzk+EdPpIhDnCwd4eZQhRJmj37M2X58h2HO5uNqgSIH22V9OW14Iab3Ju3v2/JBGK
         FkBh+Vl+ywlPDXLek56OVX9eR8guijL21wCkGBOrgCBDqWVTlUyF3Y3fKKCO3l7SLWUk
         jOEddmM13XNbr2OwEDURPTNxBfXb5OlBEi/oxCUifpl1mr3whqiOhSu0CRKjMMNuUjh9
         9slN6j9TtWAO77QjCTesk6z9yRW7BBsUpTsypOZ+aWphqBGd+J7kGPNlXEE96Wdpk08M
         GbHQt7vH+zR/MLbHBv0S8POfgt0v5joJzok+xCZjw6r4elUMOvJEV4DVk/8Cg1gP+Ack
         KKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379616; x=1742984416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=HPbVSad9C8XYt0z9Phc2YUp3DI6h5XLKeQqQH+9l9v4D0C7NNMAA96x3By4dBsrwWf
         SA9e4/nwUANA6XhE/jUhr+1Lw3hUrN/Lwk/UIqFcfEVN2MShlAvsV+tthrtGOe+3E+2/
         IuWHQV9hKmxKxOaONbN+BVrizBJAMpbavkrzNK38h/OUvmRDtRUbIkZh2UUBDbmj632a
         tFDC3SqOvdRrZX92GF5EiPlDwibiwNV8JyoMHgSKZxGxs0g1qmPAHk7t9BWS35gHUtBA
         xfXeORuL1WzyLwu5K4mo924ucY/+sYerHVS+1gdueLue8gqeZJgUyz14wa8LtWBMVn2/
         EEaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8lIGjt/hBCM5VjHMUgNpxqc2iwB0mLGicgjsEYl8W46puzTZKOBMm+JyJQmLPomfMTqXYmpMH1sTLO0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YygMjv83yVSbF3+ETKyaie/vEliYNUptYh3CKuFTQ/qI6YDbGuw
	gwou4sHHGJgK1LtKhX0iLesbJk35GN5Rgz1NHYp7ZQwheHekwtyH6Nglx3aKyfk=
X-Gm-Gg: ASbGncuQPPRRNPAv38ma9zmScF5JNWQKApNO0hIo6BBNFd0ygxk5T5FgIA3mAbilT4H
	oJux0c/d+0xSOn+/UOTru6Do1kn/DPvoOLKTsCILTQk7f04qHHyAJ2WFQdJEsvRFIm31QeJ4JkR
	+oh3T3fv6PUXNwJrseb1eMzYEw0om4ayNh4XrrHjfvPJAL4Xn/n6n/f38SsQpiXSDvjIwDOf7JA
	A4Un1Bckk+yt0ZCrl6/PDp1TPduhpGXEHX3yKrXr/MbpywTC/C6HYdwuTOL5afLz03UHP/E/jae
	BqVTWrufLORqjbz78jRhErlc4JROqGXPwYXUN3X4+wSF8SuR3A==
X-Google-Smtp-Source: AGHT+IHjcG6/IeV2BOfDblPqcpvGjw3L7kajd7hg9EDti/4DwNoU0L0nZRG8X9Tat0FLH2nt55nwLg==
X-Received: by 2002:a05:6000:1541:b0:390:e655:f998 with SMTP id ffacd0b85a97d-399739ca2a8mr1441536f8f.26.1742379615798;
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c7df3506sm21189338f8f.11.2025.03.19.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:20:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <fc197abf-e65a-439f-9d35-83f4665519f3@stanley.mountain>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
 <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>

On Wed, Mar 19, 2025 at 09:05:27AM +0100, Christophe Leroy wrote:
> 
> Doesn't sparse and/or checkpatch complain about 0 being used in lieu of NULL
> ?

Sparse does have a "Using plain integer as NULL pointer" warning, yes.

I can't apply this patchset and I haven't been following the conversation
closely (plus I'm pretty stupid as well) so I'm not sure if it will
trigger here...

regards,
dan carpenter


