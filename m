Return-Path: <linux-parisc+bounces-1883-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A19423DF
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2024 02:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C84FD1F239AF
	for <lists+linux-parisc@lfdr.de>; Wed, 31 Jul 2024 00:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95864A31;
	Wed, 31 Jul 2024 00:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b="MLUg30LZ"
X-Original-To: linux-parisc@vger.kernel.org
Received: from matoro.tk (matoro.tk [104.188.251.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0C78C1A
	for <linux-parisc@vger.kernel.org>; Wed, 31 Jul 2024 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.188.251.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722386199; cv=none; b=WGO29whrVKg7xJzf5Mc5BZKR6Z0YmJ9uRDP9kCXAefThvlxI1e6i3vkTNbslVlSipMhQzzcysbZwq+X77iLITmimmhM0oa/wSx1lQYKhycCcElSi/eGWTJxfRGm8NF4bMJsCBmHlJ0Sj7lRKBmsYElNAEPHL3Qxs1/REH00AmHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722386199; c=relaxed/simple;
	bh=OwjKZy0rEZaaexiQbCZPrp1zV6pYusnwQrwIGEMVD6o=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ras1DFpFzAva8c2gmg7BsJuvuH4+bnjnaJPkcdbjGg3ykFoCoSwI74VTlffGDE/GgXwXlgVdAgTCvpnfxxF9nn992fjus6VUAzKjSiUuZ5qBqWAXaen5iyHHyVdhDRKQ6XWiUedhsUVu/7WvrLEftys+yuQA3V5Za/LeTf+YKUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk; spf=pass smtp.mailfrom=matoro.tk; dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b=MLUg30LZ; arc=none smtp.client-ip=104.188.251.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matoro.tk
DKIM-Signature: a=rsa-sha256; bh=n0BkfMf4CmXHAwuOlDg2lHUrUbNtR/c2er2gJMZWnEk=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20240626; t=1722386173; v=1; x=1722818173;
 b=MLUg30LZjntV46VnPzh374IT37umPOrShHDvZYm/IK/zZjlg8uggJeXEmuxxbhyxYbK178L3
 POddW9js8xqpNDUNRdHcG33s8FNvOzn7G/OCMA55+jUDv4yjhW4KjnyH8eSsrjr+Ez31hCdNREM
 vEpvfGgqAMc4jhHlyvpEowi2BSBnt7OOK36tzxkmhXqo2t4EWz3GccMfF3iKDSRrfYJcWDGUztu
 r3J9x+odBYxu/DpdGhjG5aR58USc9lsPSIUZ1M8U18IJh89XGKZSasfZ13/clE7/AF0Evo/foKF
 tUsf+hZGn+0yRs2+cpN1PigI5a0iaNDrUmNcJMuNZrsU5dVuIoFTMgsmw1Mlb1BzCfMWMr/j6o8
 HJtToVXXEzn1mMWB9Ej7iX4DcTH4hP9j1Ywr276Usrxj4SoPT8oAaksCF/RQIUBF2Wmzmsp9ZKn
 vN23FewBS6WrhxxrxqEMReRTPRCfGWndqgAJsEw2TyZuLS+CeSXdNihF8ntxkrf44T/Hpb9VCpJ
 iARYJuyIUG6MfKhh9dxMnVxabG0GDgvRMSQU6VcRF6xVTjhtcCCUKqCPmTfutESRAdHuc5E1o9d
 M9ywSffmbzASasCIo8/fRKWl+PBuqwj9aPphl6tZU7bdiPLqxm5ilFZIkKhwFPXV46h/1eFmOm5
 E0lx6zJDmF4=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 7312501b; Tue, 30 Jul
 2024 20:36:13 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 30 Jul 2024 20:36:13 -0400
From: matoro <matoro_mailinglist_kernel@matoro.tk>
To: John David Anglin <dave.anglin@bell.net>
Cc: Linux Parisc <linux-parisc@vger.kernel.org>, Deller <deller@gmx.de>,
 John David Anglin <dave@parisc-linux.org>, peterz@infradead.org
Subject: Re: Crash on boot with CONFIG_JUMP_LABEL in 6.10
In-Reply-To: <11e13a9d-3942-43a5-b265-c75b10519a19@bell.net>
References: <096cad5aada514255cd7b0b9dbafc768@matoro.tk>
 <bebe64f6-b1e1-4134-901c-f911c4a6d2e6@bell.net>
 <11e13a9d-3942-43a5-b265-c75b10519a19@bell.net>
Message-ID: <cb2c656129d3a4100af56c74e2ae3060@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-07-30 09:50, John David Anglin wrote:
> On 2024-07-30 9:41 a.m., John David Anglin wrote:
>> On 2024-07-29 7:11 p.m., matoro wrote:
>>> Hi all, just bumped to the newest mainline starting with 6.10.2 and 
>>> immediately ran into a crash on boot. Fully reproducible, reverting back 
>>> to last known good (6.9.8) resolves the issue.  Any clue what's going on 
>>> here? I can provide full boot logs, start bisecting, etc if needed...
>> 6.10.2 built and booted okay on my c8000 with the attached config. You 
>> could start
>> with it and incrementally add features to try to identify the one that 
>> causes boot failure.
> Oh, I have an experimental clocksource patch installed.  You will need to 
> regenerate config
> with "make oldconfig" to use the current timer code.  Probably, this would 
> happen automatically.
>> 
>> Your config would be needed to duplicate.    Full boot log would also help.
> 
> Dave

Hi Dave, bisecting quickly revealed the cause here.

91a1d97ef482c1e4c9d4c1c656a53b0f6b16d0ed is the first bad commit
commit 91a1d97ef482c1e4c9d4c1c656a53b0f6b16d0ed
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Wed Mar 13 19:01:03 2024 +0100

     jump_label,module: Don't alloc static_key_mod for __ro_after_init keys

     When a static_key is marked ro_after_init, its state will never change
     (after init), therefore jump_label_update() will never need to iterate
     the entries, and thus module load won't actually need to track this --
     avoiding the static_key::next write.

     Therefore, mark these keys such that jump_label_add_module() might
     recognise them and avoid the modification.

     Use the special state: 'static_key_linked(key) && !static_key_mod(key)'
     to denote such keys.

     jump_label_add_module() does not exist under CONFIG_JUMP_LABEL=n, so the
     newly-introduced jump_label_init_ro() can be defined as a nop for that
     configuration.

     [ mingo: Renamed jump_label_ro() to jump_label_init_ro() ]

     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
     Signed-off-by: Valentin Schneider <vschneid@redhat.com>
     Signed-off-by: Ingo Molnar <mingo@kernel.org>
     Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
     Link: 
https://lore.kernel.org/r/20240313180106.2917308-2-vschneid@redhat.com

  include/asm-generic/sections.h |  5 ++++
  include/linux/jump_label.h     |  3 +++
  init/main.c                    |  1 +
  kernel/jump_label.c            | 53 
++++++++++++++++++++++++++++++++++++++++++
  4 files changed, 62 insertions(+)

This only manifests with CONFIG_JUMP_LABEL=y, which I have set and you do 
not.  Flipping this off allows 6.10 to boot normally.  Copying in the author 
here as well.

