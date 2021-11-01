Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9F7441F82
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Nov 2021 18:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhKARqo (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 1 Nov 2021 13:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbhKARqn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Nov 2021 13:46:43 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3BBC061766
        for <linux-parisc@vger.kernel.org>; Mon,  1 Nov 2021 10:44:10 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id i6so19033686uae.6
        for <linux-parisc@vger.kernel.org>; Mon, 01 Nov 2021 10:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sBkjx2K9CdVLfEVsFagS5KMR2KuwlMffIgKjQd/aiFs=;
        b=XJnamFzxD8Jmlaf1HI+dYovXJr8Vj+71/EqqpRLy34qq+d/YpwsUTzsYi/54Is4ObT
         RCfmbRM05YlpQXd6Y2LVjME2/nlcAj4nl640myeFu0TkkPEJ3QrOpLXURJvSJQ2idgkD
         Vb0xZFn/tV5tiu0npWv/xAfNPvUdsKzQcSAtGVsFo8b43bdIxGIzQ/Sf74+W0JrpedZF
         bA4CevvrM+Yz3+obSNRj9vAFIPlEDXiB4yI4wNUbt2+q5/iXDxaDvJmjrnJQEuRrP8jz
         GpyLQAYOXOcLwN35mZP5RDdjJPE9+XhetB+gEFyc2OwOGYVRpvgw/kzRw8MTv59LdQp9
         ZZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sBkjx2K9CdVLfEVsFagS5KMR2KuwlMffIgKjQd/aiFs=;
        b=Z2vWJ0QnX1Xwd1czZ5x4AnQ7v41Dtm+eiKjvdygqPlnl8gpD8Z01nWTBRNhc2qKMOr
         rkEOnEKhz/8XLvG8hyl8/OmDs7otg7/pFzYZYZJPvoNwol3Dm8x6EMIzcCE+H7Cu4GtC
         7pTTTs1AsHvhdbkIWNlprzFvC3aYne61Et8ezwADwP3Zfr/VJRS8t3HFn/Gi6cZcnhqh
         DdAZNopgCLTmbvrWZP7TKLLup2yfCH4z1Dry1bnl2EeoGxhHeKv7miv2c2ZjJm+4YV8v
         Z2fJctTDTYEtu+OZgrQq8SFpFc8fDI1ibDxYmAc6h7SLUddN/JFkVlJcdQ9LXEzSDI9L
         6zJA==
X-Gm-Message-State: AOAM530IjjKEF4Y9eRGrnoRKzZAMMYui/x40Or+TpLLIxMVgkQR6XZq5
        0/rdas8Mt9Nmy13+frcsT13mBDv0LCVrvQT4UQQ=
X-Google-Smtp-Source: ABdhPJwsCc6ObUvdgr6d1XWfxvuvaJ/nn9zNJNjZdra5V7f7y9NBZjYebEGhSzMYM584Hk+OPWMk+o9gS09VhsX55OM=
X-Received: by 2002:a67:c394:: with SMTP id s20mr31302813vsj.39.1635788649035;
 Mon, 01 Nov 2021 10:44:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:15aa:b0:236:dd57:6a1d with HTTP; Mon, 1 Nov 2021
 10:44:08 -0700 (PDT)
Reply-To: mr.luisfernando5050@gmail.com
From:   "Mr. Luis Fernando" <nicolemarois35@gmail.com>
Date:   Mon, 1 Nov 2021 10:44:08 -0700
Message-ID: <CANdTE=kgi63O5FobS9F4dZ3qqsahb+kXSxh7m-i0xvR+JXgihg@mail.gmail.com>
Subject: GOOD DAY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

LS0gDQogRGVhciBGcmllbmQsDQoNCkdyZWV0aW5ncy4NCg0KSG93IGFyZSB5b3UgdG9kYXksIEkg
aG9wZSB5b3UgYXJlIGZpbmU/DQoNCkkgY2FtZSBhY3Jvc3MgeW91ciBlbWFpbCBjb250YWN0IGJl
Zm9yZSBkb2luZyBhIHByaXZhdGUgc2VhcmNoIHdoaWxlIGluIG5lZWQNCm9mIGhlbHBpbmcgeW91
LiBNeSBuYW1lIGlzIE1yLiBMdWlzIEZlcm5hbmRvICBJIHdvcmsgd2l0aA0KRGlyZWN0b3Igb2Yg
dGhlIEF1ZGl0IGFuZCBBY2NvdW50aW5nIERlcGFydG1lbnQgaGVyZSBhdCBVQkEgQmFuayBvZiBB
ZnJpY2EsDQpUaGVyZSBpcyB0aGlzIGJveCB0aGF0IEkgaGF2ZSBrZXB0IGluIG15IGN1c3RvZHkg
Zm9yIHllYXJzIGFuZCBJIG5lZWQgaXQNCkhlbHAgeW91IHRyYW5zZmVyIHRoaXMgYW1vdW50IHRv
IHlvdXIgYmFuayBhY2NvdW50DQpCb3RoIG9mIHVzIGJlbmVmaXQgZnJvbSB0aGUgaW52ZXN0bWVu
dCBmb3IgbGlmZSBhbmQgdGhlIGFtb3VudCAoVVMNCiQyNyw1MDAuIE1pbGxpb24gZG9sbGFycyku
DQoNCkkgaGF2ZSBhbGwgdGhlIGRldGFpbHMgb2YgdGhlIGlucXVpcnkgdG8gZ2V0IHRoZSBiYW5r
IHRvIGJlbGlldmUgeW91DQphbmQgcmVsZWFzZSB5b3UNClRyYW5zZmVyIG1vbmV5IHRvIHlvdXIg
YmFuayBhY2NvdW50IHdpdGhpbiA3IGJhbmtpbmcgd29ya2luZyBkYXlzIHdpdGgNCllvdXIgZnVs
bCBjb29wZXJhdGlvbiB3aXRoIG1lIGFmdGVyIHN1Y2Nlc3Mgbm90aWNlIDUwJSBmb3IgeW91IGR1
cmluZw0KNTAlIGZvciBtZSBhZnRlciBzdWNjZXNzZnVsIG1vbmV5IHRyYW5zZmVyIHRvIHlvdXIg
YmFuaw0KVGhlIGFjY291bnQgaXMgZmluZS4NCg0KV2UgYXJlIHdhaXRpbmcgdG8gaGVhciBmcm9t
IHlvdS4NClRoYW5rcy4NCg0KTXIuIEx1aXMgRmVybmFuZG8NCg0K7Lmc6rWs7JeQ6rKMLA0KDQrs
nbjsgqzrp5AuDQoNCuyYpOuKmOydgCDslrTrlqDshLjsmpQ/IOq0nOywruycvOyLnOqyoOyWtOya
lD8NCg0K7ZWE7JqU7ZWgIOuVjCDqsJzsnbgg6rKA7IOJ7J2EIO2VmOq4sCDsoITsl5Ag6reA7ZWY
7J2YIOydtOuplOydvCDsl7Drnb3sspjrpbwg67Cc6rKs7ZaI7Iq164uI64ukLg0K64u57Iug7J2E
IOuPleuKlCDqsoMuIOygnCDsnbTrpoTsnYAg7ZWo6ruYIOydvO2VmOuKlCBNci4gTHVpcyBGZXJu
YW5kbyDsnoXri4jri6QuDQpVQkEg7JWE7ZSE66as7Lm0IOydgO2WieydmCDqsJDsgqwg67CPIO2a
jOqzhCDrtoDshJwg7J207IKsLA0K66qHIOuFhCDrj5nslYgg67O06rSA7ZW0IOuRkOyXiOuNmCDs
nbQg7IOB7J6Q6rCAIO2VhOyalO2VqeuLiOuLpC4NCuydtCDquIjslaHsnYQg7J2A7ZaJIOqzhOyi
jOuhnCDsnbTssrTtlZjripQg642wIOuPhOybgOydtCDrkKnri4jri6QuDQrsmrDrpqwg66qo65GQ
64qUIO2PieyDnSDtiKzsnpDsmYAg6riI7JWhICjrr7jqta0NCjI3LDUwMOuLrOufrC4g67Cx66eM
IOuLrOufrCkuDQoNCuuCmOuKlCDsnYDtlonsnbQg64u57Iug7J2EIOuvv+qzoCDri7nsi6DsnYQg
7ISd67Cp7ZWY64+E66GdIOuqqOuToCDshLjrtoAg7IKs7ZWt7J2EIOqwgOyngOqzoCDsnojsirXr
i4jri6QuDQrsnYDtlokg7JiB7JeF7J28IOq4sOykgCA37J28IOydtOuCtOyXkCDsnYDtlokg6rOE
7KKM66GcIOydtOyytA0K7ISx6rO1IO2GteyngCDtm4Qg64KY7JmA7J2YIOyZhOyghO2VnCDtmJHr
oKUgNTAlIOuPmeyViA0K7J2A7ZaJ7Jy866GcIOyEseqzteyggeycvOuhnCDshqHquIjtlZwg7ZuE
IDUwJQ0K6rOE7KCV7J2AIOq0nOywruyKteuLiOuLpC4NCg0K7Jqw66as64qUIOuLueyLoOydmCDs
hozsi53snYQg6riw64uk66as6rOgIOyeiOyKteuLiOuLpC4NCuqwkOyCrCDtlbTsmpQuDQoNCuuj
qOydtOyKpCDtjpjrpbTrgpzrj4Qg7JSoDQo=
