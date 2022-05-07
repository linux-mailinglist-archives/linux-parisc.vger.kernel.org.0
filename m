Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183F451E942
	for <lists+linux-parisc@lfdr.de>; Sat,  7 May 2022 20:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbiEGSxd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 7 May 2022 14:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbiEGSxc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 7 May 2022 14:53:32 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B233F24BF4
        for <linux-parisc@vger.kernel.org>; Sat,  7 May 2022 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1651949376;
        bh=2SnpeZhmNbhIL8cJsTGMx7Ec+y2mBGDXPqT3DtXH1Ds=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=kjhFpef0oAj2fmuXoEfX5ydRXllLfG8IM3hTL5qeeN6Le2Qy3AM5C92TJe/rNoXpv
         HnxhDS66vPASrcMfdbXPm2dJezco9eUFI7iURScvcYoCqIgiWnlaUcZTKrO2bxjJff
         wLSrHgEROerahm9d7FjPM8LJfOxJflOYag/raOT8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.53]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UZ6-1nmrGU2oLq-000e0K; Sat, 07
 May 2022 20:49:36 +0200
Message-ID: <10617c84-75d9-a3f8-21a0-22dee44dbcba@gmx.de>
Date:   Sat, 7 May 2022 20:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Latest PA8800/PA8900 cache flush patch
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Deller <deller@kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <YmhSJPy1MVBYWSrB@mx3210.localdomain>
 <791a2aee-1a9a-6680-c9d4-438c6b5519a6@gmx.de>
 <2ee9360d-7ddc-8cf1-46c5-b29663e10193@bell.net>
 <0cafa13b-336c-a425-7284-162467349bc9@bell.net>
 <2b28f20d-0183-96a7-463f-492cc972b3fa@gmx.de>
 <418213d7-a306-d3cd-2b78-50f0c96b1b8d@gmx.de>
 <0449745b-f3fd-eb86-31f9-1e26cc8bc0fd@gmx.de>
 <bbc8e524-de3f-f6ee-cc30-0e208ca56ba4@bell.net>
 <5a4f104c-80fb-a70f-23ce-e87bae25c46c@bell.net>
 <5e24be22-35d7-f9ae-7aa0-fd38018fcc98@bell.net>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <5e24be22-35d7-f9ae-7aa0-fd38018fcc98@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:QKp+5ZsGlAYbAQyaLXWo/u5vVHTYS6zg3F/jKhblEl9q45OtM+Z
 DzbF07e/pU5HShNJMkJ+bzQDoYxVt/I+NTvfnoDiW2CvERsV9p5/1o+iZ6sYiknYVxiCxjq
 TSsZpKDnT6nVZTOPB5b3lBqA/IHIc9VFn0YaNKdm3Ukf1G4cUwaIsCFz05d5Efmo6b66dQ4
 ZNZ/5CEb3pL0ULpp49AnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ARlXQcUjd5E=:zJ59vB7Xqz49XrHtSBPBJX
 TMCiYAjAREQ4JKkgf1zdqcjw2fCDjHqMCMMFc2Wg2E7PQ5I83FSLG2i5pljOog5CSgejNBOI3
 5vr7472wkkIAinWpG9/13xzml7LQn5ljej2cHscPXfolyy63ypycvUKtqGH1W8ztRlmB3UJ5H
 qxTUOTNABQWYlXH+cHCu35Zy4LLvcUHkBgF+qLiL1UcjF9gD110mfZ6tiPsN5InwItyH1kbFE
 VGowZr+95Usy68wYT4QOFNtTleTf0gzJXKgvr0LpHpDS4a+v7rch6kfjML/1so0U8a47y4JkG
 kcfdzAMkYcCiV5w74C/YfHwlhdQ2LLhS4HGqIGhLgbvhLz+nuy3HguAIl4kJmNe+9cd8fqnbH
 lpkHpSZ6n4sB/ebod03esQwxm/Yy14EY79lQDKNChHPSdVfwZwVc6M6yBN5/xZ2ZE4bY/4rHH
 yK47+h4X2hk+eFrNslfiUQVHyOcZOxgYhI+LlF4SjYiLOmgvrmqsDKqhUnZ1EIgt+zdgvazZJ
 1CDPlaawsMV4ph4ulH08EeZILyF/Q+2C1uFfN9TTbgh1Tp2JQ1Rjx2+rfXwnlTRqAeSFW0jc1
 A9xwrd8r/BiArKDPiVzsmtU6P+3g/1rAylgpOffeCXaJKAdkaw4F4GbpUe5+GPk7vm3cnP0K2
 GegV060vpbkhLiNpy8Djha8MkpDuyxBBlJLExTrmEQDZgcvu77PN9zxEe4PnOKsauw0WMrr4O
 /LLdskX+NRtWXBH9Uk/e3HaRN6ym8f2DRr3/iTvLNQjxylke+FBRVOCRtdN16wNpyWq2slfim
 UEqdkE7JIxslraegTUe5m7zM8wjFrMMRj7UeACO+uA4aP5s26+kkqcC3rRO93D525Nw4Gnqw7
 t/TECldP2rxm/RJTyVzWRLHhpvto3g2IcrImKTG1f2d0eK9C+4oYPc1LtoxDZU8xxLqjI/vYk
 uMemHO3z9Wl3T+fTfHnxLbqm5NRkF2oJ3kpoEQuxBJ/Rw+ThD0UcJJhrPBj4FQnSQsfRL8d+n
 eZaHCegSnJcj2naxqo1/6iVXkB5CLIJ0g+Aq63LN2vNW1QdIEqAWT0zTCexjAnRpbw==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

SGkgRGF2ZSwNCg0KT24gNS83LzIyIDAzOjU1LCBKb2huIERhdmlkIEFuZ2xpbiB3cm90ZToNCj4g
T24gMjAyMi0wNS0wNiA2OjM0IHAubS4sIEpvaG4gRGF2aWQgQW5nbGluIHdyb3RlOg0KPj4gT24g
MjAyMi0wNS0wNiA1OjMwIHAubS4sIEpvaG4gRGF2aWQgQW5nbGluIHdyb3RlOg0KPj4+PiBJJ3Zl
wqBidWlsdMKgNS4xNy41wqAoMzJiaXQpLsKgQm9vdHPCoG9rwqBvbsKgYzMwMDAuwqBOb8Kgc2Vn
ZmF1bHRzLg0KPj4+PiBCdXTCoEnCoGRvwqBzZWXCoHRoZcKgc3RhbGxzwqBhc8Kgd2VsbDoNCj4+
Pj4gLi4uDQo+Pj4+IFN0YXJ0aW5nwqBBdmFoacKgbUROUy9ETlMtU0TCoERhZW1vbjrCoGF2YWhp
LWRhZW1vbi4NCj4+Pj4gU3RhcnRpbmfCoHBlcmlvZGljwqBjb21tYW5kwqBzY2hlZHVsZXI6wqBj
cm9uLg0KPj4+PiBbwqDCoMKgMzEuNDcyNzA4XcKgcmN1OsKgSU5GTzrCoHJjdV9zY2hlZMKgZGV0
ZWN0ZWTCoHN0YWxsc8Kgb27CoENQVXMvdGFza3M6DQo+Pj4+IFvCoMKgwqAzMS41NDM1NzddwqDC
oChkZXRlY3RlZMKgYnnCoDAswqB0PTIxMDLCoGppZmZpZXMswqBnPTczNjEswqBxPTEwKQ0KPj4+
PiBbwqDCoMKgMzEuNjA5MTkxXcKgcmN1OsKgQWxswqBRU2VzwqBzZWVuLMKgbGFzdMKgcmN1X3Nj
aGVkwqBrdGhyZWFkwqBhY3Rpdml0ecKgMjEwMsKgKC0yMjI3MS0tMjQzNzMpLMKgamlmZmllc190
aWxsX25leHRfZnFzPTEswqByb290wqAtPnFzbWFza8KgMHgwDQo+Pj4+IFvCoMKgwqAzMS43NDc2
MTRdwqByY3U6wqByY3Vfc2NoZWTCoGt0aHJlYWTCoHN0YXJ2ZWTCoGZvcsKgMjEwMsKgamlmZmll
cyHCoGc3MzYxwqBmMHgywqBSQ1VfR1BfV0FJVF9GUVMoNSnCoC0+c3RhdGU9MHgwwqAtPmNwdT0w
DQo+Pj4+IFvCoMKgwqAzMS44NjczMTNdwqByY3U6wqDCoMKgwqDCoFVubGVzc8KgcmN1X3NjaGVk
wqBrdGhyZWFkwqBnZXRzwqBzdWZmaWNpZW50wqBDUFXCoHRpbWUswqBPT03CoGlzwqBub3fCoGV4
cGVjdGVkwqBiZWhhdmlvci4NCj4+Pj4gW8KgwqDCoDMxLjk3NDUzNV3CoHJjdTrCoFJDVcKgZ3Jh
Y2UtcGVyaW9kwqBrdGhyZWFkwqBzdGFja8KgZHVtcDoNCj4+Pj4gW8KgwqDCoDMyLjAzNDk2Ml3C
oHRhc2s6cmN1X3NjaGVkwqDCoMKgwqDCoMKgwqBzdGF0ZTpSwqDCoHJ1bm5pbmfCoHRhc2vCoMKg
wqDCoMKgc3RhY2s6wqDCoMKgwqAwwqBwaWQ6wqDCoMKgMTDCoHBwaWQ6wqDCoMKgwqDCoDLCoGZs
YWdzOjB4MDAwMDAwMDANCj4+Pj4gW8KgwqDCoDMyLjE1MzczM13CoEJhY2t0cmFjZToNCj4+Pj4g
W8KgwqDCoDMyLjE4MTkxNl3CoMKgWzwxMDk0YzIxYz5dwqBfX3NjaGVkdWxlKzB4MmRjLzB4OTY0
DQo+Pj4+IFvCoMKgwqAzMi4yMzcyNDBdwqDCoFs8MTA5NGM5MGM+XcKgc2NoZWR1bGUrMHg2OC8w
eDEzOA0KPj4+PiBbwqDCoMKgMzIuMjg5MzQwXcKgwqBbPDEwOTUzMDY4Pl3CoHNjaGVkdWxlX3Rp
bWVvdXQrMHg4NC8weDE3OA0KPj4+PiBbwqDCoMKgMzIuMzQ5NzYyXcKgwqBbPDEwMjQ3MmI0Pl3C
oHJjdV9ncF9mcXNfbG9vcCsweDMyYy8weDQyOA0KPj4+PiBbwqDCoMKgMzIuNDEwMTg2XcKgwqBb
PDEwMjQ5NjYwPl3CoHJjdV9ncF9rdGhyZWFkKzB4MTBjLzB4MWU4DQo+Pj4+IFvCoMKgwqAzMi40
Njk1NjldwqDCoFs8MTAxZWJjOTg+XcKga3RocmVhZCsweDEwMC8weDEwOA0KPj4+PiBbwqDCoMKg
MzIuNTIxNjc0XcKgwqBbPDEwMTliMDFjPl3CoHJldF9mcm9tX2tlcm5lbF90aHJlYWQrMHgxYy8w
eDI0DQo+Pj4+DQo+Pj4+IEFSR0ghISENCj4+PiBUaGlzwqB3YXPCoGludHJvZHVjZWTCoGJ5wqB0
aGXCoGZvbGxvd2luZ8KgY29tbWl0Og0KPj4+DQo+Pj4gY29tbWl0wqBkOTcxODBhZDY4YmRiN2Vl
MTBmMzI3MjA1YTY0OWJjMmY1NTg3NDFkDQo+Pj4gQXV0aG9yOsKgSGVsZ2XCoERlbGxlciA8ZGVs
bGVyQGdteC5kZT4NCj4+PiBEYXRlOsKgwqDCoFdlZMKgU2VwwqA4wqAyMzoyNzowMMKgMjAyMcKg
KzAyMDANCj4+Pg0KPj4+IMKgwqDCoMKgcGFyaXNjOsKgTWFya8Kgc2NoZWRfY2xvY2vCoHVuc3Rh
YmxlwqBvbmx5wqBpZsKgY2xvY2tzwqBhcmXCoG5vdMKgc3luY3Jvbml6ZWQNCj4+Pg0KPj4+IMKg
wqDCoMKgV2XCoGNoZWNrwqBhdMKgcnVudGltZcKgaWbCoHRoZcKgY3IxNsKgY2xvY2tzwqBhcmXC
oHN0YWJsZcKgYWNyb3NzwqBDUFVzLsKgT25secKgbWFyaw0KPj4+IMKgwqDCoMKgdGhlwqBzY2hl
ZF9jbG9ja8KgdW5zdGFibGXCoGJ5wqBjYWxsaW5nwqBjbGVhcl9zY2hlZF9jbG9ja19zdGFibGUo
KcKgaWbCoHdlDQo+Pj4gwqDCoMKgwqBrbm93wqB0aGF0wqB3ZcKgcnVuwqBvbsKgYcKgc3lzdGVt
wqB3aGljaMKgaXNuJ3TCoHN5bmNyb25pemVkwqBhY3Jvc3PCoENQVXMuDQo+Pj4NCj4+PiDCoMKg
wqDCoFNpZ25lZC1vZmYtYnk6wqBIZWxnZcKgRGVsbGVyIDxkZWxsZXJAZ214LmRlPg0KPj4+DQo+
Pj4gSW7CoHNlYXJjaGluZ8KgZm9ywqB0aGXCoGNhdXNlLMKgScKgYWxzb8Kgbm90aWNlZMKgdGhp
c8KgY29tbWl0Og0KPj4+DQo+Pj4gY29tbWl0wqBlNGYyMDA2ZjEyODdlN2VhMTc2NjA0OTA1Njlj
ZmYzMjM3NzJkYWM0DQo+Pj4gQXV0aG9yOsKgSGVsZ2XCoERlbGxlciA8ZGVsbGVyQGdteC5kZT4N
Cj4+PiBEYXRlOsKgwqDCoFR1ZcKgU2VwwqA3wqAwNTowMzoyOcKgMjAyMcKgKzAyMDANCj4+Pg0K
Pj4+IMKgwqDCoMKgcGFyaXNjOsKgUmVkdWNlwqBzaWdyZXR1cm7CoHRyYW1wb2xpbmXCoHRvwqAz
wqBpbnN0cnVjdGlvbnMNCj4+Pg0KPj4+IMKgwqDCoMKgV2XCoGNhbsKgbW92ZcKgdGhlwqBJTlNO
X0xESV9SMjDCoGluc3RydWN0aW9uwqBpbnRvwqB0aGXCoGJyYW5jaMKgZGVsYXnCoHNsb3QuDQo+
Pj4NCj4+PiDCoMKgwqDCoFNpZ25lZC1vZmYtYnk6wqBIZWxnZcKgRGVsbGVyIDxkZWxsZXJAZ214
LmRlPg0KPj4+DQo+Pj4gQ2hhbmdpbmfCoHRoZcKgc2lncmV0dXJuwqB0cmFtcG9saW5lwqBicmVh
a3PCoGdkYidzwqBkZXRlY3Rpb27CoG9mwqBzaWduYWzCoGZyYW1lcy4NCj4+PiBJwqBzdXNwZWN0
wqB0aGXCoElOU05fTERJX1IyMMKgaW5zdHJ1Y3Rpb27CoHdhc8KgaW50ZW50aW9uYWxsecKgcHV0
wqBiZWZvcmXCoHRoZQ0KPj4+IGJyYW5jaMKgdG/CoG1ha2XCoHRoZcKgc2VxdWVuY2XCoG1vcmXC
oHVuaXF1ZS4NCj4+DQo+PiBJdCBhcHBlYXJzIHRoZSBsYXR0ZXIgY29tbWl0IGhhcyBiZWVuIHJl
dmVydGVkLsKgIFRoZSBmb3JtZXIgY29tbWl0IGhhcyBiZWVuIG1vZGlmaWVkLg0KPiAzMmJpdCB2
NS4xNS4zNyBib290cyBzdWNjZXNzZnVsbHkgaWYgc2V0dXAuYyBhbmQgdGltZS5jIGFyZSByZXZl
cnRlZCB0byB2NS4xNC7CoCBPdGhlcndpc2UsDQo+IGJvb3Qgc3RhbGxzIGFzIGFib3ZlLg0KDQpU
aGFuayB5b3UgZm9yIGludmVzdGluZyB5b3VyIHRpbWUgdG8gZmluZCB0aGUgcHJvYmxlbSENClRo
ZSBtZW50aW9uZWQgcGF0Y2hlcyBjYW4gZWFzaWx5IGJlIHJldmVydGVkIC0gSSBoYXZlIHF1ZXVl
ZCB1cCB0aGUgcmV2ZXJ0LXBhdGNoZXMgbm93Lg0KSXQgc2VlbXMgY29tbWl0IGQ5NzE4MGFkNjhi
ZGI3ZWUxMGYzMjcyMDVhNjQ5YmMyZjU1ODc0MWQgd2FzIHdyb25nLCBhbmQgdGhlIGZvbGxvdy11
cCBwYXRjaA0KbWFkZSBpdCBldmVuIHdvcnNlLg0KDQpPaywgc28gd2Ugbm93IG5lZWQgdG8gZmlu
ZCB0aGUgY2F1c2Ugd2h5IHY1LjE4LXJjIGNyYXNoZXMuLi4gOi0oDQoNCkhlbGdlDQo=
