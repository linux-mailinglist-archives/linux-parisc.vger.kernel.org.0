Return-Path: <linux-parisc+bounces-3339-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7BCA4281A
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Feb 2025 17:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E07503B06F3
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Feb 2025 16:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C42A263C7C;
	Mon, 24 Feb 2025 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R3qiJTAK"
X-Original-To: linux-parisc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCDD24EF64
	for <linux-parisc@vger.kernel.org>; Mon, 24 Feb 2025 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740415119; cv=none; b=HXIEhIkaqI6t6OvSi/Z/zq5miZoJyju0Thx+DamnL3Y+5aBRgsSfakPpvjKoFhnwCWKKrZvtnisgzXhhIOCw9otimGJAvlG62g6AF/PwRqje+egaZVQaUVmw5SVGYOz7dEc+Ayyk26b33fZ+cILrvfNRLHFYhNJXC63T+wJMZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740415119; c=relaxed/simple;
	bh=MMSWJuJU5qsromQVdUd6ChbKWags0ip1ne8PGz+pULU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCsPK8bQ0gvKL6mla6QmJU/44ycfWB1bFdTOYu1qsEKq0gfaes9zDD6s+pdvKKXKEsZONN63dFXiBr18LioaRgn4Jsi7akgHxe2g9rUBd49DHY5/0f5jCOTt532LUMpe0skhKwz5mkASe33vsHrjwcBL/8q2oUT6zGUt1Nptcik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R3qiJTAK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740415115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HQ3dWVPqC2Dw8ff2CbnjKgP3N74oCRMEtHC7r2pq7E=;
	b=R3qiJTAKaF+/O93hmXhiIRB0DmQrwbxuhbpBJv24AGKznQem6F0vd/ppx9ZJuTrmLUq79o
	g/dJjqStRzVUZ4QU1k5l6CKToUAw0RFyS7KYBALIuEqYnmfHsKSq7/FnwD0M9CQFetAzFK
	IO47crP9B8idfDXAFl16V4kenqxW0Gs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-jND3wa5nPE-Q9_-iZ9a_UA-1; Mon, 24 Feb 2025 11:38:34 -0500
X-MC-Unique: jND3wa5nPE-Q9_-iZ9a_UA-1
X-Mimecast-MFC-AGG-ID: jND3wa5nPE-Q9_-iZ9a_UA_1740415113
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5dc5beb5eb0so3297335a12.1
        for <linux-parisc@vger.kernel.org>; Mon, 24 Feb 2025 08:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740415113; x=1741019913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HQ3dWVPqC2Dw8ff2CbnjKgP3N74oCRMEtHC7r2pq7E=;
        b=uaO4Fee0iIS5Orx/ucHflwbhNANEEW/KNHNWsvO9doVf7IYmoHcuZ0Sph2zoap4hJv
         5rKywgxSgOYSudy49dPeeEfEr2Sy10iM4nsy3ZfPG2+sif9be3yHe3pZNS5vZBeIMqwQ
         szYY7+Wd3OkTEL6zTbKxwD21VPyAMUw/ZQsul3lsPV173c49MZ8Bibxzw+yKlD9MQpeJ
         qW1whgp+zOEpYGZfZFaOWqHSQAz+Lo7DKVi6M50J5krjTYySo5+HH5BkCdaUX8U9hG8X
         2b8AxmZHm0Fs3gPdHjNe7hqc+KkJJycsPfbAOTrvsadhbYldHa/ZC6X43M3QwhCgdAxB
         YxGA==
X-Forwarded-Encrypted: i=1; AJvYcCXBQy1xK1CMNF/+lDqu8FDt7Y7YBHGdyq6plD/zvNEWmu3vS1s5JMkWrno90411iOrrfal+MGyAioF4QDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy14seeLC8BUWsKtDrrkzSRGZzVJQsJc2Fs2Ek75UVCRdrRw1vN
	bkmJbuJwiNRH7KTQBmwIV1kO9KJVaeoG0m6Bt+2P/4j1Obdbz+LCOYtH7/z5iIgNBaC/S6I/qU6
	qhRQlDZwbvLVJX2bB2zLLq0NIxpCmysAEfvhhu2rxZgdnJyhX0UKtXueM3OSA
X-Gm-Gg: ASbGncvd8oZNM8JQkZ8q2MW2oJiQAXqVki96fKjroa+71SC6PdtL++pwbtVElBSxBoR
	W/t0Vdunf+3FC3ZkWyKuRxvxBQ3ttRsFCmXDripE2vncOVh9aX+NhQNloaQh90PaF7Sqt2B16uH
	AncFhbQS7pzY8SD9Zn5oOTK/wisJyE5sr+MY/YWXP/vnXP6/9CNmr1badCbbumovAOY2maYbffx
	pOqvgXcrTm6RId+NfbBAmlMhm7VRHQfc9E07G2b7d3SBTfF9iLGt7fIQKmbXxYgKkb/6Yyait89
	ir/MizyNgCADBoOlnk15vnKXzjqN8xGB6FA=
X-Received: by 2002:a05:6402:2808:b0:5e0:2d53:b2a with SMTP id 4fb4d7f45d1cf-5e0b70c0d82mr36931014a12.3.1740415112466;
        Mon, 24 Feb 2025 08:38:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz+s0ONL8ejkTU1UmPgTYUJUij0Y+jBU/pmIRhrfprGz1EGlR/3qJKoYKtVNj3n95rvN+FPg==
X-Received: by 2002:a05:6402:2808:b0:5e0:2d53:b2a with SMTP id 4fb4d7f45d1cf-5e0b70c0d82mr36930832a12.3.1740415111286;
        Mon, 24 Feb 2025 08:38:31 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb4d3ef3c0sm1913191666b.41.2025.02.24.08.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:38:30 -0800 (PST)
Date: Mon, 24 Feb 2025 17:38:29 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Jan Kara <jack@suse.cz>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <pze5ejdkh5hr6qz75xbn65vmjyaw2iauseqdi52sjt3tzc6sk4@wi7vy4af5vof>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <fyp7gcbeo3xlrh7zi7k6m5aa6h5otbufxq3kh5zvgr3sjdbxl3@4nkuwx46yajk>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fyp7gcbeo3xlrh7zi7k6m5aa6h5otbufxq3kh5zvgr3sjdbxl3@4nkuwx46yajk>

On 2025-02-24 11:54:34, Jan Kara wrote:
> On Tue 11-02-25 18:22:47, Andrey Albershteyn wrote:
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> > 
> > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > extended attributes/flags. The syscalls take parent directory fd and
> > path to the child together with struct fsxattr.
> > 
> > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > that file don't need to be open as we can reference it with a path
> > instead of fd. By having this we can manipulated inode extended
> > attributes not only on regular files but also on special ones. This
> > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > we can not call ioctl() directly on the filesystem inode using fd.
> > 
> > This patch adds two new syscalls which allows userspace to get/set
> > extended inode attributes on special files by using parent directory
> > and a path - *at() like syscall.
> > 
> > Also, as vfs_fileattr_set() is now will be called on special files
> > too, let's forbid any other attributes except projid and nextents
> > (symlink can have an extent).
> > 
> > CC: linux-api@vger.kernel.org
> > CC: linux-fsdevel@vger.kernel.org
> > CC: linux-xfs@vger.kernel.org
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> 
> Some comments below:
> 
> > +SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
> > +		struct fsxattr __user *, fsx, unsigned int, at_flags)
> > +{
> > +	CLASS(fd, dir)(dfd);
> > +	struct fileattr fa;
> > +	struct path filepath;
> > +	int error;
> > +	unsigned int lookup_flags = 0;
> > +
> > +	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> > +		return -EINVAL;
> > +
> > +	if (at_flags & AT_SYMLINK_FOLLOW)
> 	    ^^ This should be !(at_flags & AT_SYMLINK_NOFOLLOW)?
> 
> In the check above you verify for AT_SYMLINK_NOFOLLOW and that also matches
> what setxattrat() does...

Right, didn't notice that this is actually opposite to setxattrat(),
will change that.

> 
> 
> > +		lookup_flags |= LOOKUP_FOLLOW;
> > +
> > +	if (at_flags & AT_EMPTY_PATH)
> > +		lookup_flags |= LOOKUP_EMPTY;
> > +
> > +	if (fd_empty(dir))
> > +		return -EBADF;
> 
> This check is wrong and in fact the whole dfd handling looks buggy.
> openat(2) manpage describes the expected behavior:
> 
>        The dirfd argument is used in conjunction with the pathname argument as
>        follows:
> 
>        •  If the pathname given in pathname is absolute,  then  dirfd  is  ig-
>           nored.
> 	  ^^^^ This is what you break. If the pathname is absolute, you're
> not expected to touch dirfd.
> 
>        •  If  the pathname given in pathname is relative and dirfd is the spe-
>           cial value AT_FDCWD, then pathname is interpreted  relative  to  the
>           current working directory of the calling process (like open()).
>           ^^^ Also AT_FDCWD handling would be broken by the above check.
> 
>        •  If  the  pathname  given  in pathname is relative, then it is inter-
>           preted relative to the directory referred to by the file  descriptor
>           dirfd  (rather than relative to the current working directory of the
>           calling process, as is done by open() for a relative pathname).   In
>           this  case,  dirfd  must  be a directory that was opened for reading
>           (O_RDONLY) or using the O_PATH flag.
> 
>        If the pathname given in pathname is relative, and dirfd is not a valid
>        file descriptor, an error (EBADF) results.  (Specifying an invalid file
>        descriptor number in dirfd can be used as a means to ensure that  path-
>        name is absolute.)
> 
> > +
> > +	error = user_path_at(dfd, filename, lookup_flags, &filepath);
> 		^^^ And user_path_at() isn't quite what you need either
> because with AT_EMPTY_PATH we also want to allow for filename to be NULL
> (not just empty string) and user_path_at() does not support that. That's
> why I in my previous replies suggested you should follow what setxattrat()
> does and that sadly it is more painful than it should be. You need
> something like:
> 
> 	name = getname_maybe_null(filename, at_flags);
> 	if (!name) {
> 		CLASS(fd, f)(dfd);
> 
> 		if (fd_empty(f))
> 			return -EBADF;
> 		error = vfs_fileattr_get(file_dentry(fd_file(f)), &fa);
> 	} else {
> 		error = filename_lookup(dfd, filename, lookup_flags, &filepath,
> 					NULL);
> 		if (error)
> 			goto out;
> 		error = vfs_fileattr_get(filepath.dentry, &fa);
> 		path_put(&filepath);
> 	}
> 	if (!error)
> 		error = copy_fsxattr_to_user(&fa, fsx);
> out:
> 	putname(name);
> 	return error;
> 
> Longer term, we need to provide user_path_maybe_null_at() for this but I
> don't want to drag you into this cleanup :)

Oh, I missed that, thanks for pointing this out, I will change it as
suggested.

-- 
- Andrey


