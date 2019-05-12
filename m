Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F08891AAE8
	for <lists+linux-parisc@lfdr.de>; Sun, 12 May 2019 08:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbfELG2q (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 12 May 2019 02:28:46 -0400
Received: from mail-yw1-f46.google.com ([209.85.161.46]:40874 "EHLO
        mail-yw1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfELG2p (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 12 May 2019 02:28:45 -0400
Received: by mail-yw1-f46.google.com with SMTP id 18so8303090ywe.7
        for <linux-parisc@vger.kernel.org>; Sat, 11 May 2019 23:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JuAxDHvMkmvrkwWOqNifPPCf9FhTZHojZR1P9pmFxkM=;
        b=uj0bBVzhPmdfSfsxrXbZcutZu85xU2wn1EO0MqOXmGfHs6sgKuLqC0qNEzjeXwHTr1
         cBTuG3HnLRobA7MZKCg3AG50y6X/Pnq8xQTIIn8eW2d/nHL4upc4E3bePpbV5EhL6d7/
         P6FwL3b1U9yN5CEythiDeVVn67UqE4kfVVciWTtL35vk8YxsDfAtAOel3skI7HL6mDHV
         UNxIlcGA5qqcLIjbPZ95/ndJNR1KFy3twzX9la0TIILinpws0nMYX0H89D52sDd8HRcC
         EnGWt7U+a5z4AEZMfVZpV+ZNF6U3LK46n9igFRwOwEOplaxFZ4twvv49Ff42NAFW3AZO
         3xTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JuAxDHvMkmvrkwWOqNifPPCf9FhTZHojZR1P9pmFxkM=;
        b=MZls8HKwX2wAXWXtDW51180fTNH1GBS9921MsffSBFTtCWTUMsuI0pHMwXev+Zof64
         L3OuA30wVqUW5cxMeyvWPdf4XbNOTP5+jYplzShiesZhVWHUYHtusRi4Utm9TJzPE3o8
         wMQIDIxtCmox/XlubgYyveOQd0/y2FhDlXogFeWoI13JPS1jBpRzbSXRJMzO7T4eJUHr
         hN4QF010s8KbQwLXkONwgA5Q4KeGBKPH24yL7bVHndegTK0RmyUnirAzt7FwLRff0Okd
         w1Vid2r3hr1AoWZBFnarUsRGtGC3IixOCbCVw+ZkTgwD3XWK4jj0M/2tERJysKU0HVGv
         HZwg==
X-Gm-Message-State: APjAAAUDKuYnKBKd2RCxuO7uBoAXbzVe1C+f4ed0gO0y1yJ8pemyyFRo
        EKOcIIe1hLwq8Ynl8jRp871MEhK/P9+7yLkJCIE=
X-Google-Smtp-Source: APXvYqxMWZ0G7KM3pW1F+q4naXercgnjTWhrtlORdAxRPcIHP0SSTf3U1PZ6y3TQx7LD4fXs8tT2wDysYSr2clP1SyY=
X-Received: by 2002:a81:ad20:: with SMTP id l32mr2855574ywh.62.1557642525129;
 Sat, 11 May 2019 23:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
 <325c8de3-3869-08d1-696d-b89f5813d537@gmx.de> <CA+QBN9AZzuJe600ngavoVseRFHCBh4ws5-5pHoWEQkkqZ_wU5g@mail.gmail.com>
 <fac5aa59-999f-e61e-774e-b43d0d28779c@bell.net>
In-Reply-To: <fac5aa59-999f-e61e-774e-b43d0d28779c@bell.net>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sun, 12 May 2019 08:28:17 +0200
Message-ID: <CA+QBN9D6yQiB2zZAvg51LWoAgFAzO9LeuJQyadRvn3y4+hUxMg@mail.gmail.com>
Subject: Re: 5.2 hppa merge seems to work on my machines
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, Meelis Roos <mroos@linux.ee>,
        linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

> Note card is PCIX slot.

tested on a C3600
with a Silicon Image Sil3124
the first card's brand is "SYBA-II" (from Amazon dot com)
it's 4 SATA channels, PCI 32bit

the second card's brand is "Adaptec 1210SA"
it's a 2 SATA channels, PCI 32bit

we do not have a PCI 64bit Silicon Image Sil3124

which is your card's brand?

are you using PCI-hardfail ? or softfail?
do you have CONFIG_MLONGCALLS=y ?

unfortunately, we do not have a C8000 to test
