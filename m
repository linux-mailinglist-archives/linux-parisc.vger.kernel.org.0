Return-Path: <linux-parisc+bounces-1412-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E91028C6532
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 12:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25D0C1C21021
	for <lists+linux-parisc@lfdr.de>; Wed, 15 May 2024 10:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F96612D0;
	Wed, 15 May 2024 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wghMJcAX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="adNbIuSh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wghMJcAX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="adNbIuSh"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0066B5F876;
	Wed, 15 May 2024 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715770479; cv=none; b=Ma3Ut9WklDT8aYHAc9IAoRXNyfIw+lmK7MI8R0r2fexMEt2c87iCqskhk7bNxm0BSIEQut4Wcz6lA1vUoxUADJz0J1BYhUjTuH9YT7Ag86RwTl1AAbqW3VNOcCzjro4KVyCCiWPH10gcynWHzemMBY+bgu7nzcfmdR/0HVBbUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715770479; c=relaxed/simple;
	bh=Djb46qMbw8em2zSmuFBKViQD/CJimPI2Syj+DiIkc94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kahur0CV6TC10eKefsfvbjh5PJfxpvbRTEAXoc7H6K6LSwlsX/Nk6m3XUq/qZAQF3LGEbORRtCxtZ5EOkjUQgJzbABpym1W69tNHPUuJ3oD9lQ/WLBrHwf3Tn3zKP8M+qbJhYgREKCbgsddlkiUK4awn8dFfrqncDquc6VSAZeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wghMJcAX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=adNbIuSh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wghMJcAX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=adNbIuSh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 10EB721FEC;
	Wed, 15 May 2024 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715770476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6jv9xWgEcYiTZtZfk0F4GwA5Qmgsj9Sim5edw+In6xE=;
	b=wghMJcAX1wHVTVEJ1QoIFPZ0piA5e1uAq6rd4zr0RvXLe47i8WOcZLRMKa6sDG9du9370A
	z0v4gplJD4re2RH6KD95ZbJF5/mdF1AGFIl8xlIMptY3WoNO2DAqZ1LaA+yRXIGqPRhLjz
	696eY0ewpYovgoKTq1sXOTQVpuNeyhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715770476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6jv9xWgEcYiTZtZfk0F4GwA5Qmgsj9Sim5edw+In6xE=;
	b=adNbIuShkFQwATA7ZymPl5DsSsG4uMUOfJXP6evMuVG0F2gCwQVnvirSvt7wOMeW8SRAQa
	C6aNNNl/uwLKy3CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715770476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6jv9xWgEcYiTZtZfk0F4GwA5Qmgsj9Sim5edw+In6xE=;
	b=wghMJcAX1wHVTVEJ1QoIFPZ0piA5e1uAq6rd4zr0RvXLe47i8WOcZLRMKa6sDG9du9370A
	z0v4gplJD4re2RH6KD95ZbJF5/mdF1AGFIl8xlIMptY3WoNO2DAqZ1LaA+yRXIGqPRhLjz
	696eY0ewpYovgoKTq1sXOTQVpuNeyhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715770476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6jv9xWgEcYiTZtZfk0F4GwA5Qmgsj9Sim5edw+In6xE=;
	b=adNbIuShkFQwATA7ZymPl5DsSsG4uMUOfJXP6evMuVG0F2gCwQVnvirSvt7wOMeW8SRAQa
	C6aNNNl/uwLKy3CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CCF7139B3;
	Wed, 15 May 2024 10:54:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UPO9G2qURGZLSgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 15 May 2024 10:54:34 +0000
Date: Wed, 15 May 2024 12:54:33 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Borislav Petkov <bp@alien8.de>
Cc: Axel Rasmussen <axelrasmussen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Liu Shixin <liushixin2@huawei.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>, Peter Xu <peterx@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <ZkSUaVx3uCIPkpkJ@localhost.localdomain>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,linux-foundation.org,kernel.org,csgroup.eu,linux.intel.com,redhat.com,zytor.com,gmx.de,hansenpartnership.com,nvidia.com,huawei.com,infradead.org,ellerman.id.au,linux.dev,linux.ibm.com,gmail.com,linutronix.de,vger.kernel.org,kvack.org,lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On Wed, May 15, 2024 at 12:41:42PM +0200, Borislav Petkov wrote:
> On Fri, May 10, 2024 at 11:29:26AM -0700, Axel Rasmussen wrote:
> > @@ -3938,7 +3938,7 @@ static vm_fault_t handle_pte_marker(struct vm_fault *vmf)
> >  
> >  	/* Higher priority than uffd-wp when data corrupted */
> >  	if (marker & PTE_MARKER_POISONED)
> > -		return VM_FAULT_HWPOISON;
> > +		return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SILENT;
> 
> If you know here that this poisoning should be silent, why do you have
> to make it all complicated and propagate it into arch code, waste
> a separate VM_FAULT flag just for that instead of simply returning here
> a VM_FAULT_COMPLETED or some other innocuous value which would stop
> processing the fault?

AFAIK, He only wants it to be silent wrt. the arch fault handler not screaming,
but he still wants to be able to trigger force_sig_mceerr().


-- 
Oscar Salvador
SUSE Labs

