Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D34631AE26
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 22:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbfELUpB (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 May 2019 16:45:01 -0400
Received: from mail-yw1-f45.google.com ([209.85.161.45]:32993 "EHLO
        mail-yw1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbfELUpA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 May 2019 16:45:00 -0400
Received: by mail-yw1-f45.google.com with SMTP id q11so9375253ywb.0
        for <linux-parisc@vger.kernel.org>; Sun, 12 May 2019 13:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=rXTZLv/Z8jb2kzjcdk+NYdqir90CjcF1FIy5Z+1TlgE=;
        b=eTbau4AlAAGdyg4cbB7cGIwK3X4MnhrpMB2A6lCDZQvtwbNz+Za2WH7BZmI2P2udd3
         A4+EvTpH9CPFeFVC3Sx7KFvX0VOQmV5fuw3cjC0TxGbdDhzNbfjqAS+2expnQkfyx71u
         P4dwyJB/KmobC+6w7Wft7JUgGHUc+VFfzBelCCC9+RMH8plas8cWN9Q7Xl4S1mU5YQfg
         KwLGnbR5Gjp/i7MLlVa/lqulgbTpdD9WarE2x0um4tEewVYuwv0EDV12LZmRsIhjwwuc
         kVfpU7dnxlV2cgk129+57KVjLdD6Hn7AQ2/B/kSrk6HS2/g7FJ7JUQw0y9cca4vP+0KQ
         993w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=rXTZLv/Z8jb2kzjcdk+NYdqir90CjcF1FIy5Z+1TlgE=;
        b=aGkSrvtSdSk5ORyVUiOxs1lwqPTn58fXSdfYKCwkUWO9g9tBpSny2bf8aUJRZv0X3b
         s3Rd/ksPnDHTe5BEyN9NMCTyukcEJhDDDSuZ21m2zSnNv8Q5gsfrMui3ViF2y2cDQ4h1
         tGGbBMuy5Z5GE9b4dZB9Pw3bvC6WJ4C4hqCQ1SrSV8ZQbOtFFLmc3JZJAlxI1mlQao5q
         U7LVgVEg82Wk4u0rIQJnSWJ331wDdMQiB4pUfpGTM6SbdGt5zY4dqjf8V0Vd6kfv1Cwc
         6eb5TkJjKmbo6LAWznGpjG804LdlS1vFkPpFUh2wZ1nBtnvlPEmskZBWxqT7Zj6En9wa
         jZ9g==
X-Gm-Message-State: APjAAAVvW2ANIl6IzYD+SjQkL0hhbwMzUNDROep9wtJ25BFOynUEGiZI
        g9zsw3osH7sK9wa4MxPuGUY1fXnptri8qqSwGY6KTFJK
X-Received: by 2002:a81:7c2:: with SMTP id 185mt13059386ywh.113.1557693900014;
 Sun, 12 May 2019 13:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
In-Reply-To: <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sun, 12 May 2019 22:44:31 +0200
Message-ID: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
Subject: C3600, sata controller
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

guys,
I asked a friend to lend us his card, which is the card2 listed below
and not things are becoming really weird

card1, Silicon Image, Inc. Adaptec AAR-1210SA
card2, Silicon Image, Inc. SiI 3124 PCI-X Serial ATA

the card1 is a PCI32 bit card, and uses the "sata_sil" driver
the card2 is a PCI64 bit card, and uses the "sata_sil24" driver

card1 is installed in a PCI32 slot, and it's moving 32Gbyte in a loop
without any issue

I have just tested card2 in each of the PCI-X slot (including the 3.3V
one) and ... it has always triggered the HPMC unit, crashing the
machine

the hardware is different, and drivers are also different, but  ....
maybe the problem is related to 32 vs 64bit?

I am going to repeat the test with card2 installed in a PCI32 slot.
This should force it to 32bit: will it work correctly?
(hope this makes sense)

---

we have also checked if the kernel is correctly handling the ram
we have a C3600 with 8Gbyte of ram

mount -t tmpfs -o size=7G tmpfs /mnt/ramdrive/
dd if=/dev/zero of=/mnt/ramdrive/test.bin
badblocks -swv /mnt/ramdrive/test.bin

checking for bad blocks in read-write mode
From block 0 to 7340031
Testing with pattern 0xaa: done
Reading and comparing: done
Testing with pattern 0x55: done
Reading and comparing: done
Testing with pattern 0xff: done
Reading and comparing: done
Testing with pattern 0x00: done
Reading and comparing: done
Pass completed, 0 bad blocks found.

no problems found
