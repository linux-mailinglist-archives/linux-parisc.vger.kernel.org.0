Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5D6578A179
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Aug 2023 22:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbjH0Ul0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Aug 2023 16:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjH0UlY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Aug 2023 16:41:24 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C03A128
        for <linux-parisc@vger.kernel.org>; Sun, 27 Aug 2023 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1693168876; x=1693773676; i=deller@gmx.de;
 bh=bHRcnWmzTirIqTYxGAAFv3HHIEu6+5gFjiKsgsbdY3U=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=O0T4AbEF57rdvzx6ExxOLPBnR67SIr0Le22JtGS/+YwD5pAT1P3gSQAJsOgKvnwWrZq+aw9
 DwglQ9jiaOP3nEmnFCLZfny5WeWChYxt45/tNTN89pJ0v7aeiCXLhbz+mZK/Qcz8r6qnFUVPI
 ZHk8ffeClBBvG7Lp3hkmhUhr5Wq05XzdDbv7iWsJaqr/CbSgHdM4pRSey48FkLYT59bQC49Mg
 TFpcHYkwmzMkDVrE/JPewJsTjlT9NOkzn71RNr/m3J+utBryWJ3ysAzkO6aNOLKrk20zvl4CT
 pCDip9Q8q/BzksaYFUK4mmiGZMFZZQvk4ka/9vfkXETIm2wM0olQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.139]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGhuK-1qVMcg1cRO-00DsgR; Sun, 27
 Aug 2023 22:41:16 +0200
Message-ID: <f8be4af4-725a-902f-60a5-0f18c198b130@gmx.de>
Date:   Sun, 27 Aug 2023 22:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>, Vidra.Jonas@seznam.cz,
        linux-parisc@vger.kernel.org
References: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
 <7ce98f53-d80d-fc78-1bff-419eedaf8e36@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <7ce98f53-d80d-fc78-1bff-419eedaf8e36@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ust/6OUNa7VczOYPNNjL1fORyroRdICdHRZrFYjCSd7ReGgQD3l
 iX1rE5DQFy1XsWWYtFhEmkqHjCoV61GrgSqSsZRbGAcjpnDY/lENej1gQjOcJwgEJAM5fTw
 grMdfQTwq2fCgBFx2V34bi1L+tAsCq4kn/CJIFXpu7F7vfnzjf+IXEg7GuyYMse15Upjdl3
 li03xol1jGD+jV/SBNmBg==
UI-OutboundReport: notjunk:1;M01:P0:0HcwpUY5RDo=;MjdxJ34wfAVQkXtkbXUw1q44GH1
 ZPGQhV1V2mkFFpIfxFLt2Q9gSuEcxyJ+c0lgs8AXUZJth4PG6A6Fn0FngIHWnDMuIPnUVOv4e
 TzwKtlW0PUd00G/hsmyNfC6PVNLfhFO04mU9kssNX7pWmXDpfDnd8juUo7sjkuAsYAF09oS71
 Kbzpk5ZzsuXhlXQlyDU9kvclGYncQpTTOYarMi/QJ6vKCEmC68u4z4uTrIpoFovczX2BmDEbE
 e95YZiWvQMmjRShb3IW11P1XQOrJKleV5VMYG8aL0+v5a9+H/5HaTT/nV7yvWK3J2s4+SnDCD
 LY52Hhzw9i35WTAopnWSN/4j4etGU55i/ZyYgfHdhxpRQ1kMYIjStXl+N2zCkjLWbWOMZHlac
 6Y4cOqdAn0qSF45MKje7Yh6MGHii7I8RtaBrUWoQiY1YuURP6iIIUlJmT6ugt1BldmNtVrBMY
 BR7/FpishLVvlLSB/bBfEfr7GdyjR6N/ztSNU/4rVVuU2pW5/QICvPWGxuf3NM7hJhaK+wNAk
 E890/sZlhWoAGoJebx2YXdlck52RRD6r17lry8sekGNG8o6cUOXw5yMJpbvn1EZtvExPvC3tp
 UYOYTX/14ixHfWrf16cyTLd/Toek5vdWF57AAWNT/BSLJMdjXnNkJuM5Wje+E/6mpACwFsVoM
 88hUX2P+HzuwN2psqJVQ54hJ9oyT10qHE6zmmocdmUOMbY9xCjXfDQxT3bKiZ4SPFWxi+z4pB
 vjTCy0Ne0GqT8C3paMJNxCw4rJVChkC09+iIesDcX7FxRSoCLTQBDQJOyS0P/5FSAmr19AWqY
 IIGtfYEdjBpCKJ80b//i42oiDrViQSw6Zhh+dYlZPW4nlM6MgPaT2zDQ2afRACKJeVsqKcyYh
 v7qr4aWg3nGcXGD6ga8WGtaLNJsafuAHoqHVgz26smPyJ2dDCx6kM+g8FgjubbU/bdiRfFoFV
 TNqBCQ==
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 8/27/23 22:35, John David Anglin wrote:
> On 2023-08-27 7:25 a.m., Vidra.Jonas@seznam.cz wrote:
>> The issue is that a call to
>> `io_uring_enter(fd, 2, 2, IORING_ENTER_GETEVENTS)`
>> returns 0, and libuv reacts to that by aborting, probably on this line:
>> https://github.com/libuv/libuv/blob/65dc822d6c20a9130fa100c7b46d751f8cf=
4d233/src/unix/linux.c#L1252
>> (I'm saying probably, because gdb seems to be buggy on my machine and I
>> don't really trust its output, so I rely on strace instead, but that
>> doesn't support backtraces on the PA-RISC.)
> I have the attached io_uring patch on 6.1.46.=C2=A0 It's back ported fro=
m 6.4.
>
> libuv make check was successful on my system.

Did the libuv check failed on 6.1.46 for you?
I just tried plain 6.1.49 and my machine crashed....

Helge
