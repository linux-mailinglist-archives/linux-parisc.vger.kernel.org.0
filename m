Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F30B052AC59
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 22:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345343AbiEQUAy (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 16:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233668AbiEQUAx (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 16:00:53 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE02862E9
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652817614;
        bh=Qz7tThec12QW83xNtSTaCdbR8olRm3cUpUQJ1VzcBQM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=OHTcyok9KRF5wUrMo2nzdNbVppwI8SDcBBTpvHY1MF8ClhNV2ThrgaoeBr5ndgRL5
         d/9Q124wsSyZi254cLTdYsz8Lqx0r/m+dHEDBclpX5OPHk92qedbLzdZvV99OUlSqR
         GClxxvrgdlLdV4umAm/n6kNSZr+b5cs57uBx+gLk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOiDd-1oFQVW3d7f-00Q7uT; Tue, 17
 May 2022 22:00:13 +0200
Message-ID: <3e255faa-25a7-b886-6956-239bdd88cbdf@gmx.de>
Date:   Tue, 17 May 2022 22:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <aa7e15ff-3e74-1b9d-4d65-235517b26675@bell.net>
 <5ea9b91f-1d64-027a-b00d-53e0ad2302ff@gmx.de>
 <4399477.LvFx2qVVIh@daneel.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <4399477.LvFx2qVVIh@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KS4rKbqxsl2fx1+/TXiDq9ssPAhZqREH6YB74cY511nlHSURBNL
 OWCGvs+SgQF6ImZoJ5sDVA93+OgMJqs4mbFcbE06etjGwIMembK0D78l+ucrjX/ATAhyiam
 oBx2zA6JT1NcQZ8gMloP/RQrRf7RX5s1rivPuIbH77s7quBLqAEonbtCzt0e54KfBR/izZQ
 v4xg1YRgM6vB0BfpcwC0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5P85G0Qk3Qc=:LDhdwVCn92GiFGLb89DHb8
 oCMDv/j0q7mjp3LONN8R6KP20RPkHSH0yidpyT9mrfcv3es+VNG0utgmDdAiJGXqtGr/fDEA4
 CJ1rorjaonqwWJYJ/HFO1hxgnWsUW44QyB1cWm8X7m0wD+8xFW6Ez2F5LknprVSPK0ECS+WaY
 9AB3Z9/Q6MW1TPJyEgJVbIuh7MUI6BZoYsSsB/Bk6hAsyvyDU7ikBUnMw6Qa8F9oPU6PtPoU0
 Un8jxHQDWTDlT+qsKvuGAr/X3S/cOFDhxxfw2pYjhvCtW3snFjaCuD6pS0SNJi559prueA9pD
 OfuiMEMQ2aEFWqdTWnsn2j9HB9RA7mJDX/ePebUv2ze5PLBx81QwCBfub8yHApFJuyOpzmnHL
 kov9l2ExOu3oFo4Cfw0VNSDoPsXfszA+N4mthLIIgF+VzxqpJZi+SkXlBIzq3gtXNiCV2wjEv
 J40FZ0Gx9IaSbc+aEKgUmGNrzOnPZCxFJ6OZH4Nlcj84gQQw/lXDNoQt4lUDdaFfnu/Kwxsrk
 8Mqxa6P4nov0uUbsFx0zJlYHCULjUq0LtnlCBRyYo5T43atr3e5em5IyVvX3u+PGtHVQWeOzJ
 Pb2LddSkmm6BOfnXNeomkcHfpaY7VnrW2/JBproNPhEcWzkbr0rgyZXjrHzj7v4E+5+8sVRPh
 kJT9UqyiDGFrWVnxzxmb0AQNlyTehh1EJm624TUoBYqzLpEcrSFwg24a6oANSOtxTAR8c6UFA
 sMCr5T0IkGsZud0hSuArnZDdUbQU8D2zmXdZKDnDUxuWLRAupYoFq+e0lVZT5BVXWjd1hTxuo
 WFe4eCxle1bUdb7BIFGuQ/Rx5xvxnN5Ao5JUtjHHIa3GLF7Eokbu25OZwnzQ1Ug5S8/qhGQrj
 YZydOhQPgf+PPI4CC5WbwSmRrbDh+kfJG2V3PwUOPT3l6rVnyKVRCDPpeu/BAVMxgo8QejBtX
 d9WTXfu9B/tQjHQyfZa6PtbOVrVK/ujxZxZZUtsFIaludRp860hTUexuYyABnFEZgKBAjKAKV
 5e0CMQiIKpM3LtAQKGJg0QJyaRf+0+jSvaWgmCcVClRPpYTWtDFoj2QzHnjtlSaW9r9F8nZ//
 addjQrS5IxrmLfFdDE8NDfwTfTjDNMZ/ckbrti0fHN2Y9zG/8+7mn7fjg==
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/17/22 20:28, Rolf Eike Beer wrote:
> Am Dienstag, 17. Mai 2022, 20:11:38 CEST schrieb Helge Deller:
>
>> I can easily split out the pr_warn("WARNING").
>
> Would make sense IMHO.

I split that patch out now.
Dave, can you please check if you are ok with it?
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dfor-next&id=3D67c35a3b646cc68598ff0bb28de5f8bd7b2e81b3
I used the wording from your other mail.

>> Moving the get_ptep() back to the original place seems ok, and I'll kee=
p
>> the strange indenting which checkpatch want.
>
> If its back at the original place then there is no need to change as
> checkpatch will not complain on unmodified lines.

I meant "back to the place where it was versions before".
So, it has to move anyway now.

> If it needs to be moved and
> changed then I would say do it in it's own patch as well.

I kept it in the way Dave sent it (with the checkpatch fixups I added).

Just pushed a new "for-next" tree at the usual place:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/lo=
g/?h=3Dfor-next

Helge
