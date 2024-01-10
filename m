Return-Path: <linux-parisc+bounces-324-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF3082193E
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jan 2024 10:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93F3628163E
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jan 2024 09:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B8BD26A;
	Tue,  2 Jan 2024 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dV46ZBbc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pO6Ezxm5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dV46ZBbc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pO6Ezxm5"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9987C8FF;
	Tue,  2 Jan 2024 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D17AF21E80;
	Tue,  2 Jan 2024 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704189366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/GSscohF6sdDI8bF3SLelZwCjQ2JqpZEm4wsy2Dqxs=;
	b=dV46ZBbcAc42h2Be2eqGqoPCUCjQ8j/oRIPSph+jCaXizunPoxaPh/h7AvJNoq7IdEjjrO
	Vo75CrHK+XBHxnx0WKiwOCZ20qayhqwMfggRjAAlN7vD5qHeRCovtVoqKycNEcTdpsyCGP
	ItWahpPgIBvcSsyAycgD9unyDWR+0cw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704189366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/GSscohF6sdDI8bF3SLelZwCjQ2JqpZEm4wsy2Dqxs=;
	b=pO6Ezxm5LGREc86qG0XaXf8mOeA4TPwkNPPQSG/edRQ7cA9WZMXIjwbHezosR+uQ6YRgpn
	DCA3UuSgm58LyzDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704189366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/GSscohF6sdDI8bF3SLelZwCjQ2JqpZEm4wsy2Dqxs=;
	b=dV46ZBbcAc42h2Be2eqGqoPCUCjQ8j/oRIPSph+jCaXizunPoxaPh/h7AvJNoq7IdEjjrO
	Vo75CrHK+XBHxnx0WKiwOCZ20qayhqwMfggRjAAlN7vD5qHeRCovtVoqKycNEcTdpsyCGP
	ItWahpPgIBvcSsyAycgD9unyDWR+0cw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704189366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/GSscohF6sdDI8bF3SLelZwCjQ2JqpZEm4wsy2Dqxs=;
	b=pO6Ezxm5LGREc86qG0XaXf8mOeA4TPwkNPPQSG/edRQ7cA9WZMXIjwbHezosR+uQ6YRgpn
	DCA3UuSgm58LyzDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9389013C96;
	Tue,  2 Jan 2024 09:56:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wBu2Irbdk2WBEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 02 Jan 2024 09:56:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Cc: linux-parisc@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/4] arch/parisc: Detect primary video device from device instance
Date: Tue,  2 Jan 2024 10:52:35 +0100
Message-ID: <20240102095604.7276-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102095604.7276-1-tzimmermann@suse.de>
References: <20240102095604.7276-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ****
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.93 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.26)[73.71%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dV46ZBbc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pO6Ezxm5
X-Spam-Score: 0.93
X-Rspamd-Queue-Id: D17AF21E80

Update fb_is_primary device() on parisc to detect the primary display
device from the Linux device instance. Aligns the code with the other
architectures. A later patch will remove the fbdev dependency from the
function's interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/video/fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/fbdev.c
index 137561d98246..e4f8ac99fc9e 100644
--- a/arch/parisc/video/fbdev.c
+++ b/arch/parisc/video/fbdev.c
@@ -21,6 +21,6 @@ int fb_is_primary_device(struct fb_info *info)
 		return true;
 
 	/* return true if it's the default built-in framebuffer driver */
-	return (sti->info == info);
+	return (sti->dev == info->device);
 }
 EXPORT_SYMBOL(fb_is_primary_device);
-- 
2.43.0


