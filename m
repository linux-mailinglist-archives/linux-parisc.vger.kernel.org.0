Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2512E4862C6
	for <lists+linux-parisc@lfdr.de>; Thu,  6 Jan 2022 11:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237813AbiAFKRV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 6 Jan 2022 05:17:21 -0500
Received: from mout.gmx.net ([212.227.15.19]:53521 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233080AbiAFKRU (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 6 Jan 2022 05:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641464236;
        bh=kGDRbzJuNfRTj+kVX/yvCE4bz4PhDjjknoZhKpDa9MQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=M+UXkO89MskXYKGkSjIZY92pjfCopMOACkLLmRBuomST63nVKcy+gp3gSRkBlnjNR
         wMhgruxidlBG1+NIpd3r8q0Iwui8Gd87ubk+iB/EWCgW0lpfduiYJ8WK+ezx0rV40T
         Dj3Xbh3b8dgzx1STMiHXhcaqKEg8WzCx9cZsAE2s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.152.191]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbRfv-1mYYuw3brt-00br34; Thu, 06
 Jan 2022 11:17:15 +0100
Message-ID: <76087540-d6ad-062c-9304-877304e84e54@gmx.de>
Date:   Thu, 6 Jan 2022 11:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] parisc: io: Improve the outb(), outw() and outl() macros
Content-Language: en-US
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     linux-parisc@vger.kernel.org
References: <20211012222936.3810578-1-bvanassche@acm.org>
 <daa2fc8f-306d-8b7c-defa-bc01c8f17cd3@acm.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <daa2fc8f-306d-8b7c-defa-bc01c8f17cd3@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:FwA2qnfElPVmoTRkYXQRJTdxzzKfIMEVVXHQjBx4lY/pWN/I5IR
 mV4cPsHBs9pj0fd7nC6u/0TknpWcbNrhwSgkYW5T23EB4kHCqyrF7tXjXQCDUcgMQoaU1FR
 L5oosVqFsaQlln4Beh35CnzobOl5muIIoJHRwG/hTZKR8y6hvVAv3HzB3Y4W2BhbanGGmcI
 683Yxf4K4NTaFvXhudMuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y/iAIjrrpUU=:+5NS3shxOpzRN56xrAJ0ii
 6ZLT5Ac9vQD2XaKH7eJyRuoP9ck3sHxctKW/yyXgmEScUwIIaDpcdYZZwwib/HpKWgdlWSkWY
 ELgfoGwOduD/ZORcF2uKyRgs6yZyKZuPacW+gzJ8knfUG5TDtyjC1n971Gan+EzQmnMDDVcAH
 BmLjSevNjvrISByEX4LEM9scQ5E9Ybv3T9dgPNxqvriEEdf8pQDr8wdYvOP0ybLJUR+JdFBdl
 mtAGTETjNiO/vJcysR+yjN+yjnDmeZK+y+LSn5wfDBfoEmF86ayS+81oK0uYNYu9V9BOV82Yo
 Z67bWidvi7Ey63jy35UNwhF4crLfIQpLnh/IJEGLMltQ6fJegaf6/atK3LdPVEn4vSTY3xdka
 NBeHzZm219Y1Q30tv2nCWVvdPX+icB/4n+Q1NctBYau8eIODq2fp7qlVwPR6uq5/YcWtay/5b
 Inmkbcdxq7oTW4USRdZsJx5cvEREoBIDajquFse732E6dzAHitBCU5uKCPfAvEt9lAUl2s+c5
 b7uErTdhovl7EOwLDBkPNYrS6N0/P+G3Z9pTQ3r+hv+ptfkO55smokXAVqt6C7TmRW5CzTgvw
 WEJFqlNVQAjum0+ZENsAJcj0/KqWK3W8reFLfLCIbMJYP2y6lxOPAhtTlE2OgEoVOKaI4BmAF
 e2t/8PGT1p/7xlJ1JQ0+Q4fpUiEn1HhVEYrB+ZxRJdatOP+THCq/NjKfaDRD9MZnL6zRwRdOx
 PUOha5O2hu9uGNz/HHy9D+t+Yxs6Uhu1UqMLQwtLYg9zRLIrs2Z5l0JBB+AY98hqjxgPC/6Ne
 he0LEsFa72EJxBDFDoBqshQg27zlakpdEZmMqcrrZrwGl6wRueI08I/fFx8/nQUBpJ2xGw8U6
 yx26XBy6JJeLQ3JhF7vLKENMlp8MVpKYhVb1UTNUWWlI9m59CgZZGGceWlpEsXy+KA4GZjAQR
 NmczrMsmFP7Dbim8GZrYgjHX9kGKHvQMOkX+lqjdwhs+eKSJ9l0MwxD5mvhhSurctp5zmhun1
 H/sqejxe+DzvtAHFHBrIKWauSceQMlHkTAdKxGrSwA0tZYyL9hTNwsRiPYjHCfULYZ8G/JRPu
 hTLPHFIbipT218=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

T24gMS81LzIyIDIyOjI5LCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6DQo+IE9uIDEwLzEyLzIxIDE1
OjI5LCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6DQo+PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xs
b3dpbmcgYnVpbGQgZXJyb3IgZm9yIHNvdXJjZSBmaWxlDQo+PiBkcml2ZXJzL3Njc2kvcGNtY2lh
L3N5bTUzYzUwMF9jcy5jOg0KPj4NCj4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1ZGUv
bGludXgvYnVnLmg6NSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJv
bSAuL2luY2x1ZGUvbGludXgvY3B1bWFzay5oOjE0LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmcm9tIC4vaW5jbHVkZS9saW51eC9tbV90eXBlc190YXNrLmg6MTQsDQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9pbmNsdWRlL2xpbnV4
L21tX3R5cGVzLmg6NSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJv
bSAuL2luY2x1ZGUvbGludXgvYnVpbGRpZC5oOjUsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGZyb20gLi9pbmNsdWRlL2xpbnV4L21vZHVsZS5oOjE0LA0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIGRyaXZlcnMvc2NzaS9wY21jaWEvc3lt
NTNjNTAwX2NzLmM6NDI6DQo+PiBkcml2ZXJzL3Njc2kvcGNtY2lhL3N5bTUzYzUwMF9jcy5jOiBJ
biBmdW5jdGlvbiDigJhTWU01M0M1MDBfaW50cuKAmToNCj4+IC4vYXJjaC9wYXJpc2MvaW5jbHVk
ZS9hc20vYnVnLmg6Mjg6MjogZXJyb3I6IGV4cGVjdGVkIGV4cHJlc3Npb24gYmVmb3JlIOKAmGRv
4oCZDQo+PiDCoMKgwqAgMjggfMKgIGRvIHvCoMKgwqDCoMKgwqDCoCBcDQo+PiDCoMKgwqDCoMKg
wqAgfMKgIF5+DQo+PiAuL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL2lvLmg6Mjc2OjIwOiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQlVH4oCZDQo+PiDCoMKgIDI3NiB8ICNkZWZpbmUg
b3V0Yih4LCB5KSBCVUcoKQ0KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBefn4NCj4+IGRyaXZlcnMvc2NzaS9wY21jaWEvc3ltNTNjNTAwX2Nz
LmM6MTI0OjE5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYb3V0YuKAmQ0KPj4gwqDC
oCAxMjQgfCAjZGVmaW5lIFJFRzAoeCnCoCAob3V0YihDNF9JTUcsICh4KSArIENPTkZJRzQpKQ0K
Pj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+
fg0KPj4gZHJpdmVycy9zY3NpL3BjbWNpYS9zeW01M2M1MDBfY3MuYzozNjI6Mjogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmFJFRzDigJkNCj4+IMKgwqAgMzYyIHzCoCBSRUcwKHBvcnRf
YmFzZSk7DQo+PiDCoMKgwqDCoMKgwqAgfMKgIF5+fn4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBC
YXJ0IFZhbiBBc3NjaGUgPGJ2YW5hc3NjaGVAYWNtLm9yZz4NCj4+IC0tLQ0KPj4gwqAgYXJjaC9w
YXJpc2MvaW5jbHVkZS9hc20vaW8uaCB8IDYgKysrLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNo
L3BhcmlzYy9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vaW8uaA0K
Pj4gaW5kZXggMGI1MjU5MTAyMzE5Li44MzdkZGRkYmFjNmEgMTAwNjQ0DQo+PiAtLS0gYS9hcmNo
L3BhcmlzYy9pbmNsdWRlL2FzbS9pby5oDQo+PiArKysgYi9hcmNoL3BhcmlzYy9pbmNsdWRlL2Fz
bS9pby5oDQo+PiBAQCAtMjczLDkgKzI3Myw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IGlubCh1bnNp
Z25lZCBsb25nIGFkZHIpDQo+PiDCoMKgwqDCoMKgIHJldHVybiAtMTsNCj4+IMKgIH0NCj4+IMKg
IC0jZGVmaW5lIG91dGIoeCwgeSnCoMKgwqAgQlVHKCkNCj4+IC0jZGVmaW5lIG91dHcoeCwgeSnC
oMKgwqAgQlVHKCkNCj4+IC0jZGVmaW5lIG91dGwoeCwgeSnCoMKgwqAgQlVHKCkNCj4+ICsjZGVm
aW5lIG91dGIoeCwgeSnCoMKgwqAgKHsodm9pZCkoeCk7ICh2b2lkKSh5KTsgQlVHKCk7IDA7fSkN
Cj4+ICsjZGVmaW5lIG91dHcoeCwgeSnCoMKgwqAgKHsodm9pZCkoeCk7ICh2b2lkKSh5KTsgQlVH
KCk7IDA7fSkNCj4+ICsjZGVmaW5lIG91dGwoeCwgeSnCoMKgwqAgKHsodm9pZCkoeCk7ICh2b2lk
KSh5KTsgQlVHKCk7IDA7fSkNCj4+IMKgICNlbmRpZg0KPj4gwqAgwqAgLyoNCj4+DQo+IA0KPiAo
K0hlbGdlIERlbGxlciBhbmQgbGludXgtcGFyaXNjKQ0KPiANCj4gUGluZz8NCg0KSSBmYWlsIHRv
IGZpbmQgdGhlIG9yaWdpbmFsIHBhdGNoIG1haWwgaW4gdGhlIGFyY2hpdmVzLi4uLg0KQ2FuIHlv
dSBwbGVhc2UgcmVzZW5kIGl0IChub3QgZm9yd2FyZCBpbmxpbmVkKSB0byB0aGUgbGludXgtcGFy
aXNjQHZnZXIua2VybmVsLm9yZw0KbWFpbGluZyBsaXN0LCB0aGVuIGl0IHNob3dzIHVwIGluIHBh
dGNod29yayBbKl0gYW5kIEkgY2FuIGFwcGx5IGl0IHRvIHRoZSBmb3ItbmV4dCB0cmVlLg0KDQpI
ZWxnZQ0KDQpbKl0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXBh
cmlzYy9saXN0Lw0K
