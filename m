Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA4DED7DEB
	for <lists+linux-parisc@lfdr.de>; Tue, 15 Oct 2019 19:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388579AbfJORgZ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 15 Oct 2019 13:36:25 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33782 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727523AbfJORgY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 15 Oct 2019 13:36:24 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so12941764pfl.0
        for <linux-parisc@vger.kernel.org>; Tue, 15 Oct 2019 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m+oSkq2BGDVnMXCTCZOGBY+AVAcaQgizlBaC3TfYgbk=;
        b=JV+TKEsIejeoGguft/smdhcOhD8TznOS3FDgaThCNzjFd/zO9Gf+USti5K/cmcvGGL
         VL+DN5u7ePo4IWynJI4kZyUxYCOiGUo31kRO4IGsw0RDA7MEE9P0Lx+Gh5T4vmOLDPmO
         nAWj+aCJO3XdoGRVZfY2JbnQgqczJYP20lPBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m+oSkq2BGDVnMXCTCZOGBY+AVAcaQgizlBaC3TfYgbk=;
        b=okb/NbHnphYm6b//tsuOi3orEi1Ktdc/cq9w4/xP6OIF5nEXPgqXbyKJkKS3dob59p
         HizvMGszjYabfu+iKsUqKqcG0EzBuQ1dqBi39Mr1MPYswHXJQta4R4gKxqJgdkMFiEmQ
         NC+79pOaL2b1ICf/KyLDjtTEXHeezxal3eXuZWuLl0VqJFP1azYd1HfMAFomkrOOaoKp
         yloUeky0XzH/DSGWwH8d4anRMxZO3mU0vPnm1LlG7CCDlUvEdJ2b1Bw6xd0e/Jv3ebMk
         EI/T8S4AIFCsGQEaImJx3pyIgeoJ7FcNKICGcW6E/OC5xJmRQ2CBkTW+ZXdQwRHFnaHA
         73DQ==
X-Gm-Message-State: APjAAAU2CmCeV0bITVsOc+Eh8flRYQLrt+tsYHk321+y4ALXA9W9tv+t
        xeo8sMpb+g0QtFTZFl+mpE3uGA==
X-Google-Smtp-Source: APXvYqyiR4aQoe1gYk78ERJu5vF+BWIQdBY7ufngAKMkxwambAKLD5Wy/+2CK6+2hmVn878fjUO5OQ==
X-Received: by 2002:a62:b504:: with SMTP id y4mr39162264pfe.124.1571160984162;
        Tue, 15 Oct 2019 10:36:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f74sm25484564pfa.34.2019.10.15.10.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:36:23 -0700 (PDT)
Date:   Tue, 15 Oct 2019 10:36:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>,
        linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
        Michal Simek <monstr@monstr.eu>, x86@kernel.org,
        linux-ia64@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-xtensa@linux-xtensa.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-parisc@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org
Subject: Re: [PATCH v2 01/29] powerpc: Rename "notes" PT_NOTE to "note"
Message-ID: <201910151034.A21FDCA32@keescook>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-2-keescook@chromium.org>
 <20191011082519.GI9749@gate.crashing.org>
 <201910110910.48270FC97@keescook>
 <20191011162552.GK9749@gate.crashing.org>
 <20191015165412.GD596@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015165412.GD596@zn.tnic>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Oct 15, 2019 at 06:54:13PM +0200, Borislav Petkov wrote:
> On Fri, Oct 11, 2019 at 11:25:52AM -0500, Segher Boessenkool wrote:
> > Names *matter*, internal names doubly so.  So why replace a good name with
> > a worse name?  Because it is slightly less work for you?
> 
> So if we agree on the name "notes" and we decide to rename the other
> arches, this should all be done in a separate patchset anyway, and ontop
> of this one. And I believe Kees wouldn't mind doing it ontop since he's
> gotten his hands dirty already. :-P

Yeah, I'm fine with that. I would prefer to do it as a separate step,
just to minimize the logical steps each patch takes. Shall I spin a v3
with the Acks added and a final rename for this?

-- 
Kees Cook
