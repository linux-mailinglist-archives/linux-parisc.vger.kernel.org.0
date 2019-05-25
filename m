Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 210832A38D
	for <lists+linux-parisc@lfdr.de>; Sat, 25 May 2019 11:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfEYI7c (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 25 May 2019 04:59:32 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:41380 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfEYI7c (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 May 2019 04:59:32 -0400
Received: by mail-yb1-f196.google.com with SMTP id d2so4578761ybh.8
        for <linux-parisc@vger.kernel.org>; Sat, 25 May 2019 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=xKKlfF2UNbDVEAghC5Zk8M2SCxRAIex5R2b+OqSnvFU=;
        b=rPNpjVQgDiaZ5xSQtw6BzqhC9XiAbEwoq5ubUuLAzdHg8Q3krPeT2X0WOdLPTT4Aic
         ZsgvEIxpTO9SSzLz57ADUGrbRea2qsE+PtUiSspPV+ZBwBFZcRrafUlt/pC6t4FspyIn
         fV/7Hnbs/VHNwYY33fMmsjOAWKurfbWoxwRpfUQytMCRoZargM3GxoLeweJUQkATIgPw
         X+n9ckN2qrD3tqCoYDdwnbEv9abq5v+SZvbLSqwIcgtLsmY7pAFw5KjPCr3J5jMRV7G7
         VVlUb6Tf/+CBzGO8lWKZu73A9M3DOhqEF9DXMiCk54tf1ShQoR5+Vex1L/m2Vk8dAfBM
         EZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=xKKlfF2UNbDVEAghC5Zk8M2SCxRAIex5R2b+OqSnvFU=;
        b=a+O5PT3kzplvM/Z7jkN7nxMDqFCpAH9MMv0J6hjpe6KkgfGVDPMjil20oc2++gzRGd
         6SlRgwUChwDdzXIy9vaBzG5OfgRPALtaJ+gc7cW8S1EUXNfUrBu80I/N/PXW6Uj3+8oJ
         Tyf9a5PejqWHqeOPg5Ez3W3gZ/1pY0JQPFcXZU4wLjEdCbeTsR+nTVtT3KccwGHk+nz2
         N2M53jNAyzmCqCS4IP8vvKvrWpChADMAKsfK2bfQ6vk62iYD1mzOF8c2CFU6FDL4l4m9
         QBDT5vuJcNjCQG4XDapqOIew/0iCCnTdP5uXqsxzcRkHBGjz5qAZKTkT+yOJPU1r2owQ
         9aZw==
X-Gm-Message-State: APjAAAWshiFAxpEZqyQ9+iKt4TSbp12Rp3BOX3R6I0SPs/Cm5kPZasGd
        0RuDvDtRDTgh3gImHObnklIsmvj6tIpA+mO06Nr2qbTn
X-Received: by 2002:a25:bcf:: with SMTP id 198mt3315064ybl.34.1558774771441;
 Sat, 25 May 2019 01:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
In-Reply-To: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sat, 25 May 2019 10:59:27 +0200
Message-ID: <CA+QBN9BPbTHojQcSQZM1KmfsUMkajhLhmJ6jye4PdK8uXO9NcQ@mail.gmail.com>
Subject: Re: C3600, sata controller
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

guys?
yahoooooooooooooooo, SYBA-SY-PCX40009 does woooork :D :D

02:03.0 RAID bus controller: Silicon Image, Inc. SiI 3124 PCI-X Serial
ATA Controller (rev 01)

10 hours burn-in test passed!!!!

while [ 1 ]
do
for item in `ls *.bin`
    do
        rm -f $copy.out
        echo -n "$item ... "
        time cp_and_check_md5sum $item $copy.out
        echo "done"
    done
done

kernel 5.1, from the git repository, compiled with SMP

dmesg | grep altern
[    2.551002] alternatives: applied 156 out of 175 patches

only applied this patch:

--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -52,7 +52,6 @@ void parisc_setup_cache_timing(void);

 #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
                        ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
-                       ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) \
                        : : "r" (addr) : "memory")
 #define asm_io_sync()  asm volatile("sync" \
                        ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
