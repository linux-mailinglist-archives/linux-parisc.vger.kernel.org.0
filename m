Return-Path: <linux-parisc+bounces-4110-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4360B58B73
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Sep 2025 03:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C811D7A817D
	for <lists+linux-parisc@lfdr.de>; Tue, 16 Sep 2025 01:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EBF22A4D8;
	Tue, 16 Sep 2025 01:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JGzWjT6J"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576D202987
	for <linux-parisc@vger.kernel.org>; Tue, 16 Sep 2025 01:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757987336; cv=none; b=e8Eb6KDgvoLduRbwBDlflid1uT0OaqMB8EGxHfG9R8NPtYcHhzXzwwAK8VCYH2G/hXVns35HPXa0HQAbxM8JKjJ4V8Sjs/ENHJL4ooiQuAA+hMSLSUcLJERLht3uRkb72IExfz/Yrgch/9jH6ca6rkR8Q2adfbgXcWoVMl8G6M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757987336; c=relaxed/simple;
	bh=ixp1vRoqVO/aQuZyYy6zFP7jfZFHYTqyHd5Z6tSU/S0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m14N49hdnnf9VeUiboth/+IPUEMoqTRxBTIEioSTaJ4oT29+bo0CvbsS7urUr2AekAjLmSUtKMXc6McPMiIstg/ASZ0o+dnlDy6trIGeZ9xuCTVW01Cbg6fShTnSbiuvHm5z/Jp6wga1XqDZLsp4AWtMYE839XtVJdCRjS2WonM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JGzWjT6J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757987333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UM/63QbNRNL2CWSzKhJPtVEvJogEqqs3VcsifJT7nZg=;
	b=JGzWjT6JFY44F9HuG73zfC+XVXSpyEZnpQCAqiavnVJaex4OmR07wPNEUXLEBK3aPPNASb
	DTaTB1gZFE+DJer/o51vsb0HNic3DYvivGyJhMpU+pMvEA5BzK1/RIXnL5VmsY2pUK7A4X
	JJbm37DGkbr6iy5wEYEwqu+Km41BUrY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-TxyyOBPkNm-w58ryTuafYA-1; Mon, 15 Sep 2025 21:48:51 -0400
X-MC-Unique: TxyyOBPkNm-w58ryTuafYA-1
X-Mimecast-MFC-AGG-ID: TxyyOBPkNm-w58ryTuafYA_1757987330
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5717bd64621so2091466e87.0
        for <linux-parisc@vger.kernel.org>; Mon, 15 Sep 2025 18:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757987330; x=1758592130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UM/63QbNRNL2CWSzKhJPtVEvJogEqqs3VcsifJT7nZg=;
        b=xPOCeAiBobpYCvInpsci8Dn5lr9CJh8+UB1uBfTMNNIIZa1U+eSDYZDzIPwhEBC86M
         zQseuI0OmPJAHFC0OBBkprt57HcX6SllxtNCwBve1K6rDVPqwqOwj4gAxKzBXUgkO7k1
         J4K0ZpkmvGg2GJ3WskqnBh84m6uhtNNqmiSjoQGj7zb2iheUyBU+SY0x3SA3FGLULXmK
         Sl+SsuzZMBrzHAVoeAFCUbiydn2jjt7gW/JJCSlYodqj/8N648oo4bqxByeJvq+w3DZ4
         s+sjBaqI63edlcar0Z1aCBEHzetgfekTRWKwi9k+yGAB9mlsYC3/QSM9y18CYEie0Lni
         ZPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEI3pUxZ2Q5hH3nX0wg6vCwJbn1uFSU5JoPBQUOfKO7UB+5N7XR3wKIMPe2bM8XYRJZ2nsVSh1HQI4+AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQvh0MTm127bRP6cehkvGP8r8oEmc+Gulyggy7br3bxwkyhaqW
	Z0p6sa+UYCQr0IXf9E6Ke95ncWZlj0zBSK2PCL3PGBR5nhoHbwo573n3nMswBauYe5OmPSUKpav
	ee/WczQb6/tpLhB6OF8jlH2tfdsWlY+E4zF3GNsKmMtNshvasaL2HvoWgx/fOkhkLTj5sAGucY5
	d9HBFOaRUQp+1Yu+M1TFSQKqGw5JyH2RctttcXI0n/
X-Gm-Gg: ASbGnctUKJrVkts4zJvTPrbMeIuehlJd6uK6BTpGgJrZGVL+Rol3DcW7e060BF9VIwq
	zstQ8CLGUot8yQDKPB6qmiwNAZFkThmtCjF5uCbEqjwjtZKijpYMlrtrhHDiSvL7n6wIaedRiT4
	00Aq2yjNscSaYIIVpqGtAhWA==
X-Received: by 2002:a05:6512:3f21:b0:563:d896:2d14 with SMTP id 2adb3069b0e04-5704f7a3535mr4252915e87.36.1757987330016;
        Mon, 15 Sep 2025 18:48:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi0qyrJSXhatUAjAN5GaSbgChEfkulnz/zBRoEI09ayrVbCpTRhDlFRFU2ScIQdlOHU/dANXpgiKsiuT/Fm5k=
X-Received: by 2002:a05:6512:3f21:b0:563:d896:2d14 with SMTP id
 2adb3069b0e04-5704f7a3535mr4252904e87.36.1757987329545; Mon, 15 Sep 2025
 18:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912223937.3735076-1-safinaskar@zohomail.com>
In-Reply-To: <20250912223937.3735076-1-safinaskar@zohomail.com>
From: Dave Young <dyoung@redhat.com>
Date: Tue, 16 Sep 2025 09:48:40 +0800
X-Gm-Features: AS18NWBkCHbtMZDfiuZiXnfW8KzozFHrUJlGejiASEzNumvZVB8NmHoE7UrrQwg
Message-ID: <CALu+AoRt5wEgx-=S263CReDf8FmLWwjs8dF9cX4_jFcMUkuujQ@mail.gmail.com>
Subject: Re: [PATCH 00/62] initrd: remove classic initrd support
To: Askar Safin <safinaskar@zohomail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, 13 Sept 2025 at 06:42, Askar Safin <safinaskar@zohomail.com> wrote:
>
> Intro
> ====
> This patchset removes classic initrd (initial RAM disk) support,
> which was deprecated in 2020.
> Initramfs still stays, and RAM disk itself (brd) still stays, too.

There is one initrd use case in my mind, it can be extended to co-work
with overlayfs as a kernel built-in solution for initrd(compressed fs
image)+overlayfs.   Currently we can use compressed fs images
(squashfs or erofs) within initramfs,  and kernel loop mount together
with overlayfs, this works fine but extra pre-mount phase is needed.

Thanks
Dave


