Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4A3A1BFD0
	for <lists+linux-parisc@lfdr.de>; Tue, 14 May 2019 01:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfEMXZT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 13 May 2019 19:25:19 -0400
Received: from mail-yw1-f41.google.com ([209.85.161.41]:37685 "EHLO
        mail-yw1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfEMXZS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 13 May 2019 19:25:18 -0400
Received: by mail-yw1-f41.google.com with SMTP id 186so12445039ywo.4
        for <linux-parisc@vger.kernel.org>; Mon, 13 May 2019 16:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MitTV56SXCoHHae8nkJmAuNZlze8MLhnrCjzePIYrr0=;
        b=cpRZLeUFI1eUmApwXLMUi3RA++aO1AfeQs0X/LS7zT3QbA2qvNNmRWByyceTa1Fv0p
         M675xIoNhGezALQseJu79Jc6lC2mP0IyFr3kwYUXPydrQ91oNd3kD6i4Yz0CMDNEqJMU
         sONxWaOjA10LxTSPKLYUkjkr0r8bfJY1K2hUALCOqM3VJmVdykzEuSEIlzxGRKvXzozQ
         VedJD28qXKnPOLRA+hbVfoP5QCnBH8747W0sYw/xxq+P3yrPc4F23AJXbx/U35/QgvkR
         IZZTHJqVQpp2CkMWu5PXxUSSmUu/HCf8+L5wcXU62cSGqlHWUd7klgGUTtpJHMQrOmuP
         nOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MitTV56SXCoHHae8nkJmAuNZlze8MLhnrCjzePIYrr0=;
        b=qdKW74O039gobMEZ6Z8M3yjnpnh6CvI7H+vWa0O84z/N6/+De7J+RNl2DwHCq1uwXL
         Ed9Rc5/9WWFWWo2+4jZvCsDcGPJ1arBv5n8Weq2L3kVIQ1C9PV+H/hVTzX0gsYHpvyHK
         yfYwXiildblm2C8+G672fQcEJmR4Lynvq32sIdZey8yYpZET9Uf9gv573AKj5wOh/mvA
         y5wEbVw3mnLnRhPbDOg4VNQurf3TMMWSaOvHKEZcY5OSngSdFvet/01YDVr1DQwFIfU4
         atYPT15hCqUHvk+o6y0oSK0DK9tSDqxsRJbA0NqPc/ERXhWgx9hOoTceuekSpfSbWiz5
         CDRg==
X-Gm-Message-State: APjAAAWOQiOu7PUTgj+pwcCHUPEoePy9Tiv9zJ/EFE6l5OHUhQaxBBmi
        E7yB3/j4YVPd7pEmnV1vJwQHJhA76dX+Dp9MTsY=
X-Google-Smtp-Source: APXvYqxcj7s4+XRedVo4m0VGekMboxozAGdtltpDsJCliM6vnDy7Dn1QmTQMyvlTX+EOLJxfdf+dxbIHjjqyjGusNLA=
X-Received: by 2002:a81:7c2:: with SMTP id 185mr16736132ywh.113.1557789917920;
 Mon, 13 May 2019 16:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net> <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
 <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net>
In-Reply-To: <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Tue, 14 May 2019 01:24:47 +0200
Message-ID: <CA+QBN9BkXRp2hCd4ADXtWOisHz1Fa0JvWo-0iR56ZTDZiaG=Yg@mail.gmail.com>
Subject: Re: C3600, sata controller
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> The issue is probably the signalling voltage and clock rate capability.

PCI_X means 64bit, no matter voltage of anything.
You can have PCI_X at 33Mhz, 66Mhz, 100Mhz
You can have PCI_X at 5V, or PCI_X at 3.3V

> TTL logic, it is likely that 3.3V CMOS logic can't provide the high level for 5V TTL logic.

inputs are 5V tolerant, outputs are already ok about their levels

> I suspect the only slot that might work with a PCI-X card is the 3.3V SL2.

the SIL24 PCI_X card has been already checked in that slot, and it
fails in the same way as it fails when it's plugged in one of the 5V
slots

> However, if you see I/O errors in the PIM dump following an HPMC, then it's not compatible.

if things were that way, it wouldn't be a random failure, but rather
an immediate failure

to me, it looks more like a timing error, or something bad with DMA 64bit

it's like to force the card to be "DMA32bit" only, just to check it
