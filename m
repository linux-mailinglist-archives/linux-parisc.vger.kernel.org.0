Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2E425E95D0
	for <lists+linux-parisc@lfdr.de>; Sun, 25 Sep 2022 22:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiIYULU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 25 Sep 2022 16:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiIYULT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Sep 2022 16:11:19 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B060A2497F
        for <linux-parisc@vger.kernel.org>; Sun, 25 Sep 2022 13:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664136669;
        bh=f+GDxbvS6vq0WXPA0E5NfJGrzfOO6BwXlYsF80DW5X0=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=VlQjlo8cozUGhb8hKuWF6mPHD3cFz11D1iMBEhRurbDG4qYlCQoiTPPSJzRCD7diM
         yVTuvOfcE5iW8PWrgUQvUMgUzDSGa8WCj28kwvxXsXqFTvs3GVKJpTeP3D12J6/oqr
         B0/zt24NcK+vle/B2oU5Nv2dOeRH99Zauz9YwoOs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49lJ-1pKiL62ro1-01066Y; Sun, 25
 Sep 2022 22:11:09 +0200
Message-ID: <1de28183-2252-04dc-9838-d695161a01ed@gmx.de>
Date:   Sun, 25 Sep 2022 22:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][RFC] parisc: Use local tlb purges only on PA2.0 machines
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YzCkkyktEZFM0svQ@p100>
 <1063fc54-738a-a1b9-fb53-8202287805c7@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <1063fc54-738a-a1b9-fb53-8202287805c7@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:eoEzWIJ41ffSDSJV9541qbHlUE8aka7ZjU9JLWKx2sBO4Uj43vz
 HJV2ZIXzGWZJ1qi8L3XUE6+4Kzds4ZczIRqBkpZH7G5AKv5OnHVdLq6m87WE5T7nyYNHn92
 gdUk804EI2+17XFchLvzwIk0xKf+VOwVpz4L68SlzQNcVElHXxKsG3KCl9mCjm9jn+5Ns32
 heXo+QBlbPF5WreqMWXfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nVbsSgdvI4w=:vWUPdd8UgMzhWcEUsUOKBN
 WcX55aqlKnvGWT2TziC/pk39stS2KbKvCiqQOnrqWDyZkmpw8fnYUPpiJjQ6SwFnPjOkQCvMw
 7lQTnrDjYy3NZAM2i3PpbJLqX1aoJLKfDCufipPK1D1kAmCls4bDb96li8ELlvBz24VfWER4Y
 ScxskO4ZTdv8PdY0irdOrdCEc60Ka06p8MeCYVw4SBuOwTDAbRkbryYrD4mC2NuFThWGLdZlv
 l4/mxBzdmWbUyipK6IzQ0mzZyto8vFZT/mBZPE1ej3r4UlV1ochwdRtnww0Zpa4XCzG7czIk7
 oiKDpwFbUAdtR4TB7LGPH9hE3erVs5A8qCwMgP8DSGYkvUNrLFUo3Tve1ub8X2TPRcXXy6iuW
 yg2DTaAFlNHB56C8XdxZnAybaBTMNMMxmw89ms90iht7YVQME4C7GYNAQM8lPttyBU69jlRZ2
 aH9wSg8vrlweQxLw1dP8uoPvIgaFNb30mBTIAV0z9QC2mp3hAYcGSrhVmnB1oMm4NHRbszB1m
 KKTwas0AeoPygNLRyz4i3ycTeW8sPVyyPOWJYYCbZqFjc5m6GVa8/h6g7/2SnMtdjrkOn7aDU
 /HQ9vcT28ZFBf4/yJfDttrTnORRNPNw+g5So+FO+cPhgX6Qs5RN82oWJXA5YDJZhcxiefY6e0
 /5gGTFq1azWW0vQZ/lX72QNWY2kVEqC6Y+H/jXQbW5Q+IrzaG8lFKWDNqyGtiumkA0hbu6H4y
 WK/1Gbzbve8Huma170nIvkl9BqTQnXtLrKSZx6IFqEXVAacBzDv956o0B7siItI9yMv0zo2Zt
 zvnL1Sm+zYutaNdRKqAM5+9FqfBBMfSGWLnzsZTdw41BHHcQBQWcorkZ9+0WaW46rcARgArSa
 hvcGPsQ2LvuHViAZN1B6ndPRe4F/HxwQDqzgp0wCtDfFVA848nWLNRcbbZ75m18Vp50B6DxhN
 04+na1JBAb6WUDdi7pFQfNwwCHTYAbNThbsOKT3IC/wcl1Qod6DTzJLcj3ZC/dQu+cSefcSfq
 T4WkmKfdz521cLdvsDQ0uufhrCLl5a9o2Inobev8JRDEJRE7Yc1Flpq0WAT6/NsLIX868mBdS
 QpN2PBqTE6VKdlJ3pDnT8maFaYGFGOiNoqNl8C/Wo8m231I0p/GzOz391eKzh2FS3JcAVsDB6
 DbfUwEZYeoUamwqnsi6zsBBFST
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

T24gOS8yNS8yMiAyMjowMiwgSm9obiBEYXZpZCBBbmdsaW4gd3JvdGU6DQo+IE9uIDIwMjItMDkt
MjUgMjo1NyBwLm0uLCBIZWxnZSBEZWxsZXIgd3JvdGU6DQo+PiArI2lmZGVmIENPTkZJR19QQTIw
DQo+PiArI2RlZmluZSBBTFRfQ09ORF9QQUNBQ0hFwqDCoMKgIEFMVF9DT05EX0FMV0FZUw0KPj4g
KyNlbHNlDQo+PiArI2RlZmluZSBBTFRfQ09ORF9QQUNBQ0hFwqDCoMKgIEFMVF9DT05EX05PX1NN
UA0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gwqAgRU5UUllfQ0ZJKGZsdXNoX3RsYl9hbGxfbG9jYWwp
DQo+PiDCoMKgwqDCoMKgIC8qDQo+PiDCoMKgwqDCoMKgwqAgKiBUaGUgcGl0bGJlIGFuZCBwZHRs
YmUgaW5zdHJ1Y3Rpb25zIHNob3VsZCBvbmx5IGJlIHVzZWQgdG8NCj4+IEBAIC01MzksMTUgKzU0
NSwxMCBAQCBFTlRSWV9DRkkoY29weV91c2VyX3BhZ2VfYXNtKQ0KPj4NCj4+IMKgwqDCoMKgwqAg
LyogUHVyZ2UgYW55IG9sZCB0cmFuc2xhdGlvbnMgKi8NCj4+DQo+PiAtI2lmZGVmIENPTkZJR19Q
QTIwDQo+PiAtwqDCoMKgIHBkdGxiLGzCoMKgwqDCoMKgwqDCoCAlcjAoJXIyOCkNCj4+IC3CoMKg
wqAgcGR0bGIsbMKgwqDCoMKgwqDCoMKgICVyMCglcjI5KQ0KPj4gLSNlbHNlDQo+PiDCoCAwOsKg
wqDCoCBwZHRsYsKgwqDCoMKgwqDCoMKgICVyMCglcjI4KQ0KPj4gwqAgMTrCoMKgwqAgcGR0bGLC
oMKgwqDCoMKgwqDCoCAlcjAoJXIyOSkNCj4+IC3CoMKgwqAgQUxURVJOQVRJVkUoMGIsIDBiKzQs
IEFMVF9DT05EX05PX1NNUCwgSU5TTl9QeFRMQikNCj4+IC3CoMKgwqAgQUxURVJOQVRJVkUoMWIs
IDFiKzQsIEFMVF9DT05EX05PX1NNUCwgSU5TTl9QeFRMQikNCj4+IC0jZW5kaWYNCj4+ICvCoMKg
wqAgQUxURVJOQVRJVkUoMGIsIDBiKzQsIEFMVF9DT05EX1BBQ0FDSEUsIElOU05fUHhUTEIpDQo+
PiArwqDCoMKgIEFMVEVSTkFUSVZFKDFiLCAxYis0LCBBTFRfQ09ORF9QQUNBQ0hFLCBJTlNOX1B4
VExCKQ0KPiBUaGlzIGRvZXNuJ3QgbG9vayBjb3JyZWN0LsKgIElmIEFMVF9DT05EX1BBQ0FDSEUg
aXMgZGVmaW5lZCBhcyBBTFRfQ09ORF9OT19TTVAsIHRoZSBwZHRsYg0KPiBpbnN0cnVjdGlvbnMg
d2lsbCBiZSBjb252ZXJ0ZWQgdG8gcGR0bGIsbCBpbnN0cnVjdGlvbnMgd2hlbiBydW5uaW5nIFVQ
LsKgIFRoZXNlIGFyZSBub3Qgc3VwcG9ydGVkDQo+IG9uIFBBIDEuMS4gDQoNCllvdXIgY29uY2Vy
biBpcyBjb3JyZWN0LCBidXQgdGhlcmUgaXMgYW4gYWRkaXRvbmFsIGNoZWNrIGluIHRoZSBhbHRl
cm5hdGl2ZS1jb2RpbmcsDQp3aGljaCBwcmV2ZW50cyBlbmFibGluZyB0aGUgbG9jYWwgZmxhZyBp
ZiB3ZSdyZSBub3QgcnVubmluZyBvbiBhIFBBMi4wIENQVS4NClNvLCB0aG9zZSBBTFRFUk5BVElW
RSgpIG1hY3JvcyB3aWxsIG9ubHkgYXBwbHkgb24gUEEyLjAgbWFjaGluZXMuDQoNCj4gV2hlbiBy
dW5uaW5nIFNNUCwgd2UgaGF2ZSBwZHRsYiBwdXJnZXMuwqAgRm9yIHRoZXNlLCB3ZSBuZWVkIGJ1
cyBzZXJpYWxpemF0aW9uLg0KPiANCj4gVGhlc2UgYWxzbyBkb24ndCBsb29rIGNvcnJlY3Q6DQo+
IA0KPiAjZGVmaW5lIHBkdGxiKHNyLCBhZGRyKSBhc20gdm9sYXRpbGUoInBkdGxiIDAoJSVzciUw
LCUxKSIgXA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBBTFRFUk5BVElWRShBTFRfQ09ORF9OT19TTVAsIElOU05fUHhUTEIpIFwNCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiA6ICJpIihzciksICJyIiAo
YWRkcikgOiAibWVtb3J5IikNCj4gI2RlZmluZSBwaXRsYihzciwgYWRkcikgYXNtIHZvbGF0aWxl
KCJwaXRsYiAwKCUlc3IlMCwlMSkiIFwNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgQUxURVJOQVRJVkUoQUxUX0NPTkRfTk9fU01QLCBJTlNOX1B4VExC
KSBcDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFM
VEVSTkFUSVZFKEFMVF9DT05EX05PX1NQTElUX1RMQiwgSU5TTl9OT1ApIFwNCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiA6ICJpIihzciksICJyIiAo
YWRkcikgOiAibWVtb3J5IikNCj4gDQo+IFdlIG9ubHkgaGF2ZSBsb2NhbCBwdXJnZSBvbiBQQSAy
LjAgbWFjaGluZXMuDQoNClNhbWUgYXMgYWJvdmUuDQoNCkhlbGdlDQo=
