Return-Path: <linux-parisc+bounces-323-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450B82193C
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jan 2024 10:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED68E1F20FF8
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jan 2024 09:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F30D262;
	Tue,  2 Jan 2024 09:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZNuLby10";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5kJF65cu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZNuLby10";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5kJF65cu"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED631C8F5;
	Tue,  2 Jan 2024 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1D78B1FCEE;
	Tue,  2 Jan 2024 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704189367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s+Dg6n3IY8XHwL3pAiZbP/itrzceNeno5mM07TKb6U=;
	b=ZNuLby10YEPb431QhdIJ1D2iMra4+sAE9KhNuZzUJ1BnSscB6yGEUdzy8xCQhGk7UTGY17
	t6wMVtLY8ZEDIpq4o3ys8RmcW8VdUX9O5HVMx6ciHb4QbYrdjKIkc0sNsJ0cWUBP+GbyBs
	USf9WjyTBOiYnDqy2I8u2mSjUsBHp5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704189367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s+Dg6n3IY8XHwL3pAiZbP/itrzceNeno5mM07TKb6U=;
	b=5kJF65cuSD8Z0qw0SXv9nVhdnuof5lRguOMwAhik/ph8lwXUAlvmFa9xm3QJ6xwaLZY9EK
	AJx7Qm4vrCB4ajBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704189367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s+Dg6n3IY8XHwL3pAiZbP/itrzceNeno5mM07TKb6U=;
	b=ZNuLby10YEPb431QhdIJ1D2iMra4+sAE9KhNuZzUJ1BnSscB6yGEUdzy8xCQhGk7UTGY17
	t6wMVtLY8ZEDIpq4o3ys8RmcW8VdUX9O5HVMx6ciHb4QbYrdjKIkc0sNsJ0cWUBP+GbyBs
	USf9WjyTBOiYnDqy2I8u2mSjUsBHp5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704189367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s+Dg6n3IY8XHwL3pAiZbP/itrzceNeno5mM07TKb6U=;
	b=5kJF65cuSD8Z0qw0SXv9nVhdnuof5lRguOMwAhik/ph8lwXUAlvmFa9xm3QJ6xwaLZY9EK
	AJx7Qm4vrCB4ajBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8C6613AC6;
	Tue,  2 Jan 2024 09:56:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KMumM7bdk2WBEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 02 Jan 2024 09:56:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Cc: linux-parisc@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/4] video/sticore: Remove info field from STI struct
Date: Tue,  2 Jan 2024 10:52:36 +0100
Message-ID: <20240102095604.7276-5-tzimmermann@suse.de>
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
X-Spam-Level: *****
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZNuLby10;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5kJF65cu
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[15.67%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -0.01
X-Rspamd-Queue-Id: 1D78B1FCEE
X-Spam-Flag: NO

The info field in struct sti_struct was used to detect the default
display device. That test is now done with the respective Linux device
and the info field is unused. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/stifb.c | 3 ---
 include/video/sticore.h     | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 9954640faae6..8e5bac27542d 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1389,7 +1389,6 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	}
 
 	/* save for primary gfx device detection & unregister_framebuffer() */
-	sti->info = info;
 	if (register_framebuffer(fb->info) < 0)
 		goto out_err4;
 
@@ -1417,7 +1416,6 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	iounmap(info->screen_base);
 out_err0:
 	framebuffer_release(info);
-	sti->info = NULL;
 	return -ENXIO;
 }
 
@@ -1496,7 +1494,6 @@ stifb_cleanup(void)
 		        framebuffer_release(info);
 			dev_set_drvdata(sti->dev, NULL);
 		}
-		sti->info = NULL;
 	}
 }
 
diff --git a/include/video/sticore.h b/include/video/sticore.h
index 9d993e22805d..823666af1871 100644
--- a/include/video/sticore.h
+++ b/include/video/sticore.h
@@ -3,7 +3,6 @@
 #define STICORE_H
 
 struct device;
-struct fb_info;
 
 /* generic STI structures & functions */
 
@@ -368,9 +367,6 @@ struct sti_struct {
 	/* PCI data structures (pg. 17ff from sti.pdf) */
 	u8 rm_entry[16]; /* pci region mapper array == pci config space offset */
 
-	/* pointer to the fb_info where this STI device is used */
-	struct fb_info *info;
-
 	/* pointer to the parent device */
 	struct device *dev;
 
-- 
2.43.0


