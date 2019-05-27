Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 736122BB79
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 22:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfE0Up1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 16:45:27 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:53912 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726657AbfE0Up1 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 16:45:27 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190527204525.URRF4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 27 May 2019 16:45:25 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by torspm02.bell.net
          with ESMTP
          id <20190527204525.VIBB30132.torspm02.bell.net@[192.168.0.183]>;
          Mon, 27 May 2019 16:45:25 -0400
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Sven Schnelle <svens@stackframe.org>,
        Carlo Pisani <carlojpisani@gmail.com>,
        Grant Grundler <grantgrundler@gmail.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <a3f85e95-272d-86fc-916a-70928d5f07ef@bell.net>
 <a6462d98-46f5-8cad-e4ef-228ee2ea5829@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
Message-ID: <f7c127b5-6e65-b285-bd2f-290cc27e776f@bell.net>
Date:   Mon, 27 May 2019 16:45:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a6462d98-46f5-8cad-e4ef-228ee2ea5829@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=FBHGMhGWAAAA:8 a=P2Aq6o7_IUYWa4uGBzwA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfNNd1HIVyy89blrzZPqNCv89NeWyqlLycxSjtBXn0fRuWSnJI6YPugmSiFrhHRNgLZa99l9GYtBvlwIx1vQ7sziing+Y9mgIoDj8qSbJRiBn7KS3UY+k CXzppHwAWHX+VQ3ndbeHz8K+wDDiW3Scs5epEdE2UQU8jkEjGa1g8/OQOVnkT6M4QcHtjIkHN4IJRw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

T24gMjAxOS0wNS0yNyA0OjExIHAubS4sIEhlbGdlIERlbGxlciB3cm90ZToNCj4gT24gMjcu
MDUuMTkgMjE6NDEsIEpvaG4gRGF2aWQgQW5nbGluIHdyb3RlOg0KPj4gT24gMjAxOS0wNS0y
NyAzOjIwIHAubS4sIEhlbGdlIERlbGxlciB3cm90ZToNCj4+PiBUaGlzIGZpeGVzIHRoZSBI
UE1DIGNyYXNoZXMgb24gYSBDMjQwIGFuZCBDMzZYWCBtYWNoaW5lcy4gRm9yIG90aGVyDQo+
Pj4gbWFjaGluZXMgd2UgcmVseSBvbiB0aGUgZmlybXdhcmUgdG8gc2V0IHRoZSBiaXQgd2hl
biBuZWVkZWQuDQo+Pj4NCj4+PiBJbiBjYXNlIG9uZSBmaW5kcyBIUE1DIGlzc3VlcywgcGVv
cGxlIGNvdWxkIHRyeSB0byBib290IHRoZWlyIG1hY2hpbmVzDQo+Pj4gd2l0aCB0aGUgIm5v
LWFsdGVybmF0aXZlcyIga2VybmVsIG9wdGlvbiB0byB0dXJuIG9mZiBhbnkgYWx0ZXJuYXRp
dmUNCj4+PiBwYXRjaGluZy4NCj4+IEp1c3Qgd29uZGVyaW5nIGFib3V0IHNvZnQgZmFpbCB2
ZXJzdXMgaGFyZCBmYWlsLsKgIEluIGxiYV9wY2kuYywgd2UgaGF2ZSBzb2Z0IGZhaWwgYnkg
ZGVmYXVsdDoNCj4+DQo+PiAjaWYgZGVmaW5lZChFTkFCTEVfSEFSREZBSUwpDQo+PiDCoMKg
wqDCoMKgwqDCoCBXUklURV9SRUczMihzdGF0IHwgSEZfRU5BQkxFLCBkLT5oYmEuYmFzZV9h
ZGRyICsgTEJBX1NUQVRfQ1RMKTsNCj4+ICNlbHNlDQo+PiDCoMKgwqDCoMKgwqDCoCBXUklU
RV9SRUczMihzdGF0ICYgfkhGX0VOQUJMRSwgZC0+aGJhLmJhc2VfYWRkciArIExCQV9TVEFU
X0NUTCk7DQo+PiAjZW5kaWYNCj4+DQo+PiBIb3dldmVyLCBpbiBzYmFfaW9tbXUuYywgd2Ug
Y3Jhc2ggb24gcm9wZSBlcnJvcnM6DQo+Pg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqKiBNYWtlIHN1cmUgdGhlIGJveCBjcmFzaGVzIG9u
IHJvcGUgZXJyb3JzLg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqLw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBXUklURV9SRUcoSEZfRU5BQkxFLCBpb2NfaHBhICsgUk9QRTBfQ1RMICsg
aik7DQo+Pg0KPj4gSSBzdXNwZWN0IENhcmxvJ3MgQzM2MDAgSFBNQyBpc3N1ZXMgbXVzdCBi
ZSBmcm9tIHJvcGUgaXNzdWUuPiBTaG91bGQgcm9wZSBlcnJvcnMgYmUgc29mdCBhcyB3ZWxs
Pw0KPiBEb24ndCBrbm93LCBidXQgc2VlbXMgbG9naWNhbC4NCj4gSWYgc28sIGRvZXMgaXQg
dGhlbiBtYWtlcyBzZW5zZSB0byBhIGtlcm5lbCBwYXJhbWV0ZXIgKGUuZy4gImhhcmRmYWls
IikgdG9vID8NCkNhcmxvIHNhaWQgdGhhdCBjMzYwMCBocG1jJ2Qgd2l0aCBzYmFfaW9tbXUu
YyBwYXRjaGVkIHRvIHNvZnQgZmFpbC7CoCBNYXliZSBwZGMgb3ZlcnJpZGVzP8KgIEFueXdh
eSwgSSBkb24ndA0KdGhpbmsgaXQncyBpbXBvcnRhbnQuDQoNCi0tIA0KSm9obiBEYXZpZCBB
bmdsaW4gIGRhdmUuYW5nbGluQGJlbGwubmV0DQoNCg==
