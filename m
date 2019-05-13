Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C02131B998
	for <lists+linux-parisc@lfdr.de>; Mon, 13 May 2019 17:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731121AbfEMPKo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 13 May 2019 11:10:44 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:45953 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731118AbfEMPKn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 13 May 2019 11:10:43 -0400
Received: by mail-yw1-f68.google.com with SMTP id w18so11235639ywa.12
        for <linux-parisc@vger.kernel.org>; Mon, 13 May 2019 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=/ALChiOKnMbi5IPfVvBTTx9Afx2HTWGWhcKipkGBRc4=;
        b=DG/ioZxRbc7Psl2Rwn2D9Ljvkt168cPnUdDyG2qr7woivVllgieIszsYuhKHWnIO4G
         GCqPQrI+BpWFdHAIH/kt7DXJRxvMVOtgd6LJ9tBxFUToeqJVwyuR+mQ7tOzX4yuxxNYs
         kk0CojDahTsS606dhWKKYke1XmI4IGjFmUjeNW4I5/wyV4JuNPDsewD1h2zNTq5rUiqS
         I00jbiO0/5kw/mNW/eTXXm0uf6hHgE1V9ZRlMSzPVOJB/bwToMaHWbMPDinrfnWmzdEv
         lSsVsECDhKyg6U6YZ9K/4TP4A8EvTZ5mi0jZOMHIS2HaSMYNOmETxYOoQZI2uAYidRrj
         urig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=/ALChiOKnMbi5IPfVvBTTx9Afx2HTWGWhcKipkGBRc4=;
        b=fu0JUcr6fTS81b0sQH33UEc94h8sB2ThaDb0IuhWBO2KFbMjHWGznB9+qSYVdtXB/5
         8dZeAOzxUQSzJ9CkMi4BMTKA23H/R1GlGYuER8KBHCnLpMnVAIoURHX/vnvP4dVeffCK
         tLUExr5oOMydSsTte3NLAybaF4lFngY1oAUFVq65VHZFntjZsO5I7dDw3sw8vMaKIOm8
         HaZ3eeyJwJSgohzpAQw1Y0lg9psXD3NLsxRDPGw77iYI8cUkZLbYavok6MVk/3D0XCLp
         JJpqGPc8gEvF0RDVyXL18xb4Vv1Y+f2c2R4iLB6f5nU9Qu0ep0/EhZvM1bbvS4R9Iuif
         Bjbg==
X-Gm-Message-State: APjAAAWLInawJxUkxbcEIlaHRq6fI29gTsUqjMMv+m8OW6xbj9qSmKgf
        y30un/HLMMQMVkGbbe1QINhWnrFh2imnSjz17pJTNoiB
X-Received: by 2002:a81:9284:: with SMTP id j126mt12287878ywg.445.1557760243034;
 Mon, 13 May 2019 08:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
In-Reply-To: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Mon, 13 May 2019 17:10:13 +0200
Message-ID: <CA+QBN9CN=n556f0KYj2LZ4q9wY+wx9mbWpaMcC44GufUqbsgEg@mail.gmail.com>
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

hi, good news!
after a burn-in test of 8hours, we can affirm that Adaptec 1210SA does work
The chip is "Silicon Image Sil31122", so the kernel module is
"sata_sil" (not sata_sil24)

while [ 1 ]
do
for item in `ls *.bin`
    do
        rm -f $copy.out
        echo -n "$item ... "
        mycp $item $copy.out
        echo "done"
    done
done

*.bin are giant files, 1GB, 2GB, 4GB, 8GB, 16GB, 32GB

it has been tested on a PCI 32bit lost of a C3600
with kernel /v4.16!!!

"mycp" does a copy and then checks the md5 checksum

I think this card can be added to the list!

Our list has been already updated
http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&p=1632
