Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F711F3D4C
	for <lists+linux-parisc@lfdr.de>; Tue,  9 Jun 2020 15:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730031AbgFINwj (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 9 Jun 2020 09:52:39 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42573 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730004AbgFINwi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Jun 2020 09:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591710757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1QZxzGJLd7MwraWpl9HYsPVgjFSkkdnN13rxpeDTWvE=;
        b=OhA5zW5AHLip1oQX1HeiEU1/k0ILC5TYFCZWUY7HkNS5gBH3pzaiZZOT28X5/dIMS+ISOm
        wjfk55JrS4cZ2fP9iqfiROoHYuZbu0xMP+ttnE6FC57IcdgNQnYMYS/6sBZ5Z3Du62+5uM
        McCNjNNWy+6PMfXTwS36fCY/+N/eE+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-SKVCis5-OQWdNQGNLlklxw-1; Tue, 09 Jun 2020 09:52:35 -0400
X-MC-Unique: SKVCis5-OQWdNQGNLlklxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABB2A18A8235;
        Tue,  9 Jun 2020 13:52:33 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 708335C1BD;
        Tue,  9 Jun 2020 13:52:19 +0000 (UTC)
From:   Florian Weimer <fweimer@redhat.com>
To:     Palmer Dabbelt <palmer@sifive.com>
Cc:     viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, rth@twiddle.net,
        ink@jurassic.park.msu.ru, mattst88@gmail.com,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        tony.luck@intel.com, fenghua.yu@intel.com, geert@linux-m68k.org,
        monstr@monstr.eu, ralf@linux-mips.org, paul.burton@mips.com,
        jhogan@kernel.org, James.Bottomley@HansenPartnership.com,
        deller@gmx.de, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, luto@kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        x86@kernel.org, peterz@infradead.org, acme@kernel.org,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, dhowells@redhat.com, firoz.khan@linaro.org,
        stefan@agner.ch, schwidefsky@de.ibm.com, axboe@kernel.dk,
        christian@brauner.io, hare@suse.com, deepa.kernel@gmail.com,
        tycho@tycho.ws, kim.phillips@arm.com, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: Add a new fchmodat4() syscall, v2
References: <20190717012719.5524-1-palmer@sifive.com>
Date:   Tue, 09 Jun 2020 15:52:17 +0200
In-Reply-To: <20190717012719.5524-1-palmer@sifive.com> (Palmer Dabbelt's
        message of "Tue, 16 Jul 2019 18:27:15 -0700")
Message-ID: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

* Palmer Dabbelt:

> This patch set adds fchmodat4(), a new syscall. The actual
> implementation is super simple: essentially it's just the same as
> fchmodat(), but LOOKUP_FOLLOW is conditionally set based on the flags.
> I've attempted to make this match "man 2 fchmodat" as closely as
> possible, which says EINVAL is returned for invalid flags (as opposed to
> ENOTSUPP, which is currently returned by glibc for AT_SYMLINK_NOFOLLOW).
> I have a sketch of a glibc patch that I haven't even compiled yet, but
> seems fairly straight-forward:

What's the status here?  We'd really like to see this system call in the
kernel because our emulation in glibc has its problems (especially if
/proc is not mounted).

Thanks,
Florian

