Return-Path: <linux-parisc+bounces-3103-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A79FA4C5
	for <lists+linux-parisc@lfdr.de>; Sun, 22 Dec 2024 09:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CFD1888B0D
	for <lists+linux-parisc@lfdr.de>; Sun, 22 Dec 2024 08:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B1317C7C4;
	Sun, 22 Dec 2024 08:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AsNwdMit";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h4KrcJ1E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AsNwdMit";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h4KrcJ1E"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED816F27F;
	Sun, 22 Dec 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734856989; cv=none; b=cgc5etmjqRACKiyJT7M4dGl9P5ij8TcuY/gmR1WwZv1Yvv2GHu4dEJ0ew5zTaVsMJrcnVYjqUM4fXGGic7n4DjHGmhY8npmVLhz67nLLP/VTPNiQtCvAWMLgg9zQgY+P5q8IBB0b5dWkABMSMqR+v/tNj11oU4oqAIMLjIBoUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734856989; c=relaxed/simple;
	bh=uomVTppw3hlhi21U12QKqekETxjGjF+ESmXfC67n2gM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELN7JRYCG4Czry0RPga/xmtVZt/+QGrgj841nqCfG5k3t2/abyg52flSKUmVNHs8E/5RQnPlPxtMFLR0w2Yl4I7GcJnufuoYY9qAySCHPuZuTF9M1R/wdpFFljq6loNNSkBQ8C12XDWuS9JmWRRPUWwFTn9juG06zbXzgEsAauU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AsNwdMit; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h4KrcJ1E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AsNwdMit; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h4KrcJ1E; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 190EB22641;
	Sun, 22 Dec 2024 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734856582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rH+jPLTrOwQjY9ySziTfMcwygF9NLYg8Wag/Vqi6e5k=;
	b=AsNwdMit9qYJhq0xM1MTuFlm1AAPF3SEw5cQcgMUZ02Ow8UlnSDGecFiLzRore0BzQueFI
	aWu9tFTvwQnjPKAdmoFBzR6nSIFduHpsrqJVmRdlBlTpIAXxjcNw1dQ+rxJdXQygOLwyfc
	CfVodDpALV6AfvWJueTjJ2FMi6WXpFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734856582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rH+jPLTrOwQjY9ySziTfMcwygF9NLYg8Wag/Vqi6e5k=;
	b=h4KrcJ1EmjJVPGTdGXzcNBlm5FwDlYZbykc5WYY194rmXcTJ+e0x20eQyEBOCoqRAD9YOK
	wOMXNRXe3IVhSjAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AsNwdMit;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=h4KrcJ1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734856582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rH+jPLTrOwQjY9ySziTfMcwygF9NLYg8Wag/Vqi6e5k=;
	b=AsNwdMit9qYJhq0xM1MTuFlm1AAPF3SEw5cQcgMUZ02Ow8UlnSDGecFiLzRore0BzQueFI
	aWu9tFTvwQnjPKAdmoFBzR6nSIFduHpsrqJVmRdlBlTpIAXxjcNw1dQ+rxJdXQygOLwyfc
	CfVodDpALV6AfvWJueTjJ2FMi6WXpFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734856582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rH+jPLTrOwQjY9ySziTfMcwygF9NLYg8Wag/Vqi6e5k=;
	b=h4KrcJ1EmjJVPGTdGXzcNBlm5FwDlYZbykc5WYY194rmXcTJ+e0x20eQyEBOCoqRAD9YOK
	wOMXNRXe3IVhSjAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96C9A13A6D;
	Sun, 22 Dec 2024 08:36:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9yLoIIXPZ2ejDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Dec 2024 08:36:21 +0000
Date: Sun, 22 Dec 2024 09:36:12 +0100
Message-ID: <87ikrc9ksj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ad1889: Use str_enabled_disabled() helper function
In-Reply-To: <20241221095210.5473-1-thorsten.blum@linux.dev>
References: <20241221095210.5473-1-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 190EB22641
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Sat, 21 Dec 2024 10:52:08 +0100,
Thorsten Blum wrote:
> 
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi

