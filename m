Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27B12003E2
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Jun 2020 10:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731358AbgFSI3J (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Jun 2020 04:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731364AbgFSI3D (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Jun 2020 04:29:03 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256AAC0613EE
        for <linux-parisc@vger.kernel.org>; Fri, 19 Jun 2020 01:29:01 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w15so5042779lfe.11
        for <linux-parisc@vger.kernel.org>; Fri, 19 Jun 2020 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=irVvm75B8uOjhet4ds9NewlHhGnanjSr3qTRTZzIUE4=;
        b=qkbi8YvZIpYdgXOhuLz+oLhk6FU5nre6FOh8jwCxVM9654uCe38mG3xi4sHqGzzDyG
         SEH1hJrw2TFIChHUxX1ZXnbwARwg6RC5j0BV0+jMRPStvzbKMhHOWFkkmEsrWjqdX5F+
         D1IOfQlW2zLQg/nVx9gJMOxi4uOERKvqBd1S1RhEt6EhjY5th0/tAvBfP2KAJAM96y7o
         h72udRwv1GPKxwptl875dVONvJoltvXpQNW88Rr7UCqkXi2dwlS43kJ7lnlN+shZedPc
         UEpFi+EUsizwMgSG5KrzWkYQzjXdopu2qfdbxfjTUi6dvlVTSJe8cWAu3gdUIqCShHxT
         T2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=irVvm75B8uOjhet4ds9NewlHhGnanjSr3qTRTZzIUE4=;
        b=dkNkkHX3J4IeFqeEDfHGMF7y+hqS0yPALcIpzTa3/7N8woSaJ5w93TD2SNE+pWCfOb
         2ciz5tdek54xmRZOVQm5p8/bi9xfpYipv09WO5nF9dQbPuZ6SK7q7TMN0dc9yY/X8m8f
         8ymjGeG/dub8OJaZQe6zoUs5f4RJU2QyRMnfCSHpmXafubsYgUgeopBQSPjt2YmhVuhv
         qvnUqk9YJdJbGswOuvBP5Km+wtuCGQoFbxOs4T8Kv4z0RD4M5ffjR31IT1TBYGotE7Cz
         jzgDjK1ADSTl0Mxl0H27F0nAGXxrQuEbHhMXKpHIqN1wiNIcgAI1gls9dhIWO8Ab3DyJ
         v0GQ==
X-Gm-Message-State: AOAM531AQaqPKCy9059E7OzHNRmJyQR7YAGmq/b7Qj3WIyhCiQ/2+GlO
        LSK7JHp3wIrVtRLrq6R8fqzJwA==
X-Google-Smtp-Source: ABdhPJxnSAk4hCfsyIu7N052ONa1UuRXTstPiF0JmLx3L/kM6WdrlnqV1xaj4A+uNl5wLop8yEYwoQ==
X-Received: by 2002:ac2:5c49:: with SMTP id s9mr1327184lfp.90.1592555339610;
        Fri, 19 Jun 2020 01:28:59 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8c9:4beb:2ce8:f19d:33e5:571e? ([2a00:1fa0:8c9:4beb:2ce8:f19d:33e5:571e])
        by smtp.gmail.com with ESMTPSA id a16sm1058721ljb.107.2020.06.19.01.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 01:28:58 -0700 (PDT)
Subject: Re: [PATCH 3/6] exec: cleanup the count() function
To:     Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Brian Gerst <brgerst@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-arm-kernel@lists.infradead.org, x86@kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200618144627.114057-1-hch@lst.de>
 <20200618144627.114057-4-hch@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <04e7876b-a8f3-3f6e-939c-bb0764ece1ac@cogentembedded.com>
Date:   Fri, 19 Jun 2020 11:28:44 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618144627.114057-4-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello!

On 18.06.2020 17:46, Christoph Hellwig wrote:

> Remove the max argument as it is hard wired to MAX_ARG_STRINGS, and

    Technically, argument is what's actually passed to a function, you're 
removing a function parameter.

> give the function a slightly less generic name.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
