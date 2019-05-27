Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA732BAD0
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 21:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfE0Tlq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 15:41:46 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:43511 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726801AbfE0Tlq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 15:41:46 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190527194145.TCYP4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 27 May 2019 15:41:45 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by torspm02.bell.net
          with ESMTP
          id <20190527194145.UVDN30132.torspm02.bell.net@[192.168.0.183]>;
          Mon, 27 May 2019 15:41:45 -0400
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Sven Schnelle <svens@stackframe.org>,
        Carlo Pisani <carlojpisani@gmail.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <a3f85e95-272d-86fc-916a-70928d5f07ef@bell.net>
Date:   Mon, 27 May 2019 15:41:44 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190527192000.GA17551@ls3530.dellerweb.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=yFb-m3sUbi8KsoEeZcIA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfCneHGI9TNptz15fYLpUYDvD5+9XhHixfFvnvUEvFyJROSUV9dJIm4u24cnWa+fqZ0RwP6sHffPkDoLvO+Nu5hpuxTkIOgrE0jJ05xzKvUzkC0S+FYZi 06JUa5D5/+fg08v2mTgVfdyiWbooxcLfyO1sag6TCHvgAdvKBkH1gDQNQmAJY1VlcB8wL6ks5wp56Q==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

T24gMjAxOS0wNS0yNyAzOjIwIHAubS4sIEhlbGdlIERlbGxlciB3cm90ZToNCj4gVGhpcyBm
aXhlcyB0aGUgSFBNQyBjcmFzaGVzIG9uIGEgQzI0MCBhbmQgQzM2WFggbWFjaGluZXMuIEZv
ciBvdGhlcg0KPiBtYWNoaW5lcyB3ZSByZWx5IG9uIHRoZSBmaXJtd2FyZSB0byBzZXQgdGhl
IGJpdCB3aGVuIG5lZWRlZC4NCj4NCj4gSW4gY2FzZSBvbmUgZmluZHMgSFBNQyBpc3N1ZXMs
IHBlb3BsZSBjb3VsZCB0cnkgdG8gYm9vdCB0aGVpciBtYWNoaW5lcw0KPiB3aXRoIHRoZSAi
bm8tYWx0ZXJuYXRpdmVzIiBrZXJuZWwgb3B0aW9uIHRvIHR1cm4gb2ZmIGFueSBhbHRlcm5h
dGl2ZQ0KPiBwYXRjaGluZy4NCkp1c3Qgd29uZGVyaW5nIGFib3V0IHNvZnQgZmFpbCB2ZXJz
dXMgaGFyZCBmYWlsLsKgIEluIGxiYV9wY2kuYywgd2UgaGF2ZSBzb2Z0IGZhaWwgYnkgZGVm
YXVsdDoNCg0KI2lmIGRlZmluZWQoRU5BQkxFX0hBUkRGQUlMKQ0KwqDCoMKgwqDCoMKgwqAg
V1JJVEVfUkVHMzIoc3RhdCB8IEhGX0VOQUJMRSwgZC0+aGJhLmJhc2VfYWRkciArIExCQV9T
VEFUX0NUTCk7DQojZWxzZQ0KwqDCoMKgwqDCoMKgwqAgV1JJVEVfUkVHMzIoc3RhdCAmIH5I
Rl9FTkFCTEUsIGQtPmhiYS5iYXNlX2FkZHIgKyBMQkFfU1RBVF9DVEwpOw0KI2VuZGlmDQoN
Ckhvd2V2ZXIsIGluIHNiYV9pb21tdS5jLCB3ZSBjcmFzaCBvbiByb3BlIGVycm9yczoNCg0K
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqKiBNYWtlIHN1
cmUgdGhlIGJveCBjcmFzaGVzIG9uIHJvcGUgZXJyb3JzLg0KwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBXUklURV9SRUcoSEZfRU5BQkxFLCBpb2NfaHBh
ICsgUk9QRTBfQ1RMICsgaik7DQoNCkkgc3VzcGVjdCBDYXJsbydzIEMzNjAwIEhQTUMgaXNz
dWVzIG11c3QgYmUgZnJvbSByb3BlIGlzc3VlLsKgIFNob3VsZCByb3BlIGVycm9ycyBiZSBz
b2Z0DQphcyB3ZWxsPw0KDQpEYXZlDQoNCi0tIA0KSm9obiBEYXZpZCBBbmdsaW4gIGRhdmUu
YW5nbGluQGJlbGwubmV0DQoNCg==
