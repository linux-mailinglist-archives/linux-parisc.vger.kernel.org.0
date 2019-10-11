Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBBEDD451C
	for <lists+linux-parisc@lfdr.de>; Fri, 11 Oct 2019 18:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfJKQLq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 11 Oct 2019 12:11:46 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35036 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbfJKQLq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 11 Oct 2019 12:11:46 -0400
Received: by mail-pl1-f196.google.com with SMTP id c3so4686670plo.2
        for <linux-parisc@vger.kernel.org>; Fri, 11 Oct 2019 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G6L52gHbcOVXjcPSYcPZfDCdfNGSvtith//1lglITt4=;
        b=U5/N6JMiUj9QDTd24aIgmkS/ZCmGBjpKwM7U8CzxrzMf1lqZSNfbZ7O4pwV0bhEzEg
         wudUUYrZzrgNiboJm0ChoceZ3O1LmYFYV3Bvx9uhV6vTeclkuNrnADNJMjD6VX65LBtL
         he7FMaEjTbOKTJQ5f79wUMqxbvVvSYa6+a7mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G6L52gHbcOVXjcPSYcPZfDCdfNGSvtith//1lglITt4=;
        b=nr0B9KVyDrAITo45usCfzs5HEgOFPImfyVp+IwtiQK/ApaIThMN3HW/m4U/4Tjh/sQ
         GK7s7j7UeSzUV78Tm6C3d2ZS1H63RcnnxFtOgCT+W8Pw0wiOWO+FknIWxZmvDzjwA8s/
         pytOenO45RqY9eB6BM23rPB6t0EEtTdvgjvyU8+XZuoLh8kbCPLUN2gjzDLEKPgCmhmn
         a8Bk3HRDs4/MnDJiiCyurmOPhsUlWFgGDt/igrovsA49NUoP9tuMHLFq8w10dUnCjBDg
         vTzj03F2cYhDgNwa0h+fA9eX21qVeEbaVncwpB8jm4Lhd2p8rubNKbTlUs5dEEGEt4aF
         Eiog==
X-Gm-Message-State: APjAAAUoP8HtoLXUrsPqg1dinBQ0aXVjg9V1sFi8c/yvimVjUgWK4Ohi
        lNZISJY3uhTTw56grT+0qkmp/w==
X-Google-Smtp-Source: APXvYqybFKi8DEP43HWkgZPyfZo8SqqFMMtnLHZ2tVbdiQx6dZitTSLWHEWMqDIFXmSN2gN3R3/hRg==
X-Received: by 2002:a17:902:bf45:: with SMTP id u5mr15982728pls.62.1570810305781;
        Fri, 11 Oct 2019 09:11:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f6sm9294369pfq.169.2019.10.11.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 09:11:44 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:11:43 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Borislav Petkov <bp@alien8.de>, linux-arch@vger.kernel.org,
        linux-s390@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
        x86@kernel.org, linux-ia64@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
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
Message-ID: <201910110910.48270FC97@keescook>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-2-keescook@chromium.org>
 <20191011082519.GI9749@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011082519.GI9749@gate.crashing.org>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Oct 11, 2019 at 03:25:19AM -0500, Segher Boessenkool wrote:
> On Thu, Oct 10, 2019 at 05:05:41PM -0700, Kees Cook wrote:
> > The Program Header identifiers are internal to the linker scripts. In
> > preparation for moving the NOTES segment declaration into RO_DATA,
> > standardize the identifier for the PT_NOTE entry to "note" as used by
> > all other architectures that emit PT_NOTE.
> 
> All other archs are wrong, and "notes" is a much better name.  This
> segment does not contain a single "note", but multiple "notes".

True, but the naming appears to be based off the Program Header name of
"PT_NOTE". Regardless, it is an entirely internal-to-the-linker-script
identifier, so I am just consolidating on a common name with the least
number of collateral changes.

-- 
Kees Cook
