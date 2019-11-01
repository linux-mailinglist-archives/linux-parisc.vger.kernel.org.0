Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBB1EC050
	for <lists+linux-parisc@lfdr.de>; Fri,  1 Nov 2019 10:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfKAJMC (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 1 Nov 2019 05:12:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44842 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbfKAJMC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 1 Nov 2019 05:12:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id v4so6734338lfd.11
        for <linux-parisc@vger.kernel.org>; Fri, 01 Nov 2019 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XlvIQVFH0OsvvtfZAtH/Qzezeu3c9I63M8S4KPzBTmI=;
        b=UuJXdNFjFQHl67JtwQY9epQ7JZlX/qPb15ER8c6Lqil7fRSMcWNmfwOoeV2vHvtVIf
         MQprOmpD0hwsPPFv2gxzxn4Ufk5Qeavun2lFUk2TgV9/BJmHdQ9LjJJ4cLQHvBjOt2iq
         7InLsmyICkBrD2SFovxTIo55dNntzl9yo0IcQEGHox/sHEWXjP92g9WoW1Z/R7RjoyCR
         dw+A/DYMa1eBrvJi7jIO94xX+0zK2qTl0s4ygNxkGhD9Tvg/jlXPIsDkskH/BRFS0OFW
         rBmZ4ZqdBwG72D4QcTsAOtQDJM+k21sLl7cD2V9ljZhidt0HoZbQbczQibBO+ANCIENx
         R3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XlvIQVFH0OsvvtfZAtH/Qzezeu3c9I63M8S4KPzBTmI=;
        b=BwtAwhLtjVGstl8ythu9lExZlWKar8rgDB/TdgOziC69ZJN+lyUeE8MxrdqIL7kidz
         JZ9bho7ln5Gmbh3rDZ6csaWFWR2Y8txe933tDMol7Z9S5Wmj5yc3vV542QGd69Co45Zl
         R/5w3X7PZejiNh1UPJgnzgnhiRxRE0d96yZGnmoyrk1oP2B1eW/lpGQ+Zk6R1lOYJ98g
         kVpE/LNX6oiossjFfxdcoT7FqxrZ1JXH0mqaxWBonP4kGsaFRzPFcBatd4KwvktyTWp2
         jLKSfJBd+ZqkP9K5aVS8WMczK9R43DaHjwjrRctbHqXRMYZPrCUgzi2VCbsrv2LQ1UN/
         INHw==
X-Gm-Message-State: APjAAAXI9BMt0CoD764rVp4zZpi1QYDx7Idf2kP7vzSv6M5ciHq0Ehir
        qcl7AVKJLVOv8ddeBv7bO/w+kw==
X-Google-Smtp-Source: APXvYqz/HnRIkMMRi6lyXHmUXuPZQAZA0KSr/y66JRxF1fApobZgQwfrztMJrO8lOUblE8ZNClOn4A==
X-Received: by 2002:a19:6b04:: with SMTP id d4mr6761779lfa.10.1572599518710;
        Fri, 01 Nov 2019 02:11:58 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id r1sm2237427ljk.83.2019.11.01.02.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 02:11:57 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 3778110134C; Fri,  1 Nov 2019 12:11:57 +0300 (+03)
Date:   Fri, 1 Nov 2019 12:11:57 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greentime Hu <green.hu@gmail.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Jeff Dike <jdike@addtoit.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Salter <msalter@redhat.com>,
        Matt Turner <mattst88@gmail.com>,
        Michal Simek <monstr@monstr.eu>, Peter Rosin <peda@axentia.se>,
        Richard Weinberger <richard@nod.at>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Russell King <linux@armlinux.org.uk>,
        Sam Creasey <sammy@sammy.net>,
        Vincent Chen <deanbo422@gmail.com>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
        sparclinux@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 01/13] alpha: use pgtable-nop4d instead of 4level-fixup
Message-ID: <20191101091157.q4cesn6vsiy5qj2j@box>
References: <1572597584-6390-1-git-send-email-rppt@kernel.org>
 <1572597584-6390-2-git-send-email-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572597584-6390-2-git-send-email-rppt@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Nov 01, 2019 at 10:39:32AM +0200, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> It is not likely alpha will have 5-level page tables.
> 
> Replace usage of include/asm-generic/4level-fixup.h and implied
> __ARCH_HAS_4LEVEL_HACK with include/asm-generic/pgtable-nop4d.h and adjust
> page table manipulation macros and functions accordingly.

Not pgtable-nop4d.h, but pgtable-nopud.h. Also in subject.

-- 
 Kirill A. Shutemov
