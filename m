Return-Path: <linux-parisc+bounces-3131-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CAA03D1F
	for <lists+linux-parisc@lfdr.de>; Tue,  7 Jan 2025 11:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F776161029
	for <lists+linux-parisc@lfdr.de>; Tue,  7 Jan 2025 10:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389581E47B1;
	Tue,  7 Jan 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zz5pfYCj"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269801DFD83
	for <linux-parisc@vger.kernel.org>; Tue,  7 Jan 2025 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247536; cv=none; b=l3wbLYeNHM6p+3Bh565sl1oFSJEQb8UpFqkXX/T217C0jvjJ1KqbMxT13lrLJXSuE48SvggUXTDQxjaM+Ah07/rqldJij3Q72RaFNuhi5bUO/Wg9Ob5s7xER7uSob3T60UnqQ30l8J4nxiYoMekITN84jnS0vf9v13v5WuNxKBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247536; c=relaxed/simple;
	bh=IxvNqk0jlDoy7K3bX8hkBg7IOVfZsilaZEB/X7GEW8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4hGPjQuHf9/+dzPnQ4oHcpUJ1hr3xU8iZTKRJB7PnX6yVSbQ/VuYxA0ih10keQKHTg5SUmsav4N8/6vK7Nt0xm5nLtkVsadYdciMjmX86Mw3fcNosn1Vch9EE51ufcRRRA/3J4FYuDMuEmOz73QcXIoRZPBY+04QWaDTeiYJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zz5pfYCj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2161eb94cceso157900325ad.2
        for <linux-parisc@vger.kernel.org>; Tue, 07 Jan 2025 02:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247531; x=1736852331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VfvNApDEnkYxo9wayRnoayueQp1chw+vILiOzbCROK8=;
        b=Zz5pfYCj1G0AlOy9g3pLcT+63zCdb6M2pAbac65HmY6coIPgtsukxLShQNobHHyUDj
         TSbrMzkm+E70eTF1Zu0zvhptBu+cdDt/BoiAEqr3rHxF+GGNkjVVIxTd59AqlQvhzBop
         1lsmoCDemP4/snQOg2teQFCkFj9uSb5iuu648=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247531; x=1736852331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfvNApDEnkYxo9wayRnoayueQp1chw+vILiOzbCROK8=;
        b=NzSnZ20oAGIAuspTha0Y+mYACYbR40MxiHJBlVyc2qZShV3NE7pGctjWMj2fuEukRJ
         fUvlpR/oT4BhhNiagtCLAHanDwdIsvzYX15iIlBeTwAQoUa0Lso/K49jtkaKEFZeFTi6
         ErgbBoWRfTtt5OsNLV62nd/W7ndEL4JqRQB8w4JYw5L/1xKdMWMKLR7knAejAXIwikzs
         OrP8k3SqJFXqJjPQ2FcWV3ESgw4V55YrA4hSk9bD7G4PJ0sBMam3+JAjA66dcL8BYsd1
         oXKy3vxatvOMc7imtncZSsJxjIBUKqmxUO7d1MHqGMBe8az+gMnxraMysEweEhMeEx5c
         LTvw==
X-Forwarded-Encrypted: i=1; AJvYcCVhmY1XaTZJe6+/7QDGIeRs/BCRqne4aMayzpo7yBJxWGQqGtCfuoPQhHR6vWioBhxRzC61Q5L4YrDlMf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7xXwOoxnkLVqTZyHdaCC5GnU1rQGFkA+Aj9zjD/2SoFP8/E/
	wFWbta9ZcWCwKqb/RnaE95iWkk6mQy8g302Y+h8utFt3OBD76QGe4IRSVQWSIg==
X-Gm-Gg: ASbGncurnajEWevMd/16O3y5Or2faFBNqarO+mg1YUQXtuYfUVVHUEWj5OGyP+Jyn41
	95CsZhRTqSN53Wn2Pc1cSaJqZTjzuw9nLzLMvHrMiJeW2sWMyvcfodauwWtmZ5Sb+ROPlaD0y0m
	ZrZG+HLG/EzrdG/+61CEwrHInDS3e6EE5IkJpgAoFvag9Cf+BdPDRtRJc3kpdSXSI07ZElxrfWq
	5Q+G9eAE9xDrWDGUAnNTVytsvW1HUHWG0wPFr9ZhRkqvlAXE5icDzOA05TE
X-Google-Smtp-Source: AGHT+IGNgNCUH8eyQMCUvASISKoR6AY1tcPkTy+eXP5eG0bm252IvAUcQpZz2kuI6Vj2Y7ykEyzoAA==
X-Received: by 2002:a05:6a00:35c3:b0:726:64a5:5f67 with SMTP id d2e1a72fcca58-72abde09893mr87978739b3a.12.1736247531428;
        Tue, 07 Jan 2025 02:58:51 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:c142:c1e8:32c2:942a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb34sm33168531b3a.87.2025.01.07.02.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:58:51 -0800 (PST)
Date: Tue, 7 Jan 2025 19:58:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 01/28] module: Extend the preempt disabled section in
 dereference_symbol_descriptor().
Message-ID: <kknhqunwsiumn2dkdhnc43ecuzdvqa7zws553gnocnksz5vl36@jllfly2mjegz>
References: <20241220174731.514432-1-bigeasy@linutronix.de>
 <20241220174731.514432-2-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220174731.514432-2-bigeasy@linutronix.de>

On (24/12/20 18:41), Sebastian Andrzej Siewior wrote:
> dereference_symbol_descriptor() needs to obtain the module pointer
> belonging to pointer in order to resolve that pointer.
> The returned mod pointer is obtained under RCU-sched/ preempt_disable()
> guarantees and needs to be used within this section to ensure that the
> module is not removed in the meantime.
> 
> Extend the preempt_disable() section to also cover
> dereference_module_function_descriptor().
> 
> Fixes: 04b8eb7a4ccd9 ("symbol lookup: introduce dereference_symbol_descriptor()")
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

FWIW
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

