Return-Path: <linux-parisc+bounces-747-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F586BAE4
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 23:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D161F28A320
	for <lists+linux-parisc@lfdr.de>; Wed, 28 Feb 2024 22:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57E371EA5;
	Wed, 28 Feb 2024 22:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mXwQ62Ud"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3481B71ECB
	for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 22:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709160320; cv=none; b=BGQN45/fhEan36GddwpbEZgXpPmENfsToYpNOfCRvQHdOCxG8p1/UK5kDfv/7KBqRckDXroTEa0Fq/w7rKLcOLtRC3EOA9jAoZOTpeVc2keiYVEJFGly+KVZW9SgBdy0tRQLJxsPOpq+DGunSe1bNMVjgkWEmYmUfTHSvWeeHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709160320; c=relaxed/simple;
	bh=1/CGCY3jhF/evFGu5DL8ruxZKJOzhM2yszIHb1BXMFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDIb4uglcfLjque1xVIjXOoA4wZjrUTnIDeimNui5CAMlXQLaOkqcJd5fTChzvVi5FRndkmogO41zREbcYsqAV2HbY0ROK0kOpNlzJ/+ZovUHOFXdwe22qsDK0Q56hAdrHGRahUpmudcdY8Xm228JU/u0rEcF1dHWOfZgbl1XhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mXwQ62Ud; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a26fa294e56so60947966b.0
        for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 14:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709160316; x=1709765116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxABPZ28o1U9eMcO7y1qUMLxndBrASNoz0KbMJJ/fIg=;
        b=mXwQ62Uddw84ptR80TKBhSUme2ejc89wI2u4IXGI5gafJUr5OeOb6NMeLlYjdZDaRP
         YsoWhxwiWGuDDpJsQTrEDqKfIschzGLefwYRxQM2svHWk74i27M2zp9oyfud+AvZD5sw
         /kVdnuBJZ1LKvHdaYRcZfXR/UoXo3FOV0/Xwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160316; x=1709765116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxABPZ28o1U9eMcO7y1qUMLxndBrASNoz0KbMJJ/fIg=;
        b=rBrutLI2sd4Oi6kJoKkGo13vX27XitBZYOOM2C5yqkzVr37O2b3gv9qSNdIXLLawcO
         etiWVCn4ty4K15TnP8oH8BrJ7n2KTdfeW4cmzSGyKS3IyTotwFv/NXwb89KDA33Te4MN
         aQOThZ74mjCaqAlrKJInsnmdwdb+xpM5INs0ZWd11mUIHRwQ2Aga3TtbWdGZtc1lK2FN
         qvoZ2PyOh/AxH2KYesaZHNkL4sEkNRicmjoSlk1Vbc5JjTeOWiqh8IZD+TagrHgTAx9s
         GxOvJ79C2Np9NvJa8Yk1dMNS0CME+tfcSswdpLQPSdieaKeAJxf37E33GzX+0xYxrkvI
         VeHg==
X-Forwarded-Encrypted: i=1; AJvYcCU33Y67kj3eDJEUIcQnY5peCqy3/ciSb1mg+mGFCVpsfwkyXvjun1xRXZ+SoDoCaESSBnbrtOfvwWg8+CjuxTUKC2zI9aEBHDC7Q4Ts
X-Gm-Message-State: AOJu0YzrzA7cNfeeTMiPERb3G7Cek13ZOaIP7vtoqYD63TEf8VUnaseP
	WONvCKikmg/WV8RKB8f0mbLsUxC5LmmtjC8D8Mv8nCTYxE1Y+sz6jS51lMX1PS1gpHqhsnmLsv5
	IdvdD
X-Google-Smtp-Source: AGHT+IGI2ReMMDzIonWzBEckEuxDicUZ0e9Agm1QxtEovSGBb0SgZbc3cB0FIgfS+j5Fts23TOMvOg==
X-Received: by 2002:a17:906:b78e:b0:a44:176e:410c with SMTP id dt14-20020a170906b78e00b00a44176e410cmr202191ejb.5.1709160316051;
        Wed, 28 Feb 2024 14:45:16 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id s18-20020a170906501200b00a42e2bc82dbsm2270521ejj.169.2024.02.28.14.45.14
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 14:45:15 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-412a9f272f4so28295e9.0
        for <linux-parisc@vger.kernel.org>; Wed, 28 Feb 2024 14:45:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNWCPwQxlV+iD8J32lyezs6ckG3EjcA0/FFYJKw5z6mn3W3F4VJGVGjgv7srOIwJ+LM/FceS66esvb7ZMLT3+GLjTB2h9gXy5svCTm
X-Received: by 2002:a05:600c:538f:b0:412:b689:5d88 with SMTP id
 hg15-20020a05600c538f00b00412b6895d88mr18372wmb.3.1709160314368; Wed, 28 Feb
 2024 14:45:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228072216.95130-1-yaoma@linux.alibaba.com> <20240228072216.95130-5-yaoma@linux.alibaba.com>
In-Reply-To: <20240228072216.95130-5-yaoma@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 14:44:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xgr4--NJ3dAh2ggxbFUV9-QR6rW+YXyMHZYXPVSkmaAw@mail.gmail.com>
Message-ID: <CAD=FV=Xgr4--NJ3dAh2ggxbFUV9-QR6rW+YXyMHZYXPVSkmaAw@mail.gmail.com>
Subject: Re: [PATCHv11 4/4] watchdog/softlockup: report the most frequent interrupts
To: Bitao Hu <yaoma@linux.alibaba.com>
Cc: tglx@linutronix.de, liusong@linux.alibaba.com, akpm@linux-foundation.org, 
	pmladek@suse.com, kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	jan.kiszka@siemens.com, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 27, 2024 at 11:22=E2=80=AFPM Bitao Hu <yaoma@linux.alibaba.com>=
 wrote:
>
> When the watchdog determines that the current soft lockup is due
> to an interrupt storm based on CPU utilization, reporting the
> most frequent interrupts could be good enough for further
> troubleshooting.
>
> Below is an example of interrupt storm. The call tree does not
> provide useful information, but we can analyze which interrupt
> caused the soft lockup by comparing the counts of interrupts.
>
> [  638.870231] watchdog: BUG: soft lockup - CPU#9 stuck for 26s! [swapper=
/9:0]
> [  638.870825] CPU#9 Utilization every 4s during lockup:
> [  638.871194]  #1:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.871652]  #2:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.872107]  #3:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.872563]  #4:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.873018]  #5:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.873494] CPU#9 Detect HardIRQ Time exceeds 50%. Most frequent HardI=
RQs:
> [  638.873994]  #1: 330945      irq#7
> [  638.874236]  #2: 31          irq#82
> [  638.874493]  #3: 10          irq#10
> [  638.874744]  #4: 2           irq#89
> [  638.874992]  #5: 1           irq#102
> ...
> [  638.875313] Call trace:
> [  638.875315]  __do_softirq+0xa8/0x364
>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> ---
>  kernel/watchdog.c | 115 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 111 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

