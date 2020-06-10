Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635D01F5971
	for <lists+linux-parisc@lfdr.de>; Wed, 10 Jun 2020 18:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgFJQug (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 10 Jun 2020 12:50:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23730 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729123AbgFJQuc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Jun 2020 12:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591807830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=HmDpJKhsOu6i+uvNkS67WV/27yfgCTe34kwlqJ5ictiAtbUaZeNVjGTmhXiRiiGHYZLiF6
        T2fLb9k6+gYCzwSv1OETtf1dr6MA8W7kAmBDb/TtG26LSicGIcHYTUG2JTw6gzchm+JeIb
        uD35kC94iOXHJkfa7ZOpyd0Cl7iOJrY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-TGszLDMkOjWafmwa4-Iq9A-1; Wed, 10 Jun 2020 12:50:28 -0400
X-MC-Unique: TGszLDMkOjWafmwa4-Iq9A-1
Received: by mail-qv1-f72.google.com with SMTP id ba13so2295908qvb.15
        for <linux-parisc@vger.kernel.org>; Wed, 10 Jun 2020 09:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=RDy5ZP3UEgRUw7znj1MDacLrn6eolFYYN48rYeeDl+novu5PeVEei+n+kpPmKCGOGZ
         YxK/2btKALCGg2KzwhZaNephkmKnsLm6Ov7NpVXI2J6lAIziHFfArNnImEvlavpmnbkw
         MS3ZuFk85UjOAL1XAVhe64DfwFf/3cYF93h4kOe1ul2puk6KzRHqXHNHN/pW6JJv0cig
         XZVNdjfqohlVkqCj41DXyzVGcV/Xd7PMJByAz1dyudQcDz1My0WPKs+fG2JqVr/icvF2
         d+20peq+T2g+bQ2UA6WtwR0YgHvakfUYl2VmkDgQh951bzv+I55nmTyzBJRyIH1UMyyY
         hrJw==
X-Gm-Message-State: AOAM532KA/nN/K27kxzmAmyH6UcbiJouiylpOq4vTFIr7CKmE5MPA08p
        KG4uln5oOxE/SOKaHNM0QxnV4n7sxmTIJb89YS4LY3Rs0TRpueHHungzaIHcuNl2l5PEF/L8bRr
        ihdh7f3oIJacyf2LXK9HfkaBr
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987576qke.236.1591807826878;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn20TLNz7hD3Ni4blZzJN/2PX0jI8mrO6z2/UHNbD+ObHKXkY/kSbOK73eCMc/XFP0Ereokw==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987535qke.236.1591807826580;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id 207sm149672qki.134.2020.06.10.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:50:25 -0700 (PDT)
Date:   Wed, 10 Jun 2020 12:50:23 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Guan Xuetao <gxt@pku.edu.cn>, linux-xtensa@linux-xtensa.org,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: Possible duplicate page fault accounting on some archs after
 commit 4064b9827063
Message-ID: <20200610165023.GA67179@xz-x1>
References: <20200610174811.44b94525@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610174811.44b94525@thinkpad>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Jun 10, 2020 at 05:48:11PM +0200, Gerald Schaefer wrote:
> Hi,

Hi, Gerald,

> 
> Some architectures have their page fault accounting code inside the fault
> retry loop, and rely on only going through that code once. Before commit
> 4064b9827063 ("mm: allow VM_FAULT_RETRY for multiple times"), that was
> ensured by testing for and clearing FAULT_FLAG_ALLOW_RETRY.
> 
> That commit had to remove the clearing of FAULT_FLAG_ALLOW_RETRY for all
> architectures, and introduced a subtle change to page fault accounting
> logic in the affected archs. It is now possible to go through the retry
> loop multiple times, and the affected archs would then account multiple
> page faults instead of just one.
> 
> This was found by coincidence in s390 code, and a quick check showed that
> there are quite a lot of other architectures that seem to be affected in a
> similar way. I'm preparing a fix for s390, by moving the accounting behind
> the retry loop, similar to x86. It is not completely straight-forward, so
> I leave the fix for other archs to the respective maintainers.

Sorry for not noticing this before.  The accounting part should definitely be
put at least into a check against fault_flag_allow_retry_first() to mimic what
was done before.  And I agree it would be even better to put it after the retry
logic, so if any of the page faults gets a major fault, it'll be accounted as a
major fault which makes more sense to me, just like what x86 is doing now with:

	major |= fault & VM_FAULT_MAJOR;

I'm not sure what's the preference of the arch maintainers, just let me know if
it's preferred to use a single series to address this issue for all affected
archs (or the archs besides s390), then I'll do.

Thanks!

-- 
Peter Xu

