Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6CB107261
	for <lists+linux-parisc@lfdr.de>; Fri, 22 Nov 2019 13:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfKVMrA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 22 Nov 2019 07:47:00 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:37789 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbfKVMrA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 22 Nov 2019 07:47:00 -0500
Date:   Fri, 22 Nov 2019 12:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=proton;
        t=1574426818; bh=81Uf/angWNON3lgpL4ZkFgv24eSOJ+Six8LbcU1AYmQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=jAfhzwlmWqPDKuWFKh8NH8eWkXeLWp++ww+qKyI+xOOnZlV1zYQkvEX7ENIv60yQW
         KcXTh1K2eV8ksfpjt8IB7QSXRwOGNPe6bH9mqdkMxruR/PU4v0a4J5tIxxcQFZ+bDu
         fZCj6V2bkLZnlwpgm785hXrNsfZ5gR/pta8/5xsSaYynl4mUKGlppOXv36MqDGUeIE
         E0Z0kPlSHmEYBC6R/1s10gQKsDlvf9lml9YmI2ea9jD16HGGIgAINfmQlxwdmCtkTv
         8ng8kVsir9FoRI8LmgzIVhdVZxFG3ym/6CJWk+1+rtVAb588mZGjuI2Zhs9aYbuDru
         ML4R1tCK8VEmQ==
To:     Helge Deller <deller@gmx.de>
From:   Phil Scarr <phil.scarr@pm.me>
Cc:     linux-parisc@vger.kernel.org
Reply-To: Phil Scarr <phil.scarr@pm.me>
Subject: Re: tigon3 firmware
Message-ID: <0D9988AC-113A-40B4-9EA2-14D4CBC50C26@pm.me>
In-Reply-To: <9c7f06fc-dace-5fe3-dbdb-be12d714fe4b@gmx.de>
References: <48306AD4-DA2B-4E37-B52A-050A02E9B565@pm.me>
 <9c7f06fc-dace-5fe3-dbdb-be12d714fe4b@gmx.de>
Feedback-ID: AnDrjaQTA1mIrVwhEbJn-LrXpVWgkp5-ycaTfIL-MTxGUAlZPyisXimQB5plDXm-ITvR42cG8qwUhD6jMQpd3Q==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Good to know, thanks!

=09-Phil


> On Nov 22, 2019, at 1:18 AM, Helge Deller <deller@gmx.de> wrote:
>=20
>=20
> On 22.11.19 00:30, Phil Scarr wrote:
>> I=E2=80=99m getting the following errors when the system rebuilds initrd=
:
>>=20
>> update-initramfs: Generating /boot/initrd.img-4.16.0-1-parisc64-smp
>> W: Possible missing firmware /lib/firmware/tigon/tg3_tso5.bin for module=
 tg3
>> W: Possible missing firmware /lib/firmware/tigon/tg3_tso.bin for module =
tg3
>> W: Possible missing firmware /lib/firmware/tigon/tg3.bin for module tg3
>>=20
>> There don=E2=80=99t appear to be any nonfree firmware for hppa.  Is this=
 expected?
>=20
> Yes, don't worry.
> For the built-in tigon cards in the hppa boxes you don't need a firmware.
>=20
> Helge


