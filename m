Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF96D45790D
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Nov 2021 23:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbhKSWuR (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 19 Nov 2021 17:50:17 -0500
Received: from mout.gmx.net ([212.227.15.19]:48909 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231313AbhKSWuR (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 19 Nov 2021 17:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1637362022;
        bh=tE9wlTHC9y2sFeyCyCen3hjuq2uZCJ5nNpbGwJ0EMMw=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=UAc/rf3JrPeJZrGAZGxcaoSoZjGDFMscycXBKS84sBg71gDXdGTJtubDMBZx+KGgP
         bRVpKoj+TJ4ykAsBNHZUO/irKyQJ3HvBUAx6PByjZlspEqBIZi2+c506x6rbOvouZq
         hcZCJpDi1RKauHN/1ZkJHT9WoeN4OdxoY4jFPpk8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof5H-1mHajH1jfV-00p7sD; Fri, 19
 Nov 2021 23:47:02 +0100
Message-ID: <d06de3f9-ddc8-43f4-01c8-b1a75961cde4@gmx.de>
Date:   Fri, 19 Nov 2021 23:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/4] parisc: Increase FRAME_WARN to 4096 bytes on parisc
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Sven Schnelle <svens@stackframe.org>,
        kernel test robot <lkp@intel.com>
References: <20211119222042.361671-1-deller@gmx.de>
 <093e8bd8-73ab-b33f-8488-00080e3a040c@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <093e8bd8-73ab-b33f-8488-00080e3a040c@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:bqI4KR7H/PISHyWyIbo9UURqsuec5PdI9A96NgUKYE3cvRr17+J
 pUBcSdUFxxuZcUNF1YBDyYexG9zCJOGrMvvh/rz66T+HzeB38fUlH+fyxLIZx++4r/tk8gq
 uE4xPVTHVDLrVe+QjS+gLhr8QLVGDa1toSaFq0hGoZfZaXKPTdoi4in5NH2A8hjsoCogZ5e
 V72Fh9xby+jZ7xI2KBXvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qCGF0wlDfeY=:H4v9eHpwdwTRBq11bWd5p5
 Mq+4mZbJCFpxsFx9zNn1kCaoTDqbTFvAABQ5eod6oJHF2xXgnkXamGgbxmeBkyGN3a38syE2B
 5mmJV9M+Cs1FP+bObf6RYi+O02YnQn0XKdoIpVJSkRgl5BBnxGtVrkXu5gtgFC4x02O8ZC6GZ
 SqqgQEKZJKMCPi1qa/CjTyoPBIU982OE71XP0Jp4Wik9H4+FJzRpvh7u9oTLEE0du8l6ho7/X
 OMssVPiVla3flBKkwvJt65zm4pgB+gEvq7BAEGT2HjNBaLQIFZ/b3JqzysNCLKemXBDMifxPp
 sYC7iaNmV5DsZn/+XWcpAPldXqDu4OYxgcRys4+dCZ/X02TDaUTKlKWChaqcmqJUVfkT9I9G8
 bk3SWwCquOwZE6F9lpujokLhqeQuf96DvhvnrgzdAg16i3mG5M/bhqPxkhEXUX3TQ2azqUKIB
 LlSsp0vzuyC68sTtkB8P+qGwHr00TORvfG1atfjOXZDpRp38+pHGv6wBPuQH7398SgAp/ohKg
 o7YDs6fzcsKc9J44H6eg5GgdyL19oQGFEoksv9BI3HZ/wKrWxqG5mzc6Y0Jiubsz9iyXBjACI
 x2u7XwpEHb4odSYrzy1HauB+WOkWSZobxMdzvT6UtDNb64pMrSyK7gQZYWSqEaCj1TplSB9WE
 Fira33h0Ao2PEwDrMfI3VXPNm+19mX+SVmRJej/oJY/folTDNvd1gSPG3TkTDDQbjsyIMXynI
 arn3ilUeYexebh12A4aKAzZBkwPIJRhDobMPy77TBDP+mFSAkb2EeAnlhlixVUsTdy7yabIdG
 aT4q24j90AuGdUiXAdBonJNwjKqMPQ4Bjua+irEfuiRyN2+UHEA0KEibf6J/BUmvpN2+zptX4
 rjc0JG+7NEUHTKvNezFVSaa6UL3JKyJjqWBOGBxDBoDoQoMI2Wcfd5YL2skd1hl1/Lohp+nbw
 A7gCfpe2IHfbE4fjm38BM928QgGMgpS5jBs5OyZbeMRS4+eH51z1AuxNgrISA5Bpf4dhBq18c
 gzEQYmCykMESjvwNAZOaILNiU9i4zxdY7YpxLCvHkKTWv1neKQmWNBtgV6hprgkz2pqBvySCp
 Zz/vfZ8EjbmN94=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11/19/21 23:29, John David Anglin wrote:
> On 2021-11-19 5:20 p.m., Helge Deller wrote:
>> PA-RISC uses a much bigger frame size for functions than other
>> architectures. So increase it to 2048 for 32- and 64-bit kernels.
> The title says 4096.

Thanks!
Will fix.

Helge
