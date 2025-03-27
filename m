Return-Path: <linux-parisc+bounces-3499-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED3A73243
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Mar 2025 13:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DD437A6DDC
	for <lists+linux-parisc@lfdr.de>; Thu, 27 Mar 2025 12:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3802135B7;
	Thu, 27 Mar 2025 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lb5Zvmbs";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VxbPFARU";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lb5Zvmbs";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VxbPFARU"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463B9460
	for <linux-parisc@vger.kernel.org>; Thu, 27 Mar 2025 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743078719; cv=none; b=B262sVU+hcXwARCixWdIRCSYtSics3ce58NXhawyD/PF3FXnT/pYemz0F/tYi2HtABh/BHvG0wjMpJ5qmRyonzd18Jm72R3lADn2D8vDBvIdtSzwdNceQZgOokEPjn8GNB/qmlW87o/83y7xcLbR/VeD1tK2sPV9/14wJI2ChYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743078719; c=relaxed/simple;
	bh=9939gY8Gvx/tT25acIcUS/s1D6Ti1Kf7htyEV5P2xFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIw3YAPpS7oYaVbbPxpArTB/vsypLCFdc/XxxltuCcznkbkc8R+tcmThpqRkZWHOw5i6cHw4OJ6udbHQqsTpLUUgrTaLWi29bN7frMPb57hEhmh9u6UPHymPD1V4/8IbIKZiFV6d2rOSRKZdVgJ6gHIh7MTZvGgI2EYU/0J/+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lb5Zvmbs; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VxbPFARU; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lb5Zvmbs; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VxbPFARU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B2D1E2117A;
	Thu, 27 Mar 2025 12:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743078714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzaWaBrzy/zcV3/lzkRdPYXCaZALjKMfXDScLnuiDPQ=;
	b=lb5ZvmbsngZdXyGxjwN188J/bOCMBjDdZgQCabf/CeOAi6M2Twf/Uvk/191R5XWyu0lGWl
	AEl4d9NQZJaVQugn6t+do0QEie8Dy+8lhPhSifS0GSj4wIvJGc322gBmIgL7I4bFACC2hY
	pAfYMaUPPetq4wmz0Y51dt1ib8GBJRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743078714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzaWaBrzy/zcV3/lzkRdPYXCaZALjKMfXDScLnuiDPQ=;
	b=VxbPFARUT+Ot/Cwaz/cqzLioWcahEjXqUKYr91UP0arcbn4gyYBmqSmEUfxKBcs6WzU4va
	LscvDn3wyXH42ACQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743078714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzaWaBrzy/zcV3/lzkRdPYXCaZALjKMfXDScLnuiDPQ=;
	b=lb5ZvmbsngZdXyGxjwN188J/bOCMBjDdZgQCabf/CeOAi6M2Twf/Uvk/191R5XWyu0lGWl
	AEl4d9NQZJaVQugn6t+do0QEie8Dy+8lhPhSifS0GSj4wIvJGc322gBmIgL7I4bFACC2hY
	pAfYMaUPPetq4wmz0Y51dt1ib8GBJRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743078714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzaWaBrzy/zcV3/lzkRdPYXCaZALjKMfXDScLnuiDPQ=;
	b=VxbPFARUT+Ot/Cwaz/cqzLioWcahEjXqUKYr91UP0arcbn4gyYBmqSmEUfxKBcs6WzU4va
	LscvDn3wyXH42ACQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5038139D4;
	Thu, 27 Mar 2025 12:31:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zUFEKDpF5WeuPAAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 27 Mar 2025 12:31:54 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 5AA64A082A; Thu, 27 Mar 2025 13:31:50 +0100 (CET)
Date: Thu, 27 Mar 2025 13:31:50 +0100
From: Jan Kara <jack@suse.cz>
To: Andrey Albershteyn <aalbersh@redhat.com>
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
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 3/3] fs: introduce getfsxattrat and setfsxattrat
 syscalls
Message-ID: <qyiozv4dtkqlp5wuyhocpptngs5wpuhyouhfqf7vaagkbobsv7@ez3cvpjdyj6q>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,linux-m68k.org,monstr.eu,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,csgroup.eu,users.sourceforge.jp,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,zeniv.linux.org.uk,suse.cz,digikod.net,google.com,arndb.de,paul-moore.com,namei.org,hallyn.com,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:email]
X-Spam-Score: -3.80
X-Spam-Flag: NO

On Fri 21-03-25 20:48:42, Andrey Albershteyn wrote:
> From: Andrey Albershteyn <aalbersh@redhat.com>
> 
> Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> extended attributes/flags. The syscalls take parent directory fd and
> path to the child together with struct fsxattr.
> 
> This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> that file don't need to be open as we can reference it with a path
> instead of fd. By having this we can manipulated inode extended
> attributes not only on regular files but also on special ones. This
> is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> we can not call ioctl() directly on the filesystem inode using fd.
> 
> This patch adds two new syscalls which allows userspace to get/set
> extended inode attributes on special files by using parent directory
> and a path - *at() like syscall.
> 
> CC: linux-api@vger.kernel.org
> CC: linux-fsdevel@vger.kernel.org
> CC: linux-xfs@vger.kernel.org
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Looks good. Just two nits below:

> +SYSCALL_DEFINE5(getfsxattrat, int, dfd, const char __user *, filename,
> +		struct fsxattr __user *, ufsx, size_t, usize,
> +		unsigned int, at_flags)
> +{
> +	struct fileattr fa = {};
> +	struct path filepath;
> +	int error;
> +	unsigned int lookup_flags = 0;
> +	struct filename *name;
> +	struct fsxattr fsx = {};
> +
> +	BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> +	BUILD_BUG_ON(sizeof(struct fsxattr) != FSXATTR_SIZE_LATEST);
> +
> +	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> +		return -EINVAL;
> +
> +	if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> +		lookup_flags |= LOOKUP_FOLLOW;
> +
> +	if (at_flags & AT_EMPTY_PATH)
> +		lookup_flags |= LOOKUP_EMPTY;

Strictly speaking setting LOOKUP_EMPTY does not have any effect because
empty names are already handled by getname_maybe_null(). But it does not
hurt either so I don't really care...

> +
> +	if (usize > PAGE_SIZE)
> +		return -E2BIG;
> +
> +	if (usize < FSXATTR_SIZE_VER0)
> +		return -EINVAL;
> +
> +	name = getname_maybe_null(filename, at_flags);
> +	if (!name) {
> +		CLASS(fd, f)(dfd);
> +
> +		if (fd_empty(f))
> +			return -EBADF;
> +		error = vfs_fileattr_get(file_dentry(fd_file(f)), &fa);
> +	} else {
> +		error = filename_lookup(dfd, name, lookup_flags, &filepath,
> +					NULL);
> +		if (error)
> +			goto out;
> +		error = vfs_fileattr_get(filepath.dentry, &fa);
> +		path_put(&filepath);
> +	}
> +	if (error == -ENOIOCTLCMD)
> +		error = -EOPNOTSUPP;
> +	if (!error) {
> +		fileattr_to_fsxattr(&fa, &fsx);
> +		error = copy_struct_to_user(ufsx, usize, &fsx,
> +					    sizeof(struct fsxattr), NULL);
> +	}
> +out:
> +	putname(name);
> +	return error;
> +}
> +
> +SYSCALL_DEFINE5(setfsxattrat, int, dfd, const char __user *, filename,
> +		struct fsxattr __user *, ufsx, size_t, usize,
> +		unsigned int, at_flags)
> +{
> +	struct fileattr fa;
> +	struct path filepath;
> +	int error;
> +	unsigned int lookup_flags = 0;
> +	struct filename *name;
> +	struct mnt_idmap *idmap;
> +	struct dentry *dentry;
> +	struct vfsmount *mnt;
> +	struct fsxattr fsx = {};
> +
> +	BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> +	BUILD_BUG_ON(sizeof(struct fsxattr) != FSXATTR_SIZE_LATEST);
> +
> +	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> +		return -EINVAL;
> +
> +	if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> +		lookup_flags |= LOOKUP_FOLLOW;
> +
> +	if (at_flags & AT_EMPTY_PATH)
> +		lookup_flags |= LOOKUP_EMPTY;

Same comment regarding LOOKUP_EMPTY here.

> +
> +	if (usize > PAGE_SIZE)
> +		return -E2BIG;
> +
> +	if (usize < FSXATTR_SIZE_VER0)
> +		return -EINVAL;
> +
> +	error = copy_struct_from_user(&fsx, sizeof(struct fsxattr), ufsx, usize);
> +	if (error)
> +		return error;
> +
> +	fsxattr_to_fileattr(&fsx, &fa);
> +
> +	name = getname_maybe_null(filename, at_flags);
> +	if (!name) {
> +		CLASS(fd, f)(dfd);
> +
> +		if (fd_empty(f))
> +			return -EBADF;
> +
> +		idmap = file_mnt_idmap(fd_file(f));
> +		dentry = file_dentry(fd_file(f));
> +		mnt = fd_file(f)->f_path.mnt;
> +	} else {
> +		error = filename_lookup(dfd, name, lookup_flags, &filepath,
> +					NULL);
> +		if (error)
> +			return error;
> +
> +		idmap = mnt_idmap(filepath.mnt);
> +		dentry = filepath.dentry;
> +		mnt = filepath.mnt;
> +	}
> +
> +	error = mnt_want_write(mnt);
> +	if (!error) {
> +		error = vfs_fileattr_set(idmap, dentry, &fa);
> +		if (error == -ENOIOCTLCMD)
> +			error = -EOPNOTSUPP;
> +		mnt_drop_write(mnt);
> +	}
> +
> +	path_put(&filepath);

filepath will not be initialized here in case of name == NULL. 

> +	return error;
> +}

With this fixed feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

