Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF15686F36
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Feb 2023 20:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbjBATtU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 Feb 2023 14:49:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjBATtM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 Feb 2023 14:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515EF3AA2
        for <linux-parisc@vger.kernel.org>; Wed,  1 Feb 2023 11:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675280907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+c79xB9zEm9gbVZK1/vCc0nmGWw5K68MnzSgOcRJD38=;
        b=JcRQbMHJYmeymltSUOs2n1NR6P8Hsh1ihvegc+xryf7yv9qmSoxhY/nFzVk0m/KR1ssE+h
        RGui/0Z+yN3ne3KCRWAegC4GBFXkMQ8/g4bseIolNYfO+JheLSLfbDi4zHwWfsQgKdOkUd
        siqFVch9zwjvuQBKKalMm8T0biUFMnE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-mE0wuppzOBmWVMDTIrNzDQ-1; Wed, 01 Feb 2023 14:48:25 -0500
X-MC-Unique: mE0wuppzOBmWVMDTIrNzDQ-1
Received: by mail-qk1-f200.google.com with SMTP id v186-20020a37dcc3000000b0072a264a6208so1238196qki.21
        for <linux-parisc@vger.kernel.org>; Wed, 01 Feb 2023 11:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+c79xB9zEm9gbVZK1/vCc0nmGWw5K68MnzSgOcRJD38=;
        b=oreL3aq6X1xpuxdTavCyXHLGoKjFtHQeCVWxOSZ1n7ezGnWQ4+GXM2+TSRT5BVX8zD
         lmNsscvD5ZgqwNg0XhfS54AqsyJh32ho3DsYR8d/hD0j4pOTPQnQSsv3DznnFux4Pspi
         KdrZ3ApKoNxjPxm4I07p7l52IY1oz+QPsSq4PyiLH3MsL/mWvcTCv+m3NVeDS1H96r7/
         J2k8SXVqSXYLH6phYjrDi+0l6PiwbpnJSL7cLb63svJzIdwTgjWd0rsjSToyjer9YlCx
         1XW9vYTk858MjkgP/zdFqJx1cKBfx4Zk4kF244A7JAYItJF3eXfwCfdHRldXXjDtV0He
         E6RA==
X-Gm-Message-State: AO0yUKVkPxW1JIAPvDRCmVdIdQ1z0HtcSSsdO8NNKLyL9Htyn6jF8Le4
        Oy02Vg/Rmg80Fx2TGDNYdl+kLuq0St5B4B7BagqDbq64ygoVB2asFAT88S5yIrTK+cZca7AZFa2
        OcNVV2C8BarRtyeKdmwzjl7UA
X-Received: by 2002:ac8:4b79:0:b0:3b9:b801:8744 with SMTP id g25-20020ac84b79000000b003b9b8018744mr4668663qts.4.1675280905102;
        Wed, 01 Feb 2023 11:48:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+aCjVIaFs+qYlZN/COXif7CSKdOwvIaVTtsTOFsLRWV42aeSjrEadyR6ifeMCBEfyQD+z4OA==
X-Received: by 2002:ac8:4b79:0:b0:3b9:b801:8744 with SMTP id g25-20020ac84b79000000b003b9b8018744mr4668639qts.4.1675280904733;
        Wed, 01 Feb 2023 11:48:24 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
        by smtp.gmail.com with ESMTPSA id a3-20020a05620a16c300b0070495934152sm4421885qkn.48.2023.02.01.11.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 11:48:24 -0800 (PST)
Date:   Wed, 1 Feb 2023 14:48:22 -0500
From:   Peter Xu <peterx@redhat.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Message-ID: <Y9rCBqwbLlLf1fHe@x1n>
References: <Y9lz6yk113LmC9SI@ZenIV>
 <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
 <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9mM5wiEhepjJcN0@ZenIV>
 <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Jan 31, 2023 at 04:00:22PM -0800, Linus Torvalds wrote:
> So most of the time it's probably not going to matter all that much
> which signal gets sent in practice.

I do also see a common pattern of the possibility to have a generic fault
handler like generic_page_fault().

It probably should start with taking the mmap_sem until providing some
retval that is much easier to digest further by the arch-dependent code, so
it can directly do something rather than parsing the bitmask in a
duplicated way (hence the new retval should hopefully not a bitmask anymore
but a "what to do").

Maybe it can be something like:

/**
 * enum page_fault_retval - Higher level fault retval, generalized from
 * vm_fault_reason above that is only used by hardware page fault handlers.
 * It generalizes the bitmask-versioned retval into something that the arch
 * dependent code should react upon.
 *
 * @PF_RET_COMPLETED:		The page fault is completed successfully
 * @PF_RET_BAD_AREA:		The page fault address falls in a bad area
 *				(e.g., vma not found, expand_stack() fails..)
 * @PF_RET_ACCESS_ERR:		The page fault has access errors
 *				(e.g., write fault on !VM_WRITE vmas)
 * @PF_RET_KERN_FIXUP:		The page fault requires kernel fixups
 *				(e.g., during copy_to_user() but fault failed?)
 * @PF_RET_HWPOISON:		The page fault encountered poisoned pages
 * @PF_RET_SIGNAL:		The page fault encountered poisoned pages
 * ...
 */
enum page_fault_retval {
	PF_RET_DONE = 0,
	PF_RET_BAD_AREA,
	PF_RET_ACCESS_ERR,
	PF_RET_KERN_FIXUP,
        PF_RET_HWPOISON,
        PF_RET_SIGNAL,
	...
};

As a start we may still want to return some more information (perhaps still
the vm_fault_t alongside?  Or another union that will provide different
information based on different PF_RET_*).  One major thing is I see how we
handle VM_FAULT_HWPOISON and also the fact that we encode something more
into the bitmask on page sizes (VM_FAULT_HINDEX_MASK).

So the generic helper could, hopefully, hide the complexity of:

  - Taking and releasing of mmap lock
  - find_vma(), and also relevant checks on access or stack handling
  - handle_mm_fault() itself (of course...)
  - detect signals
  - handle page fault retries (so, in the new layer of retval there should
    have nothing telling it to retry; it should always be the ultimate result)
  - parse different errors into "what the arch code should do", and
    generalize the common ones, e.g.
    - OOM, do pagefault_out_of_memory() for user-mode
    - VM_FAULT_SIGSEGV, which should be able to merge into PF_RET_BAD_AREA?
    - ...

It'll simplify things if we can unify some small details like whether the
-EFAULT above should contain a sigbus.

A trivial detail I found when I was looking at this is, x86_64 passes in
different signals to kernelmode_fixup_or_oops() - in do_user_addr_fault()
there're three call sites and each of them pass over a differerent signal.
IIUC that will only make a difference if there's a nested page fault during
the vsyscall emulation (but I may be wrong too because I'm new to this
code), and I have no idea when it'll happen and whether that needs to be
strictly followed.

Thanks,

-- 
Peter Xu

