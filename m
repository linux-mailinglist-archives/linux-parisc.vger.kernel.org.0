Return-Path: <linux-parisc+bounces-320-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A998821937
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jan 2024 10:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A1BF1C21530
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jan 2024 09:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F452CA66;
	Tue,  2 Jan 2024 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y+sn94ou";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TwYTfwpC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y+sn94ou";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TwYTfwpC"
X-Original-To: linux-parisc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200679ED;
	Tue,  2 Jan 2024 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0ACAE21DFA;
	Tue,  2 Jan 2024 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704189366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lVT0bGqHDuC3GVb9QA5bz+T2kctIOvFICUHrJehaw9o=;
	b=y+sn94oukXFMkpPdg4DfLC13OolAFksFsR+Kx0pXcsC8CE39MsypSfd7Ve2hX3up2ObsxJ
	YM46W2xlz+u9ZB+/dgi9oWp5YsGom1zdRDnnyzOqC6cCXAhXbtBivYgF3hO0Sm30Yq5jLe
	9PKHMj/MoPwAssWeISh2rW4ZVBIzZjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704189366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lVT0bGqHDuC3GVb9QA5bz+T2kctIOvFICUHrJehaw9o=;
	b=TwYTfwpCKKgA9rZ5CkST706urbx5GMVxlvHVF/vCEWtLfvym4mKbJyz/RWwdg4V0lJxfmi
	IAszfEr8Eb0qvTCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704189366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lVT0bGqHDuC3GVb9QA5bz+T2kctIOvFICUHrJehaw9o=;
	b=y+sn94oukXFMkpPdg4DfLC13OolAFksFsR+Kx0pXcsC8CE39MsypSfd7Ve2hX3up2ObsxJ
	YM46W2xlz+u9ZB+/dgi9oWp5YsGom1zdRDnnyzOqC6cCXAhXbtBivYgF3hO0Sm30Yq5jLe
	9PKHMj/MoPwAssWeISh2rW4ZVBIzZjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704189366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lVT0bGqHDuC3GVb9QA5bz+T2kctIOvFICUHrJehaw9o=;
	b=TwYTfwpCKKgA9rZ5CkST706urbx5GMVxlvHVF/vCEWtLfvym4mKbJyz/RWwdg4V0lJxfmi
	IAszfEr8Eb0qvTCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C664913AC6;
	Tue,  2 Jan 2024 09:56:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AccDL7Xdk2WBEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 02 Jan 2024 09:56:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Cc: linux-parisc@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] arch/parisc: Detect primary framebuffer from device
Date: Tue,  2 Jan 2024 10:52:32 +0100
Message-ID: <20240102095604.7276-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ****
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=y+sn94ou;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TwYTfwpC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
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
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[11.76%];
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
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -0.01
X-Rspamd-Queue-Id: 0ACAE21DFA
X-Spam-Flag: NO

On parisc, change detection of the primary framebuffer to test for
the Linux device instead of fbdev's fb_info in fb_is_primary_device().
Makes the test independent from fbdev.

This patchset is part of a larger effort to clean up the low-level
display handling. There are various functions that attempt to detect
the system's primary framebuffer device, such as in vgaarb, [1]
fbcon, [2] or fbmon. [3] This code should be unified in a single helper
that implements the test. The function fb_is_primary_device() already
does this, but requires fbdev on parisc. With the patchset applied, the
parisc implementation tests directly with the Linux device. No fbdev is
required.

Patch 1 adds the framebuffer's Linux device to the STI ROM structures,
which represents the graphics firmware. Patches 2 updates the stifb
driver to refer to the correct Linux device. The device is used in
patch 3 to change the test in fb_is_primary_device(). Patch 4 removes
the obsolete fb_info from the STI ROM structures.

A later patchset will update the interface of fb_is_primary_device() to
receive a Linux device instead of an instance of fb_info. This involves
several architectures, so it is better done in a separate patch.

[1] https://elixir.bootlin.com/linux/v6.6/source/drivers/pci/vgaarb.c#L557
[2] https://elixir.bootlin.com/linux/v6.6/source/drivers/video/fbdev/core/fbcon.c#L2943
[3] https://elixir.bootlin.com/linux/v6.6/source/drivers/video/fbdev/core/fbmon.c#L1503

v2:
	* fix crash during driver initialization (Helge)

Thomas Zimmermann (4):
  video/sticore: Store ROM device in STI struct
  fbdev/stifb: Allocate fb_info instance with framebuffer_alloc()
  arch/parisc: Detect primary video device from device instance
  video/sticore: Remove info field from STI struct

 arch/parisc/video/fbdev.c   |   2 +-
 drivers/video/fbdev/stifb.c | 111 ++++++++++++++++++------------------
 drivers/video/sticore.c     |   5 ++
 include/video/sticore.h     |   6 +-
 4 files changed, 66 insertions(+), 58 deletions(-)


base-commit: 25232eb8a9ac7fa0dac7e846a4bf7fba2b6db39a
-- 
2.43.0


